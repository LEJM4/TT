extends Node
## GameState - der Spielfortschritt, an genau einer Stelle (M16).
##
## Hier steht, was die Spielfiguren tragen, wie es um die Dinge der Welt steht,
## welche Level abgeschlossen sind und wo die Figur wieder erwacht. Wer davon
## etwas wissen oder ändern will, fragt hier. Über Fortschritt entscheidet nur
## dieser Dienst; im Online-Spiel führt ihn später der Gastgeber.
##
## Portalstand und Levelstand: Vor einem Level wird der Fortschritt im Portal -
## der Zeitkapsel - gesichert (portal). Im Level ändert sich eine Kopie davon,
## der Levelstand (level). Zeitanker speichern ihn, Tod und Beenden behalten ihn.
## complete_level() macht ihn zum neuen Portalstand, leave_level() verwirft ihn.
## active() liefert den Stand, der gerade gilt: im Lauf den Levelstand, sonst
## den Portalstand. Ein Stand ist ein Dictionary:
##   players    je Spielfigur ("1", "2" ...) Inventar und Ausrüstung
##   objects    je Level und Ding der Welt ein kleiner Eintrag, etwa {"open": true}
##   completed  die abgeschlossenen Level
## Später kommen Missionen (M17) und Freischaltungen (M19) dazu. Nicht im Stand:
## Gegner, Beute am Boden, Leben und Energie - nach Rasten, Tod und Laden sind
## beide voll.
## Daneben gilt ein Rückkehrpunkt (respawn): der Zeitanker, an dem die Figur nach
## dem Tod und beim nächsten Start erwacht; ohne ihn der Landepunkt des Levels.
##
## Ein Level meldet sich beim Betreten mit enter_level(). Dinge der Welt merken
## sich ihren Zustand über den Baustein Persistent, die Spielfigur über
## PlayerProgress. In die Datei schreibt der SaveManager; er bekommt alles über
## to_save_data(). Ohne SaveManager gilt der Fortschritt, bis das Spiel endet.
## Im Online-Spiel gilt ein Lauf für alle Spieler; jede Figur hat ihr eigenes
## Inventar unter players.
##
## Abschalten: in den Projekteinstellungen unter Autoload den Eintrag GameState
## entfernen - die Welt läuft wie vor M16 und vergisst alles beim Neustart des Raums.

## Version des Formats; der SaveManager schreibt sie in die Datei.
const FORMAT_VERSION := 1

## Portalstand: der Fortschritt, gesichert im Portal, bevor das Level begann.
var portal := {}
## Levelstand: die Kopie, die sich im laufenden Level ändert. Leer ohne Lauf.
var level := {}
## Level des laufenden Laufs, etwa "test_chamber"; leer, wenn keiner läuft.
var current_level := ""
## Rückkehrpunkt: {"level": ..., "anchor": ...}. Leer: der Landepunkt des Levels.
var respawn := {}


func _init() -> void:
	portal = _empty_state()


## Der Stand, der gerade gilt: im Lauf der Levelstand, sonst der Portalstand.
func active() -> Dictionary:
	if has_run():
		return level
	return portal


## Läuft gerade ein Level?
func has_run() -> bool:
	return not current_level.is_empty()


## Neues Spiel: kein Fortschritt, kein Lauf, kein Rückkehrpunkt.
func new_game() -> void:
	portal = _empty_state()
	level = {}
	current_level = ""
	respawn = {}
	EventBus.level_run_changed.emit("", "new_game")
	EventBus.respawn_changed.emit("", "")


## Ein Level wird betreten. Läuft dort schon ein Lauf - nach Tod, Neustart oder
## Laden -, geht er weiter; sonst beginnt ein neuer.
func enter_level(level_id: String) -> void:
	if level_id.is_empty() or current_level == level_id:
		return
	if has_run():
		push_warning("GameState: Der Lauf in %s endet ohne Abschluss, weil %s betreten wird." % [current_level, level_id])
	begin_level(level_id)


## Beginnt einen Lauf: Der Portalstand bleibt, wie er ist; im Level ändert sich
## eine Kopie davon. Rückkehrpunkt ist der Landepunkt des Levels.
func begin_level(level_id: String) -> void:
	if level_id.is_empty():
		return
	level = portal.duplicate(true)
	current_level = level_id
	respawn = {}
	EventBus.level_run_changed.emit(level_id, "begin")
	EventBus.respawn_changed.emit(level_id, "")


## Schließt das laufende Level ab: Der Levelstand wird zum neuen Portalstand,
## das Level gilt als abgeschlossen, der Lauf ist vorbei. Bittet ums Speichern.
## Liefert false, wenn kein Lauf läuft.
func complete_level() -> bool:
	if not has_run():
		return false
	var done := current_level
	var finished := _list(level, "completed")
	if not finished.has(done):
		finished.append(done)
	portal = level.duplicate(true)
	_end_run(done, "complete")
	EventBus.save_requested.emit("Level abgeschlossen")
	return true


## Verlässt das laufende Level: Der Levelstand wird verworfen, es gilt wieder der
## Portalstand. Bittet ums Speichern. Liefert false, wenn kein Lauf läuft.
func leave_level() -> bool:
	if not has_run():
		return false
	_end_run(current_level, "leave")
	EventBus.save_requested.emit("Level verlassen")
	return true


## Ist das Level abgeschlossen?
func is_level_completed(level_id: String) -> bool:
	return _list(active(), "completed").has(level_id)


## Setzt den Rückkehrpunkt: Hier erwacht die Figur nach dem Tod und beim nächsten
## Start - etwa an einem Zeitanker. anchor_id leer: der Landepunkt.
func set_respawn(level_id: String, anchor_id: String) -> void:
	if anchor_id.is_empty():
		respawn = {}
	else:
		respawn = {"level": level_id, "anchor": anchor_id}
	EventBus.respawn_changed.emit(level_id, anchor_id)


