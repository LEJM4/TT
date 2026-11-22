extends MenuScreen
## PauseMenu - das Pausenmenü (M20): Esc im laufenden Spiel, in jedem Level und
## in der Zeitkapsel.
##
##   Weiter           schließt das Menü
##   Optionen         dieselben Optionen wie im Hauptmenü (Kind OptionsMenu)
##   Reise abbrechen  nur in einem Level, nicht in der Zeitkapsel: dieselbe Frage
##                    mit denselben Antworten wie an der Zeitkapsel, gelesen aus
##                    abort_dialog (data/dialogs/time_capsule_abort.tres); die
##                    Antwort, die dort abbricht, meldet level_leave_requested -
##                    der Fortschritt im Level ist verloren, wie an der Zeitkapsel
##   Hauptmenü        speichert, dann zurück zum Startbildschirm
##   Spiel beenden    speichert, dann schließt das Spiel - wie das X am Fenster
## Esc öffnet das Menü nur, wenn nichts anderes Esc braucht: Ein Gespräch oder das
## Inventar schließt Esc wie bisher, erst das nächste Esc öffnet das Menü. Während
## eines Szenenwechsels öffnet es sich nicht. Esc im Menü schließt es wieder.
## Im Einzelspiel hält es die Welt ganz an (SceneTree.paused): Gegner, Geschosse,
## Zeiten und die Spielzeit stehen. Im Mehrspieler (Phase 8) hält nichts an; dann
## bleibt nur die eigene Figur stehen, weil das Menü menu_changed meldet.
## Verlassen die Figuren das Level aus dem Menü heraus, bleibt die Welt bis zum
## Wechsel angehalten; beim Wechsel löst das Menü die Pause wieder.
##
## Abschalten: Knoten aus dem Level löschen - Esc tut dann nichts mehr.

## Aktion der Antwort, die die Reise abbricht - wie an der Zeitkapsel.
const ACTION_ABORT := &"abort"

## Das Gespräch der Zeitkapsel, wenn noch Pflichtmissionen offen sind: Aus ihm
## kommen Frage und Antworten für „Reise abbrechen“.
@export var abort_dialog: DialogData
## Startszene mit dem Hauptmenü, wenn es keinen SceneManager gibt.
@export_file("*.tscn") var fallback_menu_scene := "res://levels/boot/boot.tscn"

var _paused_world := false
var _leaving := false

@onready var _resume := $Root/Window/Interior/Rows/Resume as Button
@onready var _options_button := $Root/Window/Interior/Rows/Options as Button
@onready var _abort := $Root/Window/Interior/Rows/Abort as Button
@onready var _main_menu := $Root/Window/Interior/Rows/MainMenu as Button
@onready var _quit := $Root/Window/Interior/Rows/Quit as Button
@onready var _options := $OptionsMenu as MenuScreen
@onready var _confirm := $Confirm as ConfirmWindow


func _ready() -> void:
	super._ready()
	_resume.pressed.connect(close)
	_options_button.pressed.connect(open_child.bind(_options))
	_abort.pressed.connect(_on_abort_pressed)
	_main_menu.pressed.connect(_on_main_menu_pressed)
	_quit.pressed.connect(_on_quit_pressed)
	_confirm.answered.connect(_on_abort_answered)


func _unhandled_input(event: InputEvent) -> void:
	if is_open() or _leaving or not _pressed(event, &"pause"):
		return
	var manager := _scene_manager()
	if manager != null and manager.call("is_changing"):
		return
	get_viewport().set_input_as_handled()
	open()


func _exit_tree() -> void:
	_resume_world()


## Schließt das Menü; die Welt läuft weiter.
func close() -> void:
	super.close()
	_resume_world()


func _before_open() -> void:
	_leaving = false
	_abort.visible = _in_level() and abort_dialog != null
	if _is_single_player():
		get_tree().paused = true
		_paused_world = true


