extends Node2D
## PlayerSpawner - erzeugt die Spielfiguren eines Levels an einer Stelle.
##
## Sucht die Startpunkte der Gruppe "player_spawn" und setzt je Spieler eine
## Figur auf den nächsten Punkt. Die Figuren hängen als Kinder an diesem
## Knoten. Fehlen Startpunkte, erscheinen sie am Ort des Spawners.
## Ist in GameState ein Zeitanker dieses Levels der Rückkehrpunkt (M16), erscheinen
## sie stattdessen vor ihm - nach dem Tod, nach einem Neustart des Raums und beim
## nächsten Start des Spiels. Den Anker findet er in der Gruppe "time_anchors".
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
	var anchor := _respawn_anchor()
	for index in player_count:
		var player := player_scene.instantiate() as Node2D
		if player == null:
			push_warning("PlayerSpawner: Die Spieler-Szene ist kein 2D-Knoten.")
			return
		player.name = "Player%d" % (index + 1)
		player.set("player_id", index + 1)
		add_child(player)
		if anchor != null:
			player.global_position = anchor.call("get_spawn_position", index, player_count)
		else:
			player.global_position = _spawn_position(spawn_points, index)


# Der Zeitanker, der in GameState Rückkehrpunkt ist und in diesem Level steht; sonst null.
func _respawn_anchor() -> Node:
	var state := get_node_or_null("/root/GameState")
	if state == null:
		return null
	var respawn: Dictionary = state.call("get_respawn")
	var anchor_id: Variant = respawn.get("anchor")
	if not anchor_id is String or (anchor_id as String).is_empty():
		return null
	if respawn.get("level") != state.call("level_id_of", self):
		return null
	for node in get_tree().get_nodes_in_group("time_anchors"):
		if node.has_method("get_anchor_id") and node.has_method("get_spawn_position") and node.call("get_anchor_id") == anchor_id:
			return node
	push_warning("PlayerSpawner: Zeitanker %s nicht gefunden - die Figur erscheint am Startpunkt." % anchor_id)
	return null


func _spawn_position(spawn_points: Array[Node], index: int) -> Vector2:
	if spawn_points.is_empty():
		return global_position
	var point := spawn_points[index % spawn_points.size()] as Node2D
	if point == null:
		return global_position
	return point.global_position
