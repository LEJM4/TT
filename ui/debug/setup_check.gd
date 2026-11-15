extends Control
## Setup-Check für M0: zeigt, ob Projekt, Auflösung, Maus und Tasten funktionieren.
## Wird in M1 als Startszene von der Testkammer abgelöst.

var _label: Label
var _bus_ok := false


func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_label = Label.new()
	_label.position = Vector2(8, 6)
	_label.size = Vector2(464, 200)
	_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_label)
	EventBus.setup_checked.connect(_on_setup_checked)
	EventBus.setup_checked.emit("setup_check")


func _process(_delta: float) -> void:
	var pressed := PackedStringArray()
	for action in InputSetup.all_actions():
		if Input.is_action_pressed(action):
			pressed.append(action)
	var pressed_text := "-"
	if not pressed.is_empty():
		pressed_text = ", ".join(pressed)
	var bus_text := "FEHLER"
	if _bus_ok:
		bus_text = "ok"
	var viewport_size := get_viewport_rect().size
	var mouse := get_local_mouse_position()

	var lines := PackedStringArray()
	lines.append("TimeTraveller - Setup-Check (M0)")
	lines.append("Godot %s" % Engine.get_version_info()["string"])
	lines.append("Spielfläche: %d x %d" % [int(viewport_size.x), int(viewport_size.y)])
	lines.append("EventBus: %s" % bus_text)
	lines.append("Maus: %d, %d" % [int(mouse.x), int(mouse.y)])
	lines.append("Gedrückt: %s" % pressed_text)
	lines.append("")
	lines.append("Teste: W A S D, Maus links und rechts, Leertaste, Umschalt, Strg, E, Q, 1 2 3, Tab, M, Esc")
	_label.text = "\n".join(lines)
	queue_redraw()


func _draw() -> void:
	var mouse := get_local_mouse_position()
	draw_line(mouse + Vector2(-4, 0), mouse + Vector2(5, 0), Color.WHITE, 1.0)
	draw_line(mouse + Vector2(0, -4), mouse + Vector2(0, 5), Color.WHITE, 1.0)


func _on_setup_checked(_source: String) -> void:
	_bus_ok = true
