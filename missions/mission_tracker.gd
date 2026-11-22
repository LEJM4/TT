class_name MissionTracker
extends Node
## MissionTracker - die eine Stelle für die Missionen eines Levels (M17).
##
## Benutzung: die Szene mission_tracker.tscn ins Level hängen und im Inspektor
## die Missionen-Datei des Levels wählen (MissionList aus data/missions/).
## Beim Betreten beginnen die Missionen, die mit dem Level beginnen; was schon
## läuft oder erfüllt ist, kommt still aus dem Spielstand (GameState).
## Er zählt Ereignisse (EventBus.mission_event) und die Gegenstände in den
## Inventaren der Spielfiguren, entscheidet, wann eine Mission bereit oder
## erfüllt ist, und gibt die Belohnung: Sie springt über den LootSpawner vor die
## Spielfigur. Gesprächszeilen bitten über den EventBus, eine Mission zu starten
## oder abzugeben. Jeden Wechsel meldet er (mission_changed), die ganze Liste für
## die Anzeige ebenso (mission_list_changed).
## Sind alle Pflichtmissionen erfüllt, meldet er seinen Kanal unlock_channel als
## an, wie ein Hebel: Ein Tor auf diesem Kanal öffnet sich, auch nach dem Laden;
## seit M18 wird die Zeitkapsel im Level damit bereit zur Rückreise.
## Ohne Pflichtmissionen ist der Weg von Anfang an frei.
## Gegenstand-Ziele zählen, was die Figur mit den meisten davon trägt; abgeben
## kann nur, wer alles trägt. Die Belohnung einer Mission ohne Abgabe springt vor
## die Figur mit der kleinsten Nummer. Im Online-Spiel entscheidet hier später
## der Gastgeber.
## Ohne GameState merkt er sich den Stand nur, bis der Raum neu startet.
## Debug-Zeile "Missionen", etwa "Pflicht 1/2 · Neben 0/1 · Weg zu" - der Weg
## aus dem Level, seit M18 über die Zeitkapsel.
##
## Abschalten: Knoten löschen - das Level hat keine Missionen; ein Tor auf seinem
## Kanal bleibt zu, die Zeitkapsel wird nicht bereit.

## Stand: Die Mission läuft.
const ACTIVE := "active"
## Stand: Alle Ziele sind erfüllt, sie wartet auf die Abgabe.
const READY := "ready"
## Stand: erfüllt.
const DONE := "done"
## Name des Inventars an einer Spielfigur.
const INVENTORY_NAME := "Inventory"

## Die Missionen-Datei des Levels.
@export var missions: MissionList
## Kanal, den er als an meldet, sobald alle Pflichtmissionen erfüllt sind. Leer: keiner.
@export var unlock_channel: StringName = &"missions_done"

var _level_id := ""
# Stand je Mission, Schlüssel ist ihr Name als Text: {"state": ..., "progress": [Zahl je Ziel]}.
# Ohne Eintrag ist sie nicht angenommen. Jede Änderung geht auch an GameState.
var _states := {}
var _begun := false
var _unlocked := false
var _last_entries: Array = []
var _last_report := ""


func _ready() -> void:
	if missions == null:
		push_warning("MissionTracker: keine Missionen-Datei gesetzt - das Level hat keine Missionen.")
		return
	for problem in missions.check():
		push_warning("MissionTracker: %s - %s" % [missions.resource_path, problem])
	_level_id = _find_level_id()
	EventBus.mission_event.connect(_on_mission_event)
	EventBus.mission_start_requested.connect(_on_start_requested)
	EventBus.mission_hand_in_requested.connect(_on_hand_in_requested)
	get_tree().node_added.connect(_on_node_added)
	# Erst beginnen, wenn alle im Level bereit sind und zuhören: Anzeige, Auftraggeber, Tore.
	_begin.call_deferred()


## Kennung des Levels, etwa "test_chamber".
func get_level_id() -> String:
	return _level_id


## Stand einer Mission: "active", "ready", "done" oder leer - nicht angenommen.
func get_state(mission_id: StringName) -> String:
	var entry: Variant = _states.get(String(mission_id))
	if not entry is Dictionary:
		return ""
	return String((entry as Dictionary).get("state", ""))


## Sind alle Pflichtmissionen erfüllt?
func are_required_done() -> bool:
	if missions == null:
		return false
	for mission in _all():
		if mission.required and get_state(mission.id) != DONE:
			return false
	return true


