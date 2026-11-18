class_name EnemyRangedAttack
extends EnemyAttack
## EnemyRangedAttack - Fernkampf eines Gegners (M14): löst den Baustein RangedAttack aus.
##
## Der Gegner wirft, sobald die Figur in Reichweite ist und nichts dazwischen
## steht (needs_line_of_sight). Reichweite: höchstens so weit, wie das Geschoss
## fliegt - spawn_distance + max_distance aus den RangedStats seiner Waffe -,
## begrenzt durch max_tiles. Kommt die Figur näher als min_tiles, weicht er zurück
## und wirft trotzdem, sobald er wieder bereit ist. Pause bis zum nächsten Wurf:
## cooldown der Waffe.
## Das Geschoss bestellt RangedAttack beim ProjectileSpawner des Levels; ohne ihn
## wirft er nicht. Es trifft nur die Ebenen aus target_mask der Waffe - bei
## Gegnern "player_hurtbox", also nie einen anderen Gegner.
## Steht in ranged_enemy.tscn als "Attacks/Ranged".


func _init() -> void:
	weapon_name = "RangedAttack"


func _ready() -> void:
	super()
	if weapon != null and not (weapon is RangedAttack):
		push_warning("EnemyRangedAttack %s: \"%s\" ist kein RangedAttack." % [name, weapon_name])
		weapon = null


func _weapon_ready() -> bool:
	# Ohne Geschoss-Erzeuger im Level fällt kein Wurf (M6).
	if EventBus.projectile_requested.get_connections().is_empty():
		return false
	return (weapon as RangedAttack).can_shoot()


func _weapon_reach() -> float:
	var shot := (weapon as RangedAttack).get_shot()
	if shot == null:
		return 0.0
	return shot.spawn_distance + shot.max_distance


func _trigger(direction: Vector2) -> bool:
	return (weapon as RangedAttack).try_shoot(direction)
