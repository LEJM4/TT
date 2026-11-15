class_name StaminaStats
extends Resource
## StaminaStats - Werte-Datei für den Baustein Stamina.
##
## Die Werte der Spielfigur stehen in data/player/stamina.tres.

## Größter Vorrat an Ausdauer.
@export var max_stamina := 100.0
## Ausdauer, die pro Sekunde zurückkommt.
@export var regen_per_second := 30.0
## Sekunden nach dem letzten Verbrauch, bis die Erholung beginnt.
@export var regen_delay := 0.8
## Nach völliger Erschöpfung lässt sich erst ab diesem Vorrat wieder etwas verbrauchen.
@export var recover_threshold := 25.0
