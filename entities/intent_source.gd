class_name IntentSource
extends Node
## IntentSource - was eine Figur gerade tun will.
##
## Die Figur liest hier nur Absichten und weiß nicht, woher sie kommen:
## von Tasten (PlayerInput), später von einem Gamepad oder aus dem Netz.
## Eine neue Quelle erbt von diesem Skript und füllt dieselben Felder.

## Gewünschte Laufrichtung; Länge 0 (stehen) bis 1 (volles Tempo).
var move_direction := Vector2.ZERO
## Will die Figur sprinten?
var wants_sprint := false
## Will die Figur schleichen?
var wants_sneak := false
## Zielrichtung als Vektor der Länge 1 (M4).
var aim_direction := Vector2.DOWN
## Will die Figur angreifen? Bleibt wahr, solange die Taste gehalten wird (M4).
var wants_attack := false
