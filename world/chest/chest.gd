class_name Chest
extends StaticBody2D
## Chest - Truhe: E öffnet sie genau einmal, dann springt die Beute heraus (M10).
##
## Die Taste E kommt über das Kind "Interactable". Ist die Truhe verschlossen
## (required_key), geht sie nur auf, wenn die Figur, die E drückt, den Schlüssel
## im Inventar hat; er wird dabei verbraucht. Ohne Schlüssel wackelt sie kurz,
## und über ihr erscheint das Symbol des Schlüssels (Kind "LockHint").
## Ob sie aufgeht, entscheidet nur open() - die eine Stelle für den Mehrspieler.
## Geöffnet zeigt PropView das Bild "an", E wirkt nicht mehr, und sie meldet
## opened. Darauf hören eigene Bausteine: LootDropper (Beute aus data/loot/)
## und OpenEffect (Funkeln). Sie liegt als fester Körper auf "world":
## Figuren und Geschosse halten an ihr.
## Ob sie offen ist, merkt sich ihr Kind "Persistent" im Spielstand (M16): Nach
## Tod, Neustart und Laden steht sie offen da, ohne Beute und ohne Funkeln.
## Fertige Truhen liegen daneben: chest_small.tscn und chest_big.tscn.
##
## Abschalten: Knoten löschen - die Truhe ist nicht da.

## Die Truhe ist auf- oder zugegangen; is_on heißt offen (für PropView).
signal state_changed(is_on: bool)
## Die Truhe ist aufgegangen; actor ist die Figur, die sie geöffnet hat.
signal opened(actor: Node)
## Jemand wollte sie öffnen, hat aber den Schlüssel nicht.
signal locked(actor: Node)

## Schlüssel, der die Truhe öffnet und dabei verbraucht wird. Leer: nicht verschlossen.
@export var required_key: ItemData
## Steht die Truhe beim Start schon offen? Dann gibt sie keine Beute mehr.
@export var start_open := false
## So weit wackelt sie, wenn der Schlüssel fehlt, in Pixeln.
@export var shake_distance := 2.0
## So lange wackelt sie, in Sekunden.
@export var shake_time := 0.3
## So lange steht das Schlüssel-Symbol über ihr, in Sekunden.
@export var hint_time := 1.0

## Ist die Truhe offen? Unter diesem Namen liest PropView den Zustand.
var is_on := false

var _shake: Tween
var _hint_timer: Tween

@onready var _interactable := get_node_or_null("Interactable") as Interactable
@onready var _view := get_node_or_null("PropView") as Node2D
@onready var _hint := get_node_or_null("LockHint") as Sprite2D


func _ready() -> void:
	is_on = start_open
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	if _hint != null:
		_hint.visible = false
		if required_key != null:
			_hint.texture = required_key.icon
	_update_interactable()
	state_changed.emit(is_on)


## Ist die Truhe offen?
func is_open() -> bool:
	return is_on


## Ist die Truhe verschlossen, braucht also einen Schlüssel?
func is_locked() -> bool:
	return required_key != null and not is_on


## Öffnet die Truhe für actor, wenn es geht. Liefert, ob sie aufging.
func open(actor: Node = null) -> bool:
	if is_on:
		return false
	if required_key != null and not _take_key(actor):
		locked.emit(actor)
		_show_locked()
		return false
	is_on = true
	_update_interactable()
	state_changed.emit(true)
	opened.emit(actor)
	return true


## Zustand für den Spielstand (M16): {"open": true}, sobald sie offen ist.
func get_saved_state() -> Dictionary:
	if not is_on:
		return {}
	return {"open": true}


## Stellt den Zustand aus dem Spielstand her (M16): offen wie mit start_open -
## ohne Beute, ohne Funkeln.
func apply_saved_state(data: Dictionary) -> void:
	if data.get("open") != true or is_on:
		return
	is_on = true
	_update_interactable()
	state_changed.emit(true)


func _on_interacted(actor: Node) -> void:
	open(actor)


# Nimmt den Schlüssel aus dem Inventar der Figur; liefert, ob einer da war.
func _take_key(actor: Node) -> bool:
	if actor == null:
		return false
	var inventory := actor.get_node_or_null("Inventory") as Inventory
	if inventory == null:
		return false
	return inventory.remove(required_key, 1)


func _update_interactable() -> void:
	if _interactable != null:
		_interactable.enabled = not is_on


# Rein fürs Auge: kurz wackeln und den fehlenden Schlüssel zeigen.
func _show_locked() -> void:
	if _view != null:
		if _shake != null and _shake.is_valid():
			_shake.kill()
		_view.position.x = 0.0
		_shake = create_tween()
		var step := maxf(shake_time, 0.04) / 4.0
		for target in [shake_distance, -shake_distance, shake_distance * 0.5, 0.0]:
			_shake.tween_property(_view, "position:x", target, step)
	if _hint != null and _hint.texture != null:
		if _hint_timer != null and _hint_timer.is_valid():
			_hint_timer.kill()
		_hint.visible = true
		_hint_timer = create_tween()
		_hint_timer.tween_interval(maxf(hint_time, 0.05))
		_hint_timer.tween_callback(_hint.hide)
