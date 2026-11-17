class_name EffectData
extends Resource
## EffectData - ein kurzer Effekt zum Ansehen: Blatt, Bilder und Tempo (M11a).
##
## Abgespielt wird er mit OneShotEffect.spawn(). Die Bilder liegen
## nebeneinander in einem Blatt. Beispiel: data/effects/explosion.tres.
## Ab A2 nutzen auch die Effekte für Hieb, Treffer, Tod und Stun diese Werte-Datei.

## Blatt mit den Bildern, nebeneinander.
@export var texture: Texture2D
## Größe eines Einzelbilds in Pixeln.
@export var frame_size := Vector2i(32, 32)
## Anzahl der Bilder.
@export_range(1, 64) var frame_count := 1
## Bilder je Sekunde.
@export var fps := 12.0
## Lage der Bildmitte zum Ort des Effekts, in Pixeln.
@export var offset := Vector2i.ZERO
