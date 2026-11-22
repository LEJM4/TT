extends CharacterBody2D
## Player - die Spielfigur (M2: Bewegung, M4: Zielen und Nahkampf, M5: Dash, M6: Fernkampf, M7: Fähigkeiten, A1: Bild, M11a: Inventar, M8: Interaktion, M9: Aufsammeln, M11: Ausrüstung, M13: Schleichen für Gegner, M15: Blick im Gespräch, M16: Spielstand, M19: Freischaltungen).
##
## Die Figur führt nur Absichten aus. Woher sie kommen, bestimmt das Kind
## "PlayerInput" (ein IntentSource): Tasten, später Gamepad oder Netz.
## Sie blickt in die Zielrichtung und schlägt dorthin; laufen kann sie dabei
## weiter. Hat sie ein Blickziel (look_target), blickt sie stattdessen dorthin -
## im Gespräch zum NPC, gesetzt vom Kind TalkFacing (M15). Geworfen wird
## ebenfalls in Zielrichtung: das gewählte Geschoss aus
## dem Inventar, jeder Wurf nimmt eins heraus; das Mausrad wechselt das
## Geschoss (M11a). Der Dash geht in Laufrichtung, im Stehen in Blickrichtung; solange
## er läuft, lenkt die Figur nicht und beginnt weder Hieb noch Schuss.
## Fähigkeiten liegen als Kinder unter "Abilities"; ihr Platz dort bestimmt
## die Taste. Sie kosten Energie, die nur durch Schwerttreffer zurückkommt.
## Die Taste E bedient das nächste Ding in Reichweite, etwa eine Tür (M8).
## Beute am Boden sammelt sie beim Drüberlaufen ins Inventar (M9).
## Was sie angelegt hat - Waffe, Fernkampf, Rüstung, Anhänger -, verwaltet ihr Kind
## Equipment; es ändert die Werte von Schwert, Geschossen und Leben (M11).
## Inventar und Ausrüstung holt ihr Kind PlayerProgress beim Erscheinen aus dem
## Spielstand und schreibt jede Änderung dorthin zurück (M16).
## Dash, Fernkampf, Schleichen und Fähigkeiten wirken erst, wenn sie
## freigeschaltet sind; das fragt sie ihr Kind Unlocks (M19).
## Die Zahlen stehen in data/player/: movement.tres, stamina.tres,
## health.tres, sword.tres, dash.tres, bow.tres, energy.tres, inventory.tres, interactor.tres und equipment.tres;
## die Werte der Fähigkeiten in data/abilities/, die der Geschosse in data/items/.
##
## Kinder und was ohne sie passiert:
##   CharacterView Bild         - ohne: Sie zeigt den Platzhalter mit Richtungspunkt (A1).
##   PlayerInput   Absichten    - ohne: Die Figur bleibt stehen.
##   Stamina       Ausdauer     - ohne: Sie sprintet unbegrenzt.
##   Health        Leben        - ohne: Sie nimmt keinen Schaden und stirbt nicht.
##   Hurtbox       Trefferzone  - ohne: Sie ist nicht zu treffen.
##   HitFlash      Aufblitzen   - ohne: Schaden wirkt, nur ohne Blinken.
##   MeleeAttack   Schwerthieb  - ohne: Sie kann nicht zuschlagen.
##   Dash          Ausweichen   - ohne: Sie kann nicht dashen.
##   RangedAttack  Fernkampf    - ohne: Sie kann nicht schießen.
##   Inventory     Inventar     - ohne: Sie trägt nichts und hat nichts zu werfen (M11a).
##   AmmoSelector  Geschoss-Wahl - ohne: Sie schießt wie vor M11a mit bow.tres (M11a).
##   Ammo          Munition     - nur ohne AmmoSelector; seit M11a nicht eingehängt.
##   Abilities     Fähigkeiten  - ohne: Sie hat keine Fähigkeiten.
##   Energy        Energie      - ohne: Fähigkeiten kosten nichts.
##   Interactor    Interaktion  - ohne: Sie bedient nichts mit E (M8).
##   Collector     Aufsammeln   - ohne: Sie läuft über Beute hinweg (M9).
##   TalkFacing    Blick im Gespräch - ohne: Sie behält im Gespräch ihre Blickrichtung (M15).
##   Equipment     Ausrüstung   - ohne: Sie kämpft mit ihren Grundwerten (M11).
##   PlayerProgress Spielstand  - ohne: Sie beginnt jedes Mal mit dem Startinhalt (M16).
##   Unlocks       Freischaltungen - ohne: Dash, Fernkampf, Schleichen und alle Fähigkeiten sind frei (M19).
##
## Stirbt die Figur, bleibt sie stehen und meldet es über den EventBus
## (player_died); ihr Bild zeigt den Tod, der Platzhalter wird grau.
## Was dann geschieht, entscheidet das Level.

