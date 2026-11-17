extends Ability
## Invisibility - die Fähigkeit Unsichtbarkeit (M7).
##
## Solange sie wirkt, ist das Bild der Figur durchscheinend und die Figur
## steht in der Gruppe "invisible". Gegner sollen Figuren aus dieser Gruppe
## nicht wahrnehmen; das folgt mit den Gegnern in Phase 3, ebenso der
## Bonus-Schaden für einen Angriff aus der Unsichtbarkeit.

## Gruppe, in der die Figur steht, solange sie unsichtbar ist.
const GROUP := "invisible"

## Namen der Kinder der Figur, die ihr Bild malen und durchscheinend werden.
## Fehlt eines, wird es übersprungen (A1: CharacterView dazu).
@export var view_names := PackedStringArray(["CharacterView", "PlaceholderView"])


func _begin_effect() -> void:
	var user := get_user()
	if not is_instance_valid(user):
		return
	user.add_to_group(GROUP)
	_set_view_alpha(_alpha())


func _end_effect() -> void:
	var user := get_user()
	if not is_instance_valid(user):
		return
	if user.is_in_group(GROUP):
		user.remove_from_group(GROUP)
	_set_view_alpha(1.0)


func _alpha() -> float:
	var own_stats := stats as InvisibilityStats
	if own_stats == null:
		return 0.3
	return own_stats.alpha


func _set_view_alpha(alpha: float) -> void:
	var user := get_user()
	for view_name in view_names:
		var view := user.get_node_or_null(view_name) as CanvasItem
		if view == null:
			continue
		var tint := view.modulate
		tint.a = alpha
		view.modulate = tint
