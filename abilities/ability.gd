class_name Ability
extends Node
## Ability - Grundgerüst jeder Fähigkeit: Kosten, Dauer und Abklingzeit (M7).
##
## Eine Fähigkeit ist eine eigene Szene, deren Skript von diesem erbt und nur
## die Wirkung beschreibt: _begin_effect() schaltet sie ein, _end_effect() aus.
## Benutzung: die Szene der Fähigkeit unter den Knoten "Abilities" einer Figur
## hängen und im Inspektor eine Werte-Datei wählen. Der Platz unter "Abilities"
## bestimmt die Taste: das erste Kind liegt auf Fähigkeit 1.
## Bezahlt wird aus dem Kind der Figur mit dem Namen aus supply_name (ein Supply).
## Die Abklingzeit beginnt, wenn die Wirkung endet.
##
## Abschalten: Knoten löschen - die Figur hat diese Fähigkeit dann nicht mehr.

## Die Fähigkeit wurde eingesetzt.
signal activated
## Die Wirkung ist vorbei; die Abklingzeit beginnt.
signal finished

## Werte-Datei mit Name, Kosten, Dauer und Abklingzeit.
@export var stats: AbilityStats
## Name des Kindes der Figur, das die Fähigkeit bezahlt. Leer: Sie ist kostenlos.
@export var supply_name := "Energy"

## Wirkt die Fähigkeit gerade?
var is_active := false

var _time_left := 0.0
var _cooldown_left := 0.0
var _user: Node
var _supply: Supply


func _ready() -> void:
	if stats == null:
		push_warning("Ability: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = AbilityStats.new()
	_user = _find_user()
	if _user != null and not supply_name.is_empty():
		_supply = _user.get_node_or_null(supply_name) as Supply


func _exit_tree() -> void:
	if is_active:
		is_active = false
		_end_effect()


func _physics_process(delta: float) -> void:
	if _cooldown_left > 0.0:
		_cooldown_left -= delta
	if not is_active:
		return
	_time_left -= delta
	if _time_left <= 0.0:
		is_active = false
		_cooldown_left = stats.cooldown
		_end_effect()
		finished.emit()


## Die Figur, zu der die Fähigkeit gehört.
func get_user() -> Node:
	return _user


## Ist die Fähigkeit gerade einsetzbar? Der Vorrat wird erst beim Einsatz geprüft.
func is_ready() -> bool:
	return not is_active and _cooldown_left <= 0.0


## Sekunden, die die Wirkung noch anhält.
func get_time_left() -> float:
	if not is_active:
		return 0.0
	return maxf(_time_left, 0.0)


## Sekunden, bis die Fähigkeit nach ihrer Wirkung wieder einsetzbar ist.
func get_cooldown_left() -> float:
	return maxf(_cooldown_left, 0.0)


## Setzt die Fähigkeit ein, wenn sie bereit ist und der Vorrat reicht. Liefert, ob es klappte.
func try_activate() -> bool:
	if not is_ready():
		return false
	if _supply != null and not _supply.spend(stats.cost):
		return false
	is_active = true
	_time_left = stats.duration
	_begin_effect()
	activated.emit()
	return true


## Für erbende Skripte: die Wirkung einschalten.
func _begin_effect() -> void:
	pass


## Für erbende Skripte: die Wirkung ausschalten.
func _end_effect() -> void:
	pass


func _find_user() -> Node:
	# Im Normalfall die Wurzel der Szene, in die die Fähigkeit eingehängt ist.
	if owner != null:
		return owner
	var holder := get_parent()
	if holder != null:
		return holder.get_parent()
	return null
