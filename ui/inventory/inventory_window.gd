extends CanvasLayer
## InventoryWindow - das Inventarfenster: Plätze, Ausrüstung, Angaben (M11).
##
## Tab öffnet und schließt es, Esc schließt es. Es zeigt die Plätze aus dem
## Inventory der Spielfigur mit player_id als Raster, links ihre vier
## Ausrüstungsplätze aus dem Baustein Equipment und unten Name, Art und Werte des
## gewählten Gegenstands. Ein Klick wählt; ein Doppelklick legt Ausrüstung an
## oder ab. Das Fenster entscheidet nichts: Es fragt bei Equipment an.
## Solange es offen ist, meldet es das über den EventBus (menu_changed): Die Figur
## bleibt stehen, die Welt läuft weiter. Aussehen: ui/theme/wood_theme.tres.
##
## Abschalten: Knoten aus dem Level löschen - Tab tut dann nichts.

## Plätze je Zeile im Raster.
const COLUMNS := 5
## Kantenlänge einer Zelle in Pixeln.
const CELL_SIZE := 26
## Abstand von Zelle zu Zelle im Raster, in Pixeln.
const CELL_STEP := 28
## Abstand von Ausrüstungsplatz zu Ausrüstungsplatz, in Pixeln.
const EQUIP_STEP := 30
## Hinweis, solange nichts gewählt ist.
const HINT_NOTHING := "Klick: wählen, Doppelklick: anlegen"

## Nummer des Spielers, dessen Inventar das Fenster zeigt.
@export var player_id := 1

var _inventory: Inventory
var _equipment: Equipment
var _slot_cells: Array[Panel] = []
var _equip_cells: Array[Panel] = []
# Was gewählt ist: "slot" (Platz im Inventar), "equip" (Ausrüstungsplatz) oder "".
var _selected_kind := ""
var _selected_index := -1
# Meldung nach einem Versuch, der nicht ging, etwa "Kein Platz im Inventar".
var _message := ""

@onready var _root := $Root as Control
@onready var _grid := $Root/Frame/Interior/Grid as Control
@onready var _equip_box := $Root/Frame/Interior/EquipmentSlots as Control
@onready var _info_name := $Root/Frame/Interior/InfoName as Label
@onready var _info_text := $Root/Frame/Interior/InfoText as Label
@onready var _info_hint := $Root/Frame/Interior/InfoHint as Label


func _ready() -> void:
	_root.visible = false
	_build_equipment_cells()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		toggle()
		get_viewport().set_input_as_handled()
	elif is_open() and event.is_action_pressed("pause"):
		close()
		get_viewport().set_input_as_handled()


## Ist das Fenster offen?
func is_open() -> bool:
	return _root.visible


## Öffnet das Fenster, wenn es zu ist, und schließt es sonst.
func toggle() -> void:
	if is_open():
		close()
	else:
		open()


## Öffnet das Fenster für die Spielfigur mit player_id.
func open() -> void:
	if is_open():
		return
	_bind()
	_message = ""
	_root.visible = true
	_refresh()
	EventBus.menu_changed.emit(player_id, true)


## Schließt das Fenster; die Figur nimmt wieder Eingaben an.
func close() -> void:
	if not is_open():
		return
	_root.visible = false
	EventBus.menu_changed.emit(player_id, false)


# Sucht die Spielfigur und hört auf ihr Inventar und ihre Ausrüstung.
func _bind() -> void:
	var inventory: Inventory = null
	var equipment: Equipment = null
	var player := _find_player()
	if player != null:
		inventory = player.get_node_or_null("Inventory") as Inventory
		equipment = player.get_node_or_null("Equipment") as Equipment
	if inventory != _inventory or _slot_cells.is_empty():
		if is_instance_valid(_inventory) and _inventory.changed.is_connected(_refresh):
			_inventory.changed.disconnect(_refresh)
		_inventory = inventory
		if _inventory != null:
			_inventory.changed.connect(_refresh)
		_build_slot_cells()
	if equipment != _equipment:
		if is_instance_valid(_equipment) and _equipment.changed.is_connected(_on_equipment_changed):
			_equipment.changed.disconnect(_on_equipment_changed)
		_equipment = equipment
		if _equipment != null:
			_equipment.changed.connect(_on_equipment_changed)


func _find_player() -> Node:
	for node in get_tree().get_nodes_in_group("players"):
		if node.get("player_id") == player_id:
			return node
	return null


func _build_slot_cells() -> void:
	for cell in _slot_cells:
		cell.queue_free()
	_slot_cells.clear()
	var count := 0
	if _inventory != null:
		count = _inventory.get_slot_count()
	for index in count:
		var column := index % COLUMNS
		var row := floori(index / float(COLUMNS))
		var cell := _make_cell(_grid, Vector2(column * CELL_STEP, row * CELL_STEP))
		cell.gui_input.connect(_on_cell_input.bind("slot", index))
		_slot_cells.append(cell)


func _build_equipment_cells() -> void:
	for slot in EquipmentData.SLOT_NAMES.size():
		var top := float(slot * EQUIP_STEP)
		var cell := _make_cell(_equip_box, Vector2(0.0, top))
		cell.gui_input.connect(_on_cell_input.bind("equip", slot))
		_equip_cells.append(cell)
		var label := Label.new()
		label.text = EquipmentData.SLOT_NAMES[slot]
		label.position = Vector2(CELL_SIZE + 5, top + 7)
		label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_equip_box.add_child(label)


