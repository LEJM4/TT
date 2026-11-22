extends MenuScreen
## MainMenu - das Hauptmenü, der erste Bildschirm nach dem Start (M20).
##
## Es steht in der Startszene levels/boot/boot.tscn. Drei Punkte:
##   Start      öffnet die Spielstand-Auswahl (Kind SaveSlots)
##   Optionen   öffnet die Optionen (Kind OptionsMenu)
##   Beenden    schließt das Spiel sofort, ohne Rückfrage - im Hauptmenü ist
##              kein Spielstand offen, es gibt nichts zu speichern
## Ist ein Platz gewählt (slot_chosen), startet das Spiel über den SceneManager:
## mit einem Spielstand dort, wo er aufgehört hat (start_game()), sonst als neues
## Spiel im Startlevel (new_game()). Ohne SceneManager lädt es fallback_scene.
## Titel und Zeitkapsel (Kind Root/Decor) stehen nur über dem Hauptmenü selbst,
## nicht über den Menüs, die es öffnet. Esc tut hier nichts.

## Szene, die ohne SceneManager geladen wird.
@export_file("*.tscn") var fallback_scene := "res://levels/test_chamber/test_chamber.tscn"

@onready var _start := $Root/Window/Interior/Rows/Start as Button
@onready var _options_button := $Root/Window/Interior/Rows/Options as Button
@onready var _quit := $Root/Window/Interior/Rows/Quit as Button
@onready var _slots := $SaveSlots as MenuScreen
@onready var _options := $OptionsMenu as MenuScreen
@onready var _decor := get_node_or_null("Root/Decor") as CanvasItem


func _ready() -> void:
	super._ready()
	_start.pressed.connect(open_child.bind(_slots))
	_options_button.pressed.connect(open_child.bind(_options))
	_quit.pressed.connect(_on_quit_pressed)
	_slots.connect(&"slot_chosen", _on_slot_chosen)
	_slots.closed.connect(_show_decor)
	_options.closed.connect(_show_decor)


## Esc im Hauptmenü: nichts.
func back() -> void:
	pass


func open_child(child: MenuScreen, keep_window := false) -> void:
	super.open_child(child, keep_window)
	if has_open_child() and _decor != null:
		_decor.visible = false


func _show_decor() -> void:
	if _decor != null:
		_decor.visible = true


func _on_slot_chosen(_slot: int, had_save: bool) -> void:
	var manager := get_node_or_null("/root/SceneManager")
	if manager != null:
		var started: bool = manager.call("start_game") if had_save else manager.call("new_game")
		if started:
			return
		push_warning("MainMenu: Der SceneManager startet das Spiel nicht - es geht mit %s weiter." % fallback_scene)
	if not fallback_scene.is_empty():
		get_tree().change_scene_to_file(fallback_scene)


func _on_quit_pressed() -> void:
	get_tree().quit()
