class_name PressurePlate
extends Area2D
## PressurePlate - Druckplatte: Wer draufsteht, hält ihren Kanal an (M8).
##
## Steht ein Körper auf der Platte - die Spielfigur, später auch Gegner und
## Kisten -, ist sie gedrückt und meldet ihren Kanal über den EventBus als an.
## Geht der letzte herunter, springt sie sofort hoch; der Kanal bleibt noch
## release_delay Sekunden an. So bleibt ein Tor kurz offen, nachdem man
## heruntergegangen ist. Beim Start meldet sie ihren Kanal einmal als aus.
## Wer die Platte drückt, legt die Maske fest: "player" und "enemy".
##
## Abschalten: Knoten löschen - Türen auf ihrem Kanal bleiben, wie sie sind.

## Die Platte wurde gedrückt oder losgelassen; is_on heißt gedrückt.
signal state_changed(is_on: bool)

## Kanal, den die Platte meldet; Türen mit demselben Kanal folgen ihr.
@export var channel: StringName = &""
## So lange bleibt der Kanal an, nachdem der Letzte heruntergegangen ist, in Sekunden.
@export var release_delay := 2.0

## Ist die Platte gerade gedrückt?
var is_on := false
## Ist ihr Kanal gerade an?
var channel_on := false

var _release_left := 0.0


func _ready() -> void:
	state_changed.emit(is_on)
	# Erst melden, wenn alle Türen der Szene bereit sind und zuhören.
	_announce.call_deferred()


func _physics_process(delta: float) -> void:
	var pressed := has_overlapping_bodies()
	if pressed != is_on:
		is_on = pressed
		state_changed.emit(is_on)
	if pressed:
		_release_left = release_delay
		if not channel_on:
			channel_on = true
			_announce()
	elif channel_on:
		_release_left -= delta
		if _release_left <= 0.0:
			channel_on = false
			_announce()


func _announce() -> void:
	if channel != &"":
		EventBus.switch_changed.emit(channel, get_instance_id(), channel_on)
