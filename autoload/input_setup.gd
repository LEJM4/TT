extends Node
## InputSetup - legt beim Spielstart die Tastenbelegung an.
##
## Ändern: Einträge in KEY_BINDINGS oder MOUSE_BINDINGS anpassen.
## Neue Aktion: eine Zeile ergänzen, mehr ist nicht nötig.
## Später überschreibt das Optionen-Menü (M20) diese Standardwerte.

## Aktion -> Tasten (Position auf der Tastatur, unabhängig vom Layout).
const KEY_BINDINGS := {
	"move_up": [KEY_W],
	"move_down": [KEY_S],
	"move_left": [KEY_A],
	"move_right": [KEY_D],
	"dash": [KEY_SPACE],
	"sprint": [KEY_SHIFT],
	"sneak": [KEY_CTRL],
	"interact": [KEY_E],
	"use_potion": [KEY_Q],
	"ability_1": [KEY_1],
	"ability_2": [KEY_2],
	"ability_3": [KEY_3],
	"inventory": [KEY_TAB],
	"map": [KEY_M],
	"pause": [KEY_ESCAPE],
	"debug_toggle_overlay": [KEY_F1],
	"debug_restart_room": [KEY_F2],
}

## Aktion -> Maustasten.
const MOUSE_BINDINGS := {
	"attack_primary": [MOUSE_BUTTON_LEFT],
	"attack_secondary": [MOUSE_BUTTON_RIGHT],
	"dash": [MOUSE_BUTTON_XBUTTON1],
}


func _enter_tree() -> void:
	for action: String in KEY_BINDINGS:
		_ensure_action(action)
		for key in KEY_BINDINGS[action]:
			var event := InputEventKey.new()
			event.physical_keycode = key
			InputMap.action_add_event(action, event)
	for action: String in MOUSE_BINDINGS:
		_ensure_action(action)
		for button in MOUSE_BINDINGS[action]:
			var event := InputEventMouseButton.new()
			event.button_index = button
			InputMap.action_add_event(action, event)


## Alle Aktionen, die dieses Skript anlegt.
func all_actions() -> Array[String]:
	var names: Array[String] = []
	for action: String in KEY_BINDINGS:
		names.append(action)
	for action: String in MOUSE_BINDINGS:
		if not names.has(action):
			names.append(action)
	return names


func _ensure_action(action: String) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action)
