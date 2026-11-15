extends CharacterBody2D
## Player - die Spielfigur (M2: Bewegung).
##
## Die Figur führt nur Absichten aus. Woher sie kommen, bestimmt das Kind
## "PlayerInput" (ein IntentSource): Tasten, später Gamepad oder Netz.
## Alle Zahlen stehen in der Werte-Datei data/player/movement.tres.
##
## Kinder: CollisionShape2D, PlaceholderView (Platzhalter-Grafik),
## PlayerInput (Absichten), Stamina (Ausdauer).
## Ohne Stamina sprintet die Figur unbegrenzt, ohne PlayerInput bleibt sie stehen.

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

## Aktueller Bewegungszustand.
var move_state := MoveState.IDLE
## Blickrichtung: die letzte Laufrichtung.
var facing := Vector2.DOWN

@onready var _intent := get_node_or_null("PlayerInput") as IntentSource
@onready var _stamina := get_node_or_null("Stamina") as Stamina


func _ready() -> void:
	if stats == null:
		push_warning("Player: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = MovementStats.new()


func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	var wants_sprint := false
	var wants_sneak := false
	if _intent != null:
		direction = _intent.move_direction.limit_length(1.0)
		wants_sprint = _intent.wants_sprint
		wants_sneak = _intent.wants_sneak

	move_state = _pick_state(direction, wants_sprint, wants_sneak, delta)
	var target_velocity := direction * _speed_for(move_state)
	var rate := stats.friction
	if direction != Vector2.ZERO:
		rate = stats.acceleration
	velocity = velocity.move_toward(target_velocity, rate * delta)
	move_and_slide()

	if direction != Vector2.ZERO:
		var new_facing := direction.normalized()
		if not new_facing.is_equal_approx(facing):
			facing = new_facing
			queue_redraw()
	_report_debug_values()


func _draw() -> void:
	var half := FACING_DOT_SIZE * 0.5
	var corner := facing * FACING_DOT_DISTANCE - Vector2(half, half)
	draw_rect(Rect2(corner, Vector2(FACING_DOT_SIZE, FACING_DOT_SIZE)), Color.WHITE)


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


func _report_debug_values() -> void:
	var prefix := "S%d" % player_id
	var place := "%d, %d" % [roundi(global_position.x), roundi(global_position.y)]
	var speed := "%d (%s)" % [roundi(velocity.length()), STATE_NAMES[move_state]]
	EventBus.debug_value_changed.emit(prefix + " Position", place)
	EventBus.debug_value_changed.emit(prefix + " Tempo", speed)
	if _stamina == null:
		return
	var reserve := "%d / %d" % [roundi(_stamina.current), roundi(_stamina.get_maximum())]
	if _stamina.is_exhausted:
		reserve += " (erschöpft)"
	EventBus.debug_value_changed.emit(prefix + " Ausdauer", reserve)
