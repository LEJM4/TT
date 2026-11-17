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
##   PlayerSpawner   erzeugt die Spielfiguren (M2)
##   ProjectileSpawner  erzeugt alle Geschosse (M6)
##   PlayerCamera    folgt der Spielfigur (M3); die Grenzen meldet dieses Skript
##   Crosshair       Fadenkreuz am Mauszeiger (M4)
##   DebugOverlay    Entwickler-Anzeige
## Alles außer Walls, Blocks und SpawnPoints lässt sich einzeln löschen,
## die Kammer läuft weiter.
##
## Blöcke ändern: im 2D-Editor eine CollisionShape2D unter Walls oder Blocks
## verschieben oder an den Griffen ziehen - die Farbe folgt der Form.
## Neustart des Raums: Aktion "debug_restart_room" (F2) oder der Tod einer Figur.

@export_group("Raum")
## Größe des Raums in Pixeln.
@export var room_size := Vector2i(480, 270)
## Kantenlänge einer Rasterzelle in Pixeln.
@export var cell_size := 16
## Raster einblenden?
@export var show_grid := true
## Sekunden vom Tod einer Figur bis zum Neustart des Raums.
@export var death_restart_delay := 1.0

@export_group("Farben")
## Farbe des Bodens.
@export var floor_color := Color(0.13, 0.15, 0.2)
## Farbe der Rasterlinien.
@export var grid_color := Color(1.0, 1.0, 1.0, 0.06)
## Farbe der Kreuze an den Startpunkten.
@export var spawn_color := Color(0.95, 0.76, 0.3)

var _room_time := 0.0


func _ready() -> void:
	EventBus.camera_bounds_changed.emit(Rect2(global_position, Vector2(room_size)))
	EventBus.player_died.connect(_on_player_died)


func _process(delta: float) -> void:
	_room_time += delta
	EventBus.debug_value_changed.emit("Raumzeit", "%.1f s" % _room_time)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_restart_room"):
		_restart_room()


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
	# Vorläufige Regel aus M4: Der Raum startet neu. Die endgültige folgt mit M16.
	get_tree().create_timer(death_restart_delay).timeout.connect(_restart_room)


func _restart_room() -> void:
	# Ab M18 läuft der Szenenwechsel über den SceneManager.
	get_tree().reload_current_scene()
