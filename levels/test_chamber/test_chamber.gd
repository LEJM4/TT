extends Node2D
## Testkammer - der Raum, in dem jede Mechanik zuerst ausprobiert wird (M1).
##
## Aufbau der Szene:
##   Rooms           die Räume der Kammer (M18): MainRoom, die Halle - ihren Boden malt
##                   dieses Skript -, und EastRoom, der Ostraum hinter dem Durchgang in
##                   der rechten Wand, mit eigenem Boden, eigenen Wänden, einem Topf und
##                   einer kleinen Truhe; die Kamera bleibt im Raum der Figur
##   Walls, Blocks   feste Körper auf der Ebene "world"; ihre Flächen malt PlaceholderView.
##                   Die rechte Wand hat seit M18 einen Durchgang zum Ostraum (y 256 bis 288)
##   TimeCapsule     die Zeitkapsel links vom Jäger (M18): Landepunkt - davor erscheint
##                   die Figur -, Rückreise, wenn alle Pflichtmissionen erfüllt sind,
##                   sonst Reise abbrechen; ersetzt die Startpunkte und die Nische aus M17
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
##   StartItems      Ausrüstung zum Aufsammeln unter dem Zeitanker (M11):
##                   Breitschwert, Bogen, Lederrüstung, Rubin-Anhänger
##   Caveman         Nahkämpfer (M13): ein Höhlenmensch patrouilliert rechts
##                   zwischen dem großen Block und dem rechten Pfeiler; sein
##                   Sichtkegel und Hörkreis sind eingeblendet (F1 blendet sie aus)
##   StoneThrower    Fernkämpferin (M14): eine Steinwerferin patrouilliert in der
##                   freien Fläche unten in der Mitte; sie hält Abstand und wirft
##                   Steine; Sichtkegel und Hörkreis wie beim Höhlenmenschen
##   Shaman          NPC mit Gespräch (M15): ein Schamane rechts vom Zeitanker;
##                   fragt, was dich herführt, gibt einmal 5 Pfeile
##   Hunter          NPC, der nur Auskunft gibt (M15): ein Jäger rechts neben der
##                   Zeitkapsel; warnt vor den Gegnern, ohne Antworten
##   TimeAnchor      Zeitanker rechts oberhalb der Zeitkapsel (M16): E rastet - Leben und
##                   Energie voll, hier erwacht die Figur wieder, das Spiel speichert
##   Gatherer        Auftraggeberin (M17): die Sammlerin neben dem Baum unten links;
##                   bittet um zwei Äste und gibt dafür 5 Kunai
##   MissionTracker  Missionen der Kammer aus data/missions/test_chamber.tres (M17):
##                   Höhlenmensch und grosse Truhe als Pflicht - dafür meldet die
##                   grosse Truhe ihr Öffnen mit einem MissionCue -, die Äste als
##                   Nebenmission; sind beide Pflichtmissionen erfüllt, ist die
##                   Zeitkapsel bereit (M18)
##   LootSpawner     legt alle Beute hin (M9)
##   PlayerSpawner   erzeugt die Spielfiguren (M2); ohne Zeitkapsel erscheinen sie an
##                   seinem Ort (240, 136)
##   ProjectileSpawner  erzeugt alle Geschosse (M6)
##   PlayerCamera    folgt der Spielfigur (M3); die Grenzen meldet dieses Skript, mit
##                   Räumen gelten die des Raums (M18); den Zoom liest sie aus
##                   data/world/view.tres (M13)
##   RoomWatcher     merkt, in welchem Raum die Figur ist (M18)
##   DebugKeys       Test-Tasten F2, F4, Bild auf, Bild ab, Ende und die Debug-Zeile
##                   "Spielstand" (M18; vorher in diesem Skript)
##   Crosshair       Fadenkreuz am Mauszeiger (M4)
##   DebugOverlay    Entwickler-Anzeige
##   InventoryWindow Inventarfenster auf Tab (M11)
##   Hud             Leben, Energie, Ausdauer, Fähigkeiten und Geschoss der Figur 1 (M12)
##   MissionPanel    Missionsliste links unter den Herzen, J klappt sie ein und aus,
##                   dazu die Hinweise oben in der Mitte (M17)
##   DialogWindow    Dialogfenster der Figur 1 (M15); steht als Letztes in der Szene,
##                   damit es Tasten vor dem Inventarfenster hört
## Alles außer Walls und Blocks lässt sich einzeln löschen, die Kammer läuft weiter.
## Neue Level bauen nicht auf dieser Kammer auf, sondern auf levels/level.gd mit
## dem LevelFrame (M18); die Kammer behält ihre einzelnen Knoten.
##
## Blöcke ändern: im 2D-Editor eine CollisionShape2D unter Walls oder Blocks
## verschieben oder an den Griffen ziehen - die Farbe folgt der Form.
## Tod einer Figur: nach death_restart_delay lädt der SceneManager die Kammer neu
## (M18), vorher wird gespeichert; der Fortschritt bleibt (M16), die Figur erwacht
## am Rückkehrpunkt - ohne ihn vor der Zeitkapsel -, Gegner stehen wieder, Beute am
## Boden ist weg. F2 macht dasselbe ohne Tod (DebugKeys).
## Zoom ausprobieren: Aktion "debug_cycle_zoom" (F3) schaltet 1 bis 4 durch (M13);
## Kamera und Gegner folgen sofort, die Datei view.tres bleibt, wie sie ist.
##
## Spielstand (M16): Beim Betreten meldet sich die Kammer bei GameState als Level
## level_id - ein laufender Lauf geht weiter, sonst beginnt einer. Abschluss und
## Abbruch gehen seit M18 über die Zeitkapsel und den SceneManager.

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
## Farbe der Kreuze an den Startpunkten - seit M18 vor der Zeitkapsel.
@export var spawn_color := Color(0.95, 0.76, 0.3)

