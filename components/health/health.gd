class_name Health
extends Node
## Health - Leben als Baustein.
##
## Benutzung: die Szene health.tscn als Kind mit dem Namen "Health" an eine
## Figur hängen und im Inspektor eine Werte-Datei (HealthStats) wählen.
## Schaden kommt über apply_damage(). Das ist die einzige Stelle, an der über
## Schaden entschieden wird: Tote und gerade Unverwundbare nehmen keinen.
## Ausrüstung wirkt hier mit (M11): armor zieht von jedem Treffer etwas ab -
## mindestens 1 bleibt -, set_bonus_maximum() gibt mehr Leben.
## damage_factor vervielfacht jeden Treffer vor der Rüstung (M13) - etwa bei
## einem Gegner, der den Angreifer noch nicht bemerkt hat.
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
## Rüstung: so viel weniger Schaden macht jeder Treffer; mindestens 1 bleibt (M11).
## Setzt der Baustein Equipment.
var armor := 0.0
## Faktor auf jeden Treffer, vor der Rüstung: 2 heißt doppelter Schaden (M13).
## Setzt etwa ein Gegner, solange er den Angreifer nicht bemerkt hat.
var damage_factor := 1.0

var _invulnerable_left := 0.0
var _bonus_maximum := 0.0


func _ready() -> void:
	if stats == null:
		push_warning("Health: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = HealthStats.new()
	current = get_maximum()


func _physics_process(delta: float) -> void:
	if _invulnerable_left > 0.0:
		_invulnerable_left -= delta


## Größtes Leben: laut Werte-Datei, dazu, was Ausrüstung gibt (M11).
func get_maximum() -> float:
	return stats.max_health + _bonus_maximum


## Mehr Leben durch Ausrüstung, etwa einen Anhänger (M11). Das aktuelle Leben
## bleibt, wie es ist, höchstens aber der neue Höchstwert.
func set_bonus_maximum(value: float) -> void:
	_bonus_maximum = maxf(value, 0.0)
	_set_current(minf(current, get_maximum()))
	changed.emit(current, get_maximum())


## Ist die Figur gerade unverwundbar - nach einem Treffer oder bei einem Dash?
func is_invulnerable() -> bool:
	return _invulnerable_left > 0.0


## Macht die Figur für die Dauer unverwundbar, etwa bei einem Dash (M5).
## Eine längere laufende Unverwundbarkeit bleibt bestehen.
func make_invulnerable(seconds: float) -> void:
	if is_dead:
		return
	_invulnerable_left = maxf(_invulnerable_left, seconds)


## Zieht Leben ab und liefert den Schaden, der wirklich ankam.
func apply_damage(amount: float) -> float:
	if is_dead or is_invulnerable() or amount <= 0.0:
		return 0.0
	amount *= maxf(damage_factor, 0.0)
	if amount <= 0.0:
		return 0.0
	if armor > 0.0:
		amount = maxf(amount - armor, 1.0)
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
	_set_current(get_maximum())
	if was_dead:
		revived.emit()


func _set_current(value: float) -> void:
	var new_value := clampf(value, 0.0, get_maximum())
	if is_equal_approx(new_value, current):
		return
	current = new_value
	changed.emit(current, get_maximum())
