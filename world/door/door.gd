class_name Door
extends StaticBody2D
## Door - Tür oder Gittertor (M8).
##
## Geschlossen hält die Tür Figuren und Geschosse auf, offen ist der Durchgang
## frei. Ohne Kanal öffnet und schließt die Taste E sie (Kind "Interactable").
## Mit Kanal folgt sie den Schaltern, die diesen Kanal über den EventBus melden -
## Hebeln und Druckplatten -, und E wirkt nicht: Sie ist offen, solange
## mindestens einer davon an ist.
## Steht jemand im Durchgang (Kind "DoorwaySensor"), schließt sie erst, wenn
## er frei ist. Ob die Tür auf oder zu ist, entscheidet nur set_open().
## Das Bild zeigt PropView; ein offenes Tor hat kein Bild und verschwindet.
## Ob eine Tür ohne Kanal offen ist, merkt sich ihr Kind "Persistent" im
## Spielstand (M16); Tore mit Kanal folgen nach dem Laden wieder ihren Schaltern.
##
## Abschalten: Knoten löschen - der Durchgang ist frei.

## Die Tür ist auf- oder zugegangen; is_on heißt offen.
signal state_changed(is_on: bool)

## Kanal der Schalter, denen die Tür folgt. Leer: Die Taste E bedient sie.
@export var channel: StringName = &""
## Ist die Tür beim Start offen? Mit Kanal gilt das nur, bis ein Schalter meldet.
@export var start_open := false

## Ist die Tür gerade offen?
var is_on := false

var _wants_open := false
# Schalter auf dem Kanal, die gerade an sind; Schlüssel ist ihre Kennung.
var _active_switches := {}
@onready var _shape := get_node_or_null("CollisionShape2D") as CollisionShape2D
@onready var _interactable := get_node_or_null("Interactable") as Interactable
@onready var _doorway := get_node_or_null("DoorwaySensor") as Area2D


func _ready() -> void:
	_wants_open = start_open
	_apply(start_open)
	if channel != &"":
		EventBus.switch_changed.connect(_on_switch_changed)
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	_update_interactable()


func _physics_process(_delta: float) -> void:
	# Eine Tür, die zugehen soll, wartet, bis der Durchgang frei ist.
	if is_on and not _wants_open and not is_occupied():
		_apply(false)
	_update_interactable()


## Öffnet die Tür oder schließt sie, sobald der Durchgang frei ist.
func set_open(value: bool) -> void:
	_wants_open = value
	if value and not is_on:
		_apply(true)
	elif not value and is_on and not is_occupied():
		_apply(false)


## Steht gerade jemand im Durchgang?
func is_occupied() -> bool:
	if _doorway == null:
		return false
	return _doorway.has_overlapping_bodies()


## Zustand für den Spielstand (M16): {"open": ...} - nur bei Türen ohne Kanal.
func get_saved_state() -> Dictionary:
	if channel != &"":
		return {}
	return {"open": is_on}


## Stellt den Zustand aus dem Spielstand her (M16); Tore mit Kanal übergehen ihn.
func apply_saved_state(data: Dictionary) -> void:
	var saved: Variant = data.get("open")
	if channel != &"" or not saved is bool:
		return
	set_open(saved)


func _on_interacted(_actor: Node) -> void:
	set_open(not is_on)


func _on_switch_changed(which: StringName, switch_id: int, switch_on: bool) -> void:
	if which != channel:
		return
	if switch_on:
		_active_switches[switch_id] = true
	else:
		_active_switches.erase(switch_id)
	set_open(not _active_switches.is_empty())


func _apply(open_now: bool) -> void:
	is_on = open_now
	if _shape != null:
		_shape.set_deferred("disabled", open_now)
	state_changed.emit(is_on)


func _update_interactable() -> void:
	if _interactable == null:
		return
	# E bedient nur Türen ohne Kanal; eine offene Tür mit jemandem darin bleibt offen.
	_interactable.enabled = channel == &"" and not (is_on and is_occupied())
