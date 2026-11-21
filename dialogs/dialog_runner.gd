class_name DialogRunner
extends RefCounted
## DialogRunner - geht ein Gespräch Zeile für Zeile durch (M15).
##
## Er kennt nur den Weg: welche Zeile dran ist und welche danach kommt - die
## nächste der Liste, ein Sprungziel (next) oder das Ziel einer Antwort. Zeigen
## tut das Dialogfenster; was eine Zeile bewirkt, entscheidet der NPC.
## Leere Einträge der Liste überspringt er; ein Sprung ins Leere beendet das
## Gespräch mit einer Warnung.

## Das laufende Gespräch.
var dialog: DialogData

var _index := -1


## Beginnt das Gespräch mit seiner ersten Zeile und liefert sie; null, wenn es keine hat.
func start(data: DialogData) -> DialogLine:
	dialog = data
	_index = -1
	if data != null and not data.lines.is_empty():
		_index = 0
		_skip_empty()
	return current()


## Die Zeile, die gerade dran ist; null, wenn das Gespräch vorbei ist.
func current() -> DialogLine:
	if dialog == null or _index < 0 or _index >= dialog.lines.size():
		return null
	return dialog.lines[_index]


## Läuft das Gespräch noch?
func is_running() -> bool:
	return current() != null


## Geht nach einer Zeile ohne Antworten weiter. Liefert die neue Zeile; null heißt: Ende.
func advance() -> DialogLine:
	var line := current()
	if line == null:
		return null
	_go(line.next)
	return current()


## Wählt eine Antwort der aktuellen Zeile, ab 0 gezählt. Liefert die neue Zeile;
## null heißt: Ende. Eine Antwort, die es nicht gibt, ändert nichts.
func choose(choice_index: int) -> DialogLine:
	var line := current()
	if line == null:
		return null
	var choices := line.get_choices()
	if choice_index < 0 or choice_index >= choices.size():
		return line
	_go(choices[choice_index].next)
	return current()


## Beendet das Gespräch sofort.
func stop() -> void:
	_index = -1


func _go(target: StringName) -> void:
	if target == DialogLine.END:
		_index = -1
		return
	if target == &"":
		_index += 1
	else:
		_index = dialog.find_line(target)
		if _index < 0:
			push_warning("DialogRunner: Das Sprungziel \"%s\" fehlt in %s - das Gespräch endet." % [target, dialog.resource_path])
			return
	_skip_empty()


func _skip_empty() -> void:
	while _index >= 0 and _index < dialog.lines.size() and dialog.lines[_index] == null:
		_index += 1
