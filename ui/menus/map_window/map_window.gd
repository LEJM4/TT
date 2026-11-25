extends MenuScreen
## MapWindow - das Fenster auf M mit zwei Seiten: Karte und Missionen (M20b).
##
## M öffnet es, wenn sonst kein Fenster der Figur offen ist - kein Gespräch, kein
## Inventar, keine Pause - und kein Szenenwechsel läuft; M oder Esc schließt es.
## Oben die Reiter "Karte" und "Missionen": umschalten mit der Maus, mit A und D,
## mit Pfeil links und rechts oder mit Tab. Beim nächsten Öffnen ist die Seite
## gewählt, die zuletzt offen war - bis zum Ende des Spiels.
## Wie beim Inventar läuft die Welt weiter, nur die eigene Figur bleibt stehen
## (menu_changed); im Mehrspieler hat jeder Spieler sein Fenster (player_id).
##
## Karte (MapView): die Räume des Levels (Gruppe "rooms"), davon nur die schon
## erkundeten (GameState.get_visited_rooms, abgelegt vom RoomExplorer) und den, in
## dem die eigene Figur gerade ist - er ist hell. Darauf alle Spielfiguren (Gruppe
## "players") und die Zeitkapsel im Level. Ein Level ohne Räume zeigt seine
## ganze Fläche (camera_bounds_changed). Oben rechts Level und Raum, etwa
## "Testkammer - Halle" - heißt der Raum wie das Level, etwa die Zeitkapsel innen,
## nur einmal; den Namen des Levels nennen die Reisedaten.
## Missionen: alle angenommenen Missionen des Levels, wie der MissionTracker sie
## meldet (mission_list_changed) - Pflicht zuerst, erfüllte zuletzt und blass, je
## Titel, Art und Stand, Beschreibung und Ziele mit Fortschritt wie "Äste 1/2".
## W, S, die Pfeiltasten hoch und runter und das Mausrad blättern.
## Das Fenster entscheidet nichts. Werte in data/ui/map.tres (MapSettings).
##
## Abschalten: Knoten aus dem Level löschen - M tut dann nichts.

## Seite "Karte".
const PAGE_MAP := 0
## Seite "Missionen".
const PAGE_MISSIONS := 1
## Stände, wie der MissionTracker sie meldet, und wie das Fenster sie nennt.
const STATE_TEXTS := {"active": "läuft", "ready": "bereit zur Abgabe", "done": "erfüllt"}
## Stand einer erfüllten Mission.
const DONE := "done"
## Text, wenn das Level keine Missionen hat.
const TEXT_NO_TRACKER := "Hier gibt es keine Missionen."
## Text, wenn noch keine Mission angenommen ist.
const TEXT_NONE_ACCEPTED := "Noch keine Mission angenommen."

## Werte der Karte und der Missionsseite.
@export var settings: MapSettings
## Reisedaten - für den Namen des Levels.
@export var travel: TravelSettings
## Kästchen für ein erfülltes Ziel.
@export var checked_icon: Texture2D
## Kästchen für ein offenes Ziel.
@export var unchecked_icon: Texture2D

## Seite, die beim nächsten Öffnen gewählt ist; gilt bis zum Ende des Spiels.
static var last_page := PAGE_MAP

var _page := PAGE_MAP
var _open_menus := 0
var _level_id := ""
var _level_bounds := Rect2()
var _mission_entries: Array = []
var _has_missions := false
var _capsules: Array[Vector2] = []

@onready var _map_tab := $Root/Window/Interior/Rows/Top/Tabs/MapTab as Button
@onready var _missions_tab := $Root/Window/Interior/Rows/Top/Tabs/MissionsTab as Button
@onready var _place := $Root/Window/Interior/Rows/Top/Place as Label
@onready var _map_page := $Root/Window/Interior/Rows/Pages/MapPage as Control
@onready var _map_view := $Root/Window/Interior/Rows/Pages/MapPage/MapView as MapView
@onready var _missions_page := $Root/Window/Interior/Rows/Pages/MissionsPage as ScrollContainer
@onready var _missions := $Root/Window/Interior/Rows/Pages/MissionsPage/Missions as VBoxContainer


func _ready() -> void:
	super._ready()
	if settings == null:
		push_warning("MapWindow: Keine Werte (MapSettings) - die Karte bleibt leer.")
	_map_view.settings = settings
	_map_tab.pressed.connect(_show_page.bind(PAGE_MAP, false))
	_missions_tab.pressed.connect(_show_page.bind(PAGE_MISSIONS, false))
	EventBus.menu_changed.connect(_on_menu_changed)
	EventBus.camera_bounds_changed.connect(_on_bounds_changed)
	EventBus.mission_list_changed.connect(_on_mission_list_changed)
	EventBus.room_visited.connect(_on_room_visited)
	_level_id = _find_level_id()


func _unhandled_input(event: InputEvent) -> void:
	if is_open() or not _pressed(event, &"map") or not _can_open():
		return
	get_viewport().set_input_as_handled()
	open()


