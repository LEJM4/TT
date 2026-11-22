class_name MissionObjective
extends Resource
## MissionObjective - ein Ziel einer Mission: was zu tun ist und wie oft (M17).
##
## Ein Ziel ist erfüllt, sobald sein Stand die Zahl count erreicht. Was zählt,
## bestimmen die Arten, die von diesem Skript erben: EventObjective zählt
## Ereignisse wie "caveman_defeated", ItemObjective Gegenstände im Inventar.
## Neue Arten - etwa "Ort erreichen" - kommen als neue Skripte dazu.
## Teil einer Mission (MissionData). Wie weit es erfüllt ist, entscheidet der
## MissionTracker des Levels.

## Text in der Missionsliste, etwa "Besiege den Höhlenmenschen" oder "Äste".
## Die Schrift kennt kein ß, kein unteres Anführungszeichen, keinen
## Gedankenstrich und keine drei Punkte als ein Zeichen.
@export var text := ""
## So oft muss es geschehen; bei Gegenständen: so viele.
@export_range(1, 999) var count := 1


## Zählt dieses Ziel das Ereignis? Nur EventObjective sagt ja.
func counts_event(_event: StringName) -> bool:
	return false


## Der Gegenstand, den dieses Ziel zählt; null, wenn es keinen zählt.
func get_item() -> ItemData:
	return null


## Nimmt der Auftraggeber die Gegenstände dieses Ziels bei der Abgabe?
func takes_items() -> bool:
	return false


## Prüft das Ziel und liefert die Fehler als Satzteile, etwa "hat keinen Text";
## leer heißt: alles gut.
func check() -> PackedStringArray:
	var problems := PackedStringArray()
	if text.strip_edges().is_empty():
		problems.append("hat keinen Text")
	if count < 1:
		problems.append("verlangt weniger als 1")
	problems.append_array(_check_kind())
	return problems


# Was die Art des Ziels prüft. Das Grundskript zählt nichts.
func _check_kind() -> PackedStringArray:
	return PackedStringArray(["zählt nichts - als Art ein Ereignis-Ziel oder ein Gegenstand-Ziel wählen"])
