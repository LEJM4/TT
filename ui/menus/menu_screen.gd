class_name MenuScreen
extends CanvasLayer
## MenuScreen - die Grundlage jedes Menüs (M20): Hauptmenü, Spielstand-Auswahl,
## Optionen, Tastenbelegung, Pausenmenü und Nachfragen.
##
## Aufbau einer Menü-Szene: eine eigene Bildebene (CanvasLayer) mit diesem Skript
## oder einem, das davon erbt. Ihr Kind "Root" ist ein Control über das ganze Bild
## mit dem Thema ui/menus/menu_theme.tres, darin "Window", der Holzrahmen mit den
## Bedienelementen; er steht immer in der Mitte, auf ganzen Pixeln. Menüs, die
## dieses Menü öffnet, hängen neben "Root".
## open() zeigt das Menü, close() schließt es. Esc ruft back(), das ist sonst
## dasselbe wie close().
##
## Bedienen geht mit Maus und Tastatur:
##   Pfeil hoch, Pfeil runter, W, S   voriges oder nächstes Bedienelement
##   Pfeil links, rechts, A, D        ebenso; an einem Schieberegler: weniger, mehr
##   Tab, Umschalt+Tab                nächstes, voriges Bedienelement
##   Enter, Leertaste                 drücken
##   Esc                              zurück
## Die Maus über einem Bedienelement wählt es aus. Was nur mit der Maus gehen
## soll - etwa das Lösch-Symbol der Spielstände -, hat focus_mode "None": Die
## Tastatur erreicht es nicht. Liegt die Maus darauf, ist nichts anderes gewählt -
## Enter drückt dann nichts -, danach wieder, was vorher gewählt war.
## open_child(menü) öffnet ein anderes Menü darüber. Das eigene Fenster ist
## solange ausgeblendet - mit keep_window bleibt es stehen -, danach ist wieder
## das Bedienelement gewählt, das es geöffnet hat.
## Solange ein Menü offen ist, meldet es das über den EventBus (menu_changed): Die
## Figur mit player_id bleibt stehen. Menüs laufen auch bei angehaltenem Spiel
## (process_mode "Always").

## Das Menü ist aufgegangen.
signal opened
## Das Menü ist zugegangen.
signal closed

## Nummer der Spielfigur, zu der das Menü gehört; sie bleibt stehen, solange es offen ist.
@export var player_id := 1
## Geht das Menü beim Start von selbst auf?
@export var open_on_start := false
## Bedienelement, das beim Öffnen gewählt ist. Leer: das erste.
@export var first_focus: NodePath
## Das Fenster steht so viele Pixel neben der Mitte des Bildes, etwa (0, 52).
@export var window_offset := Vector2i.ZERO

var _child: MenuScreen
var _return_focus: Control
var _focus_before_mouse_only: Control
var _hooked := {}
var _centering := false

@onready var _root := $Root as Control
@onready var _window := get_node_or_null("Root/Window") as Control


func _ready() -> void:
	# Menüs laufen auch, wenn das Spiel angehalten ist.
	process_mode = Node.PROCESS_MODE_ALWAYS
	_root.visible = false
	if _window != null:
		_window.resized.connect(_center_window)
	if open_on_start:
		open.call_deferred()


func _input(event: InputEvent) -> void:
	if not is_open() or has_open_child() or not _accepts_input():
		return
	if _pressed(event, &"pause") or _pressed(event, &"ui_cancel"):
		get_viewport().set_input_as_handled()
		back()
		return
	var vertical := _direction(event, [&"ui_up", &"move_up", &"ui_focus_prev"], [&"ui_down", &"move_down", &"ui_focus_next"])
	var side := _direction(event, [&"ui_left", &"move_left"], [&"ui_right", &"move_right"])
	if vertical == 0 and side == 0:
		return
	get_viewport().set_input_as_handled()
	var focused := get_viewport().gui_get_focus_owner()
	if side != 0 and focused is Slider and _root.is_ancestor_of(focused):
		var slider := focused as Slider
		slider.value += side * maxf(slider.step, 1.0)
		return
	_move_focus(vertical if vertical != 0 else side)


## Ist das Menü offen?
func is_open() -> bool:
	return _root.visible


## Zeigt das Menü und wählt das erste Bedienelement.
func open() -> void:
	if is_open():
		return
	_root.visible = true
	if _window != null:
		_window.visible = true
	_before_open()
	_hook_controls()
	_center_window()
	_center_window.call_deferred()
	_focus_first()
	EventBus.menu_changed.emit(player_id, true)
	opened.emit()


## Schließt das Menü - und vorher ein Menü, das es geöffnet hat.
func close() -> void:
	if not is_open():
		return
	if has_open_child():
		_child.close()
	_root.visible = false
	_return_focus = null
	EventBus.menu_changed.emit(player_id, false)
	closed.emit()


## Zurück, etwa mit Esc: schließt das Menü. Erbende Menüs ändern das.
func back() -> void:
	close()


## Öffnet ein anderes Menü über diesem. Mit keep_window bleibt das eigene Fenster
## stehen, etwa unter einer Nachfrage; sonst ist es ausgeblendet, bis das andere zu ist.
func open_child(child: MenuScreen, keep_window := false) -> void:
	if child == null or not is_open() or has_open_child():
		return
	_return_focus = get_viewport().gui_get_focus_owner()
	if _return_focus == null:
		# Geöffnet mit einem Knopf nur für die Maus: zurück zu dem, was vorher gewählt war.
		_return_focus = _focus_before_mouse_only
	_child = child
	if not child.closed.is_connected(_on_child_closed):
		child.closed.connect(_on_child_closed)
	if _window != null and not keep_window:
		_window.visible = false
	child.open()


