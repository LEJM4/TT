class_name SupplyStats
extends Resource
## SupplyStats - Werte-Datei für den Baustein Supply.
##
## Die Munition der Spielfigur steht in data/player/ammo.tres.

## Größter Vorrat; mit so viel beginnt die Figur.
@export var max_amount := 12.0

@export_group("Erholung")
## So viel füllt sich pro Sekunde von selbst auf. 0: nichts kommt nach, wie bei Munition.
@export var regen_per_second := 0.0
## Sekunden nach dem letzten Verbrauch, bis die Erholung beginnt.
@export var regen_delay := 1.0
