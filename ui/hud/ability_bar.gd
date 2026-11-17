extends HBoxContainer
## AbilityBar - die Fähigkeiten einer Spielfigur als Reihe von Symbolen (M12).
##
## Baut für jedes Kind unter "Abilities" der Figur einen Platz aus slot_scene,
## in derselben Reihenfolge, in der die Tasten 1, 2, 3 belegt sind; unter
## jedem steht die Taste aus key_icons. Was ein Platz zeigt, liest er selbst
## an seiner Fähigkeit ab (ability_slot.gd). Das HUD ruft bind().
## Fähigkeiten, die erst später zur Figur kommen, erscheinen beim nächsten bind().
##
## Abschalten: den Knoten aus hud.tscn löschen.

## Szene eines Platzes.
@export var slot_scene: PackedScene
## Bilder der Tasten, der Reihe nach für Fähigkeit 1, 2, 3 und so weiter.
@export var key_icons: Array[Texture2D] = []


func _ready() -> void:
	visible = false


## Baut die Plätze für die Fähigkeiten dieser Figur; null räumt sie ab.
func bind(player: Node) -> void:
	for slot in get_children():
		remove_child(slot)
		slot.queue_free()
	visible = false
	if player == null or slot_scene == null:
		return
	var holder := player.get_node_or_null("Abilities")
	if holder == null:
		return
	for index in holder.get_child_count():
		var ability := holder.get_child(index) as Ability
		if ability == null:
			continue
		var slot := slot_scene.instantiate()
		add_child(slot)
		var key: Texture2D = null
		if index < key_icons.size():
			key = key_icons[index]
		slot.call("setup", ability, key)
	visible = get_child_count() > 0
