class_name EnemyMeleeAttack
extends EnemyAttack
## EnemyMeleeAttack - Nahkampf eines Gegners (M14): löst den Baustein MeleeAttack aus.
##
## Der Gegner schlägt zu, sobald die Figur so nah ist, wie sein Schlag reicht -
## start_distance + reach aus den MeleeStats seiner Waffe -, sofort und ohne
## Ausholen: Treffer und erstes Bild der Hieb-Animation kommen zusammen (M13).
## Pause bis zum nächsten Schlag: cooldown der Waffe.
## Steht in melee_enemy.tscn als "Attacks/Melee".


func _init() -> void:
	weapon_name = "MeleeAttack"


func _ready() -> void:
	super()
	if weapon != null and not (weapon is MeleeAttack):
		push_warning("EnemyMeleeAttack %s: \"%s\" ist kein MeleeAttack." % [name, weapon_name])
		weapon = null


func is_busy() -> bool:
	var melee := weapon as MeleeAttack
	return melee != null and melee.is_attacking


func _weapon_ready() -> bool:
	return (weapon as MeleeAttack).can_attack()


func _weapon_reach() -> float:
	return (weapon as MeleeAttack).reach_distance()


func _trigger(direction: Vector2) -> bool:
	return (weapon as MeleeAttack).try_attack(direction)
