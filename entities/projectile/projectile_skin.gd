class_name ProjectileSkin
extends Resource
## ProjectileSkin - wie ein Geschoss im Flug aussieht und wie es explodiert (M11a).
##
## Steht in den Werten eines Wurfs (RangedStats.skin) und wird von
## ProjectileView gezeigt. Die Mechanik liest es nicht.

## Bild im Flug. Zeigt das Geschoss eine Richtung, dann nach rechts.
@export var texture: Texture2D
## Größe eines Einzelbilds in Pixeln. (0, 0): Das ganze Blatt ist ein Bild.
@export var frame_size := Vector2i.ZERO
## Anzahl der Bilder, nebeneinander im Blatt.
@export_range(1, 64) var frame_count := 1
## Bilder je Sekunde.
@export var fps := 10.0
## Drehung im Flug in Grad pro Sekunde. 0: Das Bild zeigt in Flugrichtung.
@export var spin := 0.0
## Effekt, wenn das Geschoss explodiert. Leer: keiner.
@export var explosion: EffectData
