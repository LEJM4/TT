class_name TimeCapsule
extends StaticBody2D
## TimeCapsule - die Zeitkapsel im Level: Landepunkt, Rückreise und Abbruch (M18).
##
## Sie steht dauerhaft am Landepunkt eines Levels. Vor ihr erscheint die Figur
## bei der Ankunft und nach dem Tod, solange sie an keinem Zeitanker gerastet
## hat - ihre Kinder Spawn1 und Spawn2 sind die Startpunkte (Gruppe
## "player_spawn"). Kommt die Figur gerade an (SceneManager.is_arrival()), landet
## die Zeitkapsel: Ihr Bild sinkt in land_time Sekunden (0,7) aus land_height
## Pixeln (28) herab und wird dabei sichtbar, dann wirbelt Staub auf (Kind
## ArriveEffect, Signal landed).
##
## E an der Tür (Kind Interactable) beginnt ein Gespräch (Kind TalkAction):
##   bereit       ready_dialog: "Zurück in die Zeitkapsel?" - Einsteigen meldet
##                level_exit_requested: Der SceneManager schließt das Level ab
##                und bringt alle in die Zeitkapsel.
##   nicht bereit abort_dialog: "Reise abbrechen?" - Abbrechen meldet
##                level_leave_requested: Der Fortschritt im Level ist verloren.
## Was gewählt wurde, führt sie erst nach dem Ende des Gesprächs aus (Aktion der
## letzten Zeile: "board" oder "abort"); Esc bricht ohne Folgen ab.
## Bereit ist sie, solange ein Schalter auf ihrem Kanal unlock_channel an ist -
## wie ein Tor: Der MissionTracker meldet missions_done, sobald alle
## Pflichtmissionen erfüllt sind. Die Missionen kennt sie nicht selbst. Solange
## sie bereit ist, funkelt es an der Tür (Kind ReadyEffect, Signal sparkled).
## Das Bild zeigt PropView (Kind View) mit data/skins/time_capsule.tres.
## Ihr Körper liegt auf "world": Figuren und Geschosse halten an ihr.
## Debug-Zeile "Zeitkapsel": "bereit" oder "Pflicht offen".
##
## Abschalten: Knoten löschen - die Figur erscheint am Ort des PlayerSpawner,
## das Level lässt sich nur noch mit Bild auf und Bild ab verlassen.

## Sie ist bereit geworden oder nicht mehr; is_on heißt bereit (für PropView).
signal state_changed(is_on: bool)
## Die Landung ist vorbei - der Staub wirbelt auf.
signal landed
## Solange sie bereit ist, alle sparkle_interval Sekunden einmal - es funkelt.
signal sparkled

## Aktion der Gesprächszeile "Einsteigen".
const ACTION_BOARD := &"board"
## Aktion der Gesprächszeile "Abbrechen".
const ACTION_ABORT := &"abort"

## Kanal, auf dem sie bereit wird - wie ein Tor. Leer: immer bereit.
@export var unlock_channel: StringName = &"missions_done"
## Gespräch, wenn sie bereit ist: Einsteigen oder noch nicht.
@export var ready_dialog: DialogData
## Gespräch, wenn noch Pflichtmissionen offen sind: Abbrechen oder weitermachen.
@export var abort_dialog: DialogData

@export_group("Landung")
## So lange dauert die Landung bei der Ankunft, in Sekunden.
@export var land_time := 0.7
## Aus dieser Höhe sinkt das Bild herab, in Pixeln.
@export var land_height := 28.0

@export_group("Funkeln")
## So viele Sekunden liegen zwischen zwei Funken, solange sie bereit ist.
@export var sparkle_interval := 1.6

## Ist sie bereit zur Rückreise? Unter diesem Namen liest PropView den Zustand.
var is_on := false

var _active_switches := {}
var _landing := false
var _sparkle_clock := 0.0
var _land_tween: Tween

@onready var _interactable := get_node_or_null("Interactable") as Interactable
@onready var _talk := get_node_or_null("TalkAction") as TalkAction
@onready var _view := get_node_or_null("View") as CanvasItem


