extends MenuScreen
## SaveSlots - die Spielstand-Auswahl im Hauptmenü (M20): genau drei Plätze.
##
## Ein leerer Platz zeigt „Neues Spiel“; ein Klick beginnt dort ein neues Spiel.
## Ein belegter zeigt, wo es weitergeht - das Level des Laufs oder die Zeitkapsel -,
## die Spielzeit und wann zuletzt gespeichert wurde; ein Klick lädt ihn und setzt
## das Spiel fort. Gewählt wird mit Maus oder Tastatur. Der gewählte Platz wird
## beim SaveManager geöffnet (open_slot); dann meldet das Menü slot_chosen, und
## das Hauptmenü startet das Spiel.
## Löschen geht nur hier und nur mit der Maus: das rote Kreuz neben einem
## belegten Platz, danach die Frage „Spielstand wirklich unwiderruflich löschen?“.
## „Ja“ erreicht die Tastatur nicht, gewählt ist zuerst „Nein“; Esc heißt Nein.
## Im laufenden Spiel lässt sich kein Spielstand löschen.
## Ohne SaveManager zeigt es drei leere Plätze; ein Klick beginnt ein neues Spiel
## ohne Datei.

## Ein Platz ist gewählt und beim SaveManager geöffnet. had_save heißt: Dort lag
## ein Spielstand, er ist geladen; sonst beginnt ein neues Spiel.
signal slot_chosen(slot: int, had_save: bool)

## Die Frage vor dem Löschen.
const DELETE_QUESTION := "Spielstand wirklich unwiderruflich löschen?"
## Größe eines Platzes in Pixeln.
const SLOT_SIZE := Vector2(224, 32)
## So viele Plätze, wenn es keinen SaveManager gibt.
const FALLBACK_SLOT_COUNT := 3

## Reisedaten: daraus der Name des Levels, in dem ein Spielstand weitergeht.
@export var travel: TravelSettings
## Bild des Lösch-Symbols.
@export var delete_icon: Texture2D
## Bild des Lösch-Symbols unter der Maus.
@export var delete_icon_hover: Texture2D

var _busy := false
var _pending_delete := 0

@onready var _slots := $Root/Window/Interior/Rows/Slots as VBoxContainer
@onready var _back := $Root/Window/Interior/Rows/Back as Button
@onready var _confirm := $Confirm as ConfirmWindow


func _ready() -> void:
	super._ready()
	_back.pressed.connect(back)
	_confirm.answered.connect(_on_delete_answered)


func _before_open() -> void:
	_busy = false
	_pending_delete = 0
	_rebuild()


func _accepts_input() -> bool:
	return not _busy


## Die Zeilen der Plätze neu bauen, mit dem Stand der Dateien.
func _rebuild() -> void:
	for child in _slots.get_children():
		_slots.remove_child(child)
		child.queue_free()
	for slot in range(1, _slot_count() + 1):
		_slots.add_child(_make_row(slot, _slot_info(slot)))
	_hook_controls()


func _make_row(slot: int, info: Dictionary) -> Control:
	var row := HBoxContainer.new()
	row.name = "Row%d" % slot
	row.add_theme_constant_override("separation", 4)
	var button := Button.new()
	button.name = "Slot%d" % slot
	button.theme_type_variation = &"SlotButton"
	button.custom_minimum_size = SLOT_SIZE
	button.pressed.connect(_on_slot_pressed.bind(slot))
	row.add_child(button)
	var exists: bool = info.get("exists") == true
	_add_line(button, "Platz %d" % slot, &"MenuHeading", 0, false)
	if not exists:
		_add_line(button, "Neues Spiel", &"", 1, false)
	elif info.get("valid") != true:
		_add_line(button, "Unlesbar - beginnt neu", &"MenuInfo", 1, false)
	else:
		_add_line(button, _date_text(String(info.get("saved_at", ""))), &"MenuInfo", 0, true)
		_add_line(button, _place_text(info), &"", 1, false)
		_add_line(button, _time_text(int(info.get("play_time", 0))), &"MenuInfo", 1, true)
	var delete := TextureButton.new()
	delete.name = "Delete%d" % slot
	# Nur mit der Maus: Die Tastatur erreicht das Kreuz nicht.
	delete.focus_mode = Control.FOCUS_NONE
	delete.texture_normal = delete_icon
	delete.texture_hover = delete_icon_hover
	delete.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	delete.visible = exists
	delete.pressed.connect(_on_delete_pressed.bind(slot))
	row.add_child(delete)
	return row


