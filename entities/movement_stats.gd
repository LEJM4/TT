class_name MovementStats
extends Resource
## MovementStats - Werte-Datei für die Bewegung einer Figur.
##
## Die Werte der Spielfigur stehen in data/player/movement.tres.
## Ändern: die .tres-Datei im Dateisystem doppelklicken und im Inspektor anpassen.

@export_group("Tempo")
## Normales Laufen, in Pixeln pro Sekunde.
@export var walk_speed := 80.0
## Sprinten, in Pixeln pro Sekunde. Verbraucht Ausdauer.
@export var sprint_speed := 130.0
## Schleichen, in Pixeln pro Sekunde.
@export var sneak_speed := 40.0

@export_group("Anlauf und Bremsen")
## So schnell nimmt die Figur Tempo auf (Pixel pro Sekunde, je Sekunde).
@export var acceleration := 600.0
## So schnell kommt sie zum Stehen (Pixel pro Sekunde, je Sekunde).
@export var friction := 800.0

@export_group("Sprint")
## Ausdauer, die eine Sekunde Sprinten kostet.
@export var sprint_cost_per_second := 25.0
