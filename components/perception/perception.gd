class_name Perception
extends Node2D
## Perception - Sehen und Hören als Baustein (M13).
##
## Benutzung: die Szene perception.tscn als Kind an eine Figur hängen und im
## Inspektor eine Werte-Datei (PerceptionStats) wählen. Die Figur fragt mit
## find_target(blickrichtung), welchen Spieler sie gerade bemerkt - immer den
## nächsten aus der Gruppe "players", nie nur "den einen". Der Baustein
## entscheidet nichts; er sagt nur, wen die Figur sieht oder hört.
##
## Sehen: im Kegel in Blickrichtung, nicht durch Wände (occluder_mask). Kennt
## die Figur ihr Ziel schon (aware), sieht sie es rundum und weiter.
## Hören: im Umkreis, wenn sich eine Figur bewegt und nicht schleicht.
## Schleichen: kürzere Sicht, nicht zu hören. Unsichtbar (Gruppe "invisible")
## oder tot: gar nicht zu bemerken.
## Abstände in Kacheln (PerceptionStats). Fair (ViewSettings): Bemerkt wird nur,
## wer ihn auf dem eigenen Bild hat - mit Abstand zum Rand. Der Bereich wächst und
## schrumpft mit dem Zoom; nah dran bleibt alles, wie es ist.
## Mit debug_draw zeigt er Sichtkegel, Hörkreis und diesen Bereich als Rahmen;
## F1 blendet sie aus und ein.
##
## Abschalten: Knoten löschen - die Figur bemerkt niemanden mehr.

## Gruppe der Spielfiguren.
const PLAYER_GROUP := "players"
## Gruppe der Figuren, die gerade unsichtbar sind (Fähigkeit Unsichtbarkeit).
const INVISIBLE_GROUP := "invisible"
## Aktion, die auch die Debug-Anzeige ein- und ausblendet.
const DEBUG_ACTION := "debug_toggle_overlay"

## Werte-Datei mit Sichtweite, Kegel, Hörweite und Schleichen.
@export var stats: PerceptionStats
## Ansicht mit dem Zoom der Welt - aus ihr folgt die faire Grenze (M13).
@export var view: ViewSettings
## Sichtkegel und Hörkreis zeigen - zum Testen in der Testkammer.
@export var debug_draw := false
## Farbe des Kegels, solange die Figur niemanden bemerkt hat.
@export var debug_color := Color(1.0, 1.0, 1.0, 0.07)
## Farbe des Kegels, sobald die Figur jemanden bemerkt hat.
@export var debug_aware_color := Color(1.0, 0.25, 0.25, 0.1)

var _show_debug := false
var _body: Node2D


func _ready() -> void:
	if stats == null:
		push_warning("Perception: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = PerceptionStats.new()
	if view == null:
		push_warning("Perception: keine Ansicht gesetzt, nutze Standardwerte.")
		view = ViewSettings.new()
	_body = get_parent() as Node2D
	_show_debug = debug_draw


func _physics_process(_delta: float) -> void:
	if _show_debug:
		queue_redraw()


func _input(event: InputEvent) -> void:
	if debug_draw and event.is_action_pressed(DEBUG_ACTION):
		_show_debug = not _show_debug
		queue_redraw()


## Der nächste Spieler, den die Figur gerade bemerkt; null: keiner.
## aware: Sie kennt ihr Ziel schon - dann sieht sie rundum und bis track_tiles.
func find_target(facing: Vector2, aware := false) -> Node2D:
	var best: Node2D = null
	var best_distance := INF
	for node in get_tree().get_nodes_in_group(PLAYER_GROUP):
		var player := node as Node2D
		if player == null or not can_perceive(player, facing, aware):
			continue
		var distance := global_position.distance_to(player.global_position)
		if distance < best_distance:
			best = player
			best_distance = distance
	return best


## Bemerkt die Figur dieses Ziel gerade?
func can_perceive(target: Node2D, facing: Vector2, aware := false) -> bool:
	if not is_instance_valid(target) or not target.is_inside_tree():
		return false
	if target.get("is_dead") == true or target.is_in_group(INVISIBLE_GROUP):
		return false
	var to := target.global_position - global_position
	if not is_in_fair_view(to):
		return false
	var distance := to.length()
	var sneaking := _is_sneaking(target)
	if not sneaking and distance <= ViewSettings.tiles(stats.hearing_tiles) and _is_moving(target):
		return true
	var reach := ViewSettings.tiles(stats.sight_tiles)
	if aware:
		reach = ViewSettings.tiles(stats.track_tiles)
	if sneaking:
		reach *= stats.sneak_factor
	if distance > reach:
		return false
	if not aware and distance > 0.5 and facing != Vector2.ZERO:
		if absf(facing.angle_to(to)) > deg_to_rad(stats.sight_angle * 0.5):
			return false
	return has_line_of_sight(target.global_position)


## Steht er auf dem Bild einer Figur, die um offset von ihm entfernt ist - mit
## Abstand zum Rand? Nur dann darf er sie bemerken (M13).
func is_in_fair_view(offset: Vector2) -> bool:
	var half := fair_half_extent()
	return absf(offset.x) <= half.x and absf(offset.y) <= half.y


## Halbe Breite und Höhe des fairen Bereichs in Pixeln - hängt vom Zoom ab (M13).
func fair_half_extent() -> Vector2:
	return view.fair_half_extent(get_viewport_rect().size)


## Ist der Weg von hier bis zum Punkt frei von Wänden und Blöcken?
func has_line_of_sight(point: Vector2) -> bool:
	var space := get_world_2d().direct_space_state
	var query := PhysicsRayQueryParameters2D.create(global_position, point, stats.occluder_mask)
	return space.intersect_ray(query).is_empty()


func _is_sneaking(target: Node) -> bool:
	return target.has_method("is_sneaking") and target.call("is_sneaking") == true


func _is_moving(target: Node) -> bool:
	var body := target as CharacterBody2D
	if body == null:
		return false
	return body.velocity.length() > stats.silent_speed


func _draw() -> void:
	if not _show_debug or _body == null:
		return
	var facing := Vector2.DOWN
	var body_facing: Variant = _body.get("facing")
	if body_facing is Vector2 and body_facing != Vector2.ZERO:
		facing = (body_facing as Vector2).normalized()
	var color := debug_color
	if _body.get("is_aware") == true:
		color = debug_aware_color
	var half_angle := deg_to_rad(stats.sight_angle * 0.5)
	var reach := ViewSettings.tiles(stats.sight_tiles)
	var steps := 16
	var points := PackedVector2Array([Vector2.ZERO])
	for index in steps + 1:
		var angle := facing.angle() - half_angle + 2.0 * half_angle * index / steps
		points.append(Vector2.from_angle(angle) * reach)
	# Der Kegel zählt nur, soweit er im fairen Bereich liegt (M13).
	var fair := fair_half_extent()
	var box := PackedVector2Array([
		Vector2(-fair.x, -fair.y), Vector2(fair.x, -fair.y),
		Vector2(fair.x, fair.y), Vector2(-fair.x, fair.y),
	])
	for part in Geometry2D.intersect_polygons(points, box):
		draw_colored_polygon(part, color)
	var line := Color(color, minf(color.a * 3.0, 1.0))
	draw_arc(Vector2.ZERO, ViewSettings.tiles(stats.hearing_tiles), 0.0, TAU, 32, line, 1.0)
	draw_rect(Rect2(-fair, fair * 2.0), line, false, 1.0)
