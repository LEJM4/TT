class_name MissionPanelSettings
extends Resource
## MissionPanelSettings - Werte der Missionsanzeige (M17).
##
## Die Werte stehen in data/ui/missions.tres.

## Höchstens so viele Missionen zeigt die Liste; für den Rest steht "+1 weitere" darunter.
@export_range(1, 10) var max_missions := 3
## So lange steht ein Hinweis wie "Neue Mission" oben in der Mitte, in Sekunden.
@export_range(0.5, 10.0, 0.1) var notice_time := 2.5
## So lange blendet ein Hinweis ein und wieder aus, in Sekunden - Teil von notice_time.
@export_range(0.0, 1.0, 0.05) var notice_fade := 0.2