## Startet die Mission, wenn sie noch nicht angenommen ist. Liefert, ob sie begann.
func start(mission_id: StringName) -> bool:
	if not _begun:
		return false
	var mission := _find(mission_id)
	if mission == null or not get_state(mission.id).is_empty():
		return false
	var progress: Array = []
	progress.resize(mission.objectives.size())
	progress.fill(0)
	_states[String(mission.id)] = {"state": ACTIVE, "progress": progress}
	_save(mission)
	EventBus.mission_changed.emit(_level_id, mission.id, ACTIVE)
	_publish()
	# Trägt die Figur schon alles, ist sie gleich bereit oder erfüllt.
	_evaluate(mission)
	return true


## Gibt eine bereite Mission für die Spielfigur player_id ab: Die verlangten
## Gegenstände gehen aus ihrem Inventar, die Belohnung springt vor sie.
## Liefert, ob es ging.
func hand_in(mission_id: StringName, player_id: int) -> bool:
	if not _begun:
		return false
	var mission := _find(mission_id)
	if mission == null:
		return false
	if not mission.hand_in:
		push_warning("MissionTracker: Die Mission \"%s\" wird nicht abgegeben - sie ist erfüllt, sobald ihre Ziele erfüllt sind." % mission.id)
		return false
	var state := get_state(mission.id)
	if state == DONE:
		return false
	if state != READY:
		push_warning("MissionTracker: Die Mission \"%s\" ist nicht bereit zur Abgabe (%s)." % [mission.id, state if not state.is_empty() else "nicht angenommen"])
		return false
	var player := _player(player_id)
	if player == null or not _is_complete(mission, player):
		push_warning("MissionTracker: Spielfigur %d trägt nicht alles für \"%s\"." % [player_id, mission.id])
		return false
	# Erst erfüllt, dann die Gegenstände nehmen: So fällt sie dabei nicht auf "läuft" zurück.
	_set_state(mission, DONE)
	var inventory := _inventory_of(player)
	for objective in mission.objectives:
		if objective != null and objective.takes_items() and inventory != null:
			inventory.remove(objective.get_item(), objective.count)
	_give_reward(mission, player)
	return true


func _begin() -> void:
	if _begun or not is_inside_tree():
		return
	_load_states()
	for player in get_tree().get_nodes_in_group("players"):
		_watch(player)
	_begun = true
	# Zuerst der Stand aus dem Spielstand: Die Anzeige nimmt ihn als Ausgang, ohne Hinweise.
	_publish(true)
	_announce(true)
	# Was die Figuren tragen, kann sich seit dem Speichern geändert haben.
	for mission in _all():
		if _is_open(mission):
			_save(mission)
			_evaluate(mission)
	for mission in _all():
		if mission.starts_with_level and get_state(mission.id).is_empty():
			start(mission.id)
	_publish()


# Entscheidet über bereit und erfüllt, nach dem Stand der Ziele.
func _evaluate(mission: MissionData) -> void:
	var state := get_state(mission.id)
	if state != ACTIVE and state != READY:
		return
	var complete := _is_complete(mission, null)
	if complete and not mission.hand_in:
		_set_state(mission, DONE)
		_give_reward(mission, _first_player())
	elif complete and state == ACTIVE:
		_set_state(mission, READY)
	elif not complete and state == READY:
		_set_state(mission, ACTIVE)


func _set_state(mission: MissionData, state: String) -> void:
	var entry: Variant = _states.get(String(mission.id))
	if not entry is Dictionary:
		return
	(entry as Dictionary)["state"] = state
	_save(mission)
	EventBus.mission_changed.emit(_level_id, mission.id, state)
	_publish()
	_announce()


# Sind alle Ziele erfüllt? Mit player zählen nur dessen Gegenstände.
func _is_complete(mission: MissionData, player: Node) -> bool:
	for index in mission.objectives.size():
		var objective := mission.objectives[index]
		if objective != null and _current(mission, index, player) < objective.count:
			return false
	return true


