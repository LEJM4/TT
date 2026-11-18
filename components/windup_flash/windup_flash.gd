extends Node
## WindupFlash - lässt eine Figur rot blinken, solange sie zum Schlag ausholt (M13).
##
## Benutzung: die Szene windup_flash.tscn als Kind an eine Figur hängen, die
## einen Baustein MeleeAttack mit Ausholen (windup_time) hat. Hört auf dessen
## Signale attack_windup, attack_started und attack_cancelled und färbt das
## Geschwister target_name über modulate - fehlt es, die Figur selbst.
## So kündigt ein Gegner jeden Angriff sichtbar an. Rein fürs Auge.
##
## Abschalten: Knoten löschen - die Figur holt weiter aus, nur ohne Blinken.

## Name des Geschwisters mit dem Schlag.
@export var melee_name := "MeleeAttack"
## Name des Geschwisters, das blinkt. Fehlt es, blinkt die ganze Figur.
@export var target_name := "CharacterView"
## Färbung im roten Blinkschritt; Werte über 1 machen heller.
@export var tint := Color(1.8, 0.5, 0.5)
## Dauer eines Blinkschritts in Sekunden.
@export var blink_interval := 0.08

var _target: CanvasItem
var _active := false
var _clock := 0.0


func _ready() -> void:
	var holder := get_parent()
	_target = holder.get_node_or_null(target_name) as CanvasItem
	if _target == null:
		_target = holder as CanvasItem
	var melee := holder.get_node_or_null(melee_name) as MeleeAttack
	if melee == null:
		return
	melee.attack_windup.connect(_on_windup)
	melee.attack_started.connect(_on_attack_started)
	melee.attack_cancelled.connect(_stop)


func _process(delta: float) -> void:
	if not _active or _target == null:
		return
	_clock += delta
	var step := int(_clock / maxf(blink_interval, 0.01))
	if step % 2 == 0:
		_target.modulate = tint
	else:
		_target.modulate = Color.WHITE


func _on_windup(_direction: Vector2) -> void:
	_active = true
	_clock = 0.0


func _on_attack_started(_direction: Vector2) -> void:
	_stop()


func _stop() -> void:
	if not _active:
		return
	_active = false
	if _target != null:
		_target.modulate = Color.WHITE
