extends EnemyState
## Chase - Verfolgen und Abstand halten (M13; seit M14 nach seinen Angriffen).
##
## Er bemerkt die Figur: Ist einer seiner Angriffe bereit und trifft er sie von
## hier aus, folgt "Attack" mit diesem Angriff. Sonst richtet er sich nach
## seinem ersten Angriff (EnemyAttack unter "Attacks"):
##   Verfolgen      - zu weit weg oder ohne freie Sicht: Er geht auf sie zu.
##   Zurückweichen  - näher als dessen Mindestabstand: Er weicht zurück und blickt sie an.
##   Abwarten       - dazwischen: Er bleibt stehen und blickt sie an, bis der Angriff bereit ist.
## Der Anzeigename zeigt, was er gerade tut.
## Ist eine andere Figur näher, nimmt er die. Verliert er sie länger als
## lose_time, folgt "Search" - wird sie unsichtbar, sofort. Solange er sie nicht
## bemerkt, geht er zur Stelle, an der er sie zuletzt bemerkt hat.

enum Mode { APPROACH, HOLD, RETREAT }

## Anzeigenamen der Arten, in der Reihenfolge von Mode.
const MODE_NAMES: Array[String] = ["Verfolgen", "Abwarten", "Zurückweichen"]

var _lost_time := 0.0
var _mode := Mode.APPROACH


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.set_aware(true)
	_lost_time = 0.0
	_set_mode(Mode.APPROACH)


func physics_update(delta: float) -> void:
	var nearest := enemy.look_for_target(true)
	if nearest != null:
		enemy.target = nearest
	if not enemy.is_valid_target(enemy.target):
		# Unsichtbar, tot oder weg: Er verliert sie sofort.
		machine.transition_to(&"Search")
		return
	var chased: Node2D = enemy.target
	if not enemy.can_track(chased):
		_lost_time += delta
		if _lost_time >= enemy.stats.lose_time:
			machine.transition_to(&"Search")
			return
		_set_mode(Mode.APPROACH)
		enemy.move_to(enemy.last_known_position, enemy.stats.chase_speed)
		return
	enemy.last_known_position = chased.global_position
	_lost_time = 0.0
	var ready_attack := enemy.choose_attack(chased)
	if ready_attack != null:
		machine.transition_to(&"Attack", {"attack": ready_attack})
		return
	_keep_distance(chased)


## Anzeigename: was er gerade tut (M14).
func get_display_name() -> String:
	return MODE_NAMES[_mode]


# Abstand nach dem ersten Angriff: hingehen, zurückweichen oder abwarten (M14).
func _keep_distance(chased: Node2D) -> void:
	var main := enemy.main_attack()
	if main == null or not main.can_hit(chased):
		_set_mode(Mode.APPROACH)
		enemy.move_to(enemy.last_known_position, enemy.stats.chase_speed)
		return
	var distance := enemy.global_position.distance_to(chased.global_position)
	if distance < main.min_distance():
		_set_mode(Mode.RETREAT)
		enemy.move_away_from(chased.global_position, enemy.stats.retreat_speed)
		return
	_set_mode(Mode.HOLD)
	enemy.stop()
	enemy.face_point(chased.global_position)


func _set_mode(mode: Mode) -> void:
	if mode == _mode:
		return
	_mode = mode
	enemy.report_state()