# Stand eines Ziels: gezählte Ereignisse oder getragene Gegenstände, höchstens count.
func _current(mission: MissionData, index: int, player: Node) -> int:
	var objective := mission.objectives[index]
	if objective == null:
		return 0
	var item := objective.get_item()
	if item != null:
		return mini(_count_item(item, player), objective.count)
	var entry: Variant = _states.get(String(mission.id))
	if not entry is Dictionary:
		return 0
	var progress: Array = (entry as Dictionary).get("progress", [])
	if index >= progress.size():
		return 0
	return int(progress[index])


func _is_open(mission: MissionData) -> bool:
	var state := get_state(mission.id)
	return state == ACTIVE or state == READY


func _give_reward(mission: MissionData, player: Node2D) -> void:
	if mission.reward == null:
		return
	if player == null:
		push_warning("MissionTracker: keine Spielfigur für die Belohnung von \"%s\"." % mission.id)
		return
	for stack in mission.reward.roll():
		EventBus.loot_requested.emit(stack.item, stack.amount, player.global_position)


# Legt den Stand in GameState ab; bei offenen Missionen vorher die Gegenstände neu gezählt.
func _save(mission: MissionData) -> void:
	var key := String(mission.id)
	var entry: Variant = _states.get(key)
	if not entry is Dictionary:
		return
	if _is_open(mission):
		var progress: Array = (entry as Dictionary)["progress"]
		for index in mission.objectives.size():
			var objective := mission.objectives[index]
			if objective != null and objective.get_item() != null and index < progress.size():
				progress[index] = _current(mission, index, null)
	var state := _game_state()
	if state != null:
		state.call("set_mission_state", _level_id, key, entry)


func _load_states() -> void:
	_states.clear()
	var state := _game_state()
	if state == null:
		return
	for mission in _all():
		var data: Dictionary = state.call("get_mission_state", _level_id, String(mission.id))
		var entry := _clean(mission, data)
		if not entry.is_empty():
			_states[String(mission.id)] = entry


# Ein Stand aus dem Spielstand, geprüft: Unbekanntes fällt weg, je Ziel genau eine Zahl.
func _clean(mission: MissionData, data: Dictionary) -> Dictionary:
	var state: Variant = data.get("state")
	if not (state is String and state in [ACTIVE, READY, DONE]):
		return {}
	var saved: Variant = data.get("progress")
	var progress: Array = []
	for index in mission.objectives.size():
		var value := 0
		if saved is Array and index < (saved as Array).size():
			var raw: Variant = (saved as Array)[index]
			if raw is int or raw is float:
				value = int(raw)
		var objective := mission.objectives[index]
		var most := objective.count if objective != null else 0
		progress.append(clampi(value, 0, most))
	return {"state": state, "progress": progress}


# Meldet die Liste für die Anzeige, wenn sie sich geändert hat, und die Debug-Zeile.
func _publish(force := false) -> void:
	if not _begun:
		return
	var entries := _entries()
	if force or entries != _last_entries:
		_last_entries = entries
		EventBus.mission_list_changed.emit(_level_id, entries.duplicate(true))
	_report()


func _entries() -> Array:
	var result: Array = []
	for mission in _all():
		var state := get_state(mission.id)
		var objectives: Array = []
		for index in mission.objectives.size():
			var objective := mission.objectives[index]
			if objective == null:
				continue
			var current := 0
			if state == DONE:
				current = objective.count
			elif not state.is_empty():
				current = _current(mission, index, null)
			objectives.append({
				"text": objective.text,
				"current": current,
				"count": objective.count,
				"done": current >= objective.count,
			})
		result.append({
			"id": String(mission.id),
			"title": mission.title,
			"required": mission.required,
			"hand_in": mission.hand_in,
			"state": state,
			"objectives": objectives,
		})
	return result


# Meldet den Kanal: an, sobald alle Pflichtmissionen erfüllt sind.
func _announce(force := false) -> void:
	if unlock_channel == &"":
		return
	var now := are_required_done()
	if now == _unlocked and not force:
		return
	_unlocked = now
	EventBus.switch_changed.emit(unlock_channel, get_instance_id(), _unlocked)
	_report()


# Debug-Zeile, etwa "Pflicht 1/2 · Neben 0/1 · Weg zu".
func _report() -> void:
	var required_done := 0
	var required_all := 0
	var side_done := 0
	var side_all := 0
	for mission in _all():
		var done := get_state(mission.id) == DONE
		if mission.required:
			required_all += 1
			required_done += int(done)
		else:
			side_all += 1
			side_done += int(done)
	var text := "Pflicht %d/%d · Neben %d/%d" % [required_done, required_all, side_done, side_all]
	if unlock_channel != &"":
		text += " · Weg frei" if _unlocked else " · Weg zu"
	if text != _last_report:
		_last_report = text
		EventBus.debug_value_changed.emit("Missionen", text)


