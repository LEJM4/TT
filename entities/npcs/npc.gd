class_name Npc
extends StaticBody2D
## Npc - eine Figur, die man mit E ansprechen kann (M15).
##
## Die Grundszene entities/npcs/npc.tscn hat alles: einen festen Körper auf der
## Ebene "world" - Geschosse prallen ab, verletzen lässt er sich nicht -, das Bild
## (CharacterView), das Interactable für E und die Sprechblase (TalkBubble).
## Ein fertiger NPC erbt sie und wählt im Inspektor Skin und Gespräche, so
## shaman.tscn und hunter.tscn. Händler, Schmied und Auftraggeber kommen später
## als weitere geerbte Szenen dazu.
## E bittet das Dialogfenster der Spielfigur um das Gespräch (EventBus.dialog_requested).
## Solange es läuft, blickt der NPC zur Figur und reagiert nicht auf E.
## Was eine Zeile bewirkt, entscheidet er, an genau einer Stelle: Hat sie Beute
## (reward), bestellt er sie beim LootSpawner - sie springt vor der Figur auf den
## Boden, je Zeile einmal. Markiert sie ihn als erledigt (marks_done), hat er
## nichts Neues mehr: Die Sprechblase verschwindet, und beim nächsten Mal spricht
## er repeat_dialog - ohne das wieder dialog. Ein NPC, der nur Auskunft gibt, hat
## ein Gespräch ohne Antworten.
## Startet eine Zeile eine Mission oder gibt sie eine ab (M17), meldet er das über
## den EventBus (mission_start_requested, mission_hand_in_requested); entscheiden
## tut der MissionTracker des Levels. Bringt eine Zeile eine Freischaltung (M19),
## bittet er GameState darum (unlock_requested). Der Auftraggeber (QuestGiver) erbt von ihm.
## Gemerkt wird all das im Spielstand, über sein Kind "Persistent" (M16): ob er
## erledigt ist und welche Zeilen ihre Beute schon gegeben haben.
##
## Abschalten: Knoten löschen - die Welt läuft ohne ihn weiter.

## Ein Gespräch mit ihm hat begonnen; partner ist die Spielfigur.
signal talk_started(partner: Node2D)
## Das Gespräch ist vorbei; completed heißt: bis zum Ende, sonst abgebrochen.
signal talk_finished(completed: bool)
## Er hat Beute gegeben: so viele Gegenstände.
signal reward_given(count: int)
## Er ist erledigt oder hat Beute gegeben - das merkt sich Persistent (M16).
signal progress_changed

## Das Gespräch, solange er etwas Neues zu sagen hat.
@export var dialog: DialogData
## Das kurze Gespräch, wenn er erledigt ist. Leer: wieder dialog.
@export var repeat_dialog: DialogData
## Blickrichtung zu Beginn.
@export var start_facing := Vector2.DOWN

## Blickrichtung - CharacterView liest sie.
var facing := Vector2.DOWN
## Hat er nichts Neues mehr zu sagen?
var is_done := false

var _talking := false
var _partner: Node2D
var _partner_id := 0
var _asked_by: Node2D
# Zeilen, deren Beute er schon gegeben hat (DialogLine -> true).
var _given := {}

@onready var _interactable := get_node_or_null("Interactable") as Interactable
@onready var _bubble := get_node_or_null("TalkBubble") as CanvasItem


func _ready() -> void:
	if start_facing != Vector2.ZERO:
		facing = start_facing.normalized()
	if current_dialog() == null:
		push_warning("Npc %s: kein Gespräch gesetzt - E bewirkt nichts." % name)
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	EventBus.dialog_started.connect(_on_dialog_started)
	EventBus.dialog_line_shown.connect(_on_dialog_line_shown)
	EventBus.dialog_finished.connect(_on_dialog_finished)
	_refresh_bubble()
	# Erst melden, wenn die Debug-Anzeige bereit ist und zuhört.
	_report.call_deferred()


## Das Gespräch, das er jetzt führen würde, oder null.
func current_dialog() -> DialogData:
	if is_done and repeat_dialog != null:
		return repeat_dialog
	return dialog


## Alle Gespräche, die er führen kann - für den Spielstand. Ein NPC mit weiteren
## Gesprächen, etwa der Auftraggeber (M17), ergänzt seine.
func get_dialogs() -> Array[DialogData]:
	var result: Array[DialogData] = []
	for source in [dialog, repeat_dialog]:
		var talk := source as DialogData
		if talk != null and not result.has(talk):
			result.append(talk)
	return result


## Hat er etwas Neues zu sagen?
func has_news() -> bool:
	return dialog != null and not is_done


## Spricht er gerade?
func is_talking() -> bool:
	return _talking


