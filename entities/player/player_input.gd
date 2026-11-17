extends IntentSource
## PlayerInput - übersetzt Tastatur und Maus in Absichten (lokaler Spieler).
##
## Liest die Aktionen aus InputSetup und füllt die Felder von IntentSource.
## Die Zielrichtung zeigt von der Figur zum Mauszeiger.
## Dash, Fähigkeiten und E zählen je Tastendruck genau einmal; Halten löst nichts weiter aus.
## Jede Raste des Mausrads wechselt das Geschoss um eins (M11a).
## Der Knoten läuft vor der Figur (process_physics_priority = -1 in player.tscn),
## damit sie im selben Bild die frischen Absichten liest.

## Näher als so viele Pixel an der Figur ändert die Maus die Zielrichtung nicht.
const AIM_DEAD_ZONE := 1.0
## Aktionen der Fähigkeiten in der Reihenfolge ihrer Plätze.
const ABILITY_ACTIONS: Array[String] = ["ability_1", "ability_2", "ability_3"]

var _dash_pressed := false
var _ability_pressed := -1
var _ammo_cycle := 0
var _interact_pressed := false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("dash"):
		_dash_pressed = true
	for index in ABILITY_ACTIONS.size():
		if event.is_action_pressed(ABILITY_ACTIONS[index]):
			_ability_pressed = index
	if event.is_action_pressed("ammo_next"):
		_ammo_cycle += 1
	elif event.is_action_pressed("ammo_previous"):
		_ammo_cycle -= 1
	if event.is_action_pressed("interact"):
		_interact_pressed = true


func _physics_process(_delta: float) -> void:
	move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	wants_sprint = Input.is_action_pressed("sprint")
	wants_sneak = Input.is_action_pressed("sneak")
	wants_attack = Input.is_action_pressed("attack_primary")
	wants_shoot = Input.is_action_pressed("attack_secondary")
	wants_dash = _dash_pressed
	_dash_pressed = false
	wants_ability = _ability_pressed
	_ability_pressed = -1
	wants_ammo_cycle = _ammo_cycle
	_ammo_cycle = 0
	wants_interact = _interact_pressed
	_interact_pressed = false
	var body := get_parent() as Node2D
	if body == null:
		return
	var to_mouse := body.get_global_mouse_position() - body.global_position
	if to_mouse.length() > AIM_DEAD_ZONE:
		aim_direction = to_mouse.normalized()
