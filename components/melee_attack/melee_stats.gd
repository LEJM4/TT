class_name MeleeStats
extends Resource
## MeleeStats - Werte-Datei für einen Nahkampf-Angriff.
##
## Das Schwert der Spielfigur steht in data/player/sword.tres.

@export_group("Wirkung")
## Schaden pro Treffer.
@export var damage := 10.0
## So viel füllt jeder Treffer im Vorrat der Figur auf, etwa Energie. 0 schaltet das ab.
@export var gain_per_hit := 10.0

@export_group("Trefferzone")
## Abstand von der Mitte der Figur bis zum Beginn der Trefferzone, in Pixeln.
@export var start_distance := 6.0
## Länge der Trefferzone in Schlagrichtung, in Pixeln.
@export var reach := 18.0
## Breite der Trefferzone quer zur Schlagrichtung, in Pixeln.
@export var width := 20.0

@export_group("Zeit")
## So lange ist die Trefferzone scharf, in Sekunden.
@export var active_time := 0.12
## Pause von Schlagbeginn bis zum nächsten möglichen Schlag, in Sekunden.
@export var cooldown := 0.35