## Der Rückkehrpunkt als Kopie: {"level": ..., "anchor": ...}; leer: der Landepunkt.
func get_respawn() -> Dictionary:
	return respawn.duplicate()


## Ist dieser Anker der Rückkehrpunkt?
func is_respawn(level_id: String, anchor_id: String) -> bool:
	if anchor_id.is_empty():
		return false
	return _text(respawn.get("level")) == level_id and _text(respawn.get("anchor")) == anchor_id


## Der gemerkte Zustand eines Dings der Welt; leer, wenn es noch wie in der Level-Szene ist.
func get_object_state(level_id: String, object_id: String) -> Dictionary:
	var in_level: Variant = _dict(active(), "objects").get(level_id)
	if not in_level is Dictionary:
		return {}
	var data: Variant = (in_level as Dictionary).get(object_id)
	if not data is Dictionary:
		return {}
	return (data as Dictionary).duplicate(true)


## Merkt sich den Zustand eines Dings der Welt; ein leerer Zustand löscht den Eintrag.
func set_object_state(level_id: String, object_id: String, data: Dictionary) -> void:
	if level_id.is_empty() or object_id.is_empty():
		return
	var in_level := _dict(_dict(active(), "objects"), level_id)
	if data.is_empty():
		in_level.erase(object_id)
	else:
		in_level[object_id] = data.duplicate(true)


## Gibt es gemerkte Daten zu dieser Spielfigur? Ohne sie beginnt sie mit dem Startinhalt.
func has_player_data(player_id: int) -> bool:
	return _dict(active(), "players").get(str(player_id)) is Dictionary


## Inventar und Ausrüstung einer Spielfigur, als Kopie; leer, wenn nichts gemerkt ist.
func get_player_data(player_id: int) -> Dictionary:
	var data: Variant = _dict(active(), "players").get(str(player_id))
	if not data is Dictionary:
		return {}
	return (data as Dictionary).duplicate(true)


## Merkt sich Inventar und Ausrüstung einer Spielfigur.
func set_player_data(player_id: int, data: Dictionary) -> void:
	_dict(active(), "players")[str(player_id)] = data.duplicate(true)


## Die Level-Szene, zu der ein Knoten gehört: sein oberster Besitzer.
func level_root_of(node: Node) -> Node:
	var root := node
	while root != null and root.owner != null:
		root = root.owner
	return root


## Kennung des Levels, zu dem ein Knoten gehört: level_id der Level-Szene, sonst
## ihr Dateiname, etwa "test_chamber".
func level_id_of(node: Node) -> String:
	var root := level_root_of(node)
	if root == null:
		return ""
	var id := _text(root.get("level_id"))
	if not id.is_empty():
		return id
	return root.scene_file_path.get_file().get_basename()


## Kennung eines Dings in seinem Level: sein Pfad von der Level-Szene aus,
## etwa "InteractionCorner/WoodDoor".
func object_id_of(node: Node) -> String:
	var root := level_root_of(node)
	if root == null or root == node:
		return String(node.name)
	return String(root.get_path_to(node))


## Alles für die Datei, als einfache Werte für JSON.
func to_save_data() -> Dictionary:
	return {
		"version": FORMAT_VERSION,
		"current_level": current_level,
		"respawn": respawn.duplicate(true),
		"portal": portal.duplicate(true),
		"level": level.duplicate(true),
	}


## Übernimmt einen Stand aus der Datei. Liefert false, wenn er unbrauchbar ist;
## dann bleibt alles, wie es war.
func from_save_data(data: Dictionary) -> bool:
	var version: Variant = data.get("version")
	if not (version is int or version is float) or int(version) != FORMAT_VERSION:
		return false
	var loaded_portal: Variant = data.get("portal")
	if not loaded_portal is Dictionary:
		return false
	portal = loaded_portal
	current_level = _text(data.get("current_level"))
	var loaded_level: Variant = data.get("level")
	level = loaded_level if loaded_level is Dictionary else {}
	if has_run() and level.is_empty():
		level = portal.duplicate(true)
	if not has_run():
		level = {}
	respawn = {}
	var loaded_respawn: Variant = data.get("respawn")
	if loaded_respawn is Dictionary:
		var anchor := _text(loaded_respawn.get("anchor"))
		if not anchor.is_empty():
			respawn = {"level": _text(loaded_respawn.get("level")), "anchor": anchor}
	EventBus.level_run_changed.emit(current_level, "load")
	EventBus.respawn_changed.emit(_text(respawn.get("level")), _text(respawn.get("anchor")))
	return true


func _end_run(level_id: String, event: String) -> void:
	level = {}
	current_level = ""
	respawn = {}
	EventBus.level_run_changed.emit(level_id, event)
	EventBus.respawn_changed.emit(level_id, "")


func _empty_state() -> Dictionary:
	return {"players": {}, "objects": {}, "completed": []}


# Das Dictionary unter key; legt es an, wenn es fehlt.
func _dict(holder: Dictionary, key: String) -> Dictionary:
	var value: Variant = holder.get(key)
	if value is Dictionary:
		return value
	var created := {}
	holder[key] = created
	return created


# Die Liste unter key; legt sie an, wenn sie fehlt.
func _list(holder: Dictionary, key: String) -> Array:
	var value: Variant = holder.get(key)
	if value is Array:
		return value
	var created := []
	holder[key] = created
	return created


# Text aus einem Wert der Datei; alles andere als Text wird leer.
func _text(value: Variant) -> String:
	if value is String or value is StringName:
		return String(value)
	return ""
