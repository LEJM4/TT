class_name LootDropper
extends Node2D
## LootDropper - lässt Beute fallen, wenn ein Baustein ein Signal sendet (M9).
##
## Benutzung: die Szene loot_dropper.tscn als Kind an ein Ding hängen und im
## Inspektor wählen:
##   table        Beute-Liste (LootTable aus data/loot/)
##   source_name  Name des Geschwisters, etwa "Health"; leer: der Elternknoten
##   signal_name  Signal, das die Beute auslöst, etwa "died"
## Gewürfelt wird hier, an genau einer Stelle; später entscheidet das der
## Gastgeber. Hinlegen tut die Beute der LootSpawner des Levels - bestellt über
## den EventBus (loot_requested); sie springt vom Ort dieses Knotens weg.
##
## Abschalten: Knoten löschen - es fällt nichts heraus.

## Ein Wurf ist gefallen: so viele Gegenstände fallen heraus.
signal dropped(count: int)

## Beute-Liste.
@export var table: LootTable
## Name des Geschwisters, dessen Signal zählt. Leer: der Elternknoten selbst.
@export var source_name := "Health"
## Signal, das die Beute auslöst.
@export var signal_name := "died"


func _ready() -> void:
	if table == null or signal_name.is_empty():
		push_warning("LootDropper %s: Beute-Liste oder Signal fehlt." % name)
		return
	var source := _find_source()
	if source == null:
		push_warning("LootDropper %s: Knoten \"%s\" nicht gefunden." % [name, source_name])
		return
	var count := _argument_count(source, signal_name)
	if count < 0:
		push_warning("LootDropper %s: \"%s\" hat kein Signal \"%s\"." % [name, source.name, signal_name])
		return
	# Die Werte des Signals braucht der Baustein nicht; unbind() lässt sie weg.
	var handler := drop
	if count > 0:
		handler = drop.unbind(count)
	source.connect(signal_name, handler)


## Würfelt die Beute-Liste und bestellt, was fällt, beim LootSpawner.
func drop() -> void:
	if table == null:
		return
	var stacks := table.roll()
	for stack in stacks:
		EventBus.loot_requested.emit(stack.item, stack.amount, global_position)
	dropped.emit(stacks.size())


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
