extends EnemyState
## Return - Zurück (M13): Er geht zum Startpunkt der Patrouille, dann folgt
## "Patrol". Bemerkt er unterwegs eine Figur, folgt "Alert". Kommt er
## give_up_time Sekunden nicht voran, weil etwas im Weg steht, patrouilliert er
## von dort aus - Wege um Hindernisse herum kommen erst mit den Kacheln (A4).

var _best_distance := INF
var _stuck_time := 0.0


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.set_aware(false)
	enemy.target = null
	_best_distance = INF
	_stuck_time = 0.0


func physics_update(delta: float) -> void:
	var found := enemy.look_for_target()
	if found != null:
		enemy.target = found
		machine.transition_to(&"Alert")
		return
	if enemy.move_to(enemy.home, enemy.stats.patrol_speed):
		machine.transition_to(&"Patrol")
		return
	var distance := enemy.global_position.distance_to(enemy.home)
	if distance < _best_distance - 0.5:
		_best_distance = distance
		_stuck_time = 0.0
		return
	_stuck_time += delta
	if _stuck_time >= enemy.stats.give_up_time:
		enemy.home = enemy.global_position
		machine.transition_to(&"Patrol")
