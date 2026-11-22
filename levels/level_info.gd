class_name LevelInfo
extends Resource
## LevelInfo - ein Ziel für Reisen: Kennung, Name und Szene eines Levels (M18).
##
## Steht in der Liste der Reisedaten (TravelSettings, data/world/travel.tres).
## Der SceneManager findet ein Level über seine Kennung; die Zeitsteuerung in der
## Zeitkapsel nennt sie in ihren Gesprächszeilen (DialogLine.action).

## Kennung des Levels, wie es sich bei GameState meldet, etwa "test_chamber".
@export var id := ""
## Name im Spiel, etwa "Testkammer" - für die Debug-Zeile "Ort".
@export var title := ""
## Szene des Levels.
@export_file("*.tscn") var scene := ""
