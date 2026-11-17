extends CanvasLayer
## DebugOverlay - Entwickler-Anzeige über dem Spielbild (M1).
##
## Zeigt FPS, Mausposition und gedrückte Aktionen. Jedes Modul kann weitere
## Werte melden, ohne die Anzeige zu kennen:
##     EventBus.debug_value_changed.emit("Name", "Wert")
## Ein leerer Wert entfernt den Eintrag wieder.
## Wird die Anzeige zu lang, lassen sich einzelne Werte im Inspektor
## ausblenden: hidden_keys und show_mouse.
## Seit M12 steht sie oben rechts, damit sie das HUD oben links nicht verdeckt;
## align_right aus stellt sie wieder nach links.
##
## Ein- und ausblenden: Aktion "debug_toggle_overlay" (F1).
## Abschalten: Knoten aus der Szene löschen - kein anderes Modul braucht ihn.

## Sekunden zwischen zwei Aktualisierungen des Textes.
@export var refresh_interval := 0.1
## Schriftgröße der Anzeige in Pixeln.
@export var font_size := 12
## Ist die Anzeige beim Start sichtbar?
@export var visible_on_start := true
## Mausposition anzeigen?
@export var show_mouse := true
## Gemeldete Werte, die nicht angezeigt werden - ihre Namen, etwa "Kamera".
@export var hidden_keys := PackedStringArray()
## Oben rechts statt oben links (M12)?
@export var align_right := true
## Abstand zum rechten Rand in Pixeln, wenn align_right an ist (M12).
@export var edge_margin := 4.0

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
	if show_mouse:
		lines.append("Maus: %d, %d" % [int(mouse.x), int(mouse.y)])
	lines.append("Aktionen: %s" % _pressed_actions_text())
	for key: String in _values:
		if hidden_keys.has(key):
			continue
		lines.append("%s: %s" % [key, _values[key]])
	lines.append("Anzeige: F1")
	_label.text = "\n".join(lines)
	_label.reset_size()
	if align_right:
		# reset_size() behält die linke Kante; also nach jeder Änderung neu an den rechten Rand.
		_label.position.x = get_viewport().get_visible_rect().size.x - _label.size.x - edge_margin


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