enum MoveState { IDLE, WALK, SPRINT, SNEAK, DASH }

## Namen der Zustände für die Debug-Anzeige.
const STATE_NAMES := {
	MoveState.IDLE: "Stehen",
	MoveState.WALK: "Laufen",
	MoveState.SPRINT: "Sprinten",
	MoveState.SNEAK: "Schleichen",
	MoveState.DASH: "Dash",
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
## Faktor auf das Lauftempo; die Fähigkeit Schnelligkeit ändert ihn (M7).
var speed_factor := 1.0
## Blickziel: Ist es gesetzt, blickt die Figur dorthin statt in die Zielrichtung -
## etwa im Gespräch zum NPC, gesetzt von TalkFacing (M15). null: die Zielrichtung.
var look_target: Node2D

@onready var _intent := get_node_or_null("PlayerInput") as IntentSource
@onready var _stamina := get_node_or_null("Stamina") as Stamina
@onready var _health := get_node_or_null("Health") as Health
@onready var _melee := get_node_or_null("MeleeAttack") as MeleeAttack
@onready var _dash := get_node_or_null("Dash") as Dash
@onready var _ranged := get_node_or_null("RangedAttack") as RangedAttack
@onready var _ammo := get_node_or_null("Ammo") as Supply
@onready var _inventory := get_node_or_null("Inventory") as Inventory
@onready var _ammo_selector := get_node_or_null("AmmoSelector") as AmmoSelector
@onready var _abilities := get_node_or_null("Abilities")
@onready var _energy := get_node_or_null("Energy") as Supply
@onready var _interactor := get_node_or_null("Interactor") as Interactor
@onready var _unlocks := get_node_or_null("Unlocks") as UnlockGate


func _ready() -> void:
	if stats == null:
		push_warning("Player: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = MovementStats.new()
	if _health != null:
		_health.died.connect(_on_died)
	if _dash != null:
		_dash.dash_finished.connect(_on_dash_finished)


func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	var wants_sprint := false
	var wants_sneak := false
	var wants_attack := false
	var wants_dash := false
	var wants_shoot := false
	var wanted_ability := -1
	var wanted_ammo_cycle := 0
	var wants_interact := false
	var look := facing
	if _intent != null:
		direction = _intent.move_direction.limit_length(1.0)
		wants_sprint = _intent.wants_sprint
		wants_sneak = _intent.wants_sneak
		wants_attack = _intent.wants_attack
		wants_dash = _intent.wants_dash
		wants_shoot = _intent.wants_shoot
		wanted_ability = _intent.wants_ability
		wanted_ammo_cycle = _intent.wants_ammo_cycle
		wants_interact = _intent.wants_interact
		look = _intent.aim_direction
	# Was noch nicht freigeschaltet ist, bleibt ohne Wirkung (M19).
	if _unlocks != null:
		wants_dash = wants_dash and _unlocks.can_dash()
		wants_shoot = wants_shoot and _unlocks.can_shoot()
		wants_sneak = wants_sneak and _unlocks.can_sneak()
	# Mit Blickziel, etwa dem NPC im Gespräch, blickt die Figur dorthin (M15).
	if is_instance_valid(look_target):
		look = look_target.global_position - global_position
	_face(look)

	_handle_dash_wish(direction, wants_dash)
	if _dash != null and _dash.is_dashing:
		move_state = MoveState.DASH
		velocity = _dash.get_velocity()
	else:
		move_state = _pick_state(direction, wants_sprint, wants_sneak, delta)
		var target_velocity := direction * _speed_for(move_state)
		var rate := stats.friction
		if direction != Vector2.ZERO:
			rate = stats.acceleration
		velocity = velocity.move_toward(target_velocity, rate * delta)
	move_and_slide()

	if move_state != MoveState.DASH:
		if wants_attack and _melee != null:
			_melee.try_attack(facing)
		if wants_shoot and _ranged != null:
			_ranged.try_shoot(facing)
	if wanted_ability >= 0:
		_use_ability(wanted_ability)
	if wanted_ammo_cycle != 0 and _ammo_selector != null:
		_ammo_selector.cycle(wanted_ammo_cycle)
	if wants_interact and _interactor != null:
		_interactor.try_interact()
	_report_debug_values()


## Schleicht die Figur gerade - die Taste gehalten, ob sie läuft oder steht?
## Gegner hören sie dann nicht und sehen sie nur auf kürzere Entfernung (M13).
func is_sneaking() -> bool:
	if _intent == null or not _intent.wants_sneak or move_state == MoveState.DASH:
		return false
	return _unlocks == null or _unlocks.can_sneak()


func _draw() -> void:
	# Der Richtungspunkt gehört zum Platzhalter; zeigt CharacterView das Bild, entfällt er (A1).
	var placeholder := get_node_or_null("PlaceholderView") as CanvasItem
	if placeholder == null or not placeholder.visible:
		return
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


func _handle_dash_wish(direction: Vector2, wants_dash: bool) -> void:
	if _dash == null:
		return
	if wants_dash:
		_dash.request()
	if not _dash.has_request():
		return
	# In Laufrichtung; im Stehen dorthin, wohin die Figur blickt.
	var dash_direction := direction
	if dash_direction == Vector2.ZERO:
		dash_direction = facing
	_dash.try_start(dash_direction)


func _use_ability(index: int) -> void:
	if _abilities == null or index >= _abilities.get_child_count():
		return
	var ability := _abilities.get_child(index) as Ability
	if ability == null:
		return
	if _unlocks != null and not _unlocks.can_use(ability):
		return
	ability.try_activate()


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
			return stats.sprint_speed * speed_factor
		MoveState.SNEAK:
			return stats.sneak_speed * speed_factor
		MoveState.WALK:
			return stats.walk_speed * speed_factor
	return 0.0


func _on_dash_finished() -> void:
	# Nach dem Dash nicht nachrutschen: höchstens mit Lauftempo weiter.
	velocity = velocity.limit_length(stats.walk_speed)


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
	if _dash != null:
		var dash_state := "bereit"
		if not _dash.is_ready():
			dash_state = "%.1f s" % _dash.get_cooldown_left()
		EventBus.debug_value_changed.emit(prefix + " Dash", dash_state)
	if _ammo_selector != null:
		EventBus.debug_value_changed.emit(prefix + " Geschoss", _ammo_text())
	elif _ammo != null:
		var ammo := "%d / %d" % [roundi(_ammo.current), roundi(_ammo.get_maximum())]
		EventBus.debug_value_changed.emit(prefix + " Munition", ammo)
	if _energy != null:
		var energy := "%d / %d" % [roundi(_energy.current), roundi(_energy.get_maximum())]
		EventBus.debug_value_changed.emit(prefix + " Energie", energy)
	if _abilities != null:
		EventBus.debug_value_changed.emit(prefix + " Fähigkeiten", _abilities_text())


func _ammo_text() -> String:
	var text := "keins"
	var item := _ammo_selector.selected
	if item != null:
		text = "%s %d" % [item.display_name, _ammo_selector.get_selected_count()]
	if _inventory != null:
		text += " · Plätze %d/%d" % [_inventory.get_used_slots(), _inventory.get_slot_count()]
	return text


func _abilities_text() -> String:
	var busy := PackedStringArray()
	for index in _abilities.get_child_count():
		var ability := _abilities.get_child(index) as Ability
		if ability == null:
			continue
		if ability.is_active:
			busy.append("%d aktiv %.1f" % [index + 1, ability.get_time_left()])
		elif not ability.is_ready():
			busy.append("%d Pause %.1f" % [index + 1, ability.get_cooldown_left()])
	if busy.is_empty():
		return "bereit"
	return ", ".join(busy)
