class_name ItemStack
extends Resource
## ItemStack - ein Gegenstand und seine Anzahl, etwa im Startinhalt eines Inventars (M11a).

## Der Gegenstand.
@export var item: ItemData
## Wie viele davon.
@export_range(1, 999) var amount := 1
