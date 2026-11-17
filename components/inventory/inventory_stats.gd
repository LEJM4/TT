class_name InventoryStats
extends Resource
## InventoryStats - Werte-Datei für den Baustein Inventory (M11a).
##
## Das Inventar der Spielfigur steht in data/player/inventory.tres.

## Anzahl der Plätze. Auf einem Platz liegt eine Sorte, bis zu ihrer Stapelgröße.
@export_range(1, 200) var slot_count := 20
## Was beim Start im Inventar liegt, in dieser Reihenfolge.
@export var start_items: Array[ItemStack] = []
