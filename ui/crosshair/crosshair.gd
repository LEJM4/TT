extends CanvasLayer
## Crosshair - Fadenkreuz am Mauszeiger (M4).
##
## Liegt auf einer eigenen Bildebene über allem, auch über der Debug-Anzeige.
## Gemalt wird auf dem Kind "Mark"; es sitzt immer auf dem Pixel unter der Maus.
## Solange es das Fadenkreuz gibt, ist der Mauszeiger im Spielfenster versteckt.
## Es läuft auch bei pausiertem Spiel weiter.
##
## Abschalten: den Knoten "Crosshair" aus dem Level löschen - dann zeigt das
## Spiel wieder den normalen Mauszeiger.

## Farbe des Fadenkreuzes.
@export var color := Color(1.0, 1.0, 1.0)
## Länge eines Arms in Pixeln.
@export var arm_length := 4
## Abstand der Arme von der Mitte in Pixeln.
@export var gap := 2
## Den Mauszeiger des Systems im Spielfenster verstecken?
@export var hide_system_cursor := true

@onready var _mark := get_node_or_null("Mark") as Node2D


func _ready() -> void:
	if hide_system_cursor:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	if _mark != null:
		_mark.draw.connect(_on_mark_draw)
		_mark.queue_redraw()


func _exit_tree() -> void:
	if hide_system_cursor:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _process(_delta: float) -> void:
	if _mark != null:
		_mark.position = get_viewport().get_mouse_position().floor()


func _on_mark_draw() -> void:
	# Vier Arme um das Pixel unter der Maus; das Pixel selbst bleibt frei.
	_mark.draw_rect(Rect2(-gap - arm_length, 0, arm_length, 1), color)
	_mark.draw_rect(Rect2(gap + 1, 0, arm_length, 1), color)
	_mark.draw_rect(Rect2(0, -gap - arm_length, 1, arm_length), color)
	_mark.draw_rect(Rect2(0, gap + 1, 1, arm_length), color)
