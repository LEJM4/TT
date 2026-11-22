class_name DialogLine
extends Resource
## DialogLine - eine Zeile eines Gesprächs: wer spricht, was, und wie es weitergeht (M15).
##
## Ohne Antworten geht es mit E weiter - zur nächsten Zeile der Liste oder zum
## Sprungziel next. Mit Antworten (choices) wählt die Spielfigur, und jede
## Antwort führt an ihre eigene Stelle. Was eine Zeile bewirkt - Beute (reward),
## erledigt (marks_done), eine Mission starten oder abgeben (M17) -, meldet der
## NPC, sobald das Fenster sie zeigt.
## Teil eines Gesprächs (DialogData).

## Sprungziel, das das Gespräch beendet. Keine Zeile darf so heißen.
const END := &"end"
## Höchstens so viele Antworten zeigt das Dialogfenster.
const MAX_CHOICES := 3

## Name der Zeile, damit Sprünge sie finden, etwa "question". Darf leer bleiben.
@export var id: StringName = &""
## Wer spricht. Leer: der Sprecher des Gesprächs, meist der NPC.
@export var speaker: DialogSpeaker
## Der Text. Ins Fenster passen drei Zeilen; umgebrochen wird von selbst.
## Die Schrift kennt kein ß, kein unteres Anführungszeichen, keinen
## Gedankenstrich und keine drei Punkte als ein Zeichen.
@export_multiline var text := ""
## Antworten der Spielfigur, höchstens drei. Leer: keine Frage - es geht mit E weiter.
@export var choices: Array[DialogChoice] = []
## Wohin es ohne Antworten weitergeht: leer zur nächsten Zeile der Liste,
## "end" zum Ende, sonst zur Zeile mit diesem Namen.
@export var next: StringName = &""

@export_group("Wirkung")
## Beute, die der NPC gibt, sobald die Zeile erscheint - einmal je NPC, bis der
## Raum neu lädt. Sie springt vor der Spielfigur auf den Boden.
@export var reward: LootTable
## Ab dieser Zeile hat der NPC nichts Neues mehr: Seine Sprechblase verschwindet,
## und beim nächsten Mal spricht er sein kurzes Gespräch.
@export var marks_done := false
## Name einer Mission aus der Missionen-Datei des Levels, die mit dieser Zeile
## beginnt, etwa "branches" (M17). Leer: keine. Ob sie beginnt, entscheidet der
## MissionTracker - eine Mission, die schon läuft, beginnt nicht noch einmal.
@export var start_mission: StringName = &""
## Name einer Mission, die mit dieser Zeile abgegeben wird (M17): Ist sie bereit,
## gehen die verlangten Gegenstände aus dem Inventar, und die Belohnung springt
## vor die Spielfigur. Leer: keine.
@export var hand_in_mission: StringName = &""


## Die Antworten, die das Fenster zeigt: ohne leere Einträge, höchstens drei.
func get_choices() -> Array[DialogChoice]:
	var result: Array[DialogChoice] = []
	for choice in choices:
		if choice != null and result.size() < MAX_CHOICES:
			result.append(choice)
	return result


## Ist die Zeile eine Frage mit Antworten?
func has_choices() -> bool:
	return not get_choices().is_empty()
