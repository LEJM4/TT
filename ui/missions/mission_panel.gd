extends CanvasLayer
## MissionPanel - die Missionsliste links unter den Herzen und die Hinweise oben in der Mitte (M17).
##
## Zeigt die laufenden Missionen des Levels, wie der MissionTracker sie meldet
## (EventBus.mission_list_changed): je Mission den Titel - Pflicht orange,
## Neben weiß - und darunter ihre Ziele mit Kästchen und Stand, etwa "Äste 1/2".
## Pflichtmissionen stehen oben. Mehr als max_missions passen nicht hinein, dann
## steht darunter etwa "+1 weitere". Erfüllte und nicht angenommene Missionen fehlen.
## J (Aktion mission_toggle) oder ein Klick auf die Überschrift klappt die Liste
## ein und aus; eingeklappt steht nur "Missionen 3". Das gilt, bis das Spiel
## endet - auch nach Tod und Neustart des Raums; dauerhaft gemerkt wird es mit
## den Optionen (M20).
## Beginnt eine Mission oder ist sie erfüllt, steht oben in der Mitte kurz
## "Neue Mission" oder "Mission erfüllt" mit ihrem Titel, mehrere nacheinander.
## Die erste Meldung nach dem Betreten des Levels gibt nur den Stand: Was aus dem
## Spielstand kommt, bringt keinen Hinweis.
## Nur die Überschrift nimmt Klicks an - liegt die Maus darauf, greift die Figur
## nicht an (PlayerInput); alles andere lässt die Maus durch.
## Die Anzeige entscheidet nichts. Ohne MissionTracker im Level bleibt sie unsichtbar.
## Sie liegt auf Bildebene 90 wie das HUD; Werte in data/ui/missions.tres.
##
## Abschalten: Knoten aus dem Level löschen - die Missionen zählen weiter.

## Stände, wie der MissionTracker sie meldet.
const ACTIVE := "active"
const READY := "ready"
const DONE := "done"
## Abstand der Hinweise vom oberen Rand, in Pixeln.
const NOTICE_TOP := 6.0

## Ist die Liste eingeklappt? Gilt für jede Anzeige, bis das Spiel endet.
static var collapsed := false

## Werte-Datei: wie viele Missionen, wie lange ein Hinweis steht.
@export var settings: MissionPanelSettings
## Kästchen eines erfüllten Ziels.
@export var checked_icon: Texture2D
## Kästchen eines offenen Ziels.
@export var unchecked_icon: Texture2D

var _entries: Array = []
# Stand je Mission aus der letzten Meldung; daran erkennt die Anzeige, was neu ist.
var _known := {}
var _has_list := false
var _notices: Array[Dictionary] = []
var _notice_tween: Tween

@onready var _list := $List as Control
@onready var _header := $List/Rows/Header as Control
# Der Pfeil sitzt in einem eigenen Knoten: Container setzen die Drehung ihrer Kinder zurück.
@onready var _arrow := $List/Rows/Header/Arrow/Icon as Control
@onready var _title := $List/Rows/Header/Title as Label
@onready var _missions := $List/Rows/Missions as VBoxContainer
@onready var _more := $List/Rows/More as Label
@onready var _notice := $Notice as Control
@onready var _notice_kind := $Notice/Interior/Rows/Kind as Label
@onready var _notice_title := $Notice/Interior/Rows/Title as Label


func _ready() -> void:
	if settings == null:
		push_warning("MissionPanel: keine Werte-Datei gesetzt, nutze Standardwerte.")
		settings = MissionPanelSettings.new()
	_list.visible = false
	_notice.visible = false
	_header.gui_input.connect(_on_header_input)
	EventBus.mission_list_changed.connect(_on_list_changed)


func _unhandled_input(event: InputEvent) -> void:
	if _has_list and event.is_action_pressed("mission_toggle"):
		toggle()
		get_viewport().set_input_as_handled()


## Klappt die Liste ein oder aus.
func toggle() -> void:
	collapsed = not collapsed
	_rebuild()


## Die offenen Missionen - laufend oder bereit -, Pflicht zuerst.
func get_open_entries() -> Array:
	var required: Array = []
	var others: Array = []
	for entry: Dictionary in _entries:
		var state := String(entry.get("state", ""))
		if state != ACTIVE and state != READY:
			continue
		if entry.get("required") == true:
			required.append(entry)
		else:
			others.append(entry)
	return required + others


