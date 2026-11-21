class_name TalkFacing
extends Node
## TalkFacing - die Figur blickt im Gespräch zu dem, mit dem sie spricht (M15).
##
## Benutzung: die Szene talk_facing.tscn als Kind an eine Spielfigur hängen. Beginnt
## ein Gespräch der Figur (EventBus.dialog_started mit ihrer player_id), setzt der
## Baustein ihren Wert "look_target" auf den Sprecher - den Knoten mit der Kennung
## source_id, meist ein NPC. Endet das Gespräch (dialog_finished), nimmt er ihn
## wieder weg; die Figur blickt dann wieder in die Zielrichtung, also zur Maus.
## Er dreht nur den Blick und entscheidet nichts.
##
## Abschalten: Knoten löschen - die Figur behält im Gespräch ihre Blickrichtung.


func _ready() -> void:
	EventBus.dialog_started.connect(_on_dialog_started)
	EventBus.dialog_finished.connect(_on_dialog_finished)


func _on_dialog_started(player_id: int, source_id: int) -> void:
	if not _is_own(player_id):
		return
	var speaker := instance_from_id(source_id) as Node2D
	get_parent().set("look_target", speaker)


func _on_dialog_finished(player_id: int, _source_id: int, _completed: bool) -> void:
	if _is_own(player_id):
		get_parent().set("look_target", null)


# Gilt die Meldung der eigenen Figur?
func _is_own(player_id: int) -> bool:
	var holder := get_parent()
	if holder == null:
		return false
	var own_id: Variant = holder.get("player_id")
	return own_id != null and int(own_id) == player_id
