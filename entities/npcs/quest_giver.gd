class_name QuestGiver
extends Npc
## QuestGiver - Auftraggeber: ein NPC, der eine Mission vergibt und abnimmt (M17).
##
## Er erbt alles vom Npc und wählt sein Gespräch nach dem Stand seiner Mission
## mission_id, den er in GameState liest:
##   nicht angenommen  offer_dialog    - er bietet sie an; eine Zeile startet sie
##   läuft             waiting_dialog  - er erinnert daran
##   bereit            ready_dialog    - eine Zeile gibt sie ab
##   erfüllt           done_dialog     - er bedankt sich
## Starten und Abgeben stehen als Wirkung in den Zeilen (DialogLine.start_mission,
## hand_in_mission); entscheiden tut der MissionTracker des Levels. Die Sprechblase
## zeigt er, solange er etwas anbietet oder die Mission bereit ist.
## Fehlt ein Gespräch, spricht er wie ein gewöhnlicher NPC dialog und repeat_dialog.
## Fertige Auftraggeber erben die Grundszene npc.tscn und tragen dieses Skript,
## etwa gatherer.tscn, die Sammlerin.
##
## Abschalten: Knoten löschen - die Mission lässt sich nicht annehmen.

## Name seiner Mission in der Missionen-Datei des Levels, etwa "branches".
@export var mission_id: StringName = &""
## Er bietet die Mission an; eine Zeile darin startet sie.
@export var offer_dialog: DialogData
## Die Mission läuft noch.
@export var waiting_dialog: DialogData
## Die Mission ist bereit; eine Zeile darin gibt sie ab.
@export var ready_dialog: DialogData
## Die Mission ist erfüllt.
@export var done_dialog: DialogData

# Stand der Mission, wie ihn die Meldungen bringen - gilt nur ohne GameState.
var _heard_state := ""


func _ready() -> void:
	if mission_id == &"":
		push_warning("QuestGiver %s: keine Mission gesetzt - er spricht wie ein gewöhnlicher NPC." % name)
	EventBus.mission_changed.connect(_on_mission_changed)
	super()


## Das Gespräch, das er jetzt führen würde, oder null.
func current_dialog() -> DialogData:
	var chosen := _dialog_for(mission_state())
	if chosen != null:
		return chosen
	return super()


## Hat er etwas Neues zu sagen? Ja, solange er die Mission anbietet oder sie bereit ist.
func has_news() -> bool:
	if mission_id == &"":
		return super()
	var state := mission_state()
	if state.is_empty():
		return offer_dialog != null
	if state == MissionTracker.READY:
		return ready_dialog != null
	return false


## Alle Gespräche, die er führen kann - für den Spielstand.
func get_dialogs() -> Array[DialogData]:
	var result: Array[DialogData] = super()
	for source in [offer_dialog, waiting_dialog, ready_dialog, done_dialog]:
		var talk := source as DialogData
		if talk != null and not result.has(talk):
			result.append(talk)
	return result


## Stand seiner Mission: "active", "ready", "done" oder leer - nicht angenommen.
func mission_state() -> String:
	if mission_id == &"":
		return ""
	var state := get_node_or_null("/root/GameState")
	if state == null:
		return _heard_state
	var data: Dictionary = state.call("get_mission_state", state.call("level_id_of", self), String(mission_id))
	var value: Variant = data.get("state")
	return String(value) if value is String else ""


func _dialog_for(state: String) -> DialogData:
	if mission_id == &"":
		return null
	if state.is_empty():
		return offer_dialog
	if state == MissionTracker.ACTIVE:
		return waiting_dialog
	if state == MissionTracker.READY:
		return ready_dialog
	if state == MissionTracker.DONE:
		return done_dialog
	return null


func _on_mission_changed(_level_id: String, changed_id: StringName, state: String) -> void:
	if changed_id != mission_id:
		return
	_heard_state = state
	_refresh_bubble()
	_report()
