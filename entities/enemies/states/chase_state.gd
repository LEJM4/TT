extends EnemyState
## Chase - Verfolgen (M13): Er läuft zur Figur, solange er sie bemerkt, sonst
## dorthin, wo er sie zuletzt bemerkt hat. Ist eine andere Figur näher, nimmt er
## die. In Schlagweite folgt "Attack". Verliert er sie länger als lose_time,
## folgt "Search" - wird sie unsichtbar, sofort.

var _lost_time := 0.0


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.set_aware(true)
	_lost_time = 0.0


func physics_update(delta: float) -> void:
	var nearest := enemy.look_for_target(true)
	if nearest != null:
		enemy.target = nearest
	if not enemy.is_valid_target(enemy.target):
		# Unsichtbar, tot oder weg: Er verliert sie sofort.
		machine.transition_to(&"Search")
		return
	var chased: Node2D = enemy.target
	if enemy.can_track(chased):
		enemy.last_known_position = chased.global_position
		_lost_time = 0.0
		if enemy.global_position.distance_to(chased.global_position) <= enemy.attack_distance():
			machine.transition_to(&"Attack")
			return
	else:
		_lost_time += delta
		if _lost_time >= enemy.stats.lose_time:
			machine.transition_to(&"Search")
			return
	enemy.move_to(enemy.last_known_position, enemy.stats.chase_speed)