func _on_mission_event(event: StringName, amount: int) -> void:
	if not _begun or not is_inside_tree() or amount <= 0:
		return
	for mission in _all():
		if get_state(mission.id) != ACTIVE:
			continue
		var progress: Array = (_states[String(mission.id)] as Dictionary)["progress"]
		var counted := false
		for index in mission.objectives.size():
			var objective := mission.objectives[index]
			if objective == null or index >= progress.size() or not objective.counts_event(event):
				continue
			var before := int(progress[index])
			var after := mini(before + amount, objective.count)
			if after != before:
				progress[index] = after
				counted = true
		if counted:
			_save(mission)
			_evaluate(mission)
	_publish()


func _on_start_requested(_player_id: int, mission_id: StringName) -> void:
	if is_inside_tree():
		start(mission_id)


func _on_hand_in_requested(player_id: int, mission_id: StringName) -> void:
	if is_inside_tree():
		hand_in(mission_id, player_id)


func _on_inventory_changed() -> void:
	if not _begun or not is_inside_tree():
		return
	for mission in _all():
		if _is_open(mission) and mission.has_item_objectives():
			_save(mission)
			_evaluate(mission)
	_publish()


# Eine Spielfigur ist erschienen: auf ihr Inventar hören, sobald sie bereit ist.
func _on_node_added(node: Node) -> void:
	if not is_inside_tree() or not node.is_in_group("players"):
		return
	if node.is_node_ready():
		_watch(node)
	else:
		node.ready.connect(_watch.bind(node), CONNECT_ONE_SHOT)


func _watch(player: Node) -> void:
	if not is_inside_tree() or not is_instance_valid(player):
		return
	var inventory := _inventory_of(player)
	if inventory == null or inventory.changed.is_connected(_on_inventory_changed):
		return
	inventory.changed.connect(_on_inventory_changed)
	if _begun:
		_on_inventory_changed()


# Die gültigen Missionen der Datei: ohne leere Einträge, je Name nur die erste.
func _all() -> Array[MissionData]:
	var result: Array[MissionData] = []
	if missions == null:
		return result
	var names := {}
	for mission in missions.missions:
		if mission == null or mission.id == &"" or names.has(mission.id):
			continue
		names[mission.id] = true
		result.append(mission)
	return result


func _find(mission_id: StringName) -> MissionData:
	if missions == null:
		return null
	var mission := missions.find(mission_id)
	if mission == null:
		push_warning("MissionTracker: Die Mission \"%s\" steht nicht in %s." % [mission_id, missions.resource_path])
	return mission


# Wie viele davon trägt player - ohne player: die Figur, die die meisten trägt.
func _count_item(item: ItemData, player: Node) -> int:
	if player != null:
		var inventory := _inventory_of(player)
		return inventory.count(item) if inventory != null else 0
	var most := 0
	for node in get_tree().get_nodes_in_group("players"):
		var inventory := _inventory_of(node)
		if inventory != null:
			most = maxi(most, inventory.count(item))
	return most


func _inventory_of(player: Node) -> Inventory:
	if player == null:
		return null
	return player.get_node_or_null(INVENTORY_NAME) as Inventory


func _player(player_id: int) -> Node2D:
	for node in get_tree().get_nodes_in_group("players"):
		if node.get("player_id") == player_id:
			return node as Node2D
	return null


# Die Spielfigur mit der kleinsten Nummer, oder null.
func _first_player() -> Node2D:
	var best: Node2D = null
	var best_id := 0
	for node in get_tree().get_nodes_in_group("players"):
		var id: Variant = node.get("player_id")
		if not id is int:
			continue
		if best == null or int(id) < best_id:
			best = node as Node2D
			best_id = int(id)
	return best


func _find_level_id() -> String:
	var state := _game_state()
	if state != null:
		return String(state.call("level_id_of", self))
	var root: Node = self
	while root.owner != null:
		root = root.owner
	var id: Variant = root.get("level_id")
	if (id is String or id is StringName) and not String(id).is_empty():
		return String(id)
	return root.scene_file_path.get_file().get_basename()


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")
