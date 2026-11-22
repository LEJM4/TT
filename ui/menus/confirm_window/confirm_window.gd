class_name ConfirmWindow
extends MenuScreen
## ConfirmWindow - eine Nachfrage mit zwei Antworten (M20), etwa „Spielstand
## wirklich unwiderruflich löschen?“ mit Ja und Nein.
##
## Wer fragen will, setzt mit setup() Frage und Antworten und öffnet das Fenster
## mit open_child() aus seinem Menü. Die Antwort kommt mit answered(ja). Gewählt
## ist zuerst die sichere Antwort, die zweite; Esc heißt ebenfalls Nein.
## Mit yes_by_keyboard aus geht die erste Antwort nur mit der Maus - so löscht
## niemand einen Spielstand versehentlich per Tastatur.
## Die Fläche um das Fenster ist abgedunkelt und fängt die Maus ab: Was darunter
## liegt, lässt sich nicht anklicken, solange die Frage offen ist.

## Die Frage ist beantwortet: yes heißt die erste Antwort, sonst die zweite oder Esc.
signal answered(yes: bool)

@onready var _question := $Root/Window/Interior/Rows/Question as Label
@onready var _yes := $Root/Window/Interior/Rows/Buttons/Yes as Button
@onready var _no := $Root/Window/Interior/Rows/Buttons/No as Button


func _ready() -> void:
	super._ready()
	_yes.pressed.connect(_answer.bind(true))
	_no.pressed.connect(_answer.bind(false))


## Setzt Frage und Antworten für das nächste Öffnen. yes_by_keyboard aus: Die
## erste Antwort geht nur mit der Maus.
func setup(question: String, yes_text := "Ja", no_text := "Nein", yes_by_keyboard := true) -> void:
	_question.text = question
	_yes.text = yes_text
	_no.text = no_text
	_yes.focus_mode = Control.FOCUS_ALL if yes_by_keyboard else Control.FOCUS_NONE


## Esc: Nein.
func back() -> void:
	_answer(false)


func _answer(yes: bool) -> void:
	if not is_open():
		return
	close()
	answered.emit(yes)