func _on_list_changed(_level_id: String, entries: Array) -> void:
	if _has_list:
		_queue_notices(entries)
	_has_list = true
	_known.clear()
	for entry: Dictionary in entries:
		_known[String(entry.get("id", ""))] = String(entry.get("state", ""))
	_entries = entries
	_rebuild()


func _on_header_input(event: InputEvent) -> void:
	var click := event as InputEventMouseButton
	if click != null and click.pressed and click.button_index == MOUSE_BUTTON_LEFT:
		toggle()
		_header.accept_event()


func _rebuild() -> void:
	_list.visible = _has_list
	if not _has_list:
		return
	var open := get_open_entries()
	_arrow.rotation = -PI * 0.5 if collapsed else 0.0
	_title.text = "Missionen %d" % open.size() if collapsed else "Missionen"
	for child in _missions.get_children():
		_missions.remove_child(child)
		child.queue_free()
	_missions.visible = not collapsed
	_more.visible = false
	if not collapsed:
		var shown := mini(open.size(), settings.max_missions)
		for index in shown:
			_add_mission(open[index])
		_missions.visible = shown > 0
		if open.is_empty():
			_more.text = "Keine offenen Missionen"
			_more.visible = true
		elif open.size() > shown:
			_more.text = "+%d weitere" % (open.size() - shown)
			_more.visible = true
	_list.reset_size()
	_fit_list.call_deferred()


func _add_mission(entry: Dictionary) -> void:
	var title := Label.new()
	title.text = String(entry.get("title", ""))
	title.theme_type_variation = &"MissionRequired" if entry.get("required") == true else &"MissionSide"
	_missions.add_child(title)
	var objectives: Variant = entry.get("objectives")
	if not objectives is Array:
		return
	for objective: Dictionary in objectives:
		var row := HBoxContainer.new()
		row.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.theme_type_variation = &"MissionObjectiveRow"
		var box := TextureRect.new()
		box.mouse_filter = Control.MOUSE_FILTER_IGNORE
		box.texture = checked_icon if objective.get("done") == true else unchecked_icon
		box.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
		row.add_child(box)
		var text := Label.new()
		text.theme_type_variation = &"MissionObjective"
		text.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		text.text = "%s %d/%d" % [String(objective.get("text", "")), int(objective.get("current", 0)), int(objective.get("count", 0))]
		row.add_child(text)
		_missions.add_child(row)


# Die Liste schrumpft auf ihren Inhalt, sobald die neuen Zeilen gemessen sind.
func _fit_list() -> void:
	if is_instance_valid(_list):
		_list.reset_size()


# Vergleicht die neue Meldung mit der letzten: Was neu begann oder erfüllt ist, bekommt einen Hinweis.
func _queue_notices(entries: Array) -> void:
	for entry: Dictionary in entries:
		var state := String(entry.get("state", ""))
		var before := String(_known.get(String(entry.get("id", "")), ""))
		var title := String(entry.get("title", ""))
		if before.is_empty() and (state == ACTIVE or state == READY):
			_add_notice("Neue Mission", title)
		elif before != DONE and state == DONE:
			_add_notice("Mission erfüllt", title)


func _add_notice(kind: String, title: String) -> void:
	_notices.append({"kind": kind, "title": title})
	if _notice_tween == null or not _notice_tween.is_valid():
		_show_next_notice()


func _show_next_notice() -> void:
	if _notices.is_empty():
		_notice.visible = false
		return
	var next: Dictionary = _notices.pop_front()
	_notice_kind.text = String(next["kind"])
	_notice_title.text = String(next["title"])
	_notice.modulate.a = 0.0
	_notice.visible = true
	_place_notice()
	_place_notice.call_deferred()
	var fade := clampf(settings.notice_fade, 0.0, settings.notice_time * 0.5)
	_notice_tween = create_tween()
	_notice_tween.tween_property(_notice, "modulate:a", 1.0, maxf(fade, 0.01))
	_notice_tween.tween_interval(maxf(settings.notice_time - 2.0 * fade, 0.1))
	_notice_tween.tween_property(_notice, "modulate:a", 0.0, maxf(fade, 0.01))
	_notice_tween.tween_callback(_show_next_notice)


# Hinweis oben in die Mitte, auf ganze Pixel.
func _place_notice() -> void:
	if not is_instance_valid(_notice):
		return
	_notice.reset_size()
	var width := get_viewport().get_visible_rect().size.x
	_notice.position = Vector2(roundf((width - _notice.size.x) * 0.5), NOTICE_TOP)