var _room_time := 0.0
var _restarting := false


func _enter_tree() -> void:
	# Vor allen Kindern: Dinge der Welt und Spielfigur fragen in ihrem _ready() nach dem Stand (M16).
	var state := get_node_or_null("/root/GameState")
	if state != null:
		state.call("enter_level", level_id)


func _ready() -> void:
	# Die Grenzen umfassen alle Räume, auch den Ostraum (M18). Mit RoomWatcher
	# gelten für die Kamera die Grenzen des Raums, in dem die Figur ist.
	EventBus.camera_bounds_changed.emit(Room.merge_bounds(get_tree(), Rect2(global_position, Vector2(room_size))))
	EventBus.player_died.connect(_on_player_died)
	_report_zoom()


func _process(delta: float) -> void:
	_room_time += delta
	EventBus.debug_value_changed.emit("Raumzeit", "%.1f s" % _room_time)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_cycle_zoom"):
		_cycle_zoom()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, Vector2(room_size)), floor_color)
	if show_grid and cell_size > 0:
		for x in range(0, room_size.x, cell_size):
			draw_rect(Rect2(x, 0, 1, room_size.y), grid_color)
		for y in range(0, room_size.y, cell_size):
			draw_rect(Rect2(0, y, room_size.x, 1), grid_color)
	# Kreuze an den Startpunkten - seit M18 die der Zeitkapsel.
	for node in get_tree().get_nodes_in_group("player_spawn"):
		var marker := node as Node2D
		if marker == null:
			continue
		var center := to_local(marker.global_position)
		draw_rect(Rect2(center.x - 3.0, center.y, 7.0, 1.0), spawn_color)
		draw_rect(Rect2(center.x, center.y - 3.0, 1.0, 7.0), spawn_color)


func _on_player_died(_player_id: int) -> void:
	# Tod (M16): nach einer Sekunde neu laden - die Figur erwacht am Rückkehrpunkt,
	# der Fortschritt bleibt, auch was nach dem letzten Rasten kam.
	# Hält mit der Pause an (M20): Erst wenn das Pausenmenü zu ist, lädt die Kammer neu.
	get_tree().create_timer(death_restart_delay, false).timeout.connect(_restart_room.bind("Tod"))


# Neu laden (M18): über den SceneManager mit Überblendung; ohne ihn direkt wie bisher.
func _restart_room(reason := "Neustart") -> void:
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
