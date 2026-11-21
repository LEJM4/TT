class_name Inventory
extends Node
## Inventory - das Inventar einer Figur: begrenzte Plätze, Gleiches stapelt sich (M11a).
##
## Benutzung: die Szene inventory.tscn als Kind mit dem Namen "Inventory" an
## eine Figur hängen und im Inspektor eine Werte-Datei (InventoryStats) wählen:
## Zahl der Plätze und Startinhalt.
## Gegenstände kommen nur über add() hinein und nur über remove() heraus. Das
## ist die einzige Stelle, an der über den Inhalt entschieden wird; später
## bestimmt hier der Gastgeber des Spiels.
## Neues füllt zuerst angefangene Stapel derselben Sorte, dann freie Plätze.
## Entnommen wird vom hintersten Stapel; ein geleerter Platz wird frei.
## Wer den Inhalt zeigen will, liest get_slots() und hört auf changed.
## Für den Spielstand (M16) liefert get_saved_state() den Inhalt als einfache
## Werte, apply_saved_state() stellt ihn wieder her; das macht PlayerProgress.
##
## Abschalten: Knoten löschen - die Figur trägt dann nichts bei sich.

## Der Inhalt hat sich geändert.
signal changed
## So viele eines Gegenstands sind hinzugekommen.
signal item_added(item: ItemData, amount: int)
## So viele eines Gegenstands wurden entnommen.
signal item_removed(item: ItemData, amount: int)

## Werte-Datei mit Zahl der Plätze und Startinhalt.
@export var stats: InventoryStats

# Je Platz der Gegenstand (oder null) und seine Anzahl.
var _items: Array[ItemData] = []
var _counts := PackedInt32Array()


func _ready() -> void:
	if stats == null:
		push_warning("Inventory: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = InventoryStats.new()
	_items.resize(stats.slot_count)
	_counts.resize(stats.slot_count)
	for entry in stats.start_items:
		if entry == null or entry.item == null:
			continue
		var rest := _put(entry.item, entry.amount)
		if rest > 0:
			push_warning("Inventory: Für %d × %s ist kein Platz mehr." % [rest, entry.item.display_name])
	changed.emit()


## Legt Gegenstände hinein und liefert, wie viele keinen Platz mehr fanden.
func add(item: ItemData, amount: int) -> int:
	if amount <= 0:
		return 0
	if item == null:
		return amount
	var rest := _put(item, amount)
	var added := amount - rest
	if added > 0:
		item_added.emit(item, added)
		changed.emit()
	return rest


## Nimmt Gegenstände heraus. Sind nicht genug da, bleibt alles, wie es ist, und es liefert false.
func remove(item: ItemData, amount: int) -> bool:
	if amount <= 0:
		return true
	if item == null or count(item) < amount:
		return false
	var left := amount
	for index in range(_items.size() - 1, -1, -1):
		if left <= 0:
			break
		if not _holds(index, item):
			continue
		var taken := mini(_counts[index], left)
		_counts[index] -= taken
		left -= taken
		if _counts[index] <= 0:
			_items[index] = null
			_counts[index] = 0
	item_removed.emit(item, amount)
	changed.emit()
	return true


## Wie viele dieses Gegenstands liegen im Inventar?
func count(item: ItemData) -> int:
	var total := 0
	for index in _items.size():
		if _holds(index, item):
			total += _counts[index]
	return total


## Liegen mindestens so viele dieses Gegenstands im Inventar?
func has(item: ItemData, amount := 1) -> bool:
	return count(item) >= amount


## Die Sorten im Inventar, jede einmal, in der Reihenfolge ihrer Plätze.
func get_items() -> Array[ItemData]:
	var result: Array[ItemData] = []
	for index in _items.size():
		var item := _items[index]
		if item == null:
			continue
		var known := false
		for other in result:
			if other.is_same_item(item):
				known = true
				break
		if not known:
			result.append(item)
	return result


## Inhalt aller Plätze: je Platz {"item": ItemData oder null, "count": Anzahl}.
func get_slots() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for index in _items.size():
		result.append({"item": _items[index], "count": _counts[index]})
	return result


## Anzahl aller Plätze.
func get_slot_count() -> int:
	return _items.size()


## Anzahl der belegten Plätze.
func get_used_slots() -> int:
	var used := 0
	for item in _items:
		if item != null:
			used += 1
	return used


## Der Inhalt für den Spielstand (M16): je belegtem Platz {"slot", "item", "count"},
## der Gegenstand als Pfad seiner Werte-Datei, etwa "res://data/items/arrow.tres".
func get_saved_state() -> Array:
	var data := []
	for index in _items.size():
		var item := _items[index]
		if item == null or _counts[index] <= 0:
			continue
		if not item.resource_path.begins_with("res://") or item.resource_path.contains("::"):
			push_warning("Inventory: %s hat keine eigene Datei und wird nicht gespeichert." % item.display_name)
			continue
		data.append({"slot": index, "item": item.resource_path, "count": _counts[index]})
	return data


## Ersetzt den Inhalt durch den aus dem Spielstand (M16). Was nicht mehr auf
## seinen Platz passt, kommt wie mit add() hinein; unbekannte Gegenstände entfallen.
func apply_saved_state(data: Array) -> void:
	for index in _items.size():
		_items[index] = null
		_counts[index] = 0
	var rest: Array[Dictionary] = []
	for entry in data:
		if not entry is Dictionary:
			continue
		var item := ItemData.load_from_path(_text((entry as Dictionary).get("item")))
		var amount := _number((entry as Dictionary).get("count"))
		if item == null:
			push_warning("Inventory: Gegenstand %s aus dem Spielstand fehlt." % str((entry as Dictionary).get("item")))
			continue
		if amount <= 0:
			continue
		var slot := _number((entry as Dictionary).get("slot"), -1)
		if slot >= 0 and slot < _items.size() and _items[slot] == null:
			var placed := mini(amount, maxi(item.max_stack, 1))
			_items[slot] = item
			_counts[slot] = placed
			amount -= placed
		if amount > 0:
			rest.append({"item": item, "amount": amount})
	for leftover in rest:
		var lost := _put(leftover["item"], leftover["amount"])
		if lost > 0:
			push_warning("Inventory: Für %d × %s aus dem Spielstand ist kein Platz mehr." % [lost, (leftover["item"] as ItemData).display_name])
	changed.emit()


func _holds(index: int, item: ItemData) -> bool:
	var slot_item := _items[index]
	return slot_item != null and slot_item.is_same_item(item)


# Legt so viele wie möglich hinein und liefert den Rest. Meldet nichts.
func _put(item: ItemData, amount: int) -> int:
	var left := amount
	var stack_size := maxi(item.max_stack, 1)
	# Zuerst angefangene Stapel derselben Sorte auffüllen ...
	for index in _items.size():
		if left <= 0:
			break
		if not _holds(index, item):
			continue
		var moved := mini(stack_size - _counts[index], left)
		if moved <= 0:
			continue
		_counts[index] += moved
		left -= moved
	# ... dann freie Plätze belegen.
	for index in _items.size():
		if left <= 0:
			break
		if _items[index] != null:
			continue
		var moved := mini(stack_size, left)
		_items[index] = item
		_counts[index] = moved
		left -= moved
	return left


# Ganze Zahl aus einem Wert des Spielstands; alles andere ergibt fallback.
func _number(value: Variant, fallback := 0) -> int:
	if value is int or value is float:
		return int(value)
	return fallback


# Text aus einem Wert des Spielstands; alles andere wird leer.
func _text(value: Variant) -> String:
	if value is String or value is StringName:
		return String(value)
	return ""
