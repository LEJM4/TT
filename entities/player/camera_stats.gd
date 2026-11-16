class_name CameraStats
extends Resource
## CameraStats - Werte-Datei für die Kamera der Spielfigur.
##
## Die Werte stehen in data/player/camera.tres.
## Ändern: die .tres-Datei im Dateisystem doppelklicken und im Inspektor anpassen.

@export_group("Vorausschau zur Maus")
## Anteil des Wegs von der Bildmitte zum Mauszeiger, den die Kamera mitgeht. 0 schaltet ab.
@export_range(0.0, 1.0, 0.01) var mouse_look_factor := 0.15
## Größter Versatz in Richtung Maus, in Pixeln.
@export var mouse_look_max := 40.0

@export_group("Vorausschau in Laufrichtung")
## So viele Sekunden Laufweg blickt die Kamera der Figur voraus. 0 schaltet ab.
@export var move_look_seconds := 0.12
## Größter Versatz in Laufrichtung, in Pixeln.
@export var move_look_max := 24.0

@export_group("Weichheit")
## Zeit in Sekunden, in der die Kamera ihrem Ziel nachgleitet. Kleiner ist direkter.
@export var smooth_time := 0.2
## Mindesttempo des Nachgleitens in Pixeln pro Sekunde; verhindert langes Nachkriechen.
@export var min_speed := 24.0
