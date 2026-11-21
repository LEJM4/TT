class_name PlayerProgress
extends Node
## PlayerProgress - holt Inventar und Ausrüstung einer Spielfigur aus dem
## Spielstand und schreibt jede Änderung dorthin zurück (M16).
##
## Benutzung: die Szene player_progress.tscn als letztes Kind an eine Spielfigur
## hängen, nach "Inventory" und "Equipment". Erscheint die Figur - beim Start,
## nach dem Tod, nach einem Neustart des Raums -, füllt der Baustein Inventar und
## Ausrüstung aus GameState, unter der player_id der Figur. Danach ist ihr Leben
## voll, auch wenn Ausrüstung den Höchstwert hebt. Ist für sie noch nichts
## gemerkt, bleibt der Startinhalt aus data/player/inventory.tres und
## equipment.tres und wird gemerkt. Jede Änderung an Inventar oder Ausrüstung
## legt er in GameState ab; in die Datei schreibt der SaveManager.
## Er entscheidet nichts: über den Inhalt das Inventar, über Angelegtes
## Equipment, über den Fortschritt GameState.
##
## Abschalten: Knoten löschen - die Figur beginnt jedes Mal mit dem Startinhalt, wie vor M16.

## Name des Inventars an der Figur.
@export var inventory_name := "Inventory"
## Name der Ausrüstung an der Figur.
@export var equipment_name := "Equipment"
## Name des Lebens an der Figur; nach dem Laden ist es voll.
@export var health_name := "Health"

var _player_id := 1
var _inventory: Inventory
var _equipment: Equipment


func _ready() -> void:
	var holder := get_parent()
	if holder == null:
		return
	var id: Variant = holder.get("player_id")
	if id is int:
		_player_id = id
	_inventory = holder.get_node_or_null(inventory_name) as Inventory
	_equipment = holder.get_node_or_null(equipment_name) as Equipment
	var state := _game_state()
	if state == null:
		return
	if state.call("has_player_data", _player_id):
		_restore(state.call("get_player_data", _player_id))
	else:
		# Neues Spiel oder neue Figur: Der Startinhalt wird zum Stand.
		_store()
	if _inventory != null:
		_inventory.changed.connect(_store)
	if _equipment != null:
		_equipment.changed.connect(_store.unbind(2))


func _restore(data: Dictionary) -> void:
	var items: Variant = data.get("inventory")
	if _inventory != null and items is Array:
		_inventory.apply_saved_state(items)
	var worn: Variant = data.get("equipment")
	if _equipment != null and worn is Dictionary:
		_equipment.apply_saved_state(worn)
	# Nach dem Laden ist das Leben voll - auch wenn ein Anhänger den Höchstwert hebt.
	var health := get_parent().get_node_or_null(health_name) as Health
	if health != null:
		health.reset()


func _store() -> void:
	var state := _game_state()
	if state == null:
		return
	var data := {}
	if _inventory != null:
		data["inventory"] = _inventory.get_saved_state()
	if _equipment != null:
		data["equipment"] = _equipment.get_saved_state()
	state.call("set_player_data", _player_id, data)


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")
