class_name EventObjective
extends MissionObjective
## EventObjective - Ziel: Ein Ereignis geschieht so oft wie count (M17).
##
## Etwa "Besiege den Höhlenmenschen" mit dem Ereignis "caveman_defeated".
## Ereignisse melden Bausteine über den EventBus (mission_event) - MissionCue an
## einem Gegner, wenn er fällt, oder an einer Truhe, wenn sie aufgeht. Der
## MissionTracker zählt sie für jede laufende Mission mit diesem Ziel, höchstens
## bis count; der Stand steht im Spielstand.

## Name des Ereignisses, so wie MissionCue es meldet, etwa "caveman_defeated".
@export var event: StringName = &""


func counts_event(which: StringName) -> bool:
	return event != &"" and which == event


func _check_kind() -> PackedStringArray:
	if event == &"":
		return PackedStringArray(["hat kein Ereignis"])
	return PackedStringArray()