# Eine Zelle: Hintergrund, Symbol, Anzahl unten rechts und Rahmen, wenn gewählt.
func _make_cell(parent: Control, at: Vector2) -> Panel:
	var cell := Panel.new()
	cell.theme_type_variation = &"InventoryCell"
	cell.position = at
	cell.size = Vector2(CELL_SIZE, CELL_SIZE)
	cell.mouse_filter = Control.MOUSE_FILTER_STOP
	var icon := TextureRect.new()
	icon.name = "Icon"
	icon.size = cell.size
	icon.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cell.add_child(icon)
	var count := Label.new()
	count.name = "Count"
	count.theme_type_variation = &"CountLabel"
	count.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	count.position = Vector2(0.0, CELL_SIZE - 13)
	count.size = Vector2(CELL_SIZE - 2, 12)
	count.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cell.add_child(count)
	var focus := Panel.new()
	focus.name = "Focus"
	focus.theme_type_variation = &"InventoryFocus"
	focus.position = Vector2(-2.0, -2.0)
	focus.size = cell.size + Vector2(4.0, 4.0)
	focus.mouse_filter = Control.MOUSE_FILTER_IGNORE
	focus.visible = false
	cell.add_child(focus)
	parent.add_child(cell)
	return cell


func _on_cell_input(event: InputEvent, kind: String, index: int) -> void:
	var click := event as InputEventMouseButton
	if click == null or not click.pressed or click.button_index != MOUSE_BUTTON_LEFT:
		return
	if click.double_click:
		_use(kind, index)
	else:
		_select(kind, index)


func _on_equipment_changed(_slot: int, _item: EquipmentData) -> void:
	_refresh()


func _select(kind: String, index: int) -> void:
	_selected_kind = kind
	_selected_index = index
	_message = ""
	_refresh()


# Doppelklick: Ausrüstung anlegen oder ablegen - entscheiden tut Equipment.
func _use(kind: String, index: int) -> void:
	_select(kind, index)
	if _equipment == null:
		return
	if kind == "slot":
		var gear := _slot_item(index) as EquipmentData
		if gear == null:
			return
		if _equipment.equip(gear):
			_select("equip", gear.slot)
		else:
			_message = "Kein Platz im Inventar"
	elif kind == "equip" and _equipment.get_item(index) != null:
		if not _equipment.unequip(index):
			_message = "Kein Platz im Inventar"
	_refresh()


func _refresh() -> void:
	if not is_open():
		return
	for index in _slot_cells.size():
		_show_cell(_slot_cells[index], _slot_item(index), _slot_count(index))
		_show_focus(_slot_cells[index], _selected_kind == "slot" and _selected_index == index)
	for slot in _equip_cells.size():
		var gear: EquipmentData = null
		if _equipment != null:
			gear = _equipment.get_item(slot)
		_show_cell(_equip_cells[slot], gear, 1)
		_show_focus(_equip_cells[slot], _selected_kind == "equip" and _selected_index == slot)
	_show_info()


func _show_cell(cell: Panel, item: ItemData, count: int) -> void:
	var icon := cell.get_node("Icon") as TextureRect
	var label := cell.get_node("Count") as Label
	if item == null:
		icon.texture = null
		label.text = ""
		return
	icon.texture = item.icon
	label.text = str(count) if count > 1 else ""


func _show_focus(cell: Panel, selected: bool) -> void:
	(cell.get_node("Focus") as CanvasItem).visible = selected


func _show_info() -> void:
	var item := _selected_item()
	if item == null:
		_info_name.text = ""
		_info_text.text = ""
		_info_hint.text = _message if not _message.is_empty() else HINT_NOTHING
		return
	_info_name.text = item.display_name
	_info_text.text = _describe(item)
	if not _message.is_empty():
		_info_hint.text = _message
	elif item is EquipmentData:
		_info_hint.text = "Doppelklick: ablegen" if _selected_kind == "equip" else "Doppelklick: anlegen"
	else:
		_info_hint.text = "Anzahl %d" % _slot_count(_selected_index)


# Art und Werte als eine Zeile.
func _describe(item: ItemData) -> String:
	if item is EquipmentData:
		var gear := item as EquipmentData
		var values := gear.describe()
		if values.is_empty():
			return gear.get_slot_name()
		return "%s - %s" % [gear.get_slot_name(), values]
	var kind := ItemData.CATEGORY_NAMES[item.category]
	var ammo := item as AmmoData
	if ammo != null and ammo.shot != null:
		if ammo.shot.damage > 0.0:
			return "%s - Geschoss, Schaden %d" % [kind, roundi(ammo.shot.damage)]
		return "%s - Geschoss, Explosion %d" % [kind, roundi(ammo.shot.explosion_damage)]
	return kind


func _selected_item() -> ItemData:
	if _selected_kind == "slot":
		return _slot_item(_selected_index)
	if _selected_kind == "equip" and _equipment != null and _selected_index >= 0:
		return _equipment.get_item(_selected_index)
	return null


func _slot_item(index: int) -> ItemData:
	if _inventory == null or index < 0 or index >= _inventory.get_slot_count():
		return null
	return _inventory.get_slots()[index]["item"] as ItemData


func _slot_count(index: int) -> int:
	if _inventory == null or index < 0 or index >= _inventory.get_slot_count():
		return 0
	return int(_inventory.get_slots()[index]["count"])
