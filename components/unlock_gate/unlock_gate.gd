class_name UnlockGate
extends Node
## UnlockGate - sperrt an der Spielfigur, was noch nicht freigeschaltet ist (M19).
##
## Benutzung: die Szene unlock_gate.tscn als Kind "Unlocks" an die Spielfigur
## hängen. Die Figur fragt hier vor Dash, Schuss und Schleichen und vor jeder
## Fähigkeit nach; ist es gesperrt, bewirkt die Taste nichts. Das HUD fragt
## ebenso und zeigt nur, was frei ist. Welche Freischaltung was braucht:
## dash_unlock, ranged_unlock und sneak_unlock hier, eine Fähigkeit nennt es
## selbst (Ability.unlock_id). Die Kennungen stehen in data/unlocks/unlocks.tres.
## Er entscheidet nichts - was frei ist, weiß GameState. Ändert es sich, sendet
## er changed. Ohne GameState ist alles frei, wie vor M19.
##
## Abschalten: Knoten von der Figur löschen - alles ist frei, wie vor M19.

## Die Freischaltungen haben sich geändert; wer sperrt oder anzeigt, fragt neu nach.
signal changed

## Freischaltung, die der Dash braucht. Leer: immer frei.
@export var dash_unlock: StringName = &"dash"
## Freischaltung, die der Fernkampf braucht. Leer: immer frei.
@export var ranged_unlock: StringName = &"ranged"
## Freischaltung, die das Schleichen braucht. Leer: immer frei.
@export var sneak_unlock: StringName = &"sneak"


func _ready() -> void:
	EventBus.unlocks_changed.connect(_on_unlocks_changed)
	# Neues Spiel, neuer Lauf, Abbruch, Laden: Es gilt ein anderer Stand.
	EventBus.level_run_changed.connect(_on_level_run_changed)


## Ist diese Freischaltung frei? Leer oder ohne GameState: ja.
func is_unlocked(unlock_id: StringName) -> bool:
	if unlock_id == &"":
		return true
	var state := get_node_or_null("/root/GameState")
	if state == null:
		return true
	return bool(state.call("is_unlocked", unlock_id))


## Darf die Figur dashen?
func can_dash() -> bool:
	return is_unlocked(dash_unlock)


## Darf die Figur schießen?
func can_shoot() -> bool:
	return is_unlocked(ranged_unlock)


## Darf die Figur schleichen?
func can_sneak() -> bool:
	return is_unlocked(sneak_unlock)


## Darf die Figur diese Fähigkeit einsetzen? Was sie braucht, sagt ihr unlock_id.
func can_use(ability: Node) -> bool:
	if ability == null:
		return false
	var needed: Variant = ability.get("unlock_id")
	if not (needed is StringName or needed is String):
		return true
	return is_unlocked(StringName(needed))


func _on_unlocks_changed(_unlock_id: StringName, _reason: String) -> void:
	changed.emit()


func _on_level_run_changed(_level_id: String, _event: String) -> void:
	changed.emit()
