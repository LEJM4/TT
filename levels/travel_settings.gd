class_name TravelSettings
extends Resource
## TravelSettings - die Reisedaten: alle Level, das Startlevel, die Zeitkapsel,
## seit M20 das Hauptmenü, und die Überblendung (M18).
##
## Die Werte stehen in data/world/travel.tres; der SceneManager lädt die Datei
## beim Start über ihren festen Pfad. Ein neues Level kommt als Eintrag in levels
## dazu - Kennung, Name, Szene -, ohne Code.
## Ändern: data/world/travel.tres doppelklicken und im Inspektor anpassen.

## Alle Level, in die gereist werden kann.
@export var levels: Array[LevelInfo] = []
## Kennung des Levels, in dem ein neues Spiel beginnt - bis Level 1 die Testkammer.
@export var start_level := "test_chamber"
## Szene der Zeitkapsel innen, der Lobby.
@export_file("*.tscn") var capsule_scene := ""
## Name der Zeitkapsel für die Debug-Zeile "Ort" und die Spielstand-Auswahl.
@export var capsule_title := "Zeitkapsel"
## Startszene mit dem Hauptmenü (M20): Hierher geht "Hauptmenü" im Pausenmenü.
@export_file("*.tscn") var menu_scene := "res://levels/boot/boot.tscn"
## Dauer des Aus- und des Einblendens bei jedem Wechsel, in Sekunden.
@export_range(0.0, 2.0, 0.05) var fade_time := 0.25


## Das Level mit dieser Kennung, oder null.
func find(level_id: String) -> LevelInfo:
	for info in levels:
		if info != null and info.id == level_id:
			return info
	return null


## Das Level, dessen Szene unter diesem Pfad liegt, oder null.
func find_by_scene(scene_path: String) -> LevelInfo:
	if scene_path.is_empty():
		return null
	for info in levels:
		if info != null and _same_file(info.scene, scene_path):
			return info
	return null


## Ist das die Szene der Zeitkapsel innen?
func is_capsule_scene(scene_path: String) -> bool:
	return not capsule_scene.is_empty() and _same_file(capsule_scene, scene_path)


## Ist das die Startszene mit dem Hauptmenü (M20)?
func is_menu_scene(scene_path: String) -> bool:
	return not menu_scene.is_empty() and _same_file(menu_scene, scene_path)


## Wo ein Spielstand weitergeht, als Name für die Spielstand-Auswahl (M20) - wie
## SceneManager.start_game(): das Level des Laufs, sonst die Zeitkapsel, sobald
## ein Level abgeschlossen ist, sonst das Startlevel.
func place_title(current_level: String, completed: Array) -> String:
	if not current_level.is_empty():
		return _title_of(current_level)
	for info in levels:
		if info != null and completed.has(info.id):
			return capsule_title
	return _title_of(start_level)


# Name eines Levels; ohne Eintrag seine Kennung.
func _title_of(level_id: String) -> String:
	var info := find(level_id)
	if info != null and not info.title.is_empty():
		return info.title
	return level_id


# Zwei Verweise auf dieselbe Datei - als Pfad oder als uid://.
func _same_file(first: String, second: String) -> bool:
	return _as_path(first) == _as_path(second)


func _as_path(file: String) -> String:
	if file.begins_with("uid://"):
		var id := ResourceUID.text_to_id(file)
		if ResourceUID.has_id(id):
			return ResourceUID.get_id_path(id)
	return file
