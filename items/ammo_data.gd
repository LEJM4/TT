class_name AmmoData
extends ItemData
## AmmoData - ein Geschoss als Gegenstand: was es im Flug kann und wie es aussieht (M11a).
##
## Liegt es im Inventar, kann die Figur es werfen; jeder Wurf nimmt eins heraus.
## Welches gewählt ist, bestimmt der Baustein AmmoSelector.
## Beispiele unter data/items/: arrow.tres, kunai.tres, shuriken.tres, dynamite.tres.

## Werte des Wurfs: Schaden, Durchschlag, Explosion, Tempo, Reichweite, Pause, Bild.
@export var shot: RangedStats
