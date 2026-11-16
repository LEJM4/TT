extends IntentSource
## PlayerInput - übersetzt Tastatur und Maus in Absichten (lokaler Spieler).
##
## Liest die Aktionen aus InputSetup und füllt die Felder von IntentSource.
## Die Zielrichtung zeigt von der Figur zum Mauszeiger.
## Der Knoten läuft vor der Figur (process_physics_priority = -1 in player.tscn),
## damit sie im selben Bild die frischen Absichten liest.

## Näher als so viele Pixel an der Figur ändert die Maus die Zielrichtung nicht.
const AIM_DEAD_ZONE := 1.0


func _physics_process(_delta: float) -> void:
	move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	wants_sprint = Input.is_action_pressed("sprint")
	wants_sneak = Input.is_action_pressed("sneak")
	wants_attack = Input.is_action_pressed("attack_primary")
	var body := get_parent() as Node2D
	if body == null:
		return
	var to_mouse := body.get_global_mouse_position() - body.global_position
	if to_mouse.length() > AIM_DEAD_ZONE:
		aim_direction = to_mouse.normalized()