func _input(event: InputEvent) -> void:
	if not is_open() or has_open_child() or not _accepts_input():
		return
	if _pressed(event, &"map") or _pressed(event, &"pause") or _pressed(event, &"ui_cancel"):
		get_viewport().set_input_as_handled()
		back()
		return
	var side := _direction(event, [&"ui_left", &"move_left", &"ui_focus_prev"], [&"ui_right", &"move_right", &"ui_focus_next"])
	if side != 0:
		get_viewport().set_input_as_handled()
		_show_page(wrapi(_page + side, PAGE_MAP, PAGE_MISSIONS + 1))
		return
	var vertical := _direction(event, [&"ui_up", &"move_up"], [&"ui_down", &"move_down"])
	if vertical != 0:
		get_viewport().set_input_as_handled()
		if _page == PAGE_MISSIONS and settings != null:
			_missions_page.scroll_vertical += vertical * settings.scroll_step


func _process(_delta: float) -> void:
	# Die Welt läuft weiter: Figuren können sich bewegen, solange die Karte offen ist.
	if is_open() and _page == PAGE_MAP:
		_refresh_map()


## Die Seite, die gerade offen ist: PAGE_MAP oder PAGE_MISSIONS.
func get_page() -> int:
	return _page


## Kann das Fenster jetzt aufgehen? Nicht über einem anderen Fenster der Figur,
## nicht bei angehaltenem Spiel und nicht während eines Szenenwechsels.
func can_open() -> bool:
	return _can_open()


func _before_open() -> void:
	if _level_id.is_empty():
		_level_id = _find_level_id()
	_find_capsules()
	_refresh_map()
	_rebuild_missions()
	_show_page(last_page, false)


# Gewählt ist der Reiter der offenen Seite, nicht der erste.
func _focus_first() -> void:
	_tab_of(_page).grab_focus()


func _can_open() -> bool:
	if get_tree().paused:
		return false
	if _other_menus() > 0:
		return false
	var manager := get_node_or_null("/root/SceneManager")
	return manager == null or not manager.call("is_changing")


func _show_page(page: int, focus_tab := true) -> void:
	_page = page
	last_page = page
	_map_page.visible = page == PAGE_MAP
	_missions_page.visible = page == PAGE_MISSIONS
	_map_tab.set_pressed_no_signal(page == PAGE_MAP)
	_missions_tab.set_pressed_no_signal(page == PAGE_MISSIONS)
	if page == PAGE_MAP:
		_refresh_map()
	if focus_tab and is_open():
		_tab_of(page).grab_focus()


func _tab_of(page: int) -> Button:
	return _missions_tab if page == PAGE_MISSIONS else _map_tab


# Offene Fenster der eigenen Figur, ohne dieses: Gespräch, Inventar, Pause ...
func _other_menus() -> int:
	return _open_menus - (1 if is_open() else 0)


func _on_menu_changed(id: int, now_open: bool) -> void:
	if id != player_id:
		return
	_open_menus = maxi(_open_menus + (1 if now_open else -1), 0)


func _on_bounds_changed(bounds: Rect2) -> void:
	_level_bounds = bounds


func _on_room_visited(level_id: String, _room_id: String) -> void:
	if level_id == _level_id and is_open():
		_refresh_map()


func _on_mission_list_changed(_level_id_of_list: String, entries: Array) -> void:
	_has_missions = true
	_mission_entries = entries.duplicate(true)
	if is_open():
		_rebuild_missions()


# --- Karte ---

func _refresh_map() -> void:
	var visited := _visited_rooms()
	var me := _find_player(player_id)
	var rooms: Array[Dictionary] = []
	var bounds := Rect2()
	var has_bounds := false
	var here := ""
	for node in get_tree().get_nodes_in_group("rooms"):
		var room := node as Room
		if room == null:
			continue
		var rect := room.get_bounds()
		bounds = rect if not has_bounds else bounds.merge(rect)
		has_bounds = true
		var current := me != null and here.is_empty() and room.contains(me.global_position)
		if current:
			here = room.get_display_name()
		rooms.append({
			"title": room.get_display_name(),
			"rect": rect,
			"visited": current or visited.has(room.room_id),
			"current": current,
		})
	var level_title := _level_title()
	if rooms.is_empty() and _level_bounds.has_area():
		# Ein Level ohne Räume: seine ganze Fläche.
		bounds = _level_bounds
		rooms.append({"title": level_title, "rect": bounds, "visited": true, "current": true})
	var markers: Array[Dictionary] = []
	for node in get_tree().get_nodes_in_group("players"):
		var body := node as Node2D
		if body == null:
			continue
		var id: Variant = body.get("player_id")
		var facing: Variant = body.get("facing")
		markers.append({
			"player_id": int(id) if id is int else 1,
			"position": body.global_position,
			"facing": facing if facing is Vector2 else Vector2.DOWN,
		})
	_map_view.show_map(bounds, rooms, markers, _capsules)
	var place := level_title if here.is_empty() or here == level_title else "%s - %s" % [level_title, here]
	if _place.text != place:
		_place.text = place


