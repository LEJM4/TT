extends Node
## SaveManager - schreibt den Spielstand in eine Datei und liest ihn wieder (M16);
## seit M20 auf drei Plätzen.
##
## Jeder Platz ist eine Datei: user://saves/slot_1.json bis slot_3.json, unter
## Windows in %APPDATA%\Godot\app_userdata\TimeTraveller\saves\. Der Spielstand
## aus M16 ist Platz 1. Die Dateien sind lesbares JSON: version, saved_at, reason,
## play_time (Spielzeit in Sekunden, seit M20), current_level, respawn, portal und
## level. Was darin steht, führt GameState; dieser Dienst schreibt und liest nur.
##
## Gespielt wird auf dem offenen Platz (active_slot). Die Spielstand-Auswahl im
## Hauptmenü öffnet ihn mit open_slot(): Ein belegter Platz wird geladen, ein
## leerer beginnt ein neues Spiel. Die Startszene mit dem Hauptmenü schließt ihn
## mit close_slot() - im Hauptmenü wird nichts geschrieben. Beim Start des Spiels
## ist der Platz offen, der zuletzt gespeichert wurde; so geht es weiter, wenn
## eine Szene direkt im Editor startet.
## Geschrieben wird, wenn jemand über den EventBus darum bittet (save_requested) -
## beim Rasten am Zeitanker, beim Tod, bei Abschluss und Abbruch eines Levels, vor
## jeder Reise, aus dem Pausenmenü -, und wenn das Fenster geschlossen wird. Danach
## meldet er game_saved. Der Stopp-Knopf des Editors beendet ohne Speichern.
## Löschen: delete_slot() - nur aus der Spielstand-Auswahl im Hauptmenü, mit
## Nachfrage. Zum Testen löscht F4 den offenen Platz (delete_save()), nur im
## Debug-Build.
##
## Abschalten: in den Projekteinstellungen unter Autoload den Eintrag SaveManager
## entfernen - alles läuft weiter, nur ohne Datei; die Spielstand-Auswahl zeigt
## dann drei leere Plätze.

## Ordner der Spielstände.
const SAVE_DIR := "user://saves"
## So viele Plätze gibt es.
const SLOT_COUNT := 3

## Der offene Platz, 1 bis SLOT_COUNT; 0 heißt: keiner - etwa im Hauptmenü.
var active_slot := 0
## Zeitpunkt der letzten Speicherung oder des geladenen Stands, etwa "2026-11-21 19:03:12".
var last_saved_at := ""
## Anlass der letzten Speicherung, etwa "Rasten".
var last_reason := ""

var _loaded := false


func _enter_tree() -> void:
	# Laden schon hier: Das erste Level meldet sich in seinem _enter_tree() bei
	# GameState und braucht den geladenen Stand. Globale Dienste betreten den
	# Baum vor ihm, ihr _ready() kommt erst danach.
	if _loaded:
		return
	_loaded = true
	open_slot(get_last_slot())


func _ready() -> void:
	# Schließen des Fensters erst nach dem Speichern zulassen.
	get_tree().set_auto_accept_quit(false)
	EventBus.save_requested.connect(_on_save_requested)


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save("Beenden")
		get_tree().quit()


## Wie viele Plätze es gibt.
func get_slot_count() -> int:
	return SLOT_COUNT


## Gibt es diesen Platz?
func is_valid_slot(slot: int) -> bool:
	return slot >= 1 and slot <= SLOT_COUNT


## Die Datei eines Platzes, etwa "user://saves/slot_2.json".
func slot_path(slot: int) -> String:
	return "%s/slot_%d.json" % [SAVE_DIR, slot]


## Gibt es eine Datei mit Spielstand? slot 0: der offene Platz.
func has_save(slot := 0) -> bool:
	if slot == 0:
		slot = active_slot
	return is_valid_slot(slot) and FileAccess.file_exists(slot_path(slot))


## Der Platz, der zuletzt gespeichert wurde - nach der Zeit seiner Datei. Ohne
## Dateien Platz 1.
func get_last_slot() -> int:
	var last := 1
	var newest := -1
	for slot in range(1, SLOT_COUNT + 1):
		var path := slot_path(slot)
		if not FileAccess.file_exists(path):
			continue
		var time := FileAccess.get_modified_time(path)
		if time > newest:
			newest = time
			last = slot
	return last


## Öffnet einen Platz: Ab jetzt wird dorthin gespeichert. Liegt dort ein
## Spielstand, kommt er nach GameState; sonst beginnt ein neues Spiel. Liefert,
## ob ein Spielstand geladen ist.
func open_slot(slot: int) -> bool:
	if not is_valid_slot(slot):
		push_warning("SaveManager: Den Platz %d gibt es nicht." % slot)
		return false
	active_slot = slot
	last_saved_at = ""
	last_reason = ""
	return load_game()


## Schließt den offenen Platz - etwa im Hauptmenü. Bis wieder einer offen ist,
## wird nichts geschrieben. Den Fortschritt in GameState lässt das unberührt.
func close_slot() -> void:
	active_slot = 0
	last_saved_at = ""
	last_reason = ""


