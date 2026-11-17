class_name PropSkin
extends Resource
## PropSkin - die zwei Bilder eines Dings der Welt: aus und an (M8).
##
## Ein Ding wie Tür, Hebel oder Druckplatte ist aus oder an. Für beide Zustände
## nennt der Skin eine Zelle im Blatt; (-1, -1) heißt: In diesem Zustand ist
## nichts zu sehen. Beispiele: data/skins/door_wood.tres, lever.tres.

## Blatt mit den Bildern.
@export var texture: Texture2D
## Größe einer Zelle in Pixeln.
@export var frame_size := Vector2i(16, 16)
## Zelle für "aus": Tür zu, Hebel rot, Platte oben. (-1, -1): kein Bild.
@export var off_cell := Vector2i(0, 0)
## Zelle für "an": Tür offen, Hebel blau, Platte gedrückt. (-1, -1): kein Bild.
@export var on_cell := Vector2i(-1, -1)
## Lage der Bildmitte zum Ding, in Pixeln.
@export var offset := Vector2i.ZERO