## Ist ein Menü offen, das dieses geöffnet hat?
func has_open_child() -> bool:
	return is_instance_valid(_child) and _child.is_open()


## Alle Bedienelemente, die die Tastatur erreicht, in der Reihenfolge der Szene.
func focusable_controls() -> Array[Control]:
	var result: Array[Control] = []
	_collect(_root, result)
	return result


## Wird beim Öffnen aufgerufen, bevor ein Bedienelement gewählt ist - etwa um
## Werte aufzufrischen. Erbende Menüs füllen es.
func _before_open() -> void:
	pass


## Nimmt das Menü gerade Eingaben an? Erbende Menüs sperren es, etwa während das
## Spiel startet.
func _accepts_input() -> bool:
	return true


## Verbindet neue Bedienelemente mit der Maus: Darüber sind sie gewählt. Erbende
## Menüs rufen es auf, wenn sie Bedienelemente neu bauen.
func _hook_controls() -> void:
	var controls: Array[Control] = []
	_collect_hoverable(_root, controls)
	for control in controls:
		var id := control.get_instance_id()
		if _hooked.has(id):
			continue
		_hooked[id] = true
		control.mouse_entered.connect(_on_control_hovered.bind(control))
		control.mouse_exited.connect(_on_control_left.bind(control))


## Wählt first_focus, sonst das erste Bedienelement.
func _focus_first() -> void:
	var target: Control = null
	if not first_focus.is_empty():
		target = get_node_or_null(first_focus) as Control
	if not _can_focus(target):
		var list := focusable_controls()
		target = list[0] if not list.is_empty() else null
	if target != null:
		target.grab_focus()


func _on_child_closed() -> void:
	_child = null
	if not is_open():
		return
	if _window != null:
		_window.visible = true
	_hook_controls()
	var target := _return_focus
	_return_focus = null
	if _can_focus(target):
		target.grab_focus()
	else:
		_focus_first()


# Die Maus ist über einem Bedienelement: Es ist gewählt. Ein Knopf nur für die
# Maus nimmt die Wahl solange weg - Enter drückt dann nichts.
func _on_control_hovered(control: Control) -> void:
	if not is_open() or has_open_child() or not _accepts_input():
		return
	if _can_focus(control):
		control.grab_focus()
	elif _is_mouse_only(control):
		var focused := get_viewport().gui_get_focus_owner()
		if focused != null and _root.is_ancestor_of(focused):
			_focus_before_mouse_only = focused
			focused.release_focus()


# Die Maus hat einen Knopf nur für die Maus verlassen: wieder gewählt, was vorher gewählt war.
func _on_control_left(control: Control) -> void:
	if not _is_mouse_only(control):
		return
	var target := _focus_before_mouse_only
	_focus_before_mouse_only = null
	if not is_open() or has_open_child():
		return
	if get_viewport().gui_get_focus_owner() == null and _can_focus(target):
		target.grab_focus()


func _move_focus(step: int) -> void:
	var list := focusable_controls()
	if list.is_empty():
		return
	var index := list.find(get_viewport().gui_get_focus_owner())
	if index < 0:
		index = 0 if step > 0 else list.size() - 1
	else:
		index = wrapi(index + step, 0, list.size())
	list[index].grab_focus()


func _collect(node: Node, result: Array[Control]) -> void:
	for child in node.get_children():
		var control := child as Control
		if control == null or not control.visible:
			continue
		if _can_focus(control):
			result.append(control)
		_collect(control, result)


# Alles, worauf die Maus wirkt: was die Tastatur erreicht, und alle Knöpfe.
func _collect_hoverable(node: Node, result: Array[Control]) -> void:
	for child in node.get_children():
		var control := child as Control
		if control == null:
			continue
		if control.focus_mode == Control.FOCUS_ALL or control is BaseButton:
			result.append(control)
		_collect_hoverable(control, result)


# Ein Knopf, den nur die Maus erreicht, etwa das Lösch-Symbol?
func _is_mouse_only(control: Control) -> bool:
	return is_instance_valid(control) and control is BaseButton and control.focus_mode == Control.FOCUS_NONE


func _can_focus(control: Control) -> bool:
	if not is_instance_valid(control) or not control.is_visible_in_tree():
		return false
	if control.focus_mode != Control.FOCUS_ALL:
		return false
	return not (control is BaseButton and (control as BaseButton).disabled)


# Das Fenster in die Mitte, auf ganze Pixel, so groß wie sein Inhalt.
func _center_window() -> void:
	if _window == null or _centering:
		return
	_centering = true
	_window.reset_size()
	_window.position = ((_root.size - _window.size) * 0.5).floor() + Vector2(window_offset)
	_centering = false


# -1 für eine Aktion aus backward, 1 für eine aus forward, sonst 0. Halten wiederholt.
func _direction(event: InputEvent, backward: Array[StringName], forward: Array[StringName]) -> int:
	for action in backward:
		if _pressed(event, action, true):
			return -1
	for action in forward:
		if _pressed(event, action, true):
			return 1
	return 0


func _pressed(event: InputEvent, action: StringName, allow_echo := false) -> bool:
	return InputMap.has_action(action) and event.is_action_pressed(action, allow_echo)
