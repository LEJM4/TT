extends Node
## SceneManager - die eine Stelle für Szenenwechsel (M18): Reisen zwischen den
## Leveln und der Zeitkapsel, Neustart nach Tod und F2, der Start des Spiels.
##
## Jeder Wechsel blendet aus, wechselt die Szene und blendet wieder ein - über
## einer eigenen Bildebene (120), über dem Fadenkreuz. Die Überblendung hängt
## nicht an der Pause. Ein Wechsel gilt für alle Spielfiguren.
## Die Ziele stehen in den Reisedaten data/world/travel.tres (TravelSettings):
## die Level mit Kennung, Name und Szene, das Startlevel, die Zeitkapsel innen,
## seit M20 die Startszene mit dem Hauptmenü und die Dauer der Überblendung.
##
## Wer einen Wechsel will, bittet über den EventBus darum:
##   level_exit_requested   Level abschließen: GameState.complete_level() - der
##                          Levelstand wird zum Kapselstand -, dann in die Zeitkapsel
##   level_leave_requested  Reise abbrechen: GameState.leave_level() - der Levelstand
##                          ist verloren -, dann in die Zeitkapsel; ist noch kein
##                          Level abgeschlossen, gibt es sie nicht: Das Level beginnt
##                          von vorn
##   travel_requested       in ein Level reisen, etwa von der Zeitsteuerung aus
## Levels, Menüs und Test-Tasten rufen direkt: reload_level() nach dem Tod und bei
## F2, new_game() bei F4 und für ein neues Spiel aus der Spielstand-Auswahl,
## start_game() für einen gewählten Spielstand (M20) - ohne Hauptmenü aus der
## Startszene levels/boot/boot.tscn -, go_to_menu() aus dem Pausenmenü (M20).
## Ob die Figur gerade ankommt - ein neuer Lauf hat mit dieser Szene begonnen -,
## sagt is_arrival(); dann landet die Zeitkapsel.
## Abschluss, Abbruch und neues Spiel geschehen erst, wenn das Bild schwarz ist:
## So ändert sich im alten Level nichts mehr, nachdem der Lauf vorbei ist.
## Gespeichert wird vor jeder Reise in ein Level ("Reise") und vor jedem Neuladen
## (Anlass wie übergeben); Abschluss und Abbruch speichern über GameState.
## Debug-Zeile "Ort": wo die Figuren sind, etwa "Zeitkapsel" oder
## "Testfeld · Ankunft".
##
## Abschalten: in den Projekteinstellungen unter Autoload den Eintrag SceneManager
## entfernen - Level laden nach Tod und F2 wie vor M18 ohne Überblendung neu,
## Zeitkapsel und Zeitsteuerung bewirken nichts, die Startszene lädt die Testkammer.

## Die Reisedaten.
const TRAVEL_PATH := "res://data/world/travel.tres"
## Bildebene der Überblendung: über allem, auch über dem Fadenkreuz (110).
const FADE_LAYER := 120

## Die Reisedaten aus TRAVEL_PATH.
var travel: TravelSettings

var _changing := false
var _arrival := false
var _fade_rect: ColorRect


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	travel = load(TRAVEL_PATH) as TravelSettings
	if travel == null:
		push_warning("SceneManager: %s fehlt oder ist keine TravelSettings - es gibt keine Reisen." % TRAVEL_PATH)
		travel = TravelSettings.new()
	_build_fade()
	EventBus.level_exit_requested.connect(_on_level_exit_requested)
	EventBus.level_leave_requested.connect(_on_level_leave_requested)
	EventBus.travel_requested.connect(_on_travel_requested)
	EventBus.level_run_changed.connect(_on_level_run_changed)


## Beginnt das Spiel dort, wo der Spielstand aufgehört hat - nach der Wahl in der
## Spielstand-Auswahl (M20). Läuft ein Level, geht es dorthin zurück; ist schon
## eins abgeschlossen, in die Zeitkapsel; sonst beginnt ein neuer Lauf im
## Startlevel. Liefert, ob der Wechsel beginnt.
func start_game() -> bool:
	if _changing:
		return false
	var state := _game_state()
	if state != null and state.call("has_run"):
		var running := String(state.get("current_level"))
		var info := travel.find(running)
		if info != null:
			return _change(info.scene, "fortgesetzt")
		push_warning("SceneManager: Das laufende Level \"%s\" steht nicht in %s - der Lauf wird abgebrochen." % [running, TRAVEL_PATH])
		state.call("leave_level")
	if has_capsule() and travel_to_capsule():
		return true
	return _go_to_start()


