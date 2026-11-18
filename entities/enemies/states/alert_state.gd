extends EnemyState
## Alert - Entdecken (M13): Er bleibt alert_time Sekunden stehen und schaut zur
## Figur; über ihm erscheint das "!" (Signal alerted). Danach folgt "Chase".

var _time_left := 0.0


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.set_aware(true)
	enemy.stop()
	_time_left = enemy.stats.alert_time
	if enemy.is_valid_target(enemy.target):
		var seen: Node2D = enemy.target
		enemy.face_point(seen.global_position)
		enemy.last_known_position = seen.global_position
	enemy.alerted.emit()


func physics_update(delta: float) -> void:
	enemy.stop()
	_time_left -= delta
	if _time_left <= 0.0:
		machine.transition_to(&"Chase")
