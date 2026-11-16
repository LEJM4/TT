class_name Stunnable
extends Node2D
## Stunnable - macht seinen Elternknoten betäubbar (M7).
##
## Benutzung: die Szene stunnable.tscn als Kind an ein Ziel hängen: einen
## Gegner, eine Maschine, eine Falle. Der Knoten steht in der Gruppe
## "stunnable"; die Fähigkeit Stun findet ihn dort und ruft apply_stun() auf.
## Solange die Betäubung anhält, ruht der Knoten aus paused_node, und um das
## Ziel liegt ein Ring. Wer mehr braucht, fragt is_stunned() ab oder hört auf
## die Signale.
##
## Abschalten: Knoten löschen - das Ziel lässt sich nicht mehr betäuben.

## Gruppe, in der alle betäubbaren Ziele stehen.
const GROUP := "stunnable"

## Die Betäubung hat begonnen.
signal stunned(seconds: float)
## Die Betäubung ist vorbei.
signal recovered

## Dieser Knoten ruht, solange die Betäubung anhält. Leer: keiner.
@export var paused_node: NodePath
## Radius des Rings um das Ziel, in Pixeln.
@export var ring_radius := 10.0
## Farbe des Rings.
@export var ring_color := Color(1.0, 0.9, 0.3)

var _time_left := 0.0
var _paused: Node
var _mode_before := Node.PROCESS_MODE_INHERIT


func _ready() -> void:
	add_to_group(GROUP)
	if not paused_node.is_empty():
		_paused = get_node_or_null(paused_node)


func _physics_process(delta: float) -> void:
	if _time_left <= 0.0:
		return
	_time_left -= delta
	if _time_left <= 0.0:
		_recover()


## Ist das Ziel gerade betäubt?
func is_stunned() -> bool:
	return _time_left > 0.0


## Betäubt das Ziel für die Dauer. Eine längere laufende Betäubung bleibt bestehen.
func apply_stun(seconds: float) -> void:
	if seconds <= 0.0:
		return
	var was_stunned := is_stunned()
	_time_left = maxf(_time_left, seconds)
	if was_stunned:
		return
	if is_instance_valid(_paused):
		_mode_before = _paused.process_mode
		_paused.process_mode = Node.PROCESS_MODE_DISABLED
	queue_redraw()
	stunned.emit(seconds)


func _recover() -> void:
	_time_left = 0.0
	if is_instance_valid(_paused):
		_paused.process_mode = _mode_before
	queue_redraw()
	recovered.emit()


func _draw() -> void:
	if not is_stunned():
		return
	draw_arc(Vector2.ZERO, ring_radius, 0.0, TAU, 24, ring_color, 1.0)
