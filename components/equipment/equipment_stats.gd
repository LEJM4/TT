class_name EquipmentStats
extends Resource
## EquipmentStats - Werte-Datei für den Baustein Equipment: was beim Start angelegt ist (M11).
##
## Die Spielfigur hat data/player/equipment.tres. Angelegtes liegt nicht im Inventar.

## Was beim Start angelegt ist; je Platz zählt der letzte Eintrag.
@export var start_items: Array[EquipmentData] = []
