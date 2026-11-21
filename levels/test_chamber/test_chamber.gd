extends Node2D
## Testkammer - der Raum, in dem jede Mechanik zuerst ausprobiert wird (M1).
##
## Aufbau der Szene:
##   Walls, Blocks   feste Körper auf der Ebene "world"; ihre Flächen malt PlaceholderView
##   SpawnPoints     Startpunkte für Spielfiguren (Gruppe "player_spawn")
##   DummyA          einzelne Übungspuppe (M4); Bild aus data/skins/bamboo_yellow.tres (A1)
##   DummyB, DummyC  Puppenpaar: ein Hieb kann beide treffen (M4)
##   DummyD          bewegliches Ziel: pendelt, ist nicht fest und lässt sich durchlaufen (M6);
##                   lässt sich betäuben (M7); trägt den Skin data/skins/bamboo.tres (A1)
##   DamageZone      Schadensfeld (M4)
##   DamageStrip     schmaler Schadensstreifen zum Durchdashen (M5); lässt sich betäuben (M7)
##   InteractionCorner  drei kleine Räume unten rechts (M8): Holztür mit E, Gittertor
##                   am Hebel (Kanal lever_gate), Gittertor an zwei Druckplatten (plate_gate) -
##                   eine davor, eine im Raum, damit niemand eingesperrt bleibt;
##                   hinter der Holztür liegt seit M10 ein Goldschlüssel (GoldKey)
##   DestructibleField  Zerstörbares unten links (M9): zwei Töpfe, zwei Kisten
##                   nebeneinander, zwei Steine und ein Baum
##   ChestSmall, ChestBig  Truhen unter dem langen Balken (M10): die kleine ist offen
##                   für jeden, die große braucht den Goldschlüssel
##   StartItems      Ausrüstung zum Aufsammeln unter den Startpunkten (M11):
##                   Breitschwert, Bogen, Lederrüstung, Rubin-Anhänger
##   Caveman         Nahkämpfer (M13): ein Höhlenmensch patrouilliert rechts
##                   zwischen dem großen Block und dem rechten Pfeiler; sein
##                   Sichtkegel und Hörkreis sind eingeblendet (F1 blendet sie aus)
##   StoneThrower    Fernkämpferin (M14): eine Steinwerferin patrouilliert in der
##                   freien Fläche unten in der Mitte; sie hält Abstand und wirft
##                   Steine; Sichtkegel und Hörkreis wie beim Höhlenmenschen
##   Shaman          NPC mit Gespräch (M15): ein Schamane rechts neben den
##                   Startpunkten; fragt, was dich herführt, gibt einmal 5 Pfeile
##   Hunter          NPC, der nur Auskunft gibt (M15): ein Jäger links neben den
##                   Startpunkten; warnt vor den Gegnern, ohne Antworten
##   TimeAnchor      Zeitanker über den Startpunkten (M16): E rastet - Leben und
##                   Energie voll, hier erwacht die Figur wieder, das Spiel speichert
##   LootSpawner     legt alle Beute hin (M9)
##   PlayerSpawner   erzeugt die Spielfiguren (M2)
##   ProjectileSpawner  erzeugt alle Geschosse (M6)
##   PlayerCamera    folgt der Spielfigur (M3); die Grenzen meldet dieses Skript;
##                   den Zoom liest sie aus data/world/view.tres (M13)
##   Crosshair       Fadenkreuz am Mauszeiger (M4)
##   DebugOverlay    Entwickler-Anzeige
##   InventoryWindow Inventarfenster auf Tab (M11)
##   Hud             Leben, Energie, Ausdauer, Fähigkeiten und Geschoss der Figur 1 (M12)
##   DialogWindow    Dialogfenster der Figur 1 (M15); steht als Letztes in der Szene,
##                   damit es Tasten vor dem Inventarfenster hört
## Alles außer Walls, Blocks und SpawnPoints lässt sich einzeln löschen,
## die Kammer läuft weiter.
##
## Blöcke ändern: im 2D-Editor eine CollisionShape2D unter Walls oder Blocks
## verschieben oder an den Griffen ziehen - die Farbe folgt der Form.
## Neustart des Raums: Aktion "debug_restart_room" (F2) oder der Tod einer Figur.
## Vorher bittet die Kammer ums Speichern; der Fortschritt bleibt (M16), die
## Figur erwacht am Rückkehrpunkt, Gegner stehen wieder, Beute am Boden ist weg.
## Zoom ausprobieren: Aktion "debug_cycle_zoom" (F3) schaltet 1 bis 4 durch (M13);
## Kamera und Gegner folgen sofort, die Datei view.tres bleibt, wie sie ist.
##
## Spielstand (M16): Beim Betreten meldet sich die Kammer bei GameState als Level
## level_id - ein laufender Lauf geht weiter, sonst beginnt einer. Zum Testen,
## nur im Debug-Build: F4 löscht den Spielstand, Bild auf schließt das Level ab,
## Bild ab verlässt es, Ende beendet das Spiel wie das X am Fenster - die ersten
## drei mit neuem Lauf in der Kammer. Die Debug-Zeile "Spielstand" zeigt Lauf,
## Rückkehrpunkt und die letzte Speicherung.

## Kennung des Levels im Spielstand (M16).
@export var level_id := "test_chamber"

@export_group("Raum")
## Größe des Raums in Pixeln.
@export var room_size := Vector2i(480, 270)
## Kantenlänge einer Rasterzelle in Pixeln.
@export var cell_size := 16
## Raster einblenden?
@export var show_grid := true
## Sekunden vom Tod einer Figur bis zum Neustart des Raums.
@export var death_restart_delay := 1.0
## Ansicht mit dem Zoom der Welt (M13) - dieselbe Datei wie bei Kamera und Gegnern.
@export var view: ViewSettings

