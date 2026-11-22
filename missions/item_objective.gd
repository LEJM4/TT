class_name ItemObjective
extends MissionObjective
## ItemObjective - Ziel: Eine Spielfigur trägt so viele eines Gegenstands wie count (M17).
##
## Etwa "Äste" mit data/items/branch.tres und count 2. Gezählt wird jedes Mal neu
## aus dem Inventar: Sinkt die Zahl, sinkt der Stand mit, solange die Mission
## nicht abgegeben ist. Es zählt die Figur, die die meisten davon trägt.
## Mit take_on_hand_in nimmt der MissionTracker die Gegenstände bei der Abgabe
## aus dem Inventar der Figur, die abgibt.

## Der Gegenstand, etwa data/items/branch.tres.
@export var item: ItemData
## Nimmt der Auftraggeber die Gegenstände bei der Abgabe?
@export var take_on_hand_in := true


func get_item() -> ItemData:
	return item


func takes_items() -> bool:
	return item != null and take_on_hand_in


func _check_kind() -> PackedStringArray:
	if item == null:
		return PackedStringArray(["hat keinen Gegenstand"])
	return PackedStringArray()
