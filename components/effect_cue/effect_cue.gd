class_name EffectCue
extends Node2D
## EffectCue - spielt einen Effekt, wenn ein Baustein ein Signal sendet (A2).
##
## Benutzung: die Szene effect_cue.tscn als Kind an eine Figur hängen, neben
## den Baustein, auf den sie hören soll, und im Inspektor wählen:
##   effect            Werte-Datei des Effekts (EffectData aus data/effects/)
##   source_name       Name des Geschwisters, etwa "MeleeAttack"; leer: der Elternknoten
##   signal_name       Signal, das den Effekt startet, etwa "attack_started"
##   stop_signal_name  Signal, das ihn beendet, etwa "recovered"; leer: Er läuft einmal ab
## Liefert das Signal eine Richtung mit - den ersten Vector2-Wert -, rückt der
## Effekt um distance Pixel in diese Richtung und dreht sich mit use_direction danach.
## Rein fürs Auge - der Baustein schaut nur zu und entscheidet nichts.
##
## Abschalten: Knoten löschen - die Mechanik läuft weiter, nur ohne diesen Effekt.

## So viele Werte darf ein Signal höchstens liefern, damit der Baustein es hören kann.
const MAX_SIGNAL_ARGUMENTS := 4

## Werte-Datei des Effekts.
@export var effect: EffectData
## Name des Geschwisters, dessen Signal zählt. Leer: der Elternknoten selbst.
@export var source_name := ""
## Signal, das den Effekt startet.
@export var signal_name := ""
## Signal, das einen laufenden Effekt beendet. Leer: Der Effekt läuft einmal ab.
@export var stop_signal_name := ""
## Folgt der Effekt seiner Figur? Sonst bleibt er an der Stelle, an der er entstand.
@export var follow := true
## Dreht sich der Effekt in die Richtung, die das Signal mitliefert?
@export var use_direction := false
## So weit rückt der Effekt in die Richtung des Signals, in Pixeln.
@export var distance := 0.0

var _running: OneShotEffect


func _ready() -> void:
	if effect == null or signal_name.is_empty():
		push_warning("EffectCue %s: Effekt oder Signal fehlt." % name)
		return
	var source := _find_source()
	if source == null:
		push_warning("EffectCue %s: Knoten \"%s\" nicht gefunden." % [name, source_name])
		return
	if not _listen(source, signal_name, true):
		return
	if not stop_signal_name.is_empty():
		_listen(source, stop_signal_name, false)


func _exit_tree() -> void:
	_stop()


func _find_source() -> Node:
	var holder := get_parent()
	if holder == null or source_name.is_empty():
		return holder
	return holder.get_node_or_null(source_name)


func _listen(source: Node, which: String, starting: bool) -> bool:
	var count := _argument_count(source, which)
	if count < 0:
		push_warning("EffectCue %s: \"%s\" hat kein Signal \"%s\"." % [name, source.name, which])
		return false
	if count > MAX_SIGNAL_ARGUMENTS:
		push_warning("EffectCue %s: Signal \"%s\" liefert zu viele Werte." % [name, which])
		return false
	source.connect(which, _adapter(count, starting))
	return true


func _argument_count(source: Node, which: String) -> int:
	for info in source.get_signal_list():
		if info["name"] == which:
			return (info["args"] as Array).size()
	return -1


# Signale liefern verschieden viele Werte; der Adapter reicht sie als Liste weiter.
# Er ruft eine Methode dieses Knotens auf - so löst Godot die Verbindung, wenn der Knoten geht.
func _adapter(count: int, starting: bool) -> Callable:
	match count:
		0:
			return func() -> void: _on_signal(starting, [])
		1:
			return func(a) -> void: _on_signal(starting, [a])
		2:
			return func(a, b) -> void: _on_signal(starting, [a, b])
		3:
			return func(a, b, c) -> void: _on_signal(starting, [a, b, c])
	return func(a, b, c, d) -> void: _on_signal(starting, [a, b, c, d])


func _on_signal(starting: bool, values: Array) -> void:
	if starting:
		_start(values)
	else:
		_stop()


func _start(values: Array) -> void:
	var direction := Vector2.ZERO
	for value in values:
		if value is Vector2:
			direction = (value as Vector2).normalized()
			break
	_stop()
	var at := global_position + direction * distance
	var angle := 0.0
	if use_direction and direction != Vector2.ZERO:
		angle = direction.angle()
	var holder: Node = self
	if not follow:
		holder = get_tree().current_scene
	var looping := not stop_signal_name.is_empty()
	var node := OneShotEffect.spawn(effect, at, holder, angle, looping)
	if looping:
		_running = node


func _stop() -> void:
	if is_instance_valid(_running):
		_running.queue_free()
	_running = null
