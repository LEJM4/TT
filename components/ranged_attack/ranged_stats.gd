class_name RangedStats
extends Resource
## RangedStats - Werte-Datei für einen Fernkampf-Angriff.
##
## Der Bogen der Spielfigur steht in data/player/bow.tres.

@export_group("Wirkung")
## Schaden pro Treffer.
@export var damage := 10.0

@export_group("Geschoss")
## Tempo des Geschosses in Pixeln pro Sekunde.
@export var projectile_speed := 220.0
## So weit fliegt das Geschoss höchstens, in Pixeln.
@export var max_distance := 240.0
## Abstand von der Mitte der Figur, in dem das Geschoss entsteht, in Pixeln.
@export var spawn_distance := 8.0

@export_group("Zeit und Kosten")
## Pause zwischen zwei Schüssen in Sekunden.
@export var cooldown := 0.5
## So viel kostet ein Schuss aus dem Vorrat.
@export var cost := 1.0
