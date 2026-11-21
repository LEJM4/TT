extends CanvasLayer
## DialogWindow - das Dialogfenster einer Spielfigur: Gespräche mit NPCs (M15).
##
## Ein NPC bittet über den EventBus darum (dialog_requested). Gilt die Bitte der
## Figur mit player_id und ist das Fenster frei, zeigt es das Gespräch unten in
## der Mitte: im Reiter den Namen des Sprechers, links sein Porträt, rechts bis zu
## drei Zeilen Text, Buchstabe für Buchstabe. E, Leertaste oder Linksklick
## (Aktion dialog_next) zeigt den Text ganz; noch einmal geht es weiter - darauf
## wartet der Pfeil unten rechts. Hat eine Zeile Antworten, stehen sie über dem
## Fenster und werden mit 1 bis 3 (dialog_choice_1 bis 3) oder mit der Maus
## gewählt. Esc (pause) bricht das Gespräch ab.
## Den Weg durch das Gespräch kennt der DialogRunner. Das Fenster entscheidet
## nichts: Es meldet jede Zeile, die es zeigt (dialog_line_shown), und der NPC
## gibt daraufhin vielleicht etwas. Solange es offen ist, meldet es das über
## menu_changed: Die Figur bleibt stehen, die Welt läuft weiter. Tab öffnet dann
## kein Inventar - dafür liegt das Fenster in der Szene hinter dem Inventarfenster
## und hört zuerst.
## Aussehen: ui/dialog/dialog_theme.tres; Werte: data/ui/dialog.tres.
##
## Abschalten: Knoten aus dem Level löschen - NPCs bleiben dann stumm.

## Höchstens so viele Textzeilen passen ins Fenster.
const MAX_TEXT_LINES := 3
## Fenster mit Platz für ein Porträt.
const BOX_WITH_PORTRAIT := preload("res://assets/ninja_adventure/Ui/Dialog/DialogBoxFaceset.png")
## Fenster ohne Porträt, für Sprecher ohne Bild.
const BOX_PLAIN := preload("res://assets/ninja_adventure/Ui/Dialog/DialogBox.png")
## Linker Rand des Texts mit Porträt, in Pixeln vom Fensterrand.
const TEXT_LEFT_WITH_PORTRAIT := 54.0
## Linker Rand des Texts ohne Porträt, in Pixeln vom Fensterrand.
const TEXT_LEFT_PLAIN := 10.0
## Aktionen der Antworten, in der Reihenfolge der Kästchen.
const CHOICE_ACTIONS: Array[String] = ["dialog_choice_1", "dialog_choice_2", "dialog_choice_3"]

## Nummer der Spielfigur, deren Gespräche das Fenster zeigt.
@export var player_id := 1
## Werte-Datei mit dem Tempo des Texts.
@export var settings: DialogSettings

var _runner := DialogRunner.new()
var _line: DialogLine
var _source_id := 0
var _typing := false
var _typed := 0.0
var _clock := 0.0
var _arrow_rest := Vector2.ZERO
var _buttons: Array[Button] = []

@onready var _root := $Root as Control
@onready var _box := $Root/Box as TextureRect
@onready var _portrait := $Root/Box/Portrait as TextureRect
@onready var _name := $Root/Box/Name as Label
@onready var _text := $Root/Box/Text as Label
@onready var _arrow := $Root/Box/Arrow as Control
@onready var _choices := $Root/Choices as Control


func _ready() -> void:
	if settings == null:
		push_warning("DialogWindow: keine Werte-Datei gesetzt, nutze Standardwerte.")
		settings = DialogSettings.new()
	_root.visible = false
	_arrow_rest = _arrow.position
	for child in _choices.get_children():
		var button := child as Button
		if button == null:
			continue
		button.pressed.connect(_on_choice_pressed.bind(_buttons.size()))
		_buttons.append(button)
	_hide_choices()
	EventBus.dialog_requested.connect(_on_dialog_requested)


func _process(delta: float) -> void:
	if not is_open():
		return
	if _typing:
		_typed += settings.characters_per_second * delta
		var length := maxi(_text.text.length(), 1)
		if _typed >= length:
			_finish_typing()
		else:
			_text.visible_ratio = _typed / length
	elif _arrow.visible:
		_clock += delta
		var up := fmod(_clock * settings.arrow_bob_rate, 1.0) >= 0.5
		_arrow.position = _arrow_rest - Vector2(0.0, 1.0 if up else 0.0)


