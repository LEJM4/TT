extends Camera2D
## PlayerCamera - folgt der Spielfigur des eigenen Spielers (M3).
##
## Die Kamera steht immer auf dem Pixelraster des Bildes: Bildmitte = Ort der
## Figur + Versatz, beide auf das Raster gerundet. So zittert die Figur nicht
## gegen den Hintergrund. Der Versatz ist die Vorausschau - ein Stück Richtung
## Mauszeiger und ein Stück in Laufrichtung - und gleitet weich zu seinem Ziel.
## Die Raumgrenzen meldet das Level über EventBus.camera_bounds_changed.
## Den Zoom nimmt sie aus der Ansicht data/world/view.tres (M13). Er vergrößert
## nur das Bild; die Welt rechnet weiter in Pixeln der Grafik. Bei Zoom 2 liegt
## das Raster auf halben Pixeln der Grafik. Ändert sich der Zoom im Spiel - F3 in
## der Testkammer -, folgt sie sofort.
## Alle übrigen Zahlen stehen in der Werte-Datei data/player/camera.tres.
##
## Abschalten: Knoten aus dem Level löschen - das Bild steht dann still.

## Werte-Datei mit Vorausschau und Weichheit.
@export var stats: CameraStats
## Ansicht mit dem Zoom der Welt (M13); dieselbe Datei lesen die Gegner.
@export var view: ViewSettings
## Nummer des Spielers, dem die Kamera folgt.
@export var follow_player_id := 1

var _target: Node2D
var _look_offset := Vector2.ZERO
var _bounds := Rect2()
var _has_bounds := false


func _ready() -> void:
	if stats == null:
		push_warning("PlayerCamera: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = CameraStats.new()
	if view == null:
		push_warning("PlayerCamera: keine Ansicht gesetzt, nutze Standardwerte.")
		view = ViewSettings.new()
	_apply_zoom()
	EventBus.camera_bounds_changed.connect(_on_camera_bounds_changed)


func _physics_process(delta: float) -> void:
	_apply_zoom()
	if not is_instance_valid(_target):
		_target = _find_target()
		if _target == null:
			return
		_look_offset = Vector2.ZERO
	var wanted := _wanted_offset()
	var gap := _look_offset.distance_to(wanted)
	var speed := maxf(stats.min_speed, gap / maxf(stats.smooth_time, 0.001))
	_look_offset = _look_offset.move_toward(wanted, speed * delta)
	var center := _snap(_target.global_position) + _snap(_look_offset)
	global_position = _snap(_clamp_to_bounds(center))
	var place := "%d, %d" % [roundi(global_position.x), roundi(global_position.y)]
	EventBus.debug_value_changed.emit("Kamera", place)


func _find_target() -> Node2D:
	for node in get_tree().get_nodes_in_group("players"):
		var candidate := node as Node2D
		if candidate != null and candidate.get("player_id") == follow_player_id:
			return candidate
	return null


# Zoom aus der Ansicht (M13); nur ganze Zahlen, damit die Pixel scharf bleiben.
func _apply_zoom() -> void:
	var factor := float(maxi(view.world_scale, 1))
	if zoom.x != factor or zoom.y != factor:
		zoom = Vector2(factor, factor)


# Rundet auf das Pixelraster des Bildes - bei Zoom 2 auf halbe Pixel der Grafik (M13).
func _snap(point: Vector2) -> Vector2:
	return (point * zoom).round() / zoom


func _wanted_offset() -> Vector2:
	# Weg von der Bildmitte zur Maus in Pixeln der Welt: bei Zoom 2 halb so lang wie auf dem Bild.
	var from_center := (get_viewport().get_mouse_position() - get_viewport_rect().size * 0.5) / zoom
	var wanted := (from_center * stats.mouse_look_factor).limit_length(stats.mouse_look_max)
	var body := _target as CharacterBody2D
	if body != null:
		wanted += (body.velocity * stats.move_look_seconds).limit_length(stats.move_look_max)
	return wanted


func _clamp_to_bounds(center: Vector2) -> Vector2:
	if not _has_bounds:
		return center
	var half := get_viewport_rect().size * 0.5 / zoom
	var result := center
	if _bounds.size.x <= half.x * 2.0:
		result.x = _bounds.position.x + _bounds.size.x * 0.5
	else:
		result.x = clampf(center.x, _bounds.position.x + half.x, _bounds.end.x - half.x)
	if _bounds.size.y <= half.y * 2.0:
		result.y = _bounds.position.y + _bounds.size.y * 0.5
	else:
		result.y = clampf(center.y, _bounds.position.y + half.y, _bounds.end.y - half.y)
	return result


func _on_camera_bounds_changed(bounds: Rect2) -> void:
	_bounds = bounds
	_has_bounds = true
