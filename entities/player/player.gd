extends CharacterBody2D
## Player - die Spielfigur (M2: Bewegung, M4: Zielen und Nahkampf).
##
## Die Figur führt nur Absichten aus. Woher sie kommen, bestimmt das Kind
## "PlayerInput" (ein IntentSource): Tasten, später Gamepad oder Netz.
## Sie blickt in die Zielrichtung und schlägt dorthin; laufen kann sie dabei
## weiter. Die Zahlen stehen in data/player/: movement.tres, stamina.tres,
## health.tres und sword.tres.
##
## Kinder und was ohne sie passiert:
##   PlayerInput   Absichten    - ohne: Die Figur bleibt stehen.
##   Stamina       Ausdauer     - ohne: Sie sprintet unbegrenzt.
##   Health        Leben        - ohne: Sie nimmt keinen Schaden und stirbt nicht.
##   Hurtbox       Trefferzone  - ohne: Sie ist nicht zu treffen.
##   HitFlash      Aufblitzen   - ohne: Schaden wirkt, nur ohne Blinken.
##   MeleeAttack   Schwerthieb  - ohne: Sie kann nicht zuschlagen.
##
## Stirbt die Figur, bleibt sie stehen, wird grau und meldet es über den
## EventBus (player_died). Was dann geschieht, entscheidet das Level.

enum MoveState { IDLE, WALK, SPRINT, SNEAK }

## Namen der Zustände für die Debug-Anzeige.
const STATE_NAMES := {
	MoveState.IDLE: "Stehen",
	MoveState.WALK: "Laufen",
	MoveState.SPRINT: "Sprinten",
	MoveState.SNEAK: "Schleichen",
}
## Abstand des Richtungspunkts von der Mitte der Figur, in Pixeln.
const FACING_DOT_DISTANCE := 9.0
## Kantenlänge des Richtungspunkts, in Pixeln.
const FACING_DOT_SIZE := 3.0

## Werte-Datei mit Tempo, Anlauf und Sprintkosten.
@export var stats: MovementStats
## Nummer des Spielers, beginnend bei 1.
@export var player_id := 1
## Farbe der Figur nach dem Tod.
@export var defeated_color := Color(0.35, 0.35, 0.38)

## Aktueller Bewegungszustand.
var move_state := MoveState.IDLE
## Blickrichtung: die Zielrichtung aus den Absichten.
var facing := Vector2.DOWN
## Tot: Das Leben ist auf 0 gefallen.
var is_dead := false

@onready var _intent := get_node_or_null("PlayerInput") as IntentSource
@onready var _stamina := get_node_or_null("Stamina") as Stamina
@onready var _health := get_node_or_null("Health") as Health
@onready var _melee := get_node_or_null("MeleeAttack") as MeleeAttack


func _ready() -> void:
	if stats == null:
		push_warning("Player: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = MovementStats.new()
	if _health != null:
		_health.died.connect(_on_died)


func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	var wants_sprint := false
	var wants_sneak := false
	var wants_attack := false
	if _intent != null:
		direction = _intent.move_direction.limit_length(1.0)
		wants_sprint = _intent.wants_sprint
		wants_sneak = _intent.wants_sneak
		wants_attack = _intent.wants_attack
		_face(_intent.aim_direction)

	move_state = _pick_state(direction, wants_sprint, wants_sneak, delta)
	var target_velocity := direction * _speed_for(move_state)
	var rate := stats.friction
	if direction != Vector2.ZERO:
		rate = stats.acceleration
	velocity = velocity.move_toward(target_velocity, rate * delta)
	move_and_slide()

	if wants_attack and _melee != null:
		_melee.try_attack(facing)
	_report_debug_values()


func _draw() -> void:
	var half := FACING_DOT_SIZE * 0.5
	var corner := facing * FACING_DOT_DISTANCE - Vector2(half, half)
	draw_rect(Rect2(corner, Vector2(FACING_DOT_SIZE, FACING_DOT_SIZE)), Color.WHITE)


func _face(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		return
	var new_facing := direction.normalized()
	if new_facing.is_equal_approx(facing):
		return
	facing = new_facing
	queue_redraw()


func _pick_state(direction: Vector2, wants_sprint: bool, wants_sneak: bool, delta: float) -> MoveState:
	if direction == Vector2.ZERO:
		return MoveState.IDLE
	if wants_sneak:
		return MoveState.SNEAK
	if wants_sprint and _spend_for_sprint(delta):
		return MoveState.SPRINT
	return MoveState.WALK


func _spend_for_sprint(delta: float) -> bool:
	if _stamina == null:
		return true
	return _stamina.spend(stats.sprint_cost_per_second * delta)


func _speed_for(state: MoveState) -> float:
	match state:
		MoveState.SPRINT:
			return stats.sprint_speed
		MoveState.SNEAK:
			return stats.sneak_speed
		MoveState.WALK:
			return stats.walk_speed
	return 0.0


func _on_died() -> void:
	is_dead = true
	velocity = Vector2.ZERO
	move_state = MoveState.IDLE
	set_physics_process(false)
	var view := get_node_or_null("PlaceholderView") as Node2D
	if view != null:
		view.set("color", defeated_color)
		view.queue_redraw()
	_report_debug_values()
	EventBus.player_died.emit(player_id)


func _report_debug_values() -> void:
	var prefix := "S%d" % player_id
	var place := "%d, %d" % [roundi(global_position.x), roundi(global_position.y)]
	var speed := "%d (%s)" % [roundi(velocity.length()), STATE_NAMES[move_state]]
	EventBus.debug_value_changed.emit(prefix + " Position", place)
	EventBus.debug_value_changed.emit(prefix + " Tempo", speed)
	if _stamina != null:
		var reserve := "%d / %d" % [roundi(_stamina.current), roundi(_stamina.get_maximum())]
		if _stamina.is_exhausted:
			reserve += " (erschöpft)"
		EventBus.debug_value_changed.emit(prefix + " Ausdauer", reserve)
	if _health != null:
		var life := "%d / %d" % [roundi(_health.current), roundi(_health.get_maximum())]
		EventBus.debug_value_changed.emit(prefix + " Leben", life)