@export_group("Farben")
## Farbe des Bodens.
@export var floor_color := Color(0.13, 0.15, 0.2)
## Farbe der Rasterlinien.
@export var grid_color := Color(1.0, 1.0, 1.0, 0.06)
## Farbe der Kreuze an den Startpunkten.
@export var spawn_color := Color(0.95, 0.76, 0.3)

var _room_time := 0.0
var _restarting := false


func _enter_tree() -> void:
	# Vor allen Kindern: Dinge der Welt und Spielfigur fragen in ihrem _ready() nach dem Stand (M16).
	var state := get_node_or_null("/root/GameState")
	if state != null:
		state.call("enter_level", level_id)


func _ready() -> void:
	EventBus.camera_bounds_changed.emit(Rect2(global_position, Vector2(room_size)))
	EventBus.player_died.connect(_on_player_died)
	EventBus.game_saved.connect(_on_save_state_changed.unbind(1))
	EventBus.respawn_changed.connect(_on_save_state_changed.unbind(2))
	EventBus.level_run_changed.connect(_on_save_state_changed.unbind(2))
	_report_zoom()
	_report_save_state()


func _process(delta: float) -> void:
	_room_time += delta
	EventBus.debug_value_changed.emit("Raumzeit", "%.1f s" % _room_time)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_restart_room"):
		_restart_room("Neustart")
	elif event.is_action_pressed("debug_cycle_zoom"):
		_cycle_zoom()
	elif OS.is_debug_build():
		_handle_save_keys(event)


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, Vector2(room_size)), floor_color)
	if show_grid and cell_size > 0:
		for x in range(0, room_size.x, cell_size):
			draw_rect(Rect2(x, 0, 1, room_size.y), grid_color)
		for y in range(0, room_size.y, cell_size):
			draw_rect(Rect2(0, y, room_size.x, 1), grid_color)
	var spawn_points := get_node_or_null("SpawnPoints")
	if spawn_points == null:
		return
	for child in spawn_points.get_children():
		var marker := child as Marker2D
		if marker == null:
			continue
		var center := to_local(marker.global_position)
		draw_rect(Rect2(center.x - 3.0, center.y, 7.0, 1.0), spawn_color)
		draw_rect(Rect2(center.x, center.y - 3.0, 1.0, 7.0), spawn_color)


func _on_player_died(_player_id: int) -> void:
	# Tod (M16): nach einer Sekunde neu laden - die Figur erwacht am Rückkehrpunkt,
	# der Fortschritt bleibt, auch was nach dem letzten Rasten kam.
	get_tree().create_timer(death_restart_delay).timeout.connect(_restart_room.bind("Tod"))


func _restart_room(reason := "Neustart") -> void:
	if _restarting:
		return
	_restarting = true
	EventBus.save_requested.emit(reason)
	# Ab M18 läuft der Szenenwechsel über den SceneManager.
	get_tree().reload_current_scene()


# Test-Tasten für den Spielstand (M16), nur im Debug-Build.
func _handle_save_keys(event: InputEvent) -> void:
	var state := get_node_or_null("/root/GameState")
	if event.is_action_pressed("debug_delete_save"):
		get_viewport().set_input_as_handled()
		var saves := get_node_or_null("/root/SaveManager")
		if saves != null:
			saves.call("delete_save")
		if state != null:
			state.call("new_game")
		_reload_for_new_run()
	elif event.is_action_pressed("debug_complete_level"):
		get_viewport().set_input_as_handled()
		if state != null and state.call("complete_level"):
			_reload_for_new_run()
	elif event.is_action_pressed("debug_leave_level"):
		get_viewport().set_input_as_handled()
		if state != null and state.call("leave_level"):
			_reload_for_new_run()
	elif event.is_action_pressed("debug_quit_game"):
		get_viewport().set_input_as_handled()
		# Wie das X am Fenster: Der SaveManager speichert und beendet.
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()


# Neuer Lauf in der Kammer: neu laden, ohne zu speichern - GameState hat schon gespeichert.
func _reload_for_new_run() -> void:
	if _restarting:
		return
	_restarting = true
	get_tree().reload_current_scene()


func _on_save_state_changed() -> void:
	_report_save_state()


# Debug-Zeile "Spielstand": Lauf, Rückkehrpunkt, letzte Speicherung (M16).
func _report_save_state() -> void:
	var state := get_node_or_null("/root/GameState")
	if state == null:
		EventBus.debug_value_changed.emit("Spielstand", "aus")
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
		text += " · Startpunkt"
	else:
		text += " · Anker " + anchor
	var saves := get_node_or_null("/root/SaveManager")
	if saves == null:
		text += " · ohne Datei"
	else:
		var saved_at := String(saves.get("last_saved_at"))
		if saved_at.is_empty():
			text += " · nicht gespeichert"
		else:
			text += " · %s %s" % [saved_at.get_slice(" ", 1), String(saves.get("last_reason"))]
	EventBus.debug_value_changed.emit("Spielstand", text)


# Zoom 1 bis 4 durchschalten (M13) - nur zum Ausprobieren, gespeichert wird nichts.
func _cycle_zoom() -> void:
	if view == null:
		return
	view.world_scale = view.world_scale % ViewSettings.MAX_SCALE + 1
	_report_zoom()


func _report_zoom() -> void:
	if view == null:
		return
	var tiles := view.visible_size(get_viewport_rect().size) / ViewSettings.TILE_SIZE
	var text := "%d - %.1f x %.1f Kacheln (F3)" % [view.world_scale, tiles.x, tiles.y]
	EventBus.debug_value_changed.emit("Zoom", text)
