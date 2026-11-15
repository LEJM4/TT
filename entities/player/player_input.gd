extends IntentSource
## PlayerInput - übersetzt Tastatur und Maus in Absichten (lokaler Spieler).
##
## Liest die Aktionen aus InputSetup und füllt die Felder von IntentSource.
## Der Knoten läuft vor der Figur (process_physics_priority = -1 in player.tscn),
## damit sie im selben Bild die frischen Absichten liest.


func _physics_process(_delta: float) -> void:
	move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	wants_sprint = Input.is_action_pressed("sprint")
	wants_sneak = Input.is_action_pressed("sneak")