func _ready() -> void:
	is_on = unlock_channel == &""
	if unlock_channel != &"":
		EventBus.switch_changed.connect(_on_switch_changed)
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	if _talk != null:
		_talk.talk_started.connect(_on_talk_started)
		_talk.talk_finished.connect(_on_talk_finished)
		_talk.action_chosen.connect(_on_action_chosen)
	state_changed.emit(is_on)
	if _is_arrival():
		_land()
	# Erst melden, wenn die Debug-Anzeige bereit ist und zuhört.
	_report.call_deferred()


func _process(delta: float) -> void:
	if not is_on or _landing:
		return
	_sparkle_clock -= delta
	if _sparkle_clock <= 0.0:
		_sparkle_clock = maxf(sparkle_interval, 0.1)
		sparkled.emit()


## Landet gerade? Dann ist das Bild noch in der Luft.
func is_landing() -> bool:
	return _landing


func _on_interacted(actor: Node) -> void:
	var talk := ready_dialog if is_on else abort_dialog
	if talk == null:
		push_warning("TimeCapsule %s: kein Gespräch für \"%s\" gesetzt - E bewirkt nichts." % [name, "bereit" if is_on else "nicht bereit"])
		return
	if _talk == null:
		push_warning("TimeCapsule %s: Das Kind TalkAction fehlt - E bewirkt nichts." % name)
		return
	_talk.talk(actor, talk)


func _on_talk_started(_player_id: int) -> void:
	if _interactable != null:
		_interactable.enabled = false


func _on_talk_finished(_player_id: int, _completed: bool) -> void:
	if _interactable != null:
		_interactable.enabled = true


# Die Wahl im Gespräch: erst jetzt, nach dessen Ende, ausgeführt.
func _on_action_chosen(action: StringName, player_id: int) -> void:
	if get_node_or_null("/root/SceneManager") == null:
		push_warning("TimeCapsule %s: Kein SceneManager - die Reise geht nicht weiter." % name)
	if action == ACTION_BOARD:
		if is_on:
			EventBus.level_exit_requested.emit(player_id)
		else:
			push_warning("TimeCapsule %s: Einsteigen geht nicht mehr - sie ist nicht bereit." % name)
	elif action == ACTION_ABORT:
		EventBus.level_leave_requested.emit(player_id)
	else:
		push_warning("TimeCapsule %s: Die Aktion \"%s\" kennt sie nicht." % [name, action])


func _on_switch_changed(which: StringName, switch_id: int, switch_on: bool) -> void:
	if which != unlock_channel:
		return
	if switch_on:
		_active_switches[switch_id] = true
	else:
		_active_switches.erase(switch_id)
	var now_ready := not _active_switches.is_empty()
	if now_ready == is_on:
		return
	is_on = now_ready
	_sparkle_clock = 0.0
	state_changed.emit(is_on)
	_report()


# Rein fürs Auge: Das Bild sinkt herab und wird sichtbar, dann wirbelt Staub auf.
func _land() -> void:
	if _view == null or land_time <= 0.0:
		landed.emit()
		return
	_landing = true
	var rest := (_view as Node2D).position if _view is Node2D else Vector2.ZERO
	if _view is Node2D:
		(_view as Node2D).position = rest - Vector2(0.0, land_height)
	_view.modulate.a = 0.0
	_land_tween = create_tween()
	_land_tween.set_parallel(true)
	if _view is Node2D:
		_land_tween.tween_property(_view, "position", rest, land_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	_land_tween.tween_property(_view, "modulate:a", 1.0, land_time * 0.6)
	_land_tween.chain().tween_callback(_on_landed)


func _on_landed() -> void:
	_landing = false
	landed.emit()


func _is_arrival() -> bool:
	var manager := get_node_or_null("/root/SceneManager")
	return manager != null and manager.call("is_arrival")


func _report() -> void:
	EventBus.debug_value_changed.emit("Zeitkapsel", "bereit" if is_on else "Pflicht offen")
