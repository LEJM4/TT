extends Node
## SaveManager - schreibt den Spielstand in eine Datei und liest ihn wieder (M16).
##
## Die Datei liegt unter user://saves/slot_1.json, unter Windows in
## %APPDATA%\Godot\app_userdata\TimeTraveller\saves\. Sie ist lesbares JSON:
## version, saved_at, reason, current_level, respawn, portal und level. Was darin
## steht, führt GameState; dieser Dienst schreibt und liest nur.
## Beim Start lädt er die Datei; ohne Datei beginnt ein neues Spiel. Geschrieben
## wird, wenn jemand über den EventBus darum bittet (save_requested) - beim Rasten
## am Zeitanker, beim Tod, beim Abschluss und Verlassen eines Levels -, und wenn
## das Fenster geschlossen wird. Danach meldet er game_saved.
## Der Stopp-Knopf des Editors beendet das Spiel ohne Speichern.
## Im Spiel lässt sich kein Spielstand löschen; das kommt mit dem Startmenü (M20).
## Zum Testen löscht ihn F4 in der Testkammer über delete_save().
##
## Abschalten: in den Projekteinstellungen unter Autoload den Eintrag SaveManager
## entfernen - alles läuft weiter, nur ohne Datei.

## Ordner der Spielstände.
const SAVE_DIR := "user://saves"
## Die Datei des Spielstands.
const SAVE_PATH := "user://saves/slot_1.json"
## Hierhin kommt eine Datei, die sich nicht lesen ließ, bevor ein neues Spiel beginnt.
const BAD_PATH := "user://saves/slot_1.bad.json"

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
	load_game()


func _ready() -> void:
	# Schließen des Fensters erst nach dem Speichern zulassen.
	get_tree().set_auto_accept_quit(false)
	EventBus.save_requested.connect(_on_save_requested)


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save("Beenden")
		get_tree().quit()


## Gibt es eine Datei mit Spielstand?
func has_save() -> bool:
	return FileAccess.file_exists(SAVE_PATH)


## Schreibt den Fortschritt aus GameState in die Datei. Liefert, ob es ging.
func save(reason := "") -> bool:
	var state := _game_state()
	if state == null:
		return false
	var data: Dictionary = state.call("to_save_data")
	data["saved_at"] = Time.get_datetime_string_from_system(false, true)
	data["reason"] = reason
	var error := DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	if error != OK:
		push_error("SaveManager: Ordner %s lässt sich nicht anlegen (Fehler %d)." % [SAVE_DIR, error])
		return false
	# Erst in eine Zwischendatei, dann umbenennen: Bricht das Schreiben ab, bleibt der alte Stand.
	var temp_path := SAVE_PATH + ".tmp"
	var file := FileAccess.open(temp_path, FileAccess.WRITE)
	if file == null:
		push_error("SaveManager: %s lässt sich nicht schreiben (Fehler %d)." % [temp_path, FileAccess.get_open_error()])
		return false
	file.store_string(JSON.stringify(data, "\t"))
	file.close()
	error = DirAccess.rename_absolute(temp_path, SAVE_PATH)
	if error != OK:
		push_error("SaveManager: %s lässt sich nicht ersetzen (Fehler %d)." % [SAVE_PATH, error])
		return false
	last_saved_at = data["saved_at"]
	last_reason = reason
	EventBus.game_saved.emit(reason)
	return true


## Liest die Datei und gibt den Stand an GameState. Ohne Datei oder mit einer
## unlesbaren beginnt ein neues Spiel; liefert dann false.
func load_game() -> bool:
	var state := _game_state()
	if state == null:
		return false
	if not has_save():
		state.call("new_game")
		return false
	var json := JSON.new()
	var error := json.parse(FileAccess.get_file_as_string(SAVE_PATH))
	var data: Variant = json.data
	if error != OK or not data is Dictionary or not state.call("from_save_data", data):
		push_warning("SaveManager: %s ist unlesbar (%s, Zeile %d) - gesichert als %s, es beginnt ein neues Spiel." % [SAVE_PATH, json.get_error_message(), json.get_error_line(), BAD_PATH])
		DirAccess.copy_absolute(SAVE_PATH, BAD_PATH)
		state.call("new_game")
		return false
	last_saved_at = _text((data as Dictionary).get("saved_at"))
	last_reason = _text((data as Dictionary).get("reason"))
	return true


## Löscht die Datei. Den Fortschritt in GameState lässt das unberührt. Liefert, ob es ging.
func delete_save() -> bool:
	last_saved_at = ""
	last_reason = ""
	if not has_save():
		return true
	return DirAccess.remove_absolute(SAVE_PATH) == OK


func _on_save_requested(reason: String) -> void:
	save(reason)


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")


func _text(value: Variant) -> String:
	if value is String or value is StringName:
		return String(value)
	return ""
