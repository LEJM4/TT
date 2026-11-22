class_name MissionList
extends Resource
## MissionList - die Missionen-Datei eines Levels (M17), etwa data/missions/test_chamber.tres.
##
## Alle Missionen eines Levels stehen hier beisammen: Wer ein Level baut, sieht
## sie auf einen Blick, und das Level braucht nur diese eine Datei - eingetragen
## beim MissionTracker. Jede Mission ist ein Eintrag mit eigenem Namen (id); die
## Namen müssen im Level eindeutig sein. Neue Missionen entstehen im Inspektor,
## ohne Code. Fehler wie doppelte Namen oder Ziele ohne Ereignis findet check();
## der MissionTracker schreibt sie beim Start ins Ausgabefenster.
## Missionen, die zu keinem Level gehören - etwa in der Zeitkapsel (M18) -,
## bekommen eine eigene Datei im selben Format.

## Die Missionen des Levels, in der Reihenfolge der Anzeige.
@export var missions: Array[MissionData] = []


## Die Mission mit diesem Namen; null, wenn es keine gibt.
func find(mission_id: StringName) -> MissionData:
	if mission_id == &"":
		return null
	for mission in missions:
		if mission != null and mission.id == mission_id:
			return mission
	return null


## Prüft die Datei und liefert die Fehler als Sätze; leer heißt: alles gut.
func check() -> PackedStringArray:
	var problems := PackedStringArray()
	var names := {}
	for index in missions.size():
		var mission := missions[index]
		if mission == null:
			problems.append("Mission %d ist leer." % (index + 1))
			continue
		if mission.id == &"":
			problems.append("Mission %d hat keinen Namen." % (index + 1))
		elif names.has(mission.id):
			problems.append("Der Name \"%s\" steht an mehreren Missionen." % mission.id)
		names[mission.id] = true
		problems.append_array(mission.check())
	return problems
