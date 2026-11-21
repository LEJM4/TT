class_name Persistent
extends Node
## Persistent - merkt sich den Zustand seines Elternknotens im Spielstand (M16).
##
## Benutzung: die Szene persistent.tscn als Kind an ein Ding der Welt hängen,
## das zwei Methoden hat:
##   get_saved_state()         liefert seinen Zustand als Dictionary, etwa {"open": true}
##   apply_saved_state(daten)  stellt ihn wieder her - ohne Beute, Splitter und Effekte
## Sobald das Ding bereit ist, holt der Baustein den gemerkten Zustand aus
## GameState und gibt ihn weiter. Sendet das Ding danach sein Signal save_signal
## (Standard "state_changed"), legt er dort den neuen Zustand ab. In die Datei
## schreibt ihn der SaveManager, etwa beim Rasten am Zeitanker.
## Die Kennung ist das Level - level_id der Level-Szene - und der Pfad des Dings
## darin, etwa "test_chamber" und "InteractionCorner/WoodDoor". Wer ein Ding
## umbenennt oder verschiebt, verliert seinen gemerkten Zustand.
## Dinge, die erst im Spiel entstehen - etwa Beute aus dem LootSpawner -, haben
## keinen Platz in der Level-Szene; die merkt er sich nicht.
## Er entscheidet nichts: über den Zustand das Ding, über den Fortschritt GameState.
##
## Abschalten: Knoten löschen - das Ding steht nach jedem Neustart des Raums
## wieder so da wie in der Level-Szene, wie vor M16.

## Signal des Elternknotens, nach dem sein Zustand gemerkt wird.
@export var save_signal := "state_changed"

var _holder: Node
var _level_id := ""
var _object_id := ""


func _ready() -> void:
	_holder = get_parent()
	if _holder == null or _holder.owner == null:
		# Erst im Spiel entstanden, etwa Beute aus dem LootSpawner: nichts zu merken.
		return
	if not _holder.has_method("get_saved_state") or not _holder.has_method("apply_saved_state"):
		push_warning("Persistent: %s hat kein get_saved_state() oder apply_saved_state()." % _holder.name)
		return
	var state := _game_state()
	if state == null:
		return
	_level_id = state.call("level_id_of", _holder)
	_object_id = state.call("object_id_of", _holder)
	# Erst wenn das Ding selbst bereit ist: Sein _ready() stellt den Zustand aus der Szene her.
	if _holder.is_node_ready():
		_restore()
	else:
		_holder.ready.connect(_restore, CONNECT_ONE_SHOT)


## Kennung im Spielstand, etwa "test_chamber: ChestSmall"; leer, wenn er sich nichts merkt.
func get_key() -> String:
	if _object_id.is_empty():
		return ""
	return "%s: %s" % [_level_id, _object_id]


func _restore() -> void:
	var state := _game_state()
	if state == null or not is_instance_valid(_holder):
		return
	var data: Dictionary = state.call("get_object_state", _level_id, _object_id)
	if not data.is_empty():
		_holder.call("apply_saved_state", data)
	# Erst jetzt zuhören: Was das Ding beim Start und beim Wiederherstellen meldet, ist schon gemerkt.
	_listen()


func _listen() -> void:
	var count := _argument_count(_holder, save_signal)
	if count < 0:
		push_warning("Persistent: %s hat kein Signal \"%s\"." % [_holder.name, save_signal])
		return
	# Die Werte des Signals braucht der Baustein nicht; unbind() lässt sie weg.
	var handler := _store
	if count > 0:
		handler = _store.unbind(count)
	_holder.connect(save_signal, handler)


func _store() -> void:
	var state := _game_state()
	if state == null or not is_instance_valid(_holder):
		return
	var data: Variant = _holder.call("get_saved_state")
	if not data is Dictionary:
		data = {}
	state.call("set_object_state", _level_id, _object_id, data)


func _argument_count(source: Node, which: String) -> int:
	for info in source.get_signal_list():
		if info["name"] == which:
			return (info["args"] as Array).size()
	return -1


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")
