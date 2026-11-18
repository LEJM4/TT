class_name State
extends Node
## State - ein Zustand für den Baustein StateMachine (M13).
##
## Ein erbendes Skript füllt enter(), exit() und physics_update() und wechselt
## mit machine.transition_to(name) in einen anderen Zustand. Der Name des
## Knotens ist der Name des Zustands.

## Name in der Debug-Anzeige. Leer: der Name des Knotens.
@export var display_name := ""

## Der Automat, zu dem der Zustand gehört.
var machine: StateMachine


## Der Zustand beginnt. previous ist der Name des vorigen, data kommt von transition_to().
func enter(_previous: StringName, _data: Dictionary) -> void:
	pass


## Der Zustand endet.
func exit() -> void:
	pass


## Ein Physik-Schritt, solange der Zustand aktiv ist.
func physics_update(_delta: float) -> void:
	pass


## Anzeigename des Zustands.
func get_display_name() -> String:
	if display_name.is_empty():
		return String(name)
	return display_name