func _input(event: InputEvent) -> void:
	if not is_open():
		return
	var choice := _choice_action(event)
	if event.is_action_pressed("pause"):
		close()
		get_viewport().set_input_as_handled()
	elif event.is_action_pressed("inventory"):
		# Während des Gesprächs bleibt das Inventar zu.
		get_viewport().set_input_as_handled()
	elif choice >= 0:
		get_viewport().set_input_as_handled()
		if _typing:
			_finish_typing()
		else:
			_choose(choice)
	elif event.is_action_pressed("dialog_next"):
		if _typing:
			_finish_typing()
			get_viewport().set_input_as_handled()
		elif not _has_choices():
			_advance()
			get_viewport().set_input_as_handled()
		elif not (event is InputEventMouseButton):
			# Bei einer Frage tun E und Leertaste nichts; ein Klick gehört den Kästchen.
			get_viewport().set_input_as_handled()


## Ist das Fenster offen?
func is_open() -> bool:
	return _root.visible


## Schließt das Fenster und beendet das Gespräch. completed heißt: bis zum Ende gelaufen.
func close(completed := false) -> void:
	if not is_open():
		return
	_root.visible = false
	_hide_choices()
	_runner.stop()
	_line = null
	_typing = false
	var source := _source_id
	_source_id = 0
	EventBus.dialog_finished.emit(player_id, source, completed)
	EventBus.menu_changed.emit(player_id, false)


func _on_dialog_requested(target_player: int, dialog: Resource, source_id: int) -> void:
	if target_player != player_id or is_open():
		return
	var data := dialog as DialogData
	if data == null:
		push_warning("DialogWindow: Die Bitte bringt kein Gespräch (DialogData) mit.")
		return
	for problem in data.check():
		push_warning("DialogWindow: %s - %s" % [data.resource_path, problem])
	var first := _runner.start(data)
	if first == null:
		push_warning("DialogWindow: %s hat keine Zeilen." % data.resource_path)
		return
	_source_id = source_id
	_root.visible = true
	EventBus.menu_changed.emit(player_id, true)
	EventBus.dialog_started.emit(player_id, source_id)
	_show_line(first)


func _show_line(line: DialogLine) -> void:
	_line = line
	var speaker := _runner.dialog.speaker_of(line)
	var portrait: Texture2D = null
	var title := ""
	if speaker != null:
		portrait = speaker.portrait
		title = speaker.display_name
	_box.texture = BOX_WITH_PORTRAIT if portrait != null else BOX_PLAIN
	_portrait.texture = portrait
	_portrait.visible = portrait != null
	_name.text = title
	_text.offset_left = TEXT_LEFT_WITH_PORTRAIT if portrait != null else TEXT_LEFT_PLAIN
	_text.text = line.text
	_text.visible_ratio = 0.0
	if _text.get_line_count() > MAX_TEXT_LINES:
		push_warning("DialogWindow: Der Text \"%s\" braucht %d Zeilen; ins Fenster passen %d." % [line.text, _text.get_line_count(), MAX_TEXT_LINES])
	_typed = 0.0
	_typing = true
	_arrow.visible = false
	_hide_choices()
	EventBus.dialog_line_shown.emit(player_id, _source_id, line)
	if settings.characters_per_second <= 0.0:
		_finish_typing()


func _finish_typing() -> void:
	_typing = false
	_text.visible_ratio = 1.0
	if _has_choices():
		_show_choices()
	else:
		_clock = 0.0
		_arrow.position = _arrow_rest
		_arrow.visible = true


func _advance() -> void:
	var following := _runner.advance()
	if following == null:
		close(true)
	else:
		_show_line(following)


func _choose(index: int) -> void:
	if not _has_choices() or index < 0 or index >= _line.get_choices().size():
		return
	var following := _runner.choose(index)
	if following == null:
		close(true)
	else:
		_show_line(following)


func _on_choice_pressed(index: int) -> void:
	if is_open() and not _typing:
		_choose(index)


func _has_choices() -> bool:
	return _line != null and _line.has_choices()


func _show_choices() -> void:
	var choices := _line.get_choices()
	for index in _buttons.size():
		var button := _buttons[index]
		button.visible = index < choices.size()
		if button.visible:
			button.text = choices[index].text
	_choices.visible = true


func _hide_choices() -> void:
	for button in _buttons:
		button.visible = false
	_choices.visible = false


# Welche Antwort-Taste das Ereignis ist, ab 0 gezählt; -1: keine.
func _choice_action(event: InputEvent) -> int:
	for index in CHOICE_ACTIONS.size():
		if event.is_action_pressed(CHOICE_ACTIONS[index]):
			return index
	return -1
