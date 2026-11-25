class_name MapView
extends Control
## MapView - zeichnet die Karte eines Levels (M20b).
##
## Erkundete Räume als Fläche mit Rand und Namen oben links, den Raum der eigenen
## Figur hell, die Spielfiguren als Pfeil in ihrer Blickrichtung - jede in ihrer
## Farbe - und die Zeitkapsel als kleines Bild. Alles bekommt sie von MapWindow
## über show_map(); sie entscheidet nichts und fragt niemanden. Die ganze Fläche,
## die MapWindow nennt - alle Räume, auch die unerkundeten -, passt verkleinert
## hinein: So springt nichts, wenn ein Raum dazukommt. Gezeichnet wird auf ganzen
## Pixeln; Farben und das Bild der Zeitkapsel stehen in den Werten (MapSettings).

## Die Spielfigur auf der Karte, ein Pfeil nach rechts: "#" Rand, "o" Farbe der Figur.
const MARKER: Array[String] = [
	"##.....",
	"#o##...",
	"#ooo##.",
	"#ooooo#",
	"#ooo##.",
	"#o##...",
	"##.....",
]

## Werte: Farben und das Bild der Zeitkapsel.
@export var settings: MapSettings

var _bounds := Rect2()
var _rooms: Array[Dictionary] = []
var _markers: Array[Dictionary] = []
var _capsules: Array[Vector2] = []


## Zeigt eine Karte.
##   bounds    die Fläche der Welt, die hineinpassen soll
##   rooms     je Raum {"title", "rect", "visited", "current"}; rect in der Welt
##   markers   je Figur {"player_id", "position", "facing"}
##   capsules  die Orte der Zeitkapseln - der Fuß, wie im Level
func show_map(bounds: Rect2, rooms: Array[Dictionary], markers: Array[Dictionary], capsules: Array[Vector2]) -> void:
	_bounds = bounds
	_rooms = rooms
	_markers = markers
	_capsules = capsules
	queue_redraw()


## Ein Punkt der Welt auf der Karte, in Pixeln dieses Bedienelements.
func to_map(point: Vector2) -> Vector2:
	var inner := _inner()
	var factor := _factor(inner)
	var used := (_bounds.size * factor).floor()
	var offset := inner.position + ((inner.size - used) * 0.5).floor()
	return (offset + (point - _bounds.position) * factor).floor()


## Wie viele Pixel der Karte ein Pixel der Welt ist, etwa 0,28.
func get_factor() -> float:
	return _factor(_inner())


func _draw() -> void:
	if settings == null or _bounds.size.x <= 0.0 or _bounds.size.y <= 0.0:
		return
	for room in _rooms:
		if room.get("visited") == true and room.get("current") != true:
			_draw_room(room, false)
	for room in _rooms:
		if room.get("current") == true:
			_draw_room(room, true)
	for place in _capsules:
		_draw_capsule(place)
	for marker in _markers:
		_draw_marker(marker)


func _draw_room(room: Dictionary, current: bool) -> void:
	var world: Rect2 = room.get("rect", Rect2())
	var top_left := to_map(world.position)
	var bottom_right := to_map(world.end)
	var rect := Rect2(top_left, bottom_right - top_left)
	if rect.size.x < 2.0 or rect.size.y < 2.0:
		return
	draw_rect(rect, settings.current_room_color if current else settings.room_color)
	_draw_frame(rect, settings.current_room_border_color if current else settings.room_border_color)
	_draw_label(rect, String(room.get("title", "")))


# Ein Rand aus ganzen Pixeln, innen an der Fläche.
func _draw_frame(rect: Rect2, color: Color) -> void:
	draw_rect(Rect2(rect.position, Vector2(rect.size.x, 1.0)), color)
	draw_rect(Rect2(rect.position.x, rect.end.y - 1.0, rect.size.x, 1.0), color)
	draw_rect(Rect2(rect.position, Vector2(1.0, rect.size.y)), color)
	draw_rect(Rect2(rect.end.x - 1.0, rect.position.y, 1.0, rect.size.y), color)


# Der Name oben links im Raum - dort ist er den Figuren selten im Weg; nur, wenn
# er hineinpasst.
func _draw_label(rect: Rect2, text: String) -> void:
	if text.is_empty():
		return
	var font := get_theme_default_font()
	var font_size := get_theme_default_font_size()
	if font == null:
		return
	var text_size := font.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size)
	var height := font.get_height(font_size)
	if text_size.x + 6.0 > rect.size.x or height + 2.0 > rect.size.y:
		return
	var origin := rect.position + Vector2(3.0, 1.0 + font.get_ascent(font_size))
	draw_string(font, origin.floor(), text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, settings.room_label_color)


# Das Bild der Zeitkapsel, ihr Fuß auf ihrem Ort.
func _draw_capsule(place: Vector2) -> void:
	var icon := settings.capsule_icon
	if icon == null:
		return
	var foot := to_map(place)
	var icon_size := icon.get_size()
	draw_texture(icon, (foot - Vector2(floorf(icon_size.x * 0.5), icon_size.y - 1.0)).floor())


# Eine Spielfigur: ein Pfeil aus MARKER in ihrer Blickrichtung - auf vier
# Richtungen gerundet, damit er auf ganzen Pixeln bleibt -, mit dunklem Rand.
func _draw_marker(marker: Dictionary) -> void:
	var center := to_map(marker.get("position", Vector2.ZERO))
	var facing: Vector2 = marker.get("facing", Vector2.DOWN)
	var fill := _player_color(int(marker.get("player_id", 1)))
	var half := int((MARKER.size() - 1) * 0.5)
	for y in MARKER.size():
		var row: String = MARKER[y]
		for x in row.length():
			var cell := row[x]
			if cell == ".":
				continue
			var offset := _turn(Vector2(x - half, y - half), facing)
			var color := fill if cell == "o" else settings.marker_outline_color
			draw_rect(Rect2(center + offset, Vector2.ONE), color)


# Dreht einen Punkt des Pfeils, der nach rechts zeigt, in die Blickrichtung.
func _turn(point: Vector2, facing: Vector2) -> Vector2:
	if absf(facing.x) >= absf(facing.y):
		return point if facing.x >= 0.0 else -point
	if facing.y > 0.0:
		return Vector2(-point.y, point.x)
	return Vector2(point.y, -point.x)


func _player_color(player_id: int) -> Color:
	var colors := settings.player_colors
	if colors.is_empty():
		return Color.WHITE
	return colors[wrapi(player_id - 1, 0, colors.size())]


func _inner() -> Rect2:
	var pad := float(settings.padding) if settings != null else 0.0
	return Rect2(Vector2(pad, pad), (size - Vector2(pad, pad) * 2.0).max(Vector2.ONE))


func _factor(inner: Rect2) -> float:
	if _bounds.size.x <= 0.0 or _bounds.size.y <= 0.0:
		return 1.0
	return minf(inner.size.x / _bounds.size.x, inner.size.y / _bounds.size.y)
