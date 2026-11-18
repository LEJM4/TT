extends EnemyState
## Search - Suchen (M13): Er geht zur letzten bekannten Stelle - über ihm das "?"
## (Signal search_started) - und schaut sich dort um: alle look_interval
## Sekunden dreht er sich um 90°. Bemerkt er eine Figur, folgt "Alert"; nach
## search_time Sekunden Umschauen folgt "Return". Er gilt dabei als ahnungslos:
## Treffer zählen wieder als Überraschung.

var _looking := false
var _time := 0.0
var _turns := 0


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.set_aware(false)
	enemy.target = null
	_looking = false
	_time = 0.0
	_turns = 0
	enemy.search_started.emit()


func physics_update(delta: float) -> void:
	var found := enemy.look_for_target()
	if found != null:
		enemy.target = found
		machine.transition_to(&"Alert")
		return
	_time += delta
	if not _looking:
		var arrived := enemy.move_to(enemy.last_known_position, enemy.stats.search_speed)
		if arrived or _time >= enemy.stats.search_walk_limit:
			_looking = true
			_time = 0.0
			enemy.stop()
		return
	enemy.stop()
	if _time >= enemy.stats.search_time:
		machine.transition_to(&"Return")
		return
	var turns := int(_time / maxf(enemy.stats.look_interval, 0.1))
	if turns != _turns:
		_turns = turns
		enemy.face(enemy.facing.rotated(PI * 0.5))
