class_name TimeAnchor
extends StaticBody2D
## TimeAnchor - Zeitanker: Hier rastet die Spielfigur, und hier erwacht sie wieder (M16).
##
## E rastet (Kind "Interactable"): Leben und Energie der Figur sind wieder voll,
## der Anker wird zum Rückkehrpunkt (GameState), und das Spiel speichert. Es
## funkelt (Kind "RestEffect"), und hat der SaveManager die Datei geschrieben,
## steht kurz "Gespeichert" über dem Anker (Kind "SavedLabel").
## Solange er der Rückkehrpunkt ist, leuchtet seine Kugel blau, sonst ist sie
## grau; das Bild zeigt PropView mit data/skins/time_anchor.tres.
## Stirbt die Figur oder beginnt das Spiel neu, setzt der PlayerSpawner sie vor
## den Anker, der Rückkehrpunkt ist (get_spawn_position); er findet ihn in der
## Gruppe "time_anchors". Die Kennung des Ankers ist sein Pfad im Level, etwa
## "TimeAnchor" - wer ihn umbenennt, verliert ihn als Rückkehrpunkt.
## Er liegt als fester Körper auf "world": Figuren und Geschosse halten an ihm.
##
## Abschalten: Knoten löschen - die Figur erwacht an den Startpunkten.

## Er ist Rückkehrpunkt geworden oder nicht mehr; is_on heißt: Er leuchtet (für PropView).
signal state_changed(is_on: bool)
## Eine Figur hat hier gerastet.
signal rested(actor: Node)

## Name des Vorrats an der Figur, der beim Rasten voll wird.
const ENERGY_NAME := "Energy"
## Name des Lebens an der Figur, das beim Rasten voll wird.
const HEALTH_NAME := "Health"

## Hier erscheint die Figur, vom Anker aus gemessen, in Pixeln: vor ihm.
@export var spawn_offset := Vector2(0.0, 16.0)
## Abstand mehrerer Figuren nebeneinander, in Pixeln.
@export var spawn_spacing := 16.0
## So lange steht "Gespeichert" über ihm, in Sekunden.
@export var saved_time := 1.2
## So weit steigt der Text dabei, in Pixeln.
@export var saved_rise := 4.0

## Ist er der Rückkehrpunkt? Unter diesem Namen liest PropView den Zustand.
var is_on := false

# Wahr, solange das Rasten auf die Speicherung wartet; game_saved kommt im selben Aufruf.
var _awaiting_save := false
var _label_rest := Vector2.ZERO
var _label_tween: Tween

@onready var _interactable := get_node_or_null("Interactable") as Interactable
@onready var _label := get_node_or_null("SavedLabel") as Control


func _ready() -> void:
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	if _label != null:
		_label_rest = _label.position
		_label.visible = false
	EventBus.respawn_changed.connect(_on_respawn_changed)
	EventBus.game_saved.connect(_on_game_saved)
	var state := _game_state()
	is_on = state != null and state.call("is_respawn", get_level_id(), get_anchor_id())
	state_changed.emit(is_on)


## Kennung des Levels, in dem er steht, etwa "test_chamber".
func get_level_id() -> String:
	var state := _game_state()
	if state == null:
		return ""
	return state.call("level_id_of", self)


## Kennung des Ankers: sein Pfad im Level, etwa "TimeAnchor".
func get_anchor_id() -> String:
	var state := _game_state()
	if state == null:
		return String(name)
	return state.call("object_id_of", self)


## Wo die Figur mit der Nummer index (ab 0) von count Figuren erscheint.
func get_spawn_position(index := 0, count := 1) -> Vector2:
	var shift := (float(index) - float(maxi(count, 1) - 1) * 0.5) * spawn_spacing
	return global_position + spawn_offset + Vector2(shift, 0.0)


## Rastet hier: Leben und Energie von actor voll, Rückkehrpunkt hierher, speichern.
func rest(actor: Node) -> void:
	_refill(actor)
	var state := _game_state()
	if state != null:
		state.call("set_respawn", get_level_id(), get_anchor_id())
	rested.emit(actor)
	_awaiting_save = true
	EventBus.save_requested.emit("Rasten")
	_awaiting_save = false


func _on_interacted(actor: Node) -> void:
	rest(actor)


func _refill(actor: Node) -> void:
	if actor == null:
		return
	var health := actor.get_node_or_null(HEALTH_NAME) as Health
	if health != null:
		health.reset()
	var energy := actor.get_node_or_null(ENERGY_NAME) as Supply
	if energy != null:
		energy.add(energy.get_maximum())


func _on_respawn_changed(level_id: String, anchor_id: String) -> void:
	var now_on := not anchor_id.is_empty() and level_id == get_level_id() and anchor_id == get_anchor_id()
	if now_on == is_on:
		return
	is_on = now_on
	state_changed.emit(is_on)


func _on_game_saved(_reason: String) -> void:
	if _awaiting_save:
		_show_saved()


# Rein fürs Auge: "Gespeichert" steigt kurz auf und verblasst.
func _show_saved() -> void:
	if _label == null:
		return
	if _label_tween != null and _label_tween.is_valid():
		_label_tween.kill()
	_label.position = _label_rest
	_label.modulate.a = 1.0
	_label.visible = true
	var hold := maxf(saved_time, 0.1)
	_label_tween = create_tween()
	_label_tween.set_parallel(true)
	_label_tween.tween_property(_label, "position:y", _label_rest.y - saved_rise, hold)
	_label_tween.tween_property(_label, "modulate:a", 0.0, hold * 0.4).set_delay(hold * 0.6)
	_label_tween.chain().tween_callback(_label.hide)


func _game_state() -> Node:
	return get_node_or_null("/root/GameState")
