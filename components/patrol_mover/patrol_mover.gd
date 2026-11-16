extends Node
## PatrolMover - bewegt seinen Elternknoten auf einer Strecke hin und her.
##
## Benutzung: die Szene patrol_mover.tscn als Kind an einen 2D-Knoten hängen
## und im Inspektor Strecke und Tempo wählen. Der Elternknoten pendelt
## zwischen seinem Startpunkt und Startpunkt + travel.
## Gedacht für Dinge, die nichts wegschieben müssen, etwa ein bewegliches Ziel.
##
## Abschalten: Knoten löschen - der Elternknoten bleibt stehen.

## Strecke vom Startpunkt bis zum Wendepunkt, in Pixeln.
@export var travel := Vector2(0.0, 96.0)
## Tempo in Pixeln pro Sekunde.
@export var speed := 40.0

var _start := Vector2.ZERO
var _progress := 0.0
var _forward := true
var _body: Node2D


func _ready() -> void:
	_body = get_parent() as Node2D
	if _body != null:
		_start = _body.position


func _physics_process(delta: float) -> void:
	var length := travel.length()
	if _body == null or length <= 0.0:
		return
	var step := speed * delta / length
	if _forward:
		_progress += step
		if _progress >= 1.0:
			_progress = 1.0
			_forward = false
	else:
		_progress -= step
		if _progress <= 0.0:
			_progress = 0.0
			_forward = true
	_body.position = _start + travel * _progress
