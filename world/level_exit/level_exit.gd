class_name LevelExit
extends Node2D
## LevelExit - der Ausgang eines Levels: E an der Luke verlässt das Level (M17).
##
## Eine offene Luke mit Treppe im Boden; die Figur kann darüber laufen. E (Kind
## "Interactable") meldet über den EventBus level_exit_requested mit der Nummer
## der Figur. Was dann geschieht, entscheidet das Level: Die Testkammer schließt
## sich ab wie mit Bild auf, ab M18 geht es in die Zeitkapsel.
## Den Weg zum Ausgang versperrt meist ein Tor, das sich öffnet, wenn alle
## Pflichtmissionen erfüllt sind (Kanal missions_done des MissionTracker).
## Das Bild zeigt PropView mit data/skins/level_exit.tres.
##
## Abschalten: Knoten löschen - das Level hat keinen Ausgang.

## Eine Spielfigur hat E gedrückt und möchte hinaus.
signal exit_requested(actor: Node)

@onready var _interactable := get_node_or_null("Interactable") as Interactable


func _ready() -> void:
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)


func _on_interacted(actor: Node) -> void:
	var player_id: Variant = actor.get("player_id") if actor != null else null
	if not player_id is int:
		return
	exit_requested.emit(actor)
	EventBus.level_exit_requested.emit(int(player_id))
