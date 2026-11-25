class_name MapSettings
extends Resource
## MapSettings - die Werte des Fensters auf M (M20b): Karte und Missionen.
##
## Benutzt von MapWindow und MapView; die Datei liegt unter data/ui/map.tres.

@export_group("Karte")
## Abstand der Räume vom Rand der Kartenfläche, in Pixeln.
@export var padding := 6
## Fläche eines erkundeten Raums.
@export var room_color := Color(0.25, 0.22, 0.18)
## Rand eines erkundeten Raums.
@export var room_border_color := Color(0.62, 0.55, 0.45)
## Fläche des Raums, in dem die eigene Figur ist.
@export var current_room_color := Color(0.42, 0.31, 0.22)
## Rand des Raums, in dem die eigene Figur ist.
@export var current_room_border_color := Color(1.0, 0.68, 0.33)
## Schrift der Raumnamen.
@export var room_label_color := Color(0.93, 0.86, 0.74)
## Farbe je Spielfigur: die erste für Spieler 1, die zweite für Spieler 2 und so fort.
@export var player_colors: Array[Color] = [
	Color(0.98, 0.84, 0.35),
	Color(0.45, 0.8, 0.95),
	Color(0.55, 0.88, 0.5),
	Color(0.95, 0.55, 0.75),
]
## Rand der Figuren auf der Karte; ihre Form steht in MapView.MARKER.
@export var marker_outline_color := Color(0.07, 0.08, 0.11)
## Bild der Zeitkapsel auf der Karte; ihr Fuß steht auf dem Ort der Zeitkapsel.
@export var capsule_icon: Texture2D

@export_group("Missionen")
## So viele Pixel blättern W, S und die Pfeiltasten auf der Seite "Missionen".
@export_range(4, 96, 1) var scroll_step := 24
## Erfüllte Missionen erscheinen so blass (1 = gar nicht).
@export_range(0.2, 1.0, 0.05) var done_alpha := 0.6
