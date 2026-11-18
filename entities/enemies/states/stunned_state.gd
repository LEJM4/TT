extends EnemyState
## Stunned - Betäubt (M13): Er steht still. Den Zustand setzt der Gegner, wenn
## sein Stunnable "stunned" meldet; bei "recovered" entscheidet er neu - Chase,
## wenn er die Figur kennt, sonst Search.


func enter(_previous: StringName, _data: Dictionary) -> void:
	enemy.stop()


func physics_update(_delta: float) -> void:
	enemy.stop()
