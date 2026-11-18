extends EnemyState
## Dead - Tot (M13): Er tut nichts mehr. Den Zustand setzt der Gegner, wenn sein
## Leben auf 0 fällt; kurz danach verschwindet er.


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.stop()


func physics_update(_delta: float) -> void:
	enemy.stop()
