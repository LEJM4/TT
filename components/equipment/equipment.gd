class_name Equipment
extends Node
## Equipment - die Ausrüstung einer Figur: Waffe, Fernkampf, Rüstung, Anhänger (M11).
##
## Benutzung: die Szene equipment.tscn als Kind mit dem Namen "Equipment" an eine
## Figur hängen, die auch ein Kind "Inventory" hat, und im Inspektor eine
## Werte-Datei (EquipmentStats) wählen - was beim Start angelegt ist.
## equip(gegenstand) nimmt ihn aus dem Inventar und legt ihn an; was vorher auf
## dem Platz lag, kommt ins Inventar zurück. unequip(platz) legt ab, wenn im
## Inventar Platz ist. Das ist die einzige Stelle, an der über Angelegtes
## entschieden wird; später bestimmt hier der Gastgeber des Spiels.
## Die Werte gibt der Baustein an die Geschwister weiter: MeleeAttack schlägt mit
## den Werten der Waffe, ohne Waffe mit seinen eigenen; RangedAttack bekommt den
## Schadens-Bonus, Health Rüstung und mehr Leben. Fehlt ein Geschwister, wirkt
## nur dieser Teil nicht.
##
## Abschalten: Knoten löschen - die Figur kämpft mit ihren Grundwerten, und
## Ausrüstung bleibt im Inventar liegen.

## Auf einem Platz liegt jetzt item; null heißt: Er ist leer.
signal changed(slot: int, item: EquipmentData)

## Werte-Datei mit dem, was beim Start angelegt ist.
@export var stats: EquipmentStats

# Angelegtes je Platz (EquipmentData.Slot).
var _items := {}

@onready var _inventory := get_parent().get_node_or_null("Inventory") as Inventory
@onready var _melee := get_parent().get_node_or_null("MeleeAttack") as MeleeAttack
@onready var _ranged := get_parent().get_node_or_null("RangedAttack") as RangedAttack
@onready var _health := get_parent().get_node_or_null("Health") as Health


func _ready() -> void:
	if stats != null:
		for item in stats.start_items:
			if item != null:
				_items[item.slot] = item
	_apply()


## Was auf dem Platz liegt; null, wenn er leer ist.
func get_item(slot: int) -> EquipmentData:
	return _items.get(slot) as EquipmentData


## Legt den Gegenstand aus dem Inventar an. Liefert, ob es ging.
func equip(item: EquipmentData) -> bool:
	if item == null or _inventory == null or not _inventory.has(item):
		return false
	var previous := get_item(item.slot)
	if not _inventory.remove(item, 1):
		return false
	if previous != null and _inventory.add(previous, 1) > 0:
		# Kein Platz für das Alte: alles bleibt, wie es war.
		_inventory.add(item, 1)
		return false
	_items[item.slot] = item
	_apply()
	changed.emit(item.slot, item)
	return true


## Legt ab, was auf dem Platz liegt, und gibt es ins Inventar. Liefert, ob es ging.
func unequip(slot: int) -> bool:
	var item := get_item(slot)
	if item == null or _inventory == null:
		return false
	if _inventory.add(item, 1) > 0:
		return false
	_items.erase(slot)
	_apply()
	changed.emit(slot, null)
	return true


# Gibt die Werte alles Angelegten an die Geschwister weiter.
func _apply() -> void:
	var weapon := get_item(EquipmentData.Slot.WEAPON)
	if _melee != null:
		if weapon != null:
			_melee.set_stats(weapon.melee)
		else:
			_melee.set_stats(null)
	var projectile_bonus := 0.0
	var armor := 0.0
	var health_bonus := 0.0
	for value in _items.values():
		var item := value as EquipmentData
		if item == null:
			continue
		projectile_bonus += item.projectile_damage_bonus
		armor += item.armor
		health_bonus += item.max_health_bonus
	if _ranged != null:
		_ranged.damage_bonus = projectile_bonus
	if _health != null:
		_health.armor = armor
		_health.set_bonus_maximum(health_bonus)
