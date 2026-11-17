class_name Projectile
extends Node2D
## Projectile - ein Geschoss, das geradeaus fliegt (M6; M11a: Durchschlag, Explosion, Bild).
##
## Erzeugt wird es nur vom ProjectileSpawner des Levels; der ruft direkt nach
## dem Einhängen launch() auf. Das Geschoss fliegt in gerader Linie. Es endet,
## wenn es so viele Ziele getroffen hat, wie seine Werte erlauben (pierce),
## wenn es an eine Wand oder einen Block stößt oder seine Reichweite verbraucht
## hat. Hat es einen Explosionsradius, explodiert es dann und bleibt kurz liegen,
## während das Kind "ExplosionHitbox" alles im Umkreis trifft.
## Schaden beim Aufprall teilt das Kind "Hitbox" aus; Wände und Blöcke bemerkt
## das Kind "WorldSensor". Ein Geschoss ohne Aufprall-Schaden bemerkt Ziele über
## das Kind "TargetSensor". Wie es aussieht, zeigt das Kind "ProjectileView".

## Das Geschoss fliegt los; shot sind die Werte des Wurfs (M11a).
signal launched(shot: RangedStats)
## Das Geschoss explodiert am Ort at (M11a).
signal detonated(at: Vector2)

## So lange trifft eine Explosion, in Sekunden; dann verschwindet das Geschoss.
const EXPLOSION_TIME := 0.1

## Die Werte des Wurfs, gesetzt von launch() (M11a).
var shot: RangedStats

var _direction := Vector2.RIGHT
var _speed := 0.0
var _distance_left := 0.0
var _hits_left := 1
var _is_finished := false
var _explosion_left := 0.0

@onready var _hitbox := get_node_or_null("Hitbox") as Hitbox
@onready var _world_sensor := get_node_or_null("WorldSensor") as Area2D
@onready var _target_sensor := get_node_or_null("TargetSensor") as Area2D
@onready var _explosion := get_node_or_null("ExplosionHitbox") as Hitbox
@onready var _explosion_shape := get_node_or_null("ExplosionHitbox/CollisionShape2D") as CollisionShape2D


## Startet das Geschoss: Richtung, Werte des Schusses und die Ebenen der Ziele.
func launch(direction: Vector2, stats: RangedStats, target_mask: int) -> void:
	shot = stats
	_direction = direction.normalized()
	_speed = stats.projectile_speed
	_distance_left = stats.max_distance
	_hits_left = maxi(stats.pierce, 1)
	rotation = _direction.angle()
	if _hitbox != null and stats.damage > 0.0:
		_hitbox.damage = stats.damage
		_hitbox.collision_mask = target_mask
		_hitbox.hit_landed.connect(_on_hit_landed)
		_hitbox.activate()
	if _world_sensor != null:
		_world_sensor.body_entered.connect(_on_body_entered)
	if _is_explosive():
		_prepare_explosion(target_mask)
		# Ohne Aufprall-Schaden merkt erst der TargetSensor, dass ein Ziel getroffen ist.
		if _target_sensor != null and stats.damage <= 0.0:
			_target_sensor.collision_mask = target_mask
			_target_sensor.area_entered.connect(_on_target_touched)
	launched.emit(stats)


func _physics_process(delta: float) -> void:
	if _is_finished:
		_explosion_left -= delta
		if _explosion_left <= 0.0:
			queue_free()
		return
	var step := _speed * delta
	position += _direction * step
	_distance_left -= step
	if _distance_left <= 0.0:
		_finish()


func _is_explosive() -> bool:
	return shot != null and shot.explosion_radius > 0.0


func _prepare_explosion(target_mask: int) -> void:
	if _explosion == null:
		return
	_explosion.damage = shot.explosion_damage
	_explosion.collision_mask = target_mask
	_explosion.hit_interval = 0.0
	if _explosion_shape != null:
		# Eigene Form je Geschoss: Die Form aus der Szene teilen sich alle.
		var circle := CircleShape2D.new()
		circle.radius = shot.explosion_radius
		_explosion_shape.shape = circle


# Das Geschoss hat sein Ziel, eine Wand oder das Ende seiner Reichweite erreicht.
func _finish() -> void:
	if _is_finished:
		return
	_is_finished = true
	if _hitbox != null:
		_hitbox.deactivate()
	if _target_sensor != null:
		_target_sensor.set_deferred("monitoring", false)
	if not _is_explosive():
		queue_free()
		return
	_speed = 0.0
	_explosion_left = EXPLOSION_TIME
	if _explosion != null:
		_explosion.activate()
	detonated.emit(global_position)


func _on_hit_landed(_hurtbox: Hurtbox) -> void:
	_hits_left -= 1
	if _hits_left <= 0:
		_finish()


func _on_body_entered(_body: Node2D) -> void:
	_finish()


func _on_target_touched(area: Area2D) -> void:
	if area is Hurtbox:
		_finish()
