class_name DebrisCue
extends Node2D
## DebrisCue - lässt Splitter fliegen, wenn ein Baustein ein Signal sendet (M9).
##
## Benutzung: die Szene debris_cue.tscn als Kind an ein Ding hängen, neben den
## Baustein, auf den sie hören soll, und im Inspektor wählen:
##   debris       Werte-Datei der Splitter (DebrisData aus data/effects/)
##   source_name  Name des Geschwisters, etwa "Health"; leer: der Elternknoten
##   signal_name  Signal, das die Splitter auslöst, etwa "died" oder "hit_received"
## Die Splitter entstehen am Ort dieses Knotens und fliegen zu Ende, auch wenn
## das Ding danach verschwindet. Rein fürs Auge - der Baustein entscheidet nichts.
##
## Abschalten: Knoten löschen - die Mechanik läuft weiter, nur ohne Splitter.

## Werte-Datei der Splitter.
@export var debris: DebrisData
## Name des Geschwisters, dessen Signal zählt. Leer: der Elternknoten selbst.
@export var source_name := "Health"
## Signal, das die Splitter auslöst.
@export var signal_name := "died"


func _ready() -> void:
	if debris == null or signal_name.is_empty():
		push_warning("DebrisCue %s: Splitter oder Signal fehlt." % name)
		return
	var source := _find_source()
	if source == null:
		push_warning("DebrisCue %s: Knoten \"%s\" nicht gefunden." % [name, source_name])
		return
	var count := _argument_count(source, signal_name)
	if count < 0:
		push_warning("DebrisCue %s: \"%s\" hat kein Signal \"%s\"." % [name, source.name, signal_name])
		return
	# Die Werte des Signals braucht der Baustein nicht; unbind() lässt sie weg.
	var handler := _burst
	if count > 0:
		handler = _burst.unbind(count)
	source.connect(signal_name, handler)


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


func _burst() -> void:
	var holder: Node = get_tree().current_scene
	if holder == null:
		holder = get_parent()
	Debris.spawn(debris, global_position, holder)
