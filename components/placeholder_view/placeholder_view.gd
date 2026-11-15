extends Node2D
## PlaceholderView - malt die Kollisionsformen seines Elternknotens als Farbflächen.
##
## Platzhalter, solange es noch keine echte Grafik gibt (bis Gate G2).
## Benutzung: die Szene placeholder_view.tscn als Kind an einen Körper hängen
## (StaticBody2D, CharacterBody2D, Area2D ...) und im Inspektor die Farbe wählen.
## Gemalt werden alle Rechtecke, Kreise und Kapseln, die als CollisionShape2D
## neben diesem Knoten liegen.
##
## Abschalten: Knoten löschen - die Kollision bleibt, nur das Bild fehlt.

## Farbe der gemalten Flächen.
@export var color := Color(0.55, 0.6, 0.7)


func _draw() -> void:
	var body := get_parent()
	if body == null:
		return
	var to_own_space := transform.affine_inverse()
	for child in body.get_children():
		var shape_node := child as CollisionShape2D
		if shape_node == null or shape_node.shape == null:
			continue
		draw_set_transform_matrix(to_own_space * shape_node.transform)
		_draw_shape(shape_node.shape)
	draw_set_transform_matrix(Transform2D.IDENTITY)


func _draw_shape(shape: Shape2D) -> void:
	if shape is RectangleShape2D:
		var rectangle := shape as RectangleShape2D
		draw_rect(Rect2(-rectangle.size * 0.5, rectangle.size), color)
	elif shape is CircleShape2D:
		var circle := shape as CircleShape2D
		draw_circle(Vector2.ZERO, circle.radius, color)
	elif shape is CapsuleShape2D:
		var capsule := shape as CapsuleShape2D
		var straight := maxf(capsule.height - 2.0 * capsule.radius, 0.0)
		draw_rect(Rect2(-capsule.radius, -straight * 0.5, 2.0 * capsule.radius, straight), color)
		draw_circle(Vector2(0.0, -straight * 0.5), capsule.radius, color)
		draw_circle(Vector2(0.0, straight * 0.5), capsule.radius, color)
