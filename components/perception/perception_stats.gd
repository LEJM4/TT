class_name PerceptionStats
extends Resource
## PerceptionStats - Werte-Datei für den Baustein Perception (M13).
##
## Die Werte des Höhlenmenschen stehen in data/enemies/caveman_perception.tres.
## Abstände stehen in Kacheln (1 Kachel = 16 Pixel der Grafik) - sie hängen
## nicht vom Zoom ab. Was davon zählt, begrenzt zusätzlich das Bild der Figur:
## Ein Gegner bemerkt nur, wer ihn auch sehen kann (ViewSettings).

@export_group("Sehen")
## So weit sieht der Träger nach vorn, in Kacheln.
@export var sight_tiles := 6.0
## Öffnung des Sichtkegels in Grad.
@export_range(0.0, 360.0, 1.0) var sight_angle := 100.0
## Kennt er die Figur schon, behält er sie bis zu dieser Entfernung im Blick -
## rundum, aber nicht durch Wände. In Kacheln.
@export var track_tiles := 10.0
## Ebenen, die die Sicht verdecken: Wände, Blöcke, geschlossene Türen.
@export_flags_2d_physics var occluder_mask := 1

@export_group("Hören")
## In diesem Umkreis hört er eine Figur, die läuft - auch von hinten und durch
## Wände. In Kacheln.
@export var hearing_tiles := 2.5
## Langsamer als das macht eine Figur keine Schritte, die man hört. In Pixeln pro Sekunde.
@export var silent_speed := 10.0

@export_group("Schleichen")
## Schleicht die Figur, sieht er sie nur auf diesen Anteil der Entfernung;
## hören kann er sie dann nicht.
@export_range(0.0, 1.0, 0.05) var sneak_factor := 0.5