## Schreibt den Fortschritt aus GameState in die Datei des offenen Platzes.
## Liefert, ob es ging; ohne offenen Platz geschieht nichts.
func save(reason := "") -> bool:
	if not is_valid_slot(active_slot):
		return false
	var state := _game_state()
	if state == null:
		return false
	var path := slot_path(active_slot)
	var data: Dictionary = state.call("to_save_data")
	data["saved_at"] = Time.get_datetime_string_from_system(false, true)
	data["reason"] = reason
	var error := DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	if error != OK:
		push_error("SaveManager: Ordner %s lässt sich nicht anlegen (Fehler %d)." % [SAVE_DIR, error])
		return false
	# Erst in eine Zwischendatei, dann umbenennen: Bricht das Schreiben ab, bleibt der alte Stand.
	var temp_path := path + ".tmp"
	var file := FileAccess.open(temp_path, FileAccess.WRITE)
	if file == null:
		push_error("SaveManager: %s lässt sich nicht schreiben (Fehler %d)." % [temp_path, FileAccess.get_open_error()])
		return false
	file.store_string(JSON.stringify(data, "\t"))
	file.close()
	error = DirAccess.rename_absolute(temp_path, path)
	if error != OK:
		push_error("SaveManager: %s lässt sich nicht ersetzen (Fehler %d)." % [path, error])
		return false
	last_saved_at = data["saved_at"]
	last_reason = reason
	EventBus.game_saved.emit(reason)
	return true


## Liest die Datei des offenen Platzes und gibt den Stand an GameState. Ohne Datei
## oder mit einer unlesbaren beginnt ein neues Spiel; liefert dann false.
func load_game() -> bool:
	var state := _game_state()
	if state == null:
		return false
	if not has_save():
		state.call("new_game")
		return false
	var path := slot_path(active_slot)
	var data: Variant = _read(path)
	if data == null or not state.call("from_save_data", data):
		var bad_path := path.get_basename() + ".bad.json"
		push_warning("SaveManager: %s ist unlesbar - gesichert als %s, es beginnt ein neues Spiel." % [path, bad_path])
		DirAccess.copy_absolute(path, bad_path)
		state.call("new_game")
		return false
	last_saved_at = _text((data as Dictionary).get("saved_at"))
	last_reason = _text((data as Dictionary).get("reason"))
	return true


## Löscht die Datei eines Platzes - aus der Spielstand-Auswahl im Hauptmenü. Den
## Fortschritt in GameState lässt das unberührt. Liefert, ob es ging.
func delete_slot(slot: int) -> bool:
	if not is_valid_slot(slot):
		return false
	if slot == active_slot:
		last_saved_at = ""
		last_reason = ""
	var path := slot_path(slot)
	if FileAccess.file_exists(path + ".tmp"):
		DirAccess.remove_absolute(path + ".tmp")
	if not FileAccess.file_exists(path):
		return true
	return DirAccess.remove_absolute(path) == OK


## Löscht die Datei des offenen Platzes - F4 im Debug-Build (M16). Liefert, ob es ging.
func delete_save() -> bool:
	return delete_slot(active_slot)


## Übersicht eines Platzes für die Spielstand-Auswahl, ohne ihn zu laden:
##   exists         gibt es die Datei?
##   valid          lässt sie sich lesen?
##   current_level  Level des Laufs; leer ohne Lauf
##   completed      die abgeschlossenen Level
##   play_time      Spielzeit in Sekunden; 0 in Spielständen vor M20
##   saved_at       Zeitpunkt der letzten Speicherung, etwa "2026-11-22 19:03:12"
func get_slot_info(slot: int) -> Dictionary:
	var info := {
		"slot": slot,
		"exists": false,
		"valid": false,
		"current_level": "",
		"completed": [],
		"play_time": 0,
		"saved_at": "",
	}
	if not has_save(slot):
		return info
	info["exists"] = true
	var data: Variant = _read(slot_path(slot))
	if data == null or not (data as Dictionary).get("portal") is Dictionary:
		return info
	var save_data := data as Dictionary
	info["valid"] = true
	var running := _text(save_data.get("current_level"))
	info["current_level"] = running
	# Wie GameState.active(): im Lauf zählt der Levelstand, sonst der Kapselstand.
	var stand: Dictionary = save_data["portal"]
	var level: Variant = save_data.get("level")
	if not running.is_empty() and level is Dictionary and not (level as Dictionary).is_empty():
		stand = level
	var completed: Variant = stand.get("completed")
	if completed is Array:
		info["completed"] = (completed as Array).duplicate()
	var played: Variant = save_data.get("play_time")
	if played is float or played is int:
		info["play_time"] = maxi(int(played), 0)
	info["saved_at"] = _text(save_data.get("saved_at"))
	return info


func _on_save_requested(reason: String) -> void:
	save(reason)


# Der Inhalt einer Datei als Dictionary; null, wenn sie sich nicht lesen lässt.
func _read(path: String) -> Variant:
	var json := JSON.new()
	if json.parse(FileAccess.get_file_as_string(path)) != OK:
		push_warning("SaveManager: %s: %s (Zeile %d)." % [path, json.get_error_message(), json.get_error_line()])
		return null
	if not json.data is Dictionary:
		return null
	return json.data


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")


func _text(value: Variant) -> String:
	if value is String or value is StringName:
		return String(value)
	return ""
