class_name MissionCue
extends Node
## MissionCue - meldet ein Ereignis für Missionen, wenn ein Baustein ein Signal sendet (M17).
##
## Benutzung: die Szene mission_cue.tscn als Kind an ein Ding hängen und im
## Inspektor wählen:
##   event        Name des Ereignisses, etwa "caveman_defeated"
##   amount       so viel zählt es, meist 1
##   source_name  Name des Geschwisters, etwa "Health"; leer: der Elternknoten
##   signal_name  Signal, das das Ereignis auslöst, etwa "died"
## Das Ereignis geht über den EventBus (mission_event) an den MissionTracker des
## Levels; welche Mission es zählt, entscheidet er. Aufbau wie LootDropper.
## Beispiele: am Höhlenmenschen "caveman_defeated" bei Health/died, an der
## grossen Truhe der Testkammer "chest_big_opened" bei opened.
##
## Abschalten: Knoten löschen - das Ding zählt für keine Mission mehr.

## Das Ereignis wurde gemeldet.
signal cued(event: StringName)

## Name des Ereignisses, so wie es in den Zielen der Missionen steht.
@export var event: StringName = &""
## So viel zählt es.
@export_range(1, 99) var amount := 1
## Name des Geschwisters, dessen Signal zählt. Leer: der Elternknoten selbst.
@export var source_name := "Health"
## Signal, das das Ereignis auslöst.
@export var signal_name := "died"


func _ready() -> void:
	if event == &"" or signal_name.is_empty():
		push_warning("MissionCue %s: Ereignis oder Signal fehlt." % _label())
		return
	var source := _find_source()
	if source == null:
		push_warning("MissionCue %s: Knoten \"%s\" nicht gefunden." % [_label(), source_name])
		return
	var count := _argument_count(source, signal_name)
	if count < 0:
		push_warning("MissionCue %s: \"%s\" hat kein Signal \"%s\"." % [_label(), source.name, signal_name])
		return
	# Die Werte des Signals braucht der Baustein nicht; unbind() lässt sie weg.
	var handler := cue
	if count > 0:
		handler = cue.unbind(count)
	source.connect(signal_name, handler)


## Meldet das Ereignis.
func cue() -> void:
	if event == &"":
		return
	EventBus.mission_event.emit(event, amount)
	cued.emit(event)


func _find_source() -> Node:
	var holder := get_parent()
	if holder == null or source_name.is_empty():
		return holder
	return holder.get_node_or_null(source_name)


func _argument_count(source: Node, which: String) -> int:
	for info in source.get_signal_list():
		if info["name"] == which:
			return (info["args"] as Array).size()
	return -1


# Name für Warnungen: Eltern und eigener Name, etwa "ChestBig/MissionCue".
func _label() -> String:
	var holder := get_parent()
	if holder == null:
		return String(name)
	return "%s/%s" % [holder.name, name]
