class_name DialogData
extends Resource
## DialogData - ein Gespräch als Werte-Datei: Zeilen nacheinander (M15).
##
## Jede Zeile (DialogLine) hat einen Text und kann Antworten haben, springen,
## Beute geben oder den NPC als erledigt markieren. Ohne Sprung folgt die nächste
## Zeile der Liste; nach der letzten ist das Gespräch zu Ende. Hat keine Zeile
## Antworten, spricht nur der NPC - so bei einem, der nur Auskunft gibt.
## Neue Gespräche entstehen im Inspektor, ohne Code; Beispiele in data/dialogs/.
## Fehler wie einen Sprung ins Leere findet check(); das Dialogfenster schreibt
## sie beim Start des Gesprächs ins Ausgabefenster.

## Wer spricht, wenn eine Zeile keinen eigenen Sprecher hat - meist der NPC.
@export var speaker: DialogSpeaker
## Die Zeilen in ihrer Reihenfolge.
@export var lines: Array[DialogLine] = []


## Nummer der Zeile mit diesem Namen, ab 0 gezählt; -1, wenn es keine gibt.
func find_line(line_id: StringName) -> int:
	if line_id == &"":
		return -1
	for index in lines.size():
		if lines[index] != null and lines[index].id == line_id:
			return index
	return -1


## Wer die Zeile spricht: ihr eigener Sprecher oder der des Gesprächs.
func speaker_of(line: DialogLine) -> DialogSpeaker:
	if line != null and line.speaker != null:
		return line.speaker
	return speaker


## Prüft das Gespräch und liefert die Fehler als Sätze; leer heißt: alles gut.
func check() -> PackedStringArray:
	var problems := PackedStringArray()
	var names := {}
	for index in lines.size():
		var line := lines[index]
		if line == null:
			problems.append("Zeile %d ist leer." % (index + 1))
			continue
		if line.text.strip_edges().is_empty():
			problems.append("Zeile %d hat keinen Text." % (index + 1))
		if line.id == DialogLine.END:
			problems.append("Zeile %d heißt \"%s\" - der Name ist für das Ende vergeben." % [index + 1, DialogLine.END])
		elif line.id != &"":
			if names.has(line.id):
				problems.append("Der Name \"%s\" steht an mehreren Zeilen." % line.id)
			names[line.id] = true
		if line.choices.size() > DialogLine.MAX_CHOICES:
			problems.append("Zeile %d hat %d Antworten; das Fenster zeigt nur %d." % [index + 1, line.choices.size(), DialogLine.MAX_CHOICES])
		for choice_index in line.choices.size():
			var choice := line.choices[choice_index]
			if choice == null or choice.text.strip_edges().is_empty():
				problems.append("Antwort %d in Zeile %d hat keinen Text." % [choice_index + 1, index + 1])
	for index in lines.size():
		var line := lines[index]
		if line == null:
			continue
		var targets: Array[StringName] = [line.next]
		for choice in line.choices:
			if choice != null:
				targets.append(choice.next)
		for target in targets:
			if target != &"" and target != DialogLine.END and not names.has(target):
				problems.append("Zeile %d springt zu \"%s\" - eine Zeile mit diesem Namen gibt es nicht." % [index + 1, target])
	return problems
