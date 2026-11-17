class_name SkinAnimation
extends Resource
## SkinAnimation - eine Animation eines Skins: wo ihre Bilder im Blatt stehen
## und wie schnell sie laufen (A1).
##
## Ein Blatt ist in gleich große Zellen geteilt; die Größe steht im Skin
## (CharacterSkin.frame_size). Gezählt wird ab 0: x nach rechts, y nach unten.
## Die vier Blickrichtungen folgen im Grafik-Paket immer derselben Reihenfolge:
## unten, oben, links, rechts.
##
## Beispiele:
##   NinjaGreen/Separate/Walk.png - Spalten = Richtungen, Zeilen = Bilder:
##     first_cell (0, 0), frame_step (0, 1), direction_step (1, 0), frame_count 4
##   NinjaGreen/Separate/Dead.png - eine Spalte für alle Richtungen:
##     first_cell (0, 0), frame_step (0, 1), direction_step (0, 0), frame_count 2

## Blatt mit den Bildern.
@export var texture: Texture2D
## Zelle des ersten Bildes für die Blickrichtung unten.
@export var first_cell := Vector2i.ZERO
## Schritt von einem Bild zum nächsten, in Zellen. (0, 1) heißt: eine Zeile tiefer.
@export var frame_step := Vector2i(0, 1)
## Schritt von einer Blickrichtung zur nächsten, in Zellen. (1, 0) heißt: eine
## Spalte weiter; (0, 0) heißt: dieselben Bilder für alle Richtungen.
@export var direction_step := Vector2i(1, 0)
## Anzahl der Bilder je Blickrichtung.
@export_range(1, 64) var frame_count := 1
## Bilder je Sekunde.
@export var fps := 8.0
## Wiederholen? Sonst bleibt am Ende das letzte Bild stehen.
@export var loop := true
