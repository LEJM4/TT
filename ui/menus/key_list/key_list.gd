extends MenuScreen
## KeyList - die Tastenbelegung zum Ansehen (M20), aus den Optionen.
##
## Zeigt je Spielaktion ihren Namen und ihre Tasten, in zwei Spalten. Die Tasten
## kommen beim Öffnen aus der Tastenbelegung (InputMap, angelegt von InputSetup) -
## ändert sich die Belegung später, zeigt die Liste das von selbst. Tasten und
## Maustasten erscheinen als Bild aus Ui/Input/ des Grafik-Pakets, ohne Bild als
## Text, etwa „Maustaste 4“. Ändern lässt sich hier nichts; das kommt später.
## Was in der Liste steht, steht in ROWS; Entwickler-Tasten fehlen dort.

## Je Zeile: Name im Spiel und die Aktionen, deren Tasten dazu gehören.
const ROWS := [
	["Laufen", [&"move_up", &"move_left", &"move_down", &"move_right"]],
	["Sprinten", [&"sprint"]],
	["Schleichen", [&"sneak"]],
	["Dash", [&"dash"]],
	["Zuschlagen", [&"attack_primary"]],
	["Werfen", [&"attack_secondary"]],
	["Geschoss", [&"ammo_previous", &"ammo_next"]],
	["Fähigkeiten", [&"ability_1", &"ability_2", &"ability_3"]],
	["Bedienen", [&"interact"]],
	["Inventar", [&"inventory"]],
	["Missionen", [&"mission_toggle"]],
	["Pause", [&"pause"]],
]
## Ordner der Tastenbilder, je Taste Key<Name>.png.
const KEY_ICON_DIR := "res://assets/ninja_adventure/Ui/Input/Keyboard/"
## Ordner der Mausbilder.
const MOUSE_ICON_DIR := "res://assets/ninja_adventure/Ui/Input/Mouse/"
## Tasten mit eigenem Bildnamen; Buchstaben, Ziffern und F1 bis F12 ergeben sich selbst.
const KEY_ICON_NAMES := {
	KEY_SPACE: "Space", KEY_SHIFT: "Shift", KEY_CTRL: "Ctrl", KEY_ALT: "Alt",
	KEY_TAB: "Tab", KEY_ESCAPE: "Escape", KEY_ENTER: "Enter", KEY_DELETE: "Delete",
	KEY_UP: "Up", KEY_DOWN: "Down", KEY_LEFT: "Left", KEY_RIGHT: "Right",
}
## Tasten ohne Bild, als Text.
const KEY_TEXTS := {
	KEY_SPACE: "Leertaste", KEY_SHIFT: "Umschalt", KEY_CTRL: "Strg", KEY_ESCAPE: "Esc",
	KEY_HOME: "Pos1", KEY_END: "Ende", KEY_PAGEUP: "Bild auf", KEY_PAGEDOWN: "Bild ab",
}
## Maustasten mit Bild.
const MOUSE_ICON_NAMES := {
	MOUSE_BUTTON_LEFT: "MouseButtonLeft", MOUSE_BUTTON_RIGHT: "MouseButtonRight",
	MOUSE_BUTTON_MIDDLE: "MouseButtonMiddle", MOUSE_BUTTON_WHEEL_UP: "MouseWheelUp",
	MOUSE_BUTTON_WHEEL_DOWN: "MouseWheelDown",
}
## Maustasten ohne Bild, als Text.
const MOUSE_TEXTS := {
	MOUSE_BUTTON_XBUTTON1: "Maustaste 4", MOUSE_BUTTON_XBUTTON2: "Maustaste 5",
}

@onready var _grid := $Root/Window/Interior/Rows/Grid as GridContainer
@onready var _back := $Root/Window/Interior/Rows/Back as Button


func _ready() -> void:
	super._ready()
	_back.pressed.connect(back)


func _before_open() -> void:
	_build()


# Zwei Spalten: links die erste Hälfte der Zeilen, rechts die zweite.
func _build() -> void:
	for child in _grid.get_children():
		_grid.remove_child(child)
		child.queue_free()
	var rows: Array = []
	for row: Array in ROWS:
		var actions: Array = row[1]
		if actions.any(func(action: StringName) -> bool: return InputMap.has_action(action)):
			rows.append(row)
	var half := ceili(rows.size() / 2.0)
	for index in half:
		_add_row(rows[index])
		if index + half < rows.size():
			_add_row(rows[index + half])
		else:
			_grid.add_child(Control.new())
			_grid.add_child(Control.new())


func _add_row(row: Array) -> void:
	var name_label := Label.new()
	name_label.text = String(row[0])
	name_label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_grid.add_child(name_label)
	var inputs := HBoxContainer.new()
	inputs.add_theme_constant_override("separation", 2)
	inputs.custom_minimum_size = Vector2(0, 20)
	for action: StringName in row[1]:
		if not InputMap.has_action(action):
			continue
		for event in InputMap.action_get_events(action):
			var shown := _input_view(event)
			if shown != null:
				inputs.add_child(shown)
	_grid.add_child(inputs)


# Ein Bild oder ein Text für eine Taste oder Maustaste; null für alles andere.
func _input_view(event: InputEvent) -> Control:
	var key := event as InputEventKey
	if key != null:
		var code := key.keycode
		if key.physical_keycode != KEY_NONE:
			code = key.physical_keycode
			if DisplayServer.get_name() != "headless":
				# Die Taste an dieser Stelle der Tastatur, im Layout des Spielers.
				var in_layout := DisplayServer.keyboard_get_keycode_from_physical(key.physical_keycode)
				if in_layout != KEY_NONE:
					code = in_layout
		var icon := _key_icon(code)
		if icon != null:
			return _icon_view(icon)
		return _text_view(KEY_TEXTS.get(code, OS.get_keycode_string(code)))
	var button := event as InputEventMouseButton
	if button != null:
		if MOUSE_ICON_NAMES.has(button.button_index):
			var path: String = MOUSE_ICON_DIR + String(MOUSE_ICON_NAMES[button.button_index]) + ".png"
			if ResourceLoader.exists(path):
				return _icon_view(load(path) as Texture2D)
		return _text_view(MOUSE_TEXTS.get(button.button_index, "Maustaste %d" % button.button_index))
	return null


func _key_icon(code: Key) -> Texture2D:
	var icon_name := ""
	if KEY_ICON_NAMES.has(code):
		icon_name = KEY_ICON_NAMES[code]
	elif (code >= KEY_A and code <= KEY_Z) or (code >= KEY_0 and code <= KEY_9):
		icon_name = char(code)
	elif code >= KEY_F1 and code <= KEY_F12:
		icon_name = "F%d" % (code - KEY_F1 + 1)
	if icon_name.is_empty():
		return null
	var path := KEY_ICON_DIR + "Key" + icon_name + ".png"
	if not ResourceLoader.exists(path):
		return null
	return load(path) as Texture2D


func _icon_view(icon: Texture2D) -> Control:
	var view := TextureRect.new()
	view.texture = icon
	view.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
	view.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	view.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return view


func _text_view(text: String) -> Control:
	var label := Label.new()
	label.text = text
	label.theme_type_variation = &"MenuInfo"
	label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	return label
