extends EnemyState
## Attack - Angriff (M13; seit M14 mit Angriffs-Modulen).
##
## Er setzt den Angriff ein, den "Chase" gewählt hat - ein Modul unter "Attacks",
## mitgegeben als data["attack"]. Er dreht sich zur Figur und löst ihn sofort aus,
## ohne Ausholen: Beim Nahkampf kommt der Treffer mit dem ersten Bild der
## Hieb-Animation, beim Fernkampf fliegt das Geschoss los. Solange der Angriff
## läuft, steuert ihn das Modul - meist steht er still. Danach steht er
## recover_time aus dessen Werte-Datei still und verfolgt dann weiter ("Chase").
## Ist die Figur aus der Reichweite, bevor er angreifen konnte, verfolgt er sie weiter.

var _attack: EnemyAttack
var _started := false
var _recover_left := 0.0


func enter(_previous: StringName, data: Dictionary) -> void:
	enemy.set_aware(true)
	enemy.stop()
	_attack = data.get("attack") as EnemyAttack
	_started = false
	_recover_left = 0.0


func exit() -> void:
	_attack = null


func physics_update(delta: float) -> void:
	if not is_instance_valid(_attack):
		machine.transition_to(&"Chase")
		return
	if not _started:
		enemy.stop()
		if not enemy.is_valid_target(enemy.target):
			machine.transition_to(&"Search")
			return
		var victim: Node2D = enemy.target
		# Aus der Reichweite oder nicht mehr bereit, bevor er angreifen konnte: weiter verfolgen.
		if not _attack.can_hit(victim) or not _attack.is_ready():
			machine.transition_to(&"Chase")
			return
		enemy.face_point(victim.global_position)
		if _attack.start(victim):
			_started = true
			_recover_left = _attack.get_recover_time()
		return
	if _attack.update(delta):
		return
	enemy.stop()
	_recover_left -= delta
	if _recover_left <= 0.0:
		machine.transition_to(&"Chase")
