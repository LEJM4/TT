class_name AmmoSelector
extends Node
## AmmoSelector - wählt, welches Geschoss die Figur wirft (M11a).
##
## Benutzung: die Szene ammo_selector.tscn als Kind an eine Figur hängen, die
## auch ein Inventar hat (Baustein Inventory, Name aus inventory_name).
## Wählbar ist jedes Geschoss (AmmoData), von dem mindestens eins im Inventar
## liegt, in der Reihenfolge der Plätze. cycle(1) wählt das nächste, cycle(-1)
## das vorige. Ist das gewählte aufgebraucht, rückt das nächste nach.
## Der Fernkampf (RangedAttack) holt hier mit get_shot() die Werte des Wurfs
## und bezahlt mit consume(); entnommen wird nur über das Inventar.
##
## Abschalten: Knoten löschen - der Fernkampf nutzt dann wieder seine eigene
## Werte-Datei und seinen Vorrat, wie vor M11a.

## Ein anderes Geschoss ist gewählt; null heißt: keins mehr da.
signal selection_changed(item: AmmoData)

## Name des Geschwisters, das die Geschosse trägt (ein Inventory).
@export var inventory_name := "Inventory"

## Das gewählte Geschoss; null, wenn keins im Inventar liegt.
var selected: AmmoData

var _inventory: Inventory
# Platz des gewählten Geschosses in available(); rückt nach, wenn es aufgebraucht ist.
var _index := 0


func _ready() -> void:
	_inventory = get_parent().get_node_or_null(inventory_name) as Inventory
	if _inventory != null:
		_inventory.changed.connect(_refresh)
	_refresh()


## Werte des Wurfs mit dem gewählten Geschoss; null, wenn keins da ist.
func get_shot() -> RangedStats:
	if selected == null:
		return null
	return selected.shot


## Wie viele des gewählten Geschosses im Inventar liegen.
func get_selected_count() -> int:
	if selected == null or _inventory == null:
		return 0
	return _inventory.count(selected)


## Nimmt so viele des gewählten Geschosses aus dem Inventar. Liefert, ob es ging.
func consume(amount: int = 1) -> bool:
	if amount <= 0:
		return true
	if selected == null or _inventory == null:
		return false
	return _inventory.remove(selected, amount)


## Wählt das nächste (step 1) oder vorige (step -1) Geschoss, das im Inventar liegt.
func cycle(step: int) -> void:
	var choices := available()
	if choices.is_empty():
		_select(null, 0)
		return
	var index := choices.find(selected)
	if index < 0:
		index = 0
	else:
		index = posmod(index + step, choices.size())
	_select(choices[index], index)


## Die Geschosse im Inventar, jedes einmal, in der Reihenfolge der Plätze.
func available() -> Array[AmmoData]:
	var result: Array[AmmoData] = []
	if _inventory == null:
		return result
	for item in _inventory.get_items():
		var ammo := item as AmmoData
		if ammo != null and ammo.shot != null:
			result.append(ammo)
	return result


func _refresh() -> void:
	var choices := available()
	if choices.is_empty():
		_select(null, 0)
		return
	var index := choices.find(selected)
	if index >= 0:
		_index = index
		return
	# Das gewählte ist aufgebraucht, oder es gab noch keins: Das nächste rückt
	# auf seinen Platz nach; war es das letzte, geht es vorne weiter.
	index = posmod(_index, choices.size())
	_select(choices[index], index)


func _select(item: AmmoData, index: int) -> void:
	_index = index
	if item == selected:
		return
	selected = item
	selection_changed.emit(item)
