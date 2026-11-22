class_name Room
extends Node2D
## Room - ein Raum eines Levels (M18).
##
## Ein Level besteht aus Räumen in seiner eigenen Szene, etwa die Halle und der
## Ostraum der Testkammer. Ein Raum ist eine Fläche: size Pixel ab seinem Ort,
## nach rechts und unten. Der RoomWatcher des Levels merkt, in welchem Raum die
## Mitte einer Spielfigur liegt, und die Kamera dieser Figur bleibt in seinen
## Grenzen; beim Wechsel gleitet sie hinüber.
## Auf Wunsch malt der Raum seinen Boden und ein Raster (draw_floor). Wände,
## Blöcke und Dinge eines Raums liegen am besten als seine Kinder: Sie stehen
## dann relativ zu seinem Ort, und sein Boden liegt unter ihnen. Dinge, die sich
## ihren Zustand merken (Persistent), behalten ihn über ihren Pfad im Level.
## Steht in der Gruppe "rooms".
##
## Abschalten: Knoten löschen - die Fläche gehört dann zu keinem Raum; die Kamera
## nimmt dort die Grenzen des Raums, in dem die Figur zuletzt war.

## Kennung des Raums, etwa "east". Leer: der Name des Knotens.
@export var room_id := ""
## Name im Spiel, etwa "Ostraum" - für die Debug-Zeile "S1 Raum". Leer: die Kennung.
@export var title := ""
## Größe des Raums in Pixeln, ab seinem Ort nach rechts und unten.
@export var size := Vector2i(320, 192)

@export_group("Boden")
## Malt der Raum seinen Boden? Aus, wenn das Level den Boden schon malt.
@export var draw_floor := false
## Raster auf dem Boden einblenden?
@export var show_grid := true
## Kantenlänge einer Rasterzelle in Pixeln.
@export var cell_size := 16
## Farbe des Bodens.
@export var floor_color := Color(0.13, 0.15, 0.2)
## Farbe der Rasterlinien.
@export var grid_color := Color(1.0, 1.0, 1.0, 0.06)


func _enter_tree() -> void:
	add_to_group("rooms")


func _ready() -> void:
	if room_id.is_empty():
		room_id = String(name)
	queue_redraw()


## Fläche des Raums in der Welt.
func get_bounds() -> Rect2:
	return Rect2(global_position, Vector2(size))


## Liegt dieser Punkt der Welt im Raum?
func contains(point: Vector2) -> bool:
	return get_bounds().has_point(point)


## Name für Anzeigen: title, sonst die Kennung.
func get_display_name() -> String:
	return title if not title.is_empty() else room_id


## Die Fläche, die alle Räume im Baum zusammen mit base bedecken - für die
## Grenzen eines Levels, das ohne RoomWatcher läuft.
static func merge_bounds(tree: SceneTree, base: Rect2) -> Rect2:
	var result := base
	for node in tree.get_nodes_in_group("rooms"):
		var room := node as Room
		if room != null:
			result = result.merge(room.get_bounds())
	return result


func _draw() -> void:
	if not draw_floor:
		return
	draw_rect(Rect2(Vector2.ZERO, Vector2(size)), floor_color)
	if show_grid and cell_size > 0:
		for x in range(0, size.x, cell_size):
			draw_rect(Rect2(x, 0, 1, size.y), grid_color)
		for y in range(0, size.y, cell_size):
			draw_rect(Rect2(0, y, size.x, 1), grid_color)
