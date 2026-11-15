class_name Stamina
extends Node
## Stamina - Ausdauer als Baustein.
##
## Benutzung: die Szene stamina.tscn als Kind an eine Figur hängen und im
## Inspektor eine Werte-Datei (StaminaStats) wählen. Die Figur ruft spend()
## auf; der Vorrat füllt sich nach einer kurzen Pause von selbst.
## Ist der Vorrat einmal leer, gilt die Figur als erschöpft, bis er wieder
## über recover_threshold liegt.
##
## Abschalten: Knoten löschen - die Spielfigur sprintet dann unbegrenzt.

## Der Vorrat hat sich geändert.
signal changed(current: float, maximum: float)
## Der Vorrat ist aufgebraucht.
signal exhausted
## Nach einer Erschöpfung ist wieder genug da.
signal recovered

## Werte-Datei mit Vorrat, Erholung und Pause.
@export var stats: StaminaStats

## Aktueller Vorrat.
var current := 0.0
## Erschöpft: Erst ab recover_threshold lässt sich wieder etwas verbrauchen.
var is_exhausted := false

var _regen_wait := 0.0


func _ready() -> void:
	if stats == null:
		push_warning("Stamina: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = StaminaStats.new()
	current = stats.max_stamina
	changed.emit(current, stats.max_stamina)


func _physics_process(delta: float) -> void:
	if _regen_wait > 0.0:
		_regen_wait -= delta
		return
	if current < stats.max_stamina:
		_set_current(current + stats.regen_per_second * delta)


## Größter Vorrat laut Werte-Datei.
func get_maximum() -> float:
	return stats.max_stamina


## Lässt sich gerade etwas verbrauchen?
func can_spend() -> bool:
	return not is_exhausted and current > 0.0


## Verbraucht Ausdauer und liefert, ob das möglich war.
func spend(amount: float) -> bool:
	if not can_spend():
		return false
	_regen_wait = stats.regen_delay
	_set_current(current - amount)
	return true


func _set_current(value: float) -> void:
	var new_value := clampf(value, 0.0, stats.max_stamina)
	if is_equal_approx(new_value, current):
		return
	current = new_value
	changed.emit(current, stats.max_stamina)
	if current <= 0.0 and not is_exhausted:
		is_exhausted = true
		exhausted.emit()
	elif is_exhausted and current >= stats.recover_threshold:
		is_exhausted = false
		recovered.emit()
