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
## Will die Figur dashen? Nur in dem Physik-Schritt wahr, in dem der Wunsch kam (M5).
var wants_dash := false
## Will die Figur schießen? Bleibt wahr, solange die Taste gehalten wird (M6).
var wants_shoot := false
## Platz der Fähigkeit, die die Figur einsetzen will: 0 ist die erste, -1 heißt keine.
## Nur in dem Physik-Schritt gesetzt, in dem der Wunsch kam (M7).
var wants_ability := -1
## Geschoss wechseln: positiv zum nächsten, negativ zum vorigen, 0 bleibt.
## Nur in dem Physik-Schritt gesetzt, in dem der Wunsch kam (M11a).
var wants_ammo_cycle := 0