## Zurück zum Startbildschirm mit dem Hauptmenü (M20), etwa aus dem Pausenmenü.
## Gespeichert hat vorher, wer zurück will. Liefert, ob der Wechsel beginnt.
func go_to_menu() -> bool:
	if travel.menu_scene.is_empty():
		push_warning("SceneManager: In %s ist kein Hauptmenü eingetragen." % TRAVEL_PATH)
		return false
	return _change(travel.menu_scene, "")


## Beginnt ein neues Spiel im Startlevel: Der Fortschritt in GameState ist weg,
## sobald das Bild schwarz ist. Die Datei bleibt, bis jemand speichert - F4
## löscht sie vorher. Liefert, ob der Wechsel beginnt.
func new_game() -> bool:
	var info := travel.find(travel.start_level)
	if info == null:
		push_warning("SceneManager: Das Startlevel \"%s\" steht nicht in %s." % [travel.start_level, TRAVEL_PATH])
		return false
	return _change(info.scene, "", _begin_new_game)


## Reist in ein Level: überblenden, speichern, dort beginnt ein neuer Lauf - die
## Zeitkapsel landet. Gereist wird aus der Zeitkapsel; läuft noch ein Lauf, geht
## es nicht. Liefert, ob die Reise beginnt.
func travel_to_level(level_id: String) -> bool:
	var info := travel.find(level_id)
	if info == null:
		push_warning("SceneManager: Das Ziel \"%s\" steht nicht in %s." % [level_id, TRAVEL_PATH])
		return false
	var state := _game_state()
	if state != null and state.call("has_run"):
		push_warning("SceneManager: Gereist wird aus der Zeitkapsel - in %s läuft noch ein Lauf." % state.get("current_level"))
		return false
	return _change(info.scene, "", _save_before_travel)


## Bringt alle in die Zeitkapsel, die Lobby. Läuft noch ein Lauf, geht es nicht -
## erst Abschluss oder Abbruch. Liefert, ob der Wechsel beginnt.
func travel_to_capsule() -> bool:
	if travel.capsule_scene.is_empty():
		push_warning("SceneManager: In %s ist keine Zeitkapsel eingetragen." % TRAVEL_PATH)
		return false
	var state := _game_state()
	if state != null and state.call("has_run"):
		push_warning("SceneManager: In die Zeitkapsel geht es erst nach Abschluss oder Abbruch des Laufs in %s." % state.get("current_level"))
		return false
	return _change(travel.capsule_scene, "")


## Lädt die Szene neu, in der die Figuren gerade sind - nach dem Tod und bei F2.
## Vorher bittet er ums Speichern; der Fortschritt bleibt, die Figur erwacht am
## Rückkehrpunkt, ohne ihn vor der Zeitkapsel. reason ist der Anlass, etwa "Tod".
func reload_level(reason := "Neustart") -> bool:
	if _changing:
		return false
	var scene := get_tree().current_scene
	if scene == null or scene.scene_file_path.is_empty():
		push_warning("SceneManager: Die laufende Szene hat keine Datei - sie lässt sich nicht neu laden.")
		return false
	EventBus.save_requested.emit(reason)
	return _change(scene.scene_file_path, reason)


## Kommt die Figur gerade an? Wahr, wenn mit der laufenden Szene ein neuer Lauf
## begonnen hat - nach einer Reise, einem neuen Spiel oder einem Abbruch ohne
## Zeitkapsel. Falsch nach Tod, F2 und Fortsetzen. Dann landet die Zeitkapsel.
func is_arrival() -> bool:
	return _arrival


## Läuft gerade ein Wechsel?
func is_changing() -> bool:
	return _changing


## Gibt es die Zeitkapsel schon? Ja, sobald ein Level abgeschlossen ist.
func has_capsule() -> bool:
	var state := _game_state()
	if state == null:
		return false
	for info in travel.levels:
		if info != null and state.call("is_level_completed", info.id):
			return true
	return false


func _go_to_start() -> bool:
	var info := travel.find(travel.start_level)
	if info == null:
		push_warning("SceneManager: Das Startlevel \"%s\" steht nicht in %s." % [travel.start_level, TRAVEL_PATH])
		return false
	return _change(info.scene, "")


# Wechselt die Szene mit Überblendung. note steht in der Debug-Zeile "Ort", wenn
# kein neuer Lauf beginnt, etwa "Tod". before läuft, sobald das Bild schwarz ist,
# direkt vor dem Wechsel - etwa der Abschluss des Levels; liefert es false, bleibt
# alles, wie es war. So ändert sich nichts mehr im alten Level, nachdem der Lauf
# vorbei ist. Liefert, ob der Wechsel beginnt.
func _change(scene_path: String, note: String, before := Callable()) -> bool:
	if _changing:
		return false
	if scene_path.is_empty() or not ResourceLoader.exists(scene_path):
		push_warning("SceneManager: Die Szene \"%s\" gibt es nicht." % scene_path)
		return false
	_changing = true
	_run_change(scene_path, note, before)
	return true


