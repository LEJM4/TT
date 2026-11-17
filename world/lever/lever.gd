class_name Lever
extends StaticBody2D
## Lever - Hebel: E legt ihn um, und er meldet seinen Kanal (M8).
##
## Ein Druck auf E schaltet ihn um: aus (rot) oder an (blau). Den neuen Zustand
## meldet er über den EventBus als switch_changed(channel, Kennung, is_on);
## Türen mit demselben Kanal folgen ihm. Beim Start meldet er seinen Zustand einmal,
## damit alle Türen ihn kennen. Ob er an ist, entscheidet nur toggle().
##
## Abschalten: Knoten löschen - Türen auf seinem Kanal bleiben, wie sie sind.

## Der Hebel wurde umgelegt; is_on heißt an.
signal state_changed(is_on: bool)

## Kanal, den der Hebel meldet; Türen mit demselben Kanal folgen ihm.
@export var channel: StringName = &""
## Ist der Hebel beim Start an?
@export var start_on := false

## Ist der Hebel gerade an?
var is_on := false

@onready var _interactable := get_node_or_null("Interactable") as Interactable


func _ready() -> void:
	is_on = start_on
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	state_changed.emit(is_on)
	# Erst melden, wenn alle Türen der Szene bereit sind und zuhören.
	_announce.call_deferred()


## Legt den Hebel um.
func toggle() -> void:
	is_on = not is_on
	state_changed.emit(is_on)
	_announce()


func _on_interacted(_actor: Node) -> void:
	toggle()


func _announce() -> void:
	if channel != &"":
		EventBus.switch_changed.emit(channel, get_instance_id(), is_on)
