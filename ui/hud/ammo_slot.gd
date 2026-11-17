extends Panel
## AmmoSlot - das gewählte Geschoss einer Spielfigur mit seiner Anzahl (M12).
##
## Kinder: Icon (TextureRect, das Symbol des Geschosses) und Count (Label, die
## Anzahl im Inventar). Ohne Geschoss bleibt die Zelle leer. Gewählt wird am
## Baustein AmmoSelector der Figur, mit dem Mausrad; die Zelle hört auf seine
## Meldung selection_changed und auf changed des Inventars. Das HUD ruft bind().
##
## Abschalten: den Knoten aus hud.tscn löschen.

var _selector: AmmoSelector
var _inventory: Inventory

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
	_selector = null
	_inventory = null
	if player != null:
		_selector = player.get_node_or_null("AmmoSelector") as AmmoSelector
		_inventory = player.get_node_or_null("Inventory") as Inventory
	visible = _selector != null
	if _selector == null:
		return
	_selector.selection_changed.connect(_on_selection_changed)
	if _inventory != null:
		_inventory.changed.connect(_refresh)
	_refresh()


func _on_selection_changed(_item: AmmoData) -> void:
	_refresh()


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