func _run_change(scene_path: String, note: String, before: Callable) -> void:
	await _fade_to(1.0)
	if before.is_valid() and not before.call():
		_changing = false
		await _fade_to(0.0)
		return
	var packed := load(scene_path) as PackedScene
	var error := ERR_CANT_OPEN
	if packed != null:
		_arrival = false
		error = get_tree().change_scene_to_packed(packed)
	if error != OK:
		push_error("SceneManager: Die Szene %s lässt sich nicht laden (Fehler %d)." % [scene_path, error])
		_changing = false
		await _fade_to(0.0)
		return
	await get_tree().scene_changed
	_changing = false
	_report_place(note)
	await _fade_to(0.0)


# Vor dem Wechsel, wenn das Bild schwarz ist: neues Spiel.
func _begin_new_game() -> bool:
	var state := _game_state()
	if state != null:
		state.call("new_game")
	return true


# Vor einer Reise: speichern - in der Zeitkapsel der Kapselstand.
func _save_before_travel() -> bool:
	EventBus.save_requested.emit("Reise")
	return true


# Vor dem Wechsel in die Zeitkapsel: Abschluss - der Levelstand wird zum Kapselstand.
func _complete_run() -> bool:
	var state := _game_state()
	return state != null and state.call("complete_level")


# Vor dem Wechsel: Abbruch - der Levelstand ist verloren.
func _leave_run() -> bool:
	var state := _game_state()
	return state != null and state.call("leave_level")


func _on_level_exit_requested(_player_id: int) -> void:
	if _changing or not _has_run_to_end("abzuschließen"):
		return
	# Nach dem Abschluss gibt es die Zeitkapsel; ohne Eintrag geht es ins Startlevel.
	var target := travel.capsule_scene
	if target.is_empty():
		push_warning("SceneManager: In %s ist keine Zeitkapsel eingetragen - es geht ins Startlevel." % TRAVEL_PATH)
		var start := travel.find(travel.start_level)
		target = start.scene if start != null else ""
	_change(target, "", _complete_run)


func _on_level_leave_requested(_player_id: int) -> void:
	if _changing or not _has_run_to_end("abzubrechen"):
		return
	var target := ""
	if has_capsule() and not travel.capsule_scene.is_empty():
		target = travel.capsule_scene
	else:
		# Noch keine Zeitkapsel: Das Level beginnt von vorn.
		var left := travel.find(String(_game_state().get("current_level")))
		if left == null:
			left = travel.find(travel.start_level)
		target = left.scene if left != null else ""
	_change(target, "", _leave_run)


# Läuft ein Lauf, den Abschluss oder Abbruch beenden kann? Sonst eine Warnung.
func _has_run_to_end(what: String) -> bool:
	var state := _game_state()
	if state == null:
		push_warning("SceneManager: Ohne GameState gibt es nichts %s." % what)
		return false
	if not state.call("has_run"):
		push_warning("SceneManager: Kein Lauf - es gibt nichts %s." % what)
		return false
	return true


func _on_travel_requested(_player_id: int, level_id: String) -> void:
	travel_to_level(level_id)


func _on_level_run_changed(_level_id: String, event: String) -> void:
	# Ein neuer Lauf beginnt, während die Szene den Baum betritt: Die Figur kommt an.
	if event == "begin":
		_arrival = true


# Debug-Zeile "Ort": die Zeitkapsel, sonst Name des Levels und Ankunft oder Anlass.
func _report_place(note: String) -> void:
	var scene := get_tree().current_scene
	if scene == null:
		return
	var path := scene.scene_file_path
	var text := ""
	if travel.is_menu_scene(path):
		text = "Hauptmenü"
	elif travel.is_capsule_scene(path):
		text = travel.capsule_title
	else:
		var info := travel.find_by_scene(path)
		text = info.title if info != null and not info.title.is_empty() else path.get_file().get_basename()
		if _arrival:
			text += " · Ankunft"
		elif not note.is_empty():
			text += " · " + note
	EventBus.debug_value_changed.emit("Ort", text)


func _build_fade() -> void:
	var layer := CanvasLayer.new()
	layer.name = "Fade"
	layer.layer = FADE_LAYER
	add_child(layer)
	_fade_rect = ColorRect.new()
	_fade_rect.name = "Cover"
	_fade_rect.color = Color(0.0, 0.0, 0.0, 0.0)
	_fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_fade_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(_fade_rect)


func _fade_to(alpha: float) -> void:
	var time := maxf(travel.fade_time, 0.0)
	if time <= 0.0 or is_equal_approx(_fade_rect.color.a, alpha):
		_fade_rect.color.a = alpha
		return
	var tween := create_tween()
	tween.tween_property(_fade_rect, "color:a", alpha, time)
	await tween.finished


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")
