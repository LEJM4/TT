class_name Collector
extends Area2D
## Collector - sammelt Beute auf, über die die Figur läuft (M9).
##
## Benutzung: die Szene collector.tscn als Kind an eine Figur hängen, die auch
## ein Kind "Inventory" hat. Liegt ein Pickup im Kreis und ist er bereit, kommt
## so viel davon ins Inventar, wie hineinpasst; der Rest bleibt liegen und wird
## genommen, sobald wieder Platz ist. Über den Inhalt entscheidet allein das
## Inventar (add); hier wird nur übergeben.
## Was zuletzt aufgesammelt wurde, steht in der Debug-Anzeige (F1) unter "Beute".
##
## Abschalten: Knoten löschen - die Figur läuft über Beute hinweg.

## Gegenstände sind ins Inventar gekommen.
signal collected(item: ItemData, amount: int)
## Ein Gegenstand passt gerade nicht mehr ins Inventar; gemeldet einmal, bis sich etwas ändert.
signal rejected(item: ItemData)

var _inventory: Inventory
var _report_key := "Beute"
var _last_report := ""


func _ready() -> void:
	var holder := get_parent()
	if holder == null:
		return
	_inventory = holder.get_node_or_null("Inventory") as Inventory
	var player_id: Variant = holder.get("player_id")
	if player_id != null:
		_report_key = "S%d Beute" % int(player_id)


func _physics_process(_delta: float) -> void:
	if _inventory == null:
		return
	for area in get_overlapping_areas():
		var pickup := area as Pickup
		if pickup == null or not pickup.can_collect():
			continue
		var item := pickup.item
		var offered := pickup.amount
		var taken := offered - _inventory.add(item, offered)
		if taken > 0:
			pickup.take(taken)
			collected.emit(item, taken)
			_report("+%d × %s (jetzt %d)" % [taken, item.display_name, _inventory.count(item)])
			continue
		# Kein Platz: einmal melden, bis sich etwas ändert.
		var text := "%s: Inventar voll" % item.display_name
		if text != _last_report:
			rejected.emit(item)
		_report(text)


# Schreibt den Text in die Debug-Anzeige, wenn er neu ist.
func _report(text: String) -> void:
	if text == _last_report:
		return
	_last_report = text
	EventBus.debug_value_changed.emit(_report_key, text)
