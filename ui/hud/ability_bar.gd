extends HBoxContainer
## AbilityBar - die Fähigkeiten einer Spielfigur als Reihe von Symbolen (M12).
##
## Baut für jedes Kind unter "Abilities" der Figur einen Platz aus slot_scene,
## in derselben Reihenfolge, in der die Tasten 1, 2, 3 belegt sind; unter
## jedem steht die Taste aus key_icons. Was ein Platz zeigt, liest er selbst
## an seiner Fähigkeit ab (ability_slot.gd). Das HUD ruft bind().
## Fähigkeiten, die erst später zur Figur kommen, erscheinen beim nächsten bind().
## Gesperrte Fähigkeiten fehlen, bis sie freigeschaltet sind (M19): Die Reihe
## fragt das Kind Unlocks der Figur und hört auf dessen Meldung changed.
##
## Abschalten: den Knoten aus hud.tscn löschen.

## Szene eines Platzes.
@export var slot_scene: PackedScene
## Bilder der Tasten, der Reihe nach für Fähigkeit 1, 2, 3 und so weiter.
@export var key_icons: Array[Texture2D] = []

var _gate: UnlockGate


func _ready() -> void:
	visible = false


## Baut die Plätze für die Fähigkeiten dieser Figur; null räumt sie ab.
func bind(player: Node) -> void:
	if _gate != null and is_instance_valid(_gate) and _gate.changed.is_connected(_refresh_unlocks):
		_gate.changed.disconnect(_refresh_unlocks)
	_gate = null
	for slot in get_children():
		remove_child(slot)
		slot.queue_free()
	visible = false
	if player == null or slot_scene == null:
		return
	var holder := player.get_node_or_null("Abilities")
	if holder == null:
		return
	_gate = player.get_node_or_null("Unlocks") as UnlockGate
	if _gate != null:
		_gate.changed.connect(_refresh_unlocks)
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
		slot.set_meta("ability", ability)
	_refresh_unlocks()


# Zeigt nur die Plätze, deren Fähigkeit frei ist (M19).
func _refresh_unlocks() -> void:
	var gate := _gate if _gate != null and is_instance_valid(_gate) else null
	var shown := false
	for slot in get_children():
		var ability: Variant = slot.get_meta("ability", null)
		var free := gate == null or (is_instance_valid(ability) and gate.can_use(ability as Node))
		(slot as CanvasItem).visible = free
		shown = shown or free
	visible = shown
