extends Ability
## Stun - die Fähigkeit Stun: betäubt alles Betäubbare im Umkreis (M7).
##
## Beim Einsatz geht von der Figur ein Ring aus. Jeder Knoten der Gruppe
## "stunnable" (der Baustein Stunnable) innerhalb des Umkreises wird für die
## Dauer der Fähigkeit betäubt. Was eine Betäubung bewirkt, bestimmt das Ziel.

## Gruppe der Ziele, die sich betäuben lassen.
const TARGET_GROUP := "stunnable"

## So lange ist der Ring zu sehen, in Sekunden.
@export var pulse_time := 0.25
## Farbe des Rings.
@export var pulse_color := Color(1.0, 0.9, 0.3, 0.9)

var _pulse_left := 0.0

@onready var _pulse := get_node_or_null("Pulse") as Node2D


func _ready() -> void:
	super()
	if _pulse != null:
		_pulse.draw.connect(_on_pulse_draw)


func _process(delta: float) -> void:
	if _pulse_left <= 0.0:
		return
	_pulse_left -= delta
	if _pulse != null:
		_pulse.queue_redraw()


func _begin_effect() -> void:
	var user := get_user() as Node2D
	if user == null:
		return
	var radius := _radius()
	for node in get_tree().get_nodes_in_group(TARGET_GROUP):
		var target := node as Stunnable
		if target == null:
			continue
		if target.global_position.distance_to(user.global_position) <= radius:
			target.apply_stun(stats.duration)
	if _pulse != null:
		_pulse.global_position = user.global_position
		_pulse_left = pulse_time
		_pulse.queue_redraw()


func _radius() -> float:
	var own_stats := stats as StunStats
	if own_stats == null:
		return 64.0
	return own_stats.radius


func _on_pulse_draw() -> void:
	if _pulse_left <= 0.0:
		return
	var progress := 1.0 - _pulse_left / maxf(pulse_time, 0.01)
	_pulse.draw_arc(Vector2.ZERO, _radius() * progress, 0.0, TAU, 48, pulse_color, 1.0)
