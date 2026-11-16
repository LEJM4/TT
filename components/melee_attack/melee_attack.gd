class_name MeleeAttack
extends Node2D
## MeleeAttack - Nahkampf-Angriff als Baustein.
##
## Benutzung: die Szene melee_attack.tscn als Kind an eine Figur hängen, im
## Inspektor eine Werte-Datei (MeleeStats) und die Ebene der Ziele wählen.
## Die Figur ruft try_attack(richtung) auf. Der Knoten dreht sich in die
## Richtung und macht seine Hitbox für kurze Zeit scharf. Größe und Lage der
## Trefferzone kommen aus der Werte-Datei.
##
## Abschalten: Knoten löschen - die Figur kann dann nicht mehr zuschlagen.

## Ein Schlag hat begonnen.
signal attack_started(direction: Vector2)
## Der Schlag ist vorbei.
signal attack_finished

## Werte-Datei mit Schaden, Trefferzone und Zeiten.
@export var stats: MeleeStats
## Ebenen, deren Hurtboxen getroffen werden.
@export_flags_2d_physics var target_mask := 0
## Farbe der Trefferzone, solange sie scharf ist.
@export var swing_color := Color(1.0, 0.95, 0.6, 0.8)

## Läuft gerade ein Schlag?
var is_attacking := false

var _active_left := 0.0
var _cooldown_left := 0.0

@onready var _hitbox := get_node_or_null("Hitbox") as Hitbox
@onready var _shape_node := get_node_or_null("Hitbox/CollisionShape2D") as CollisionShape2D


func _ready() -> void:
	if stats == null:
		push_warning("MeleeAttack: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = MeleeStats.new()
	if _hitbox != null:
		_hitbox.damage = stats.damage
		_hitbox.collision_mask = target_mask
	if _shape_node != null:
		var zone := RectangleShape2D.new()
		zone.size = Vector2(stats.reach, stats.width)
		_shape_node.shape = zone
		_shape_node.position = Vector2(stats.start_distance + stats.reach * 0.5, 0.0)


func _physics_process(delta: float) -> void:
	if _cooldown_left > 0.0:
		_cooldown_left -= delta
	if not is_attacking:
		return
	_active_left -= delta
	if _active_left <= 0.0:
		_finish()


## Ist gerade ein neuer Schlag möglich?
func can_attack() -> bool:
	return not is_attacking and _cooldown_left <= 0.0


## Schlägt in die Richtung, wenn es gerade möglich ist. Liefert, ob der Schlag begann.
func try_attack(direction: Vector2) -> bool:
	if not can_attack() or direction == Vector2.ZERO:
		return false
	rotation = direction.angle()
	is_attacking = true
	_active_left = stats.active_time
	_cooldown_left = stats.cooldown
	if _hitbox != null:
		_hitbox.activate()
	queue_redraw()
	attack_started.emit(direction)
	return true


func _finish() -> void:
	is_attacking = false
	if _hitbox != null:
		_hitbox.deactivate()
	queue_redraw()
	attack_finished.emit()


func _draw() -> void:
	if not is_attacking:
		return
	var zone := Rect2(stats.start_distance, -stats.width * 0.5, stats.reach, stats.width)
	draw_rect(zone, swing_color)
