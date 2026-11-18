class_name StateMachine
extends Node
## StateMachine - Zustandsautomat als Baustein (M13).
##
## Benutzung: die Szene state_machine.tscn als Kind an eine Figur hängen und
## darunter je Zustand einen Knoten, dessen Skript von State erbt. Genau ein
## Zustand ist aktiv; nur er bekommt physics_update(). Gewechselt wird mit
## transition_to(name) - aus einem Zustand heraus oder von außen. Begonnen
## wird mit initial_state, sobald alle Knoten der Szene bereit sind.
## Der Automat läuft vor seiner Figur (process_physics_priority -1), damit sie
## im selben Schritt ausführt, was der Zustand will.
##
## Abschalten: Knoten löschen - die Figur tut dann nichts mehr von selbst.

## Der Zustand hat gewechselt.
signal state_changed(previous: StringName, current: StringName)

## Name des ersten Zustands. Leer: das erste Kind.
@export var initial_state: StringName = &""

## Der aktive Zustand; null, solange noch keiner begonnen hat.
var current: State
## Name des aktiven Zustands.
var current_name: StringName = &""


func _ready() -> void:
	for child in get_children():
		var state := child as State
		if state != null:
			state.machine = self
	# Erst beginnen, wenn auch die Figur und ihre übrigen Bausteine bereit sind.
	_start.call_deferred()


func _physics_process(delta: float) -> void:
	if current != null:
		current.physics_update(delta)


## Wechselt in den Zustand mit diesem Namen; data reicht ihm Werte weiter.
func transition_to(state_name: StringName, data: Dictionary = {}) -> void:
	var next := get_node_or_null(NodePath(String(state_name))) as State
	if next == null:
		push_warning("StateMachine: Zustand '%s' fehlt." % state_name)
		return
	var previous := current_name
	if current != null:
		current.exit()
	current = next
	current_name = state_name
	current.enter(previous, data)
	state_changed.emit(previous, state_name)


## Anzeigename des aktiven Zustands, etwa für die Debug-Anzeige.
func get_display_name() -> String:
	if current == null:
		return "-"
	return current.get_display_name()


func _start() -> void:
	if current != null or not is_inside_tree():
		return
	var first := initial_state
	if first == &"":
		for child in get_children():
			if child is State:
				first = child.name
				break
	if first != &"":
		transition_to(first)
