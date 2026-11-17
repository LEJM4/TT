class_name DebrisData
extends Resource
## DebrisData - Splitter, die auseinanderfliegen: Scherben, Holz, Blätter, Steine (M9).
##
## Abgespielt werden sie mit Debris.spawn(), meist über den Baustein DebrisCue.
## Das Blatt ist ein Streifen mit einzelnen Bruchstücken nebeneinander, etwa
## FX/Particle/Wood.png; jeder Splitter zeigt eins davon, zufällig gewählt.
## Die Splitter springen hoch, fallen, drehen sich und verblassen.
## Beispiele: data/effects/debris_crate.tres, debris_rock.tres.

## Streifen mit den Bruchstücken nebeneinander.
@export var texture: Texture2D
## Anzahl der Bruchstücke im Streifen.
@export_range(1, 32) var piece_count := 6
## So viele Splitter fliegen.
@export_range(1, 64) var amount := 8
## So lange ist ein Splitter zu sehen, in Sekunden.
@export var lifetime := 0.6
## Kleinstes Tempo beim Losfliegen, in Pixeln je Sekunde.
@export var speed_min := 50.0
## Größtes Tempo beim Losfliegen, in Pixeln je Sekunde.
@export var speed_max := 90.0
## Streuung um die Richtung nach oben, in Grad; 180 heißt in alle Richtungen.
@export_range(0.0, 180.0) var spread := 70.0
## Zug nach unten, in Pixeln je Sekunde zum Quadrat - so fallen die Splitter.
@export var gravity := 300.0
## Bremsen, in Pixeln je Sekunde zum Quadrat.
@export var damping := 30.0
## Höchstes Drehtempo, in Grad je Sekunde, in beide Richtungen.
@export var spin := 360.0
## Kleinste Größe eines Splitters; 1 ist die Größe im Blatt.
@export var scale_min := 0.6
## Größte Größe eines Splitters.
@export var scale_max := 0.9
## Radius des Kreises, in dem die Splitter entstehen, in Pixeln.
@export var emission_radius := 3.0
## Färbung der Splitter; Weiß lässt das Blatt, wie es ist.
@export var tint := Color.WHITE
