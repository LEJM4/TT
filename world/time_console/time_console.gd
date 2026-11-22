class_name TimeConsole
extends StaticBody2D
## TimeConsole - die Zeitsteuerung in der Zeitkapsel: Hier wählt die Spielfigur
## das Ziel der Reise (M18).
##
## E (Kind Interactable) beginnt das Gespräch dialog (Kind TalkAction): "Wohin
## soll die Reise gehen?" mit bis zu drei Antworten. Die Zeile, nach der das
## Gespräch endet, nennt mit ihrer Aktion (DialogLine.action) das Ziel - die
## Kennung eines Levels aus data/world/travel.tres, etwa "test_field". Dann meldet
## die Zeitsteuerung travel_requested; reisen tut der SceneManager. Ohne Aktion
## - "Hierbleiben" - oder mit Esc geschieht nichts.
## Ein neues Ziel: eine Antwort und eine Zeile mit seiner Kennung als Aktion in
## data/dialogs/time_console.tres. Gesperrte Ziele und die Zeitkarte kommen später.
## Das Bild zeigt PropView mit data/skins/time_console.tres - den Kristall.
## Ihr Körper liegt auf "world": Figuren und Geschosse halten an ihr.
##
## Abschalten: Knoten löschen - aus der Zeitkapsel geht es nur noch mit F4 hinaus.

## Gespräch an der Zeitsteuerung: Frage nach dem Ziel, je Ziel eine Zeile mit Aktion.
@export var dialog: DialogData

@onready var _interactable := get_node_or_null("Interactable") as Interactable
@onready var _talk := get_node_or_null("TalkAction") as TalkAction


func _ready() -> void:
	if dialog == null:
		push_warning("TimeConsole %s: kein Gespräch gesetzt - E bewirkt nichts." % name)
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	if _talk != null:
		_talk.talk_started.connect(_on_talk_started)
		_talk.talk_finished.connect(_on_talk_finished)
		_talk.action_chosen.connect(_on_action_chosen)


func _on_interacted(actor: Node) -> void:
	if dialog == null:
		return
	if _talk == null:
		push_warning("TimeConsole %s: Das Kind TalkAction fehlt - E bewirkt nichts." % name)
		return
	_talk.talk(actor, dialog)


func _on_talk_started(_player_id: int) -> void:
	if _interactable != null:
		_interactable.enabled = false


func _on_talk_finished(_player_id: int, _completed: bool) -> void:
	if _interactable != null:
		_interactable.enabled = true


func _on_action_chosen(action: StringName, player_id: int) -> void:
	if get_node_or_null("/root/SceneManager") == null:
		push_warning("TimeConsole %s: Kein SceneManager - die Reise fällt aus." % name)
	EventBus.travel_requested.emit(player_id, String(action))
