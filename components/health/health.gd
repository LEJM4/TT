class_name Health
extends Node
## Health - Leben als Baustein.
##
## Benutzung: die Szene health.tscn als Kind mit dem Namen "Health" an eine
## Figur hängen und im Inspektor eine Werte-Datei (HealthStats) wählen.
## Schaden kommt über apply_damage(). Das ist die einzige Stelle, an der über
## Schaden entschieden wird: Tote und gerade Unverwundbare nehmen keinen.
## Später bestimmt hier der Gastgeber des Spiels.
##
## Abschalten: Knoten löschen - die Figur nimmt dann keinen Schaden mehr.

## Das Leben hat sich geändert.
signal changed(current: float, maximum: float)
## Schaden ist angekommen.
signal damaged(amount: float)
## Das Leben ist auf 0 gefallen.
signal died
## Das Leben wurde nach dem Tod zurückgesetzt.
signal revived

## Werte-Datei mit Höchstwert und Unverwundbarkeit.
@export var stats: HealthStats

## Aktuelles Leben.
var current := 0.0
## Tot: Das Leben ist auf 0 gefallen und wurde noch nicht zurückgesetzt.
var is_dead := false

var _invulnerable_left := 0.0


func _ready() -> void:
	if stats == null:
		push_warning("Health: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = HealthStats.new()
	current = stats.max_health


func _physics_process(delta: float) -> void:
	if _invulnerable_left > 0.0:
		_invulnerable_left -= delta


## Größtes Leben laut Werte-Datei.
func get_maximum() -> float:
	return stats.max_health


## Ist die Figur nach einem Treffer gerade unverwundbar?
func is_invulnerable() -> bool:
	return _invulnerable_left > 0.0


## Zieht Leben ab und liefert den Schaden, der wirklich ankam.
func apply_damage(amount: float) -> float:
	if is_dead or is_invulnerable() or amount <= 0.0:
		return 0.0
	var before := current
	_set_current(current - amount)
	var dealt := before - current
	if dealt <= 0.0:
		return 0.0
	if current <= 0.0:
		is_dead = true
	else:
		_invulnerable_left = stats.invulnerable_time
	damaged.emit(dealt)
	if is_dead:
		died.emit()
	return dealt


## Setzt das Leben auf den Höchstwert zurück, auch nach dem Tod.
func reset() -> void:
	var was_dead := is_dead
	is_dead = false
	_invulnerable_left = 0.0
	_set_current(stats.max_health)
	if was_dead:
		revived.emit()


func _set_current(value: float) -> void:
	var new_value := clampf(value, 0.0, stats.max_health)
	if is_equal_approx(new_value, current):
		return
	current = new_value
	changed.emit(current, stats.max_health)