func _accepts_input() -> bool:
	return not _leaving


func _on_abort_pressed() -> void:
	if _leaving or has_open_child():
		return
	var question := _abort_question()
	var aborting := _aborting_choice()
	if question == null or aborting < 0:
		push_warning("PauseMenu: In %s fehlt eine Frage mit einer Antwort, die die Reise abbricht." % _dialog_path())
		return
	var choices := question.get_choices()
	var staying := 1 if aborting == 0 else 0
	var stay_text := choices[staying].text if staying < choices.size() else "Nein"
	_confirm.setup(question.text, choices[aborting].text, stay_text, true)
	open_child(_confirm, true)


func _on_abort_answered(yes: bool) -> void:
	if yes:
		_leave_level()


# Bricht die Reise ab - derselbe Weg wie an der Zeitkapsel.
func _leave_level() -> void:
	_leaving = true
	var manager := _scene_manager()
	if manager != null:
		EventBus.level_leave_requested.emit(player_id)
		if manager.call("is_changing"):
			# Die Welt bleibt angehalten, bis das Level wechselt; dann löst _exit_tree() die Pause.
			return
		push_warning("PauseMenu: Die Reise lässt sich gerade nicht abbrechen.")
		_leaving = false
		return
	# Ohne SceneManager wie die Test-Taste Bild ab: Levelstand verwerfen, neu laden.
	var state := get_node_or_null("/root/GameState")
	close()
	if state != null and state.call("leave_level"):
		get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	if _leaving or has_open_child():
		return
	_leaving = true
	EventBus.save_requested.emit("Hauptmenü")
	var manager := _scene_manager()
	if manager != null:
		if manager.call("go_to_menu"):
			return
		push_warning("PauseMenu: Der SceneManager wechselt gerade nicht ins Hauptmenü.")
		_leaving = false
		return
	close()
	if not fallback_menu_scene.is_empty():
		get_tree().change_scene_to_file(fallback_menu_scene)


func _on_quit_pressed() -> void:
	if _leaving or has_open_child():
		return
	_leaving = true
	# Wie das X am Fenster: Der SaveManager speichert und beendet.
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


# Die Frage im Gespräch der Zeitkapsel: die erste Zeile mit Antworten.
func _abort_question() -> DialogLine:
	var runner := DialogRunner.new()
	var line := runner.start(abort_dialog)
	while line != null and not line.has_choices():
		line = runner.advance()
	return line


# Welche Antwort die Reise abbricht, ab 0 gezählt; -1: keine. Gerechnet wie bei
# der Zeitkapsel: Es zählt die Aktion der letzten Zeile, bevor das Gespräch endet.
func _aborting_choice() -> int:
	var question := _abort_question()
	if question == null:
		return -1
	for index in question.get_choices().size():
		var runner := DialogRunner.new()
		var line := runner.start(abort_dialog)
		while line != null and line != question:
			line = runner.advance()
		line = runner.choose(index)
		var action: StringName = &""
		var steps := 0
		while line != null and not line.has_choices() and steps < 64:
			action = line.action
			line = runner.advance()
			steps += 1
		if line == null and action == ACTION_ABORT:
			return index
	return -1


func _resume_world() -> void:
	if not _paused_world:
		return
	_paused_world = false
	if is_inside_tree():
		get_tree().paused = false


# Läuft gerade ein Level - nicht die Zeitkapsel?
func _in_level() -> bool:
	var state := get_node_or_null("/root/GameState")
	return state != null and state.call("has_run")


# Ohne Netz ist es ein Einzelspiel: Dann darf die Welt anhalten.
func _is_single_player() -> bool:
	var peer := multiplayer.multiplayer_peer
	return peer == null or peer is OfflineMultiplayerPeer


func _scene_manager() -> Node:
	return get_node_or_null("/root/SceneManager")


func _dialog_path() -> String:
	return abort_dialog.resource_path if abort_dialog != null else "abort_dialog"
