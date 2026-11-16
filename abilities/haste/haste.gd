extends Ability
## Haste - die Fähigkeit Schnelligkeit: schneller laufen und angreifen (M7).
##
## Solange sie wirkt, setzt sie bei der Figur den Wert "speed_factor" und bei
## deren Kindern den Wert "rate_factor" - wer einen solchen Wert hat, wird
## schneller, alle anderen bleiben unberührt.

func _begin_effect() -> void:
	_apply(_factor())


func _end_effect() -> void:
	_apply(1.0)


func _factor() -> float:
	var haste_stats := stats as HasteStats
	if haste_stats == null:
		return 1.0
	return haste_stats.speed_factor


func _apply(factor: float) -> void:
	var user := get_user()
	if not is_instance_valid(user):
		return
	if user.get("speed_factor") != null:
		user.set("speed_factor", factor)
	for child in user.get_children():
		if child.get("rate_factor") != null:
			child.set("rate_factor", factor)