# Eine Textzeile im Platz: line 0 oben, 1 darunter; right steht rechtsbündig.
func _add_line(button: Button, text: String, variation: StringName, line: int, right: bool) -> void:
	var label := Label.new()
	label.text = text
	if variation != &"":
		label.theme_type_variation = variation
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	label.position = Vector2(6, 3 + line * 13)
	label.size = Vector2(SLOT_SIZE.x - 12, 12)
	if right:
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	button.add_child(label)


func _on_slot_pressed(slot: int) -> void:
	if _busy or not is_open() or has_open_child():
		return
	_busy = true
	var had_save := false
	var saves := _save_manager()
	if saves != null:
		had_save = saves.call("open_slot", slot)
	slot_chosen.emit(slot, had_save)


func _on_delete_pressed(slot: int) -> void:
	if _busy or not is_open() or has_open_child():
		return
	_pending_delete = slot
	_confirm.setup(DELETE_QUESTION, "Ja", "Nein", false)
	open_child(_confirm, true)


func _on_delete_answered(yes: bool) -> void:
	var slot := _pending_delete
	_pending_delete = 0
	if not yes or slot <= 0:
		return
	var saves := _save_manager()
	if saves != null and not saves.call("delete_slot", slot):
		push_warning("SaveSlots: Platz %d ließ sich nicht löschen." % slot)
	_rebuild()
	var button := _slots.get_node_or_null("Row%d/Slot%d" % [slot, slot]) as Control
	if _can_focus(button):
		button.grab_focus()


func _slot_count() -> int:
	var saves := _save_manager()
	if saves != null:
		return int(saves.call("get_slot_count"))
	return FALLBACK_SLOT_COUNT


func _slot_info(slot: int) -> Dictionary:
	var saves := _save_manager()
	if saves != null:
		return saves.call("get_slot_info", slot)
	return {"slot": slot, "exists": false}


# Wo es weitergeht: das Level des Laufs, die Zeitkapsel oder das Startlevel.
func _place_text(info: Dictionary) -> String:
	var running := String(info.get("current_level", ""))
	var completed: Array = info.get("completed", [])
	if travel != null:
		return travel.place_title(running, completed)
	return running


## Die Spielzeit als Text, etwa „Spielzeit 1 Std. 5 Min.“.
static func _time_text(seconds: int) -> String:
	var minutes := floori(maxi(seconds, 0) / 60.0)
	if minutes < 1:
		return "Spielzeit unter 1 Min."
	var hours := floori(minutes / 60.0)
	minutes -= hours * 60
	if hours == 0:
		return "Spielzeit %d Min." % minutes
	return "Spielzeit %d Std. %d Min." % [hours, minutes]


## Zeitpunkt der letzten Speicherung als Text: aus „2026-11-22 19:03:12“ wird
## „22.11.2026, 19:03“.
static func _date_text(saved_at: String) -> String:
	var parts := saved_at.split(" ")
	if parts.size() < 2:
		return saved_at
	var date := parts[0].split("-")
	if date.size() != 3:
		return saved_at
	return "%s.%s.%s, %s" % [date[2], date[1], date[0], parts[1].substr(0, 5)]


func _save_manager() -> Node:
	return get_node_or_null("/root/SaveManager")
