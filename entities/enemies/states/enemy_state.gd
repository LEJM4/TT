class_name EnemyState
extends State
## EnemyState - Grundlage aller Zustände eines Gegners (M13): kennt seinen Gegner.
##
## Die Zustände liegen als Kinder unter "Brain" (ein StateMachine) in
## entities/enemies/enemy.tscn. Jeder steuert den Gegner nur über dessen
## Methoden - move_to(), stop(), face(), look_for_target() - und wechselt mit
## machine.transition_to(name).

## Der Gegner, zu dem der Zustand gehört: die Wurzel seiner Szene.
var enemy: Enemy


func _ready() -> void:
	enemy = owner as Enemy
	if enemy == null:
		push_warning("EnemyState: '%s' gehört zu keinem Gegner." % name)
