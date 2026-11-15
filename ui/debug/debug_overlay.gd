extends CanvasLayer
## DebugOverlay - Entwickler-Anzeige über dem Spielbild (M1).
##
## Zeigt FPS, Mausposition und gedrückte Aktionen. Jedes Modul kann weitere
## Werte melden, ohne die Anzeige zu kennen:
##     EventBus.debug_value_changed.emit("Name", "Wert")
## Ein leerer Wert entfernt den Eintrag wieder.
##
## Ein- und ausblenden: Aktion "debug_toggle_overlay" (F1).
## Abschalten: Knoten aus der Szene löschen - kein anderes Modul braucht ihn.

## Sekunden zwischen zwei Aktualisierungen des Textes.
@export var refresh_interval := 0.1
## Schriftgröße der Anzeige in Pixeln.
@export var font_size := 12
## Ist die Anzeige beim Start sichtbar?
@export var visible_on_start := true

var _values: Dictionary = {}
var _time_left := 0.0

@onready var _label: Label = $ValuesLabel


func _ready() -> void:
	visible = visible_on_start
	_label.add_theme_font_size_override("font_size", font_size)
	EventBus.debug_value_changed.connect(_on_debug_value_changed)
	_refresh()


func _process(delta: float) -> void:
	_time_left -= delta
	if _time_left > 0.0:
		return
	_time_left = refresh_interval
	if visible:
		_refresh()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_toggle_overlay"):
		visible = not visible
		if visible:
			_refresh()
		get_viewport().set_input_as_handled()


func _refresh() -> void:
	var mouse := get_viewport().get_mouse_position()
	var lines := PackedStringArray()
	lines.append("FPS: %d" % int(Engine.get_frames_per_second()))
	lines.append("Maus: %d, %d" % [int(mouse.x), int(mouse.y)])
	lines.append("Aktionen: %s" % _pressed_actions_text())
	for key: String in _values:
		lines.append("%s: %s" % [key, _values[key]])
	lines.append("Anzeige: F1")
	_label.text = "\n".join(lines)
	_label.reset_size()


func _pressed_actions_text() -> String:
	var pressed := PackedStringArray()
	for action in InputSetup.all_actions():
		if Input.is_action_pressed(action):
			pressed.append(action)
	if pressed.is_empty():
		return "-"
	return ", ".join(pressed)


func _on_debug_value_changed(key: String, value: String) -> void:
	if value.is_empty():
		_values.erase(key)
	else:
		_values[key] = value
