class_name UnlockSettings
extends Resource
## UnlockSettings - alle Freischaltungen des Spiels und die Texte dazu (M19).
##
## Die Datei liegt fest unter data/unlocks/unlocks.tres; GameState liest sie.
## Was hier nicht steht, lässt sich nicht sperren - eine Kennung, die niemand
## kennt, gilt als frei. Neue Freischaltung: einen Eintrag in unlocks ergänzen
## und ihre Kennung dort eintragen, wo sie sperrt - siehe UnlockInfo.

## Zeichen, die die Schrift im Spiel nicht kennt.
const UNKNOWN_CHARACTERS: Array[String] = ["ß", "„", "–", "…"]

## Die Freischaltungen, in der Reihenfolge der Anzeige.
@export var unlocks: Array[UnlockInfo] = []
## Erste Zeile des Hinweises oben in der Mitte, wenn etwas frei wird.
@export var notice_kind := "Neu freigeschaltet"
## Zweite Zeile, wenn auf einmal alles frei wird (Pos1 im Debug-Build).
@export var notice_all := "Alles"


## Die Freischaltung mit dieser Kennung; null, wenn es sie nicht gibt.
func find(unlock_id: StringName) -> UnlockInfo:
	if unlock_id == &"":
		return null
	for info in unlocks:
		if info != null and info.id == unlock_id:
			return info
	return null


## Prüft die Datei und liefert die Fehler als Sätze; leer heißt: alles gut.
func check() -> PackedStringArray:
	var problems := PackedStringArray()
	var seen := {}
	for index in unlocks.size():
		var info := unlocks[index]
		if info == null:
			problems.append("Eintrag %d ist leer." % (index + 1))
			continue
		if info.id == &"":
			problems.append("Eintrag %d hat keine Kennung." % (index + 1))
		elif seen.has(info.id):
			problems.append("Die Kennung \"%s\" steht zweimal da." % info.id)
		seen[info.id] = true
		if info.title.strip_edges().is_empty():
			problems.append("\"%s\" hat keinen Namen." % info.id)
		for text in [info.title, info.key_hint]:
			for character in UNKNOWN_CHARACTERS:
				if String(text).contains(character):
					problems.append("\"%s\" enthält \"%s\" - das kennt die Schrift nicht." % [info.id, character])
	for text in [notice_kind, notice_all]:
		for character in UNKNOWN_CHARACTERS:
			if String(text).contains(character):
				problems.append("Ein Hinweis enthält \"%s\" - das kennt die Schrift nicht." % character)
	return problems
