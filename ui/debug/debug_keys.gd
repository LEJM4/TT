class_name DebugKeys
extends Node
## DebugKeys - die Test-Tasten an einer Stelle, in jedem Level und in der Zeitkapsel (M18).
##
##   F2       Raum neu laden wie ein Tod ohne Tod: speichern, dann über den
##            SceneManager neu laden - der Fortschritt bleibt
## Nur im Debug-Build, also nicht im fertigen Spiel:
##   F4       Spielstand des offenen Platzes löschen und dort ein neues Spiel im
##            Startlevel beginnen (seit M20 gibt es drei Plätze; im fertigen Spiel
##            löscht nur die Spielstand-Auswahl im Hauptmenü)
##   Bild auf Level abschließen ohne Nachfrage - derselbe Weg wie "Einsteigen"
##            an der Zeitkapsel (level_exit_requested)
##   Bild ab  Reise abbrechen ohne Nachfrage - derselbe Weg wie "Abbrechen"
##            an der Zeitkapsel (level_leave_requested)
##   Ende     Spiel beenden wie mit dem X am Fenster: Der SaveManager speichert
##   Pos1     alles freischalten (M19) - GameState.unlock_all()
## F3 (Zoom) bleibt in der Testkammer. F5 bis F8 fängt der Godot-Editor ab.
## Dazu die Debug-Zeile "Spielstand": seit M20 der Platz, dann Lauf, Rückkehrpunkt
## und letzte Speicherung, etwa "Platz 1 · Lauf test_chamber · Landepunkt ·
## 19:03:12 Rasten", und seit M19 die Zeile
## "Frei": was freigeschaltet ist, etwa "Dash, Stun", sonst "nichts" oder "alles".
## Ohne SceneManager laden F2, F4, Bild auf und Bild ab das Level direkt neu, wie vor M18.
##
## Abschalten: Knoten löschen - die Test-Tasten wirken nicht, alles andere läuft.

## Nummer der Spielfigur, für die Bild auf und Bild ab gelten.
@export var player_id := 1


func _ready() -> void:
	EventBus.game_saved.connect(_on_save_state_changed.unbind(1))
	EventBus.respawn_changed.connect(_on_save_state_changed.unbind(2))
	EventBus.level_run_changed.connect(_on_save_state_changed.unbind(2))
	EventBus.unlocks_changed.connect(_on_save_state_changed.unbind(2))
	# Erst melden, wenn die Debug-Anzeige bereit ist und zuhört.
	_report_save_state.call_deferred()


func _unhandled_input(event: InputEvent) -> void:
	var manager := _scene_manager()
	if manager != null and manager.call("is_changing"):
		# Während eines Wechsels gelten die Test-Tasten nicht.
		return
	if event.is_action_pressed("debug_restart_room"):
		get_viewport().set_input_as_handled()
		_restart("Neustart")
	elif not OS.is_debug_build():
		return
	elif event.is_action_pressed("debug_delete_save"):
		get_viewport().set_input_as_handled()
		_new_game()
	elif event.is_action_pressed("debug_complete_level"):
		get_viewport().set_input_as_handled()
		_complete_level()
	elif event.is_action_pressed("debug_leave_level"):
		get_viewport().set_input_as_handled()
		_leave_level()
	elif event.is_action_pressed("debug_quit_game"):
		get_viewport().set_input_as_handled()
		# Wie das X am Fenster: Der SaveManager speichert und beendet.
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()
	elif event.is_action_pressed("debug_unlock_all"):
		get_viewport().set_input_as_handled()
		var state := _game_state()
		if state != null:
			state.call("unlock_all")


func _restart(reason: String) -> void:
	var manager := _scene_manager()
	if manager != null:
		manager.call("reload_level", reason)
		return
	EventBus.save_requested.emit(reason)
	get_tree().reload_current_scene()


func _new_game() -> void:
	var saves := get_node_or_null("/root/SaveManager")
	if saves != null:
		saves.call("delete_save")
	var manager := _scene_manager()
	if manager != null:
		manager.call("new_game")
		return
	var state := _game_state()
	if state != null:
		state.call("new_game")
	get_tree().reload_current_scene()


func _complete_level() -> void:
	if _scene_manager() != null:
		EventBus.level_exit_requested.emit(player_id)
		return
	var state := _game_state()
	if state != null and state.call("complete_level"):
		get_tree().reload_current_scene()


func _leave_level() -> void:
	if _scene_manager() != null:
		EventBus.level_leave_requested.emit(player_id)
		return
	var state := _game_state()
	if state != null and state.call("leave_level"):
		get_tree().reload_current_scene()


func _on_save_state_changed() -> void:
	_report_save_state()


# Debug-Zeile "Spielstand": Lauf, Rückkehrpunkt, letzte Speicherung (M16).
func _report_save_state() -> void:
	var state := _game_state()
	if state == null:
		EventBus.debug_value_changed.emit("Spielstand", "aus")
		EventBus.debug_value_changed.emit("Frei", "alles")
		return
	var run := String(state.get("current_level"))
	var text := "kein Lauf"
	if not run.is_empty():
		text = "Lauf " + run
		if state.call("is_level_completed", run):
			text += " (abgeschlossen)"
	var respawn: Dictionary = state.call("get_respawn")
	var anchor := String(respawn.get("anchor", ""))
	if anchor.is_empty():
		text += " · Landepunkt"
	else:
		text += " · Anker " + anchor
	var saves := get_node_or_null("/root/SaveManager")
	if saves == null:
		text += " · ohne Datei"
	else:
		# Der offene Platz vorn (M20).
		var slot := int(saves.get("active_slot"))
		text = ("Platz %d · " % slot if slot > 0 else "kein Platz · ") + text
		var saved_at := String(saves.get("last_saved_at"))
		if saved_at.is_empty():
			text += " · nicht gespeichert"
		else:
			text += " · %s %s" % [saved_at.get_slice(" ", 1), String(saves.get("last_reason"))]
	EventBus.debug_value_changed.emit("Spielstand", text)
	# Freischaltungen (M19): ohne die Werte-Datei ist alles frei.
	if state.has_method("get_unlock_titles"):
		var free: PackedStringArray = state.call("get_unlock_titles", true)
		var locked: PackedStringArray = state.call("get_unlock_titles", false)
		var line := ", ".join(free)
		if locked.is_empty():
			line = "alles"
		elif free.is_empty():
			line = "nichts"
		EventBus.debug_value_changed.emit("Frei", line)


func _scene_manager() -> Node:
	return get_node_or_null("/root/SceneManager")


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")
