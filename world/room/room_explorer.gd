class_name RoomExplorer
extends Node
## RoomExplorer - merkt, welche Räume eines Levels schon betreten wurden (M20b).
##
## Hört auf room_changed vom RoomWatcher: Betritt eine Spielfigur einen Raum,
## bittet er GameState, ihn als erkundet abzulegen (visit_room). Die Karte im
## Fenster auf M zeigt nur erkundete Räume. Er entscheidet nichts - was erkundet
## ist, steht an einer Stelle im Kapsel- und Levelstand und gilt für alle
## Spielfiguren gemeinsam: Tod und Beenden behalten es, ein Abbruch verwirft, was
## im Lauf dazukam, der Abschluss übernimmt es für die nächste Reise.
## Debug-Zeile "Erkundet", etwa "1 von 2 Räumen"; ohne Räume "keine Räume".
##
## Abschalten: Knoten löschen - nichts kommt mehr dazu; die Karte zeigt dann nur
## Räume, die schon erkundet sind, und den, in dem die Figur gerade ist.

var _level_id := ""


func _ready() -> void:
	var state := _game_state()
	if state != null:
		_level_id = String(state.call("level_id_of", self))
	EventBus.room_changed.connect(_on_room_changed)
	EventBus.room_visited.connect(_on_room_visited)
	# Erst melden, wenn die Debug-Anzeige bereit ist und zuhört.
	_report.call_deferred()


## Kennung des Levels, dessen Räume er merkt, etwa "test_chamber".
func get_level_id() -> String:
	return _level_id


func _on_room_changed(_player_id: int, room_id: String, _bounds: Rect2) -> void:
	var state := _game_state()
	if state == null or _level_id.is_empty() or room_id.is_empty():
		return
	state.call("visit_room", _level_id, room_id)


func _on_room_visited(level_id: String, _room_id: String) -> void:
	if level_id == _level_id:
		_report()


func _report() -> void:
	var ids := PackedStringArray()
	for node in get_tree().get_nodes_in_group("rooms"):
		var room := node as Room
		if room != null and not ids.has(room.room_id):
			ids.append(room.room_id)
	if ids.is_empty():
		EventBus.debug_value_changed.emit("Erkundet", "keine Räume")
		return
	var visited := 0
	var state := _game_state()
	if state != null:
		var known: PackedStringArray = state.call("get_visited_rooms", _level_id)
		for room_id in ids:
			if known.has(room_id):
				visited += 1
	var noun := "Raum" if ids.size() == 1 else "Räumen"
	EventBus.debug_value_changed.emit("Erkundet", "%d von %d %s" % [visited, ids.size(), noun])


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")
