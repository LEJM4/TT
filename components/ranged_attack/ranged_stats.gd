class_name RangedStats
extends Resource
## RangedStats - Werte-Datei für einen Fernkampf-Angriff.
##
## Der Bogen der Spielfigur steht in data/player/bow.tres. Seit M11a hat jedes
## Geschoss im Inventar seine eigenen Werte, in data/items/ (AmmoData.shot).

@export_group("Wirkung")
## Schaden pro Treffer. 0: Das Geschoss trifft beim Aufprall nicht, es explodiert nur.
@export var damage := 10.0
## So viele Ziele trifft ein Geschoss, bevor es endet. 1: nur das erste (M11a).
@export_range(1, 99) var pierce := 1
## Umkreis der Explosion am Ende des Flugs, in Pixeln. 0: keine Explosion (M11a).
@export var explosion_radius := 0.0
## Schaden der Explosion je Ziel im Umkreis (M11a).
@export var explosion_damage := 0.0

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
## So viel kostet ein Schuss aus dem Vorrat; aus dem Inventar so viele Stück.
@export var cost := 1.0

@export_group("Bild")
## Wie das Geschoss im Flug aussieht und explodiert. Leer: Platzhalter (M11a).
@export var skin: ProjectileSkin
