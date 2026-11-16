class_name Projectile
extends Node2D
## Projectile - ein Geschoss, das geradeaus fliegt (M6).
##
## Erzeugt wird es nur vom ProjectileSpawner des Levels; der ruft direkt nach
## dem Einhängen launch() auf. Das Geschoss fliegt in gerader Linie und endet,
## sobald es ein Ziel trifft, an eine Wand oder einen Block stößt oder seine
## Reichweite verbraucht hat. Schaden teilt das Kind "Hitbox" aus; Wände und
## Blöcke bemerkt das Kind "WorldSensor".

var _direction := Vector2.RIGHT
var _speed := 0.0
var _distance_left := 0.0

@onready var _hitbox := get_node_or_null("Hitbox") as Hitbox
@onready var _world_sensor := get_node_or_null("WorldSensor") as Area2D


## Startet das Geschoss: Richtung, Werte des Schusses und die Ebenen der Ziele.
func launch(direction: Vector2, stats: RangedStats, target_mask: int) -> void:
	_direction = direction.normalized()
	_speed = stats.projectile_speed
	_distance_left = stats.max_distance
	rotation = _direction.angle()
	if _hitbox != null:
		_hitbox.damage = stats.damage
		_hitbox.collision_mask = target_mask
		_hitbox.hit_landed.connect(_on_hit_landed)
		_hitbox.activate()
	if _world_sensor != null:
		_world_sensor.body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	var step := _speed * delta
	position += _direction * step
	_distance_left -= step
	if _distance_left <= 0.0:
		queue_free()


func _on_hit_landed(_hurtbox: Hurtbox) -> void:
	# Ein Geschoss trifft genau ein Ziel.
	if _hitbox != null:
		_hitbox.deactivate()
	queue_free()


func _on_body_entered(_body: Node2D) -> void:
	queue_free()