func _visited_rooms() -> PackedStringArray:
	var state := get_node_or_null("/root/GameState")
	if state == null or _level_id.is_empty():
		return PackedStringArray()
	return state.call("get_visited_rooms", _level_id)


func _find_player(id: int) -> Node2D:
	for node in get_tree().get_nodes_in_group("players"):
		if node.get("player_id") == id:
			return node as Node2D
	return null


# Die Zeitkapseln im Level - sie bleiben stehen, gesucht wird beim Öffnen.
func _find_capsules() -> void:
	_capsules.clear()
	var scene := get_tree().current_scene
	if scene != null:
		_collect_capsules(scene)


func _collect_capsules(node: Node) -> void:
	for child in node.get_children():
		var script := child.get_script() as Script
		if script != null and script.get_global_name() == &"TimeCapsule" and child is Node2D:
			_capsules.append((child as Node2D).global_position)
		_collect_capsules(child)


func _level_title() -> String:
	var scene := get_tree().current_scene
	if travel != null:
		if scene != null and travel.is_capsule_scene(scene.scene_file_path):
			return travel.capsule_title
		var info := travel.find(_level_id)
		if info != null and not info.title.is_empty():
			return info.title
	return _level_id


# Kennung des Levels, zu dem das Fenster gehört: level_id der Level-Szene, sonst
# ihr Dateiname. Kam das Fenster erst im Spiel dazu, gilt die laufende Szene.
func _find_level_id() -> String:
	var root: Node = self
	while root.owner != null:
		root = root.owner
	if root == self:
		root = get_tree().current_scene
	if root == null:
		return ""
	var id: Variant = root.get("level_id")
	if id is String and not (id as String).is_empty():
		return id
	return root.scene_file_path.get_file().get_basename()


# --- Missionen ---

func _rebuild_missions() -> void:
	for child in _missions.get_children():
		_missions.remove_child(child)
		child.queue_free()
	_missions_page.scroll_vertical = 0
	if not _has_missions:
		_add_info(TEXT_NO_TRACKER)
		return
	var accepted: Array = []
	for index in _mission_entries.size():
		var entry: Variant = _mission_entries[index]
		if entry is Dictionary and not String((entry as Dictionary).get("state", "")).is_empty():
			accepted.append([entry, index])
	if accepted.is_empty():
		_add_info(TEXT_NONE_ACCEPTED)
		return
	accepted.sort_custom(_comes_first)
	for pair: Array in accepted:
		_add_mission(pair[0])


# Pflicht vor Neben, Offenes vor Erfülltem, sonst die Reihenfolge der Missionen-Datei.
func _comes_first(a: Array, b: Array) -> bool:
	var entry_a: Dictionary = a[0]
	var entry_b: Dictionary = b[0]
	var required_a: bool = entry_a.get("required") == true
	var required_b: bool = entry_b.get("required") == true
	if required_a != required_b:
		return required_a
	var done_a: bool = String(entry_a.get("state", "")) == DONE
	var done_b: bool = String(entry_b.get("state", "")) == DONE
	if done_a != done_b:
		return done_b
	return int(a[1]) < int(b[1])


func _add_info(text: String) -> void:
	var label := Label.new()
	label.text = text
	label.theme_type_variation = &"MenuInfo"
	_missions.add_child(label)


func _add_mission(entry: Dictionary) -> void:
	var required: bool = entry.get("required") == true
	var state := String(entry.get("state", ""))
	var block := VBoxContainer.new()
	block.add_theme_constant_override("separation", 1)
	block.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if state == DONE and settings != null:
		block.modulate = Color(1.0, 1.0, 1.0, settings.done_alpha)
	var head := HBoxContainer.new()
	head.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var title := Label.new()
	title.text = String(entry.get("title", ""))
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if required:
		title.theme_type_variation = &"MenuHeading"
	head.add_child(title)
	var kind := Label.new()
	kind.text = "%s - %s" % ["Pflicht" if required else "Neben", STATE_TEXTS.get(state, state)]
	kind.theme_type_variation = &"MenuInfo"
	head.add_child(kind)
	block.add_child(head)
	var description := String(entry.get("description", ""))
	if not description.is_empty():
		var text := Label.new()
		text.text = description
		text.theme_type_variation = &"MenuInfo"
		text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		text.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		block.add_child(text)
	var objectives: Variant = entry.get("objectives")
	if objectives is Array:
		for objective: Variant in objectives:
			if objective is Dictionary:
				block.add_child(_objective_row(objective))
	_missions.add_child(block)


func _objective_row(objective: Dictionary) -> Control:
	var row := HBoxContainer.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 3)
	var box := TextureRect.new()
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.texture = checked_icon if objective.get("done") == true else unchecked_icon
	box.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
	row.add_child(box)
	var text := Label.new()
	text.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	text.text = "%s %d/%d" % [String(objective.get("text", "")), int(objective.get("current", 0)), int(objective.get("count", 0))]
	row.add_child(text)
	return row
