class_name MissionData
extends Resource
## MissionData - eine Mission: Name, Titel, Ziele und Belohnung (M17), seit M19 auch Freischaltungen.
##
## Steht in der Missionen-Datei eines Levels (MissionList). Spielstand und
## Gespräche nennen sie über ihren Namen id, nicht über einen Dateipfad - so
## bleibt ein Spielstand gültig, wenn die Datei umgebaut wird.
## Pflichtmissionen (required) öffnen zusammen den Weg aus dem Level, Neben-
## missionen sind freiwillig. Eine Mission beginnt mit dem Level
## (starts_with_level) oder, wenn eine Gesprächszeile sie startet
## (DialogLine.start_mission). Sind alle Ziele erfüllt, ist sie erfüllt - mit
## hand_in erst, wenn eine Gesprächszeile sie abgibt (DialogLine.hand_in_mission),
## meist bei einem Auftraggeber (QuestGiver). Bis dahin ist sie bereit.
## Ob sie läuft, bereit oder erfüllt ist, entscheidet der MissionTracker.

## Zeichen, die die Schrift im Spiel nicht kennt.
const UNKNOWN_CHARACTERS: Array[String] = ["ß", "„", "–", "…"]

## Name der Mission: englisch, klein, im Level eindeutig, etwa "branches".
@export var id: StringName = &""
## Titel in der Anzeige, etwa "Holz für das Feuer".
@export var title := ""
## Beschreibung für das Missionsfenster, das mit den Menüs (M20) kommt. Darf leer bleiben.
@export_multiline var description := ""
## Pflichtmission? Erst wenn alle erfüllt sind, öffnet sich der Weg aus dem Level.
@export var required := false
## Beginnt sie mit dem Level? Sonst startet sie eine Gesprächszeile.
@export var starts_with_level := false
## Muss sie abgegeben werden, etwa bei einem Auftraggeber? Sonst ist sie
## erfüllt, sobald alle Ziele erfüllt sind.
@export var hand_in := false
## Die Ziele; alle müssen erfüllt sein.
@export var objectives: Array[MissionObjective] = []
## Belohnung: Sie springt vor der Spielfigur auf den Boden. Leer: keine.
@export var reward: LootTable
## Freischaltungen als Belohnung (M19), etwa "haste" - die Kennungen stehen in
## data/unlocks/unlocks.tres. Ob sie frei werden, entscheidet GameState. Leer: keine.
@export var reward_unlocks: Array[StringName] = []


## Hat die Mission ein Ziel, das Gegenstände zählt?
func has_item_objectives() -> bool:
	for objective in objectives:
		if objective != null and objective.get_item() != null:
			return true
	return false


## Prüft die Mission und liefert die Fehler als Sätze; leer heißt: alles gut.
## Den Namen prüft die Missionen-Datei, weil er dort eindeutig sein muss.
func check() -> PackedStringArray:
	var problems := PackedStringArray()
	var label := "Mission \"%s\"" % id
	if title.strip_edges().is_empty():
		problems.append("%s hat keinen Titel." % label)
	problems.append_array(_check_text(title, "%s: Der Titel" % label))
	if objectives.is_empty():
		problems.append("%s hat keine Ziele." % label)
	for index in objectives.size():
		var objective := objectives[index]
		if objective == null:
			problems.append("%s: Ziel %d ist leer." % [label, index + 1])
			continue
		for problem in objective.check():
			problems.append("%s: Ziel %d %s." % [label, index + 1, problem])
		problems.append_array(_check_text(objective.text, "%s: Der Text von Ziel %d" % [label, index + 1]))
	return problems


# Meldet Zeichen, die die Schrift nicht kennt.
func _check_text(value: String, what: String) -> PackedStringArray:
	var problems := PackedStringArray()
	for character in UNKNOWN_CHARACTERS:
		if value.contains(character):
			problems.append("%s enthält \"%s\" - das kennt die Schrift nicht." % [what, character])
	return problems
