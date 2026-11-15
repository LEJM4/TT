extends Node2D
## PlayerSpawner - erzeugt die Spielfiguren eines Levels an einer Stelle.
##
## Sucht die Startpunkte der Gruppe "player_spawn" und setzt je Spieler eine
## Figur auf den nächsten Punkt. Die Figuren hängen als Kinder an diesem
## Knoten. Fehlen Startpunkte, erscheinen sie am Ort des Spawners.
##
## Abschalten: Knoten aus dem Level löschen - dann gibt es keine Spielfigur.

## Szene der Spielfigur.
@export var player_scene: PackedScene
## Anzahl der Figuren. Mehr als 1 dient nur zum Testen: Alle folgen denselben Tasten.
@export_range(1, 4) var player_count := 1


func _ready() -> void:
	if player_scene == null:
		push_warning("PlayerSpawner: keine Spieler-Szene gesetzt.")
		return
	var spawn_points := get_tree().get_nodes_in_group("player_spawn")
	for index in player_count:
		var player := player_scene.instantiate() as Node2D
		if player == null:
			push_warning("PlayerSpawner: Die Spieler-Szene ist kein 2D-Knoten.")
			return
		player.name = "Player%d" % (index + 1)
		player.set("player_id", index + 1)
		add_child(player)
		player.global_position = _spawn_position(spawn_points, index)


func _spawn_position(spawn_points: Array[Node], index: int) -> Vector2:
	if spawn_points.is_empty():
		return global_position
	var point := spawn_points[index % spawn_points.size()] as Node2D
	if point == null:
		return global_position
	return point.global_position