func _on_interacted(actor: Node) -> void:
	var data := current_dialog()
	if data == null or _talking:
		return
	var player_id: Variant = actor.get("player_id")
	if player_id == null:
		return
	if EventBus.dialog_requested.get_connections().is_empty():
		push_warning("Npc %s: Kein Dialogfenster im Level - das Gespräch fällt aus." % name)
		return
	_asked_by = actor as Node2D
	EventBus.dialog_requested.emit(int(player_id), data, get_instance_id())


func _on_dialog_started(player_id: int, source_id: int) -> void:
	if source_id != get_instance_id():
		return
	_talking = true
	_partner_id = player_id
	_partner = _asked_by if is_instance_valid(_asked_by) else _find_player(player_id)
	_asked_by = null
	if _interactable != null:
		_interactable.enabled = false
	_face_partner()
	_refresh_bubble()
	_report()
	talk_started.emit(_partner)


func _on_dialog_line_shown(player_id: int, source_id: int, line: Resource) -> void:
	if source_id != get_instance_id():
		return
	var dialog_line := line as DialogLine
	if dialog_line == null:
		return
	var changed := false
	if dialog_line.reward != null and not _given.has(dialog_line):
		_given[dialog_line] = true
		_give(dialog_line.reward)
		changed = true
	if dialog_line.marks_done and not is_done:
		is_done = true
		_refresh_bubble()
		_report()
		changed = true
	if changed:
		progress_changed.emit()
	# Missionen (M17): Starten und Abgeben entscheidet der MissionTracker.
	if dialog_line.start_mission != &"":
		EventBus.mission_start_requested.emit(player_id, dialog_line.start_mission)
	if dialog_line.hand_in_mission != &"":
		EventBus.mission_hand_in_requested.emit(player_id, dialog_line.hand_in_mission)
	# Freischaltungen (M19): Frei schaltet GameState; was schon frei ist, bleibt es.
	if dialog_line.unlock != &"":
		EventBus.unlock_requested.emit(player_id, dialog_line.unlock)


func _on_dialog_finished(_player_id: int, source_id: int, completed: bool) -> void:
	if source_id != get_instance_id():
		return
	_talking = false
	_partner = null
	if _interactable != null:
		_interactable.enabled = true
	_refresh_bubble()
	_report()
	talk_finished.emit(completed)


## Zustand für den Spielstand (M16): erledigt, und welche Zeilen schon Beute
## gegeben haben - je Zeile "gespräch#name", ohne Namen "gespräch#nummer".
func get_saved_state() -> Dictionary:
	var given: Array[String] = []
	for line: DialogLine in _given:
		var key := _line_key(line)
		if not key.is_empty():
			given.append(key)
	if not is_done and given.is_empty():
		return {}
	return {"done": is_done, "given": given}


## Stellt den Zustand aus dem Spielstand her (M16): erledigt, Beute schon gegeben.
func apply_saved_state(data: Dictionary) -> void:
	is_done = data.get("done") == true
	var given: Variant = data.get("given")
	if given is Array:
		for source in get_dialogs():
			var talk := source as DialogData
			if talk == null:
				continue
			for line in talk.lines:
				if line != null and (given as Array).has(_line_key(line)):
					_given[line] = true
	_refresh_bubble()
	_report()


# Würfelt die Beute und bestellt sie beim LootSpawner; sie springt vor der Figur auf den Boden.
func _give(table: LootTable) -> void:
	var origin := global_position
	if is_instance_valid(_partner):
		origin = _partner.global_position
	var stacks := table.roll()
	for stack in stacks:
		EventBus.loot_requested.emit(stack.item, stack.amount, origin)
	reward_given.emit(stacks.size())


# Kennung einer Zeile für den Spielstand: Gespräch und Name der Zeile, ohne Namen ihre Nummer.
func _line_key(line: DialogLine) -> String:
	for source in get_dialogs():
		var talk := source as DialogData
		if talk == null:
			continue
		var index := talk.lines.find(line)
		if index < 0:
			continue
		var line_name := String(line.id)
		if line_name.is_empty():
			line_name = str(index)
		return "%s#%s" % [talk.resource_path.get_file().get_basename(), line_name]
	return ""


func _face_partner() -> void:
	if not is_instance_valid(_partner):
		return
	var to_partner := _partner.global_position - global_position
	if to_partner.length() > 0.5:
		facing = to_partner.normalized()


func _find_player(player_id: int) -> Node2D:
	for node in get_tree().get_nodes_in_group("players"):
		if node.get("player_id") == player_id:
			return node as Node2D
	return null


func _refresh_bubble() -> void:
	if _bubble != null:
		_bubble.visible = has_news() and not _talking


# Eine Zeile je NPC in der Debug-Anzeige, etwa "Shaman: wartet · hat Neues".
func _report() -> void:
	var text := "wartet"
	if _talking:
		text = "spricht mit S%d" % _partner_id
	if is_done:
		text += " · erledigt"
	elif has_news():
		text += " · hat Neues"
	EventBus.debug_value_changed.emit(String(name), text)
