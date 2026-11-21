class_name ItemData
extends Resource
## ItemData - ein Gegenstand: Name, Art, Symbol und wie viele sich stapeln (M11a).
##
## Je Gegenstand eine Werte-Datei, abgelegt unter data/items/. Das Inventar
## (Baustein Inventory) zählt Gegenstände; zwei Einträge mit derselben id
## gelten als derselbe Gegenstand. Geschosse erben von diesem Skript (AmmoData).

## Arten von Gegenständen, wie im Konzept.
enum Category { WEAPON, ARMOR, CONSUMABLE, KEY, MATERIAL }

## Namen der Arten für die Anzeige, in der Reihenfolge von Category.
const CATEGORY_NAMES: Array[String] = ["Waffen", "Rüstung", "Verbrauchbares", "Schlüssel", "Materialien"]

## Eindeutige Kennung, englisch und klein geschrieben, etwa "arrow".
@export var id: StringName
## Name im Spiel.
@export var display_name := ""
## Art des Gegenstands.
@export var category := Category.CONSUMABLE
## Symbol für Inventar und Anzeige.
@export var icon: Texture2D
## So viele passen auf einen Platz.
@export_range(1, 999) var max_stack := 1


## Lädt einen Gegenstand aus seiner Werte-Datei, etwa für den Spielstand (M16).
## Liefert null, wenn der Pfad nicht im Projekt liegt, fehlt oder kein Gegenstand ist.
static func load_from_path(path: String) -> ItemData:
	if not path.begins_with("res://") or not ResourceLoader.exists(path):
		return null
	return load(path) as ItemData


## Ist das derselbe Gegenstand wie other? Gleich ist er bei gleicher id oder als dieselbe Datei.
func is_same_item(other: ItemData) -> bool:
	if other == null:
		return false
	if other == self:
		return true
	return id != &"" and id == other.id
