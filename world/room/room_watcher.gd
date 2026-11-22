class_name RoomWatcher
extends Node
## RoomWatcher - weiß je Spielfigur, in welchem Raum sie ist (M18).
##
## In jedem Physik-Schritt - nach den Figuren, vor der Kamera - prüft er für jede
## Figur der Gruppe "players", in welchem Raum der Gruppe "rooms" ihre Mitte liegt.
## Wechselt sie den Raum, meldet er room_changed(player_id, room_id, bounds) über
## den EventBus; die Kamera dieser Figur gleitet dann in die Grenzen des neuen
## Raums. Liegt die Mitte in keinem Raum, bleibt der alte. Jede Figur kann in
## einem anderen Raum sein. Er entscheidet nichts über die Welt.
## Debug-Zeile je Figur, etwa "S1 Raum: Ostraum".
##
## Abschalten: Knoten löschen - die Kamera nimmt die Grenzen, die das Level meldet.

# Raum je Spielfigur: player_id -> Room.
var _rooms := {}


func _physics_process(_delta: float) -> void:
	var rooms := get_tree().get_nodes_in_group("rooms")
	if rooms.is_empty():
		return
	for node in get_tree().get_nodes_in_group("players"):
		var player := node as Node2D
		if player == null:
			continue
		var id: Variant = player.get("player_id")
		if not id is int:
			continue
		var current: Variant = _rooms.get(id)
		if is_instance_valid(current) and (current as Room).contains(player.global_position):
			continue
		var found := _room_at(rooms, player.global_position)
		if found == null or (is_instance_valid(current) and found == current):
			continue
		_rooms[id] = found
		EventBus.room_changed.emit(int(id), found.room_id, found.get_bounds())
		EventBus.debug_value_changed.emit("S%d Raum" % int(id), found.get_display_name())


## Der Raum, in dem die Figur mit dieser Nummer gerade ist, oder null.
func get_room_of(player_id: int) -> Room:
	var current: Variant = _rooms.get(player_id)
	if is_instance_valid(current):
		return current as Room
	return null


func _room_at(rooms: Array[Node], point: Vector2) -> Room:
	for node in rooms:
		var room := node as Room
		if room != null and room.contains(point):
			return room
	return null
