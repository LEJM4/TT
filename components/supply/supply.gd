class_name Supply
extends Node
## Supply - ein zählbarer Vorrat als Baustein: Munition, Energie.
##
## Benutzung: die Szene supply.tscn als Kind an eine Figur hängen, dem Knoten
## einen sprechenden Namen geben (etwa "Ammo") und im Inspektor eine
## Werte-Datei (SupplyStats) wählen. Wer etwas verbraucht, ruft spend(menge)
## auf, wer etwas zurückgibt, add(menge). Steht in der Werte-Datei eine
## Erholung, füllt sich der Vorrat außerdem von selbst.
##
## Abschalten: Knoten löschen - wer ihn nutzt, arbeitet dann kostenlos.

## Der Vorrat hat sich geändert.
signal changed(current: float, maximum: float)

## Werte-Datei mit Höchstwert und Erholung.
@export var stats: SupplyStats

## Aktueller Vorrat.
var current := 0.0

var _regen_wait := 0.0


func _ready() -> void:
	if stats == null:
		push_warning("Supply: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = SupplyStats.new()
	current = stats.max_amount


func _physics_process(delta: float) -> void:
	if stats.regen_per_second <= 0.0 or current >= stats.max_amount:
		return
	if _regen_wait > 0.0:
		_regen_wait -= delta
		return
	_set_current(current + stats.regen_per_second * delta)


## Größter Vorrat laut Werte-Datei.
func get_maximum() -> float:
	return stats.max_amount


## Verbraucht die Menge und liefert, ob genug da war. Reicht es nicht, bleibt der Vorrat unberührt.
func spend(amount: float) -> bool:
	if amount <= 0.0:
		return true
	if current + 0.0001 < amount:
		return false
	_regen_wait = stats.regen_delay
	_set_current(current - amount)
	return true


## Füllt den Vorrat um die Menge auf, höchstens bis zum Höchstwert (M7).
func add(amount: float) -> void:
	if amount <= 0.0:
		return
	_set_current(current + amount)


func _set_current(value: float) -> void:
	var new_value := clampf(value, 0.0, stats.max_amount)
	if is_equal_approx(new_value, current):
		return
	current = new_value
	changed.emit(current, stats.max_amount)
