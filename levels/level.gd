class_name Level
extends Node2D
## Level - Grundlage jedes Levels außer der Testkammer (M18).
##
## Benutzung: die Wurzel einer neuen Level-Szene bekommt dieses Skript, dazu
## als letztes Kind levels/level_frame/level_frame.tscn - alles, was jedes Level
## braucht: Spielfigur, Kamera, Beute, Geschosse, Anzeigen und Fenster. Den
## MissionTracker mit der Missionen-Datei bringt jedes Level selbst mit, ebenso
## Räume (world/room/room.tscn), Wände und die Zeitkapsel (world/time_capsule/).
## Damit man hinreisen kann, kommt das Level in die Reisedaten data/world/travel.tres.
##
## Beim Betreten meldet es sich bei GameState (enter_level) - ein laufender Lauf
## geht weiter, sonst beginnt einer. In der Zeitkapsel ist starts_run aus: Dort
## läuft kein Lauf, was sich ändert, gilt im Kapselstand.
## Es meldet seine Grenzen - die eigene Fläche und alle Räume - für die Kamera.
## Stirbt eine Figur, lädt es nach death_restart_delay Sekunden über den
## SceneManager neu; die Figur erwacht am Rückkehrpunkt.
## Die Test-Tasten F2, F4, Bild auf, Bild ab und Ende liegen im LevelFrame (DebugKeys).
##
## Abschalten: Ohne SceneManager lädt es nach dem Tod ohne Überblendung neu.

## Kennung des Levels im Spielstand und in den Reisedaten, etwa "test_field".
## Leer: der Dateiname der Szene.
@export var level_id := ""
## Beginnt hier ein Lauf durch das Level? Aus in der Zeitkapsel.
@export var starts_run := true
## Größe des Levels in Pixeln, ab seinem Ort - für die Kamera, wenn es keine Räume gibt.
@export var level_size := Vector2i(480, 272)
## Sekunden vom Tod einer Figur bis zum Neuladen.
@export var death_restart_delay := 1.0

var _restarting := false


func _enter_tree() -> void:
	if level_id.is_empty():
		level_id = scene_file_path.get_file().get_basename()
	# Vor allen Kindern: Dinge der Welt und Spielfigur fragen in ihrem _ready() nach dem Stand.
	var state := get_node_or_null("/root/GameState")
	if state == null:
		return
	if starts_run:
		state.call("enter_level", level_id)
	elif state.call("has_run"):
		# Etwa die Zeitkapsel direkt im Editor gestartet: Was sich hier ändert, gilt dann im Levelstand.
		push_warning("Level %s: Hier beginnt kein Lauf, aber in %s läuft noch einer." % [level_id, state.get("current_level")])


func _ready() -> void:
	EventBus.camera_bounds_changed.emit(get_bounds())
	EventBus.player_died.connect(_on_player_died)


## Fläche des Levels in der Welt: level_size ab seinem Ort und alle Räume darin.
func get_bounds() -> Rect2:
	return Room.merge_bounds(get_tree(), Rect2(global_position, Vector2(level_size)))


## Lädt das Level neu: über den SceneManager mit Überblendung, sonst direkt.
## Vorher bittet es ums Speichern; der Fortschritt bleibt.
func restart(reason := "Neustart") -> void:
	if _restarting:
		return
	_restarting = true
	var manager := get_node_or_null("/root/SceneManager")
	if manager != null and manager.call("reload_level", reason):
		return
	if manager != null and manager.call("is_changing"):
		return
	EventBus.save_requested.emit(reason)
	get_tree().reload_current_scene()


func _on_player_died(_player_id: int) -> void:
	# Hält mit der Pause an (M20): Erst wenn das Pausenmenü zu ist, lädt das Level neu.
	get_tree().create_timer(death_restart_delay, false).timeout.connect(restart.bind("Tod"))
