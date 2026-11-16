class_name DashStats
extends Resource
## DashStats - Werte-Datei für den Baustein Dash.
##
## Die Werte der Spielfigur stehen in data/player/dash.tres.

@export_group("Bewegung")
## Strecke eines Dashs in Pixeln.
@export var distance := 64.0
## Dauer eines Dashs in Sekunden.
@export var duration := 0.2

@export_group("Schutz und Pause")
## Sekunden Unverwundbarkeit ab Dash-Beginn. 0 schaltet den Schutz ab.
@export var invulnerable_time := 0.25
## Pause von Dash-Beginn bis zum nächsten möglichen Dash, in Sekunden.
@export var cooldown := 0.8
## So lange gilt ein Tastendruck noch, wenn der Dash gerade nicht möglich ist, in Sekunden.
@export var buffer_time := 0.12
