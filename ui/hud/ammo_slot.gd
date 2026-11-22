extends Panel
## AmmoSlot - das gewählte Geschoss einer Spielfigur mit seiner Anzahl (M12).
##
## Kinder: Icon (TextureRect, das Symbol des Geschosses) und Count (Label, die
## Anzahl im Inventar). Ohne Geschoss bleibt die Zelle leer. Gewählt wird am
## Baustein AmmoSelector der Figur, mit dem Mausrad; die Zelle hört auf seine
## Meldung selection_changed und auf changed des Inventars. Das HUD ruft bind().
## Ist der Fernkampf noch nicht freigeschaltet, fehlt die Zelle (M19); das fragt
## sie das Kind Unlocks der Figur.
##
## Abschalten: den Knoten aus hud.tscn löschen.

var _selector: AmmoSelector
var _inventory: Inventory
var _gate: UnlockGate

@onready var _icon := $Icon as TextureRect
@onready var _count := $Count as Label


func _ready() -> void:
	visible = false


## Zeigt das gewählte Geschoss dieser Figur; null blendet die Zelle aus.
func bind(player: Node) -> void:
	if _selector != null and _selector.selection_changed.is_connected(_on_selection_changed):
		_selector.selection_changed.disconnect(_on_selection_changed)
	if _inventory != null and _inventory.changed.is_connected(_refresh):
		_inventory.changed.disconnect(_refresh)
	if _gate != null and is_instance_valid(_gate) and _gate.changed.is_connected(_update_visibility):
		_gate.changed.disconnect(_update_visibility)
	_selector = null
	_inventory = null
	_gate = null
	if player != null:
		_selector = player.get_node_or_null("AmmoSelector") as AmmoSelector
		_inventory = player.get_node_or_null("Inventory") as Inventory
		_gate = player.get_node_or_null("Unlocks") as UnlockGate
	_update_visibility()
	if _selector == null:
		return
	if _gate != null:
		_gate.changed.connect(_update_visibility)
	_selector.selection_changed.connect(_on_selection_changed)
	if _inventory != null:
		_inventory.changed.connect(_refresh)
	_refresh()


func _on_selection_changed(_item: AmmoData) -> void:
	_refresh()


# Sichtbar mit Geschoss-Wahl, und nur, wenn der Fernkampf frei ist (M19).
func _update_visibility() -> void:
	var free := _gate == null or not is_instance_valid(_gate) or _gate.can_shoot()
	visible = _selector != null and free


func _refresh() -> void:
	if _selector == null or not is_instance_valid(_selector):
		return
	var item := _selector.selected
	if item == null:
		_icon.texture = null
		_count.text = ""
		return
	_icon.texture = item.icon
	_count.text = str(_selector.get_selected_count())
