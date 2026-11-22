class_name TalkAction
extends Node
## TalkAction - führt für ein Ding ein Gespräch und meldet danach die gewählte
## Aktion (M18).
##
## Benutzung: die Szene talk_action.tscn als Kind an ein Ding hängen, das mit
## Gesprächen bedient wird - die Zeitkapsel, die Zeitsteuerung -, und im Skript
## des Dings talk(figur, gespräch) aufrufen, etwa wenn E gedrückt wurde. Der
## Baustein bittet das Dialogfenster der Figur um das Gespräch; als Sprecher gilt
## der Elternknoten, zu ihm dreht sich die Figur (TalkFacing).
## Jede gezeigte Zeile mit einer Aktion (DialogLine.action) merkt er sich; eine
## Zeile ohne Aktion löscht sie wieder. Endet das Gespräch regulär, meldet er die
## Aktion der letzten Zeile: action_chosen(aktion, player_id). Was dann geschieht,
## entscheidet der Elternknoten. Mit Esc abgebrochen geschieht nichts.
## Ohne Dialogfenster im Level schreibt er eine Warnung, und es geschieht nichts.
##
## Abschalten: Knoten löschen - das Ding führt keine Gespräche mehr.

## Das Gespräch hat begonnen - das Dialogfenster zeigt es.
signal talk_started(player_id: int)
## Das Gespräch ist vorbei; completed heißt: bis zum Ende, sonst abgebrochen.
signal talk_finished(player_id: int, completed: bool)
## Das Gespräch endete mit einer Aktion, etwa "board".
signal action_chosen(action: StringName, player_id: int)

var _talking := false
var _action: StringName = &""


func _ready() -> void:
	EventBus.dialog_started.connect(_on_dialog_started)
	EventBus.dialog_line_shown.connect(_on_dialog_line_shown)
	EventBus.dialog_finished.connect(_on_dialog_finished)


## Bittet das Dialogfenster von actor um das Gespräch. Liefert, ob die Bitte
## hinausging; ob das Fenster frei ist, entscheidet es selbst.
func talk(actor: Node, dialog: DialogData) -> bool:
	if dialog == null or _talking or actor == null:
		return false
	var player_id: Variant = actor.get("player_id")
	if not player_id is int:
		return false
	if EventBus.dialog_requested.get_connections().is_empty():
		push_warning("TalkAction %s: Kein Dialogfenster im Level - das Gespräch fällt aus." % _holder_name())
		return false
	EventBus.dialog_requested.emit(int(player_id), dialog, _source_id())
	return true


## Läuft gerade ein Gespräch?
func is_talking() -> bool:
	return _talking


# Als Sprecher gilt der Elternknoten: Seine Kennung tragen die Meldungen des Fensters.
func _source_id() -> int:
	var holder := get_parent()
	return holder.get_instance_id() if holder != null else get_instance_id()


func _holder_name() -> String:
	var holder := get_parent()
	return String(holder.name) if holder != null else String(name)


func _on_dialog_started(player_id: int, source_id: int) -> void:
	if source_id != _source_id():
		return
	_talking = true
	_action = &""
	talk_started.emit(player_id)


func _on_dialog_line_shown(_player_id: int, source_id: int, line: Resource) -> void:
	if source_id != _source_id():
		return
	var dialog_line := line as DialogLine
	_action = dialog_line.action if dialog_line != null else &""


func _on_dialog_finished(player_id: int, source_id: int, completed: bool) -> void:
	if source_id != _source_id():
		return
	_talking = false
	var chosen := _action
	_action = &""
	talk_finished.emit(player_id, completed)
	if completed and chosen != &"":
		action_chosen.emit(chosen, player_id)
