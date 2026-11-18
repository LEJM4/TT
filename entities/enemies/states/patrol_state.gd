extends EnemyState
## Patrol - Patrouille (M13): Er geht zwischen seinem Startpunkt und dem Ende
## der Strecke patrol_tiles hin und her und wartet an jedem Ende patrol_wait Sekunden.
## Ohne Strecke steht er und wacht. Bemerkt er eine Figur, folgt "Alert".

var _forward := true
var _wait_left := 0.0


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.set_aware(false)
	enemy.target = null
	_wait_left = 0.0
	# Weiter zum ferneren Ende, damit er nicht auf der Stelle kehrtmacht.
	var to_home := enemy.global_position.distance_to(enemy.home)
	var to_end := enemy.global_position.distance_to(enemy.patrol_end())
	_forward = to_home <= to_end


func physics_update(delta: float) -> void:
	var found := enemy.look_for_target()
	if found != null:
		enemy.target = found
		machine.transition_to(&"Alert")
		return
	if enemy.patrol_tiles == Vector2.ZERO:
		enemy.stop()
		return
	if _wait_left > 0.0:
		_wait_left -= delta
		enemy.stop()
		return
	var point := enemy.home
	if _forward:
		point = enemy.patrol_end()
	if enemy.move_to(point, enemy.stats.patrol_speed):
		_forward = not _forward
		_wait_left = enemy.stats.patrol_wait
