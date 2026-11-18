extends EnemyState
## Attack - Angriff (M13): Er bleibt stehen, dreht sich zur Figur und schlägt zu,
## sobald MeleeAttack bereit ist - sofort, ohne Ausholen: Der Treffer kommt mit
## dem ersten Bild der Hieb-Animation. Er schlägt nur, solange die Figur in der
## Trefferzone steht (attack_distance); ist sie vorher heraus, verfolgt er sie
## weiter. Nach dem Schlag und attack_recover Sekunden folgt wieder "Chase".

var _started := false
var _recover_left := 0.0


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.set_aware(true)
	enemy.stop()
	_started = false
	_recover_left = enemy.stats.attack_recover


func physics_update(delta: float) -> void:
	enemy.stop()
	var attack := enemy.melee
	if attack == null:
		machine.transition_to(&"Chase")
		return
	if not _started:
		if not enemy.is_valid_target(enemy.target):
			machine.transition_to(&"Search")
			return
		var victim: Node2D = enemy.target
		var to := victim.global_position - enemy.global_position
		# Aus der Trefferzone, bevor er zuschlagen konnte: weiter verfolgen.
		if to.length() > enemy.attack_distance():
			machine.transition_to(&"Chase")
			return
		enemy.face(to)
		if attack.try_attack(enemy.facing):
			_started = true
		return
	if attack.is_attacking:
		return
	_recover_left -= delta
	if _recover_left <= 0.0:
		machine.transition_to(&"Chase")
