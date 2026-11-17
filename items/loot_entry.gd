class_name LootEntry
extends Resource
## LootEntry - eine Zeile einer Beute-Liste: was, wie viele, wie wahrscheinlich (M9).
##
## Steht in einer LootTable, etwa in data/loot/crate.tres.

## Der Gegenstand.
@export var item: ItemData
## Wie viele davon, wenn er fällt.
@export_range(1, 999) var amount := 1
## Wahrscheinlichkeit, dass er fällt: 1 immer, 0.5 jedes zweite Mal.
@export_range(0.0, 1.0, 0.05) var chance := 1.0
