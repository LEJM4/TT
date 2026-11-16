class_name InvisibilityStats
extends AbilityStats
## InvisibilityStats - Werte-Datei der Fähigkeit Unsichtbarkeit.
##
## Die Werte stehen in data/abilities/invisibility.tres.

## Deckkraft der Figur, solange die Fähigkeit wirkt: 0 ist unsichtbar, 1 normal.
@export_range(0.0, 1.0, 0.05) var alpha := 0.3
