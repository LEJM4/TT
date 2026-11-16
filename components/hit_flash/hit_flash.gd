extends Node
## HitFlash - lässt den Elternknoten bei Schaden aufblitzen.
##
## Benutzung: die Szene hit_flash.tscn als Kind an eine Figur hängen, die
## auch ein Kind mit dem Namen "Health" hat. Bei jedem Schaden wird die
## Figur kurz hell; solange sie danach unverwundbar ist, blinkt sie.
## Der Baustein färbt über "modulate" des Elternknotens und fasst den Wert
## nur an, solange ein Effekt läuft.
##
## Abschalten: Knoten löschen - Schaden wirkt weiter, nur ohne Aufblitzen.

## Dauer des Aufblitzens in Sekunden.
@export var flash_time := 0.1
## Helligkeit beim Aufblitzen; 1 ist normal.
@export var flash_strength := 3.0
## Blinken, solange die Figur unverwundbar ist?
@export var blink_while_invulnerable := true
## Dauer eines Blinkschritts in Sekunden.
@export var blink_interval := 0.08
## Deckkraft im durchsichtigen Blinkschritt.
@export_range(0.0, 1.0, 0.05) var blink_alpha := 0.35

var _flash_left := 0.0
var _blink_clock := 0.0
var _is_tinted := false
var _target: CanvasItem
var _health: Health


func _ready() -> void:
	_target = get_parent() as CanvasItem
	_health = get_parent().get_node_or_null("Health") as Health
	if _health != null:
		_health.damaged.connect(_on_damaged)


func _process(delta: float) -> void:
	if _target == null:
		return
	if _flash_left > 0.0:
		_flash_left -= delta
		_tint(Color(flash_strength, flash_strength, flash_strength, 1.0))
	elif blink_while_invulnerable and _health != null and _health.is_invulnerable():
		_blink_clock += delta
		var step := int(_blink_clock / maxf(blink_interval, 0.01))
		var alpha := 1.0
		if step % 2 == 0:
			alpha = blink_alpha
		_tint(Color(1.0, 1.0, 1.0, alpha))
	elif _is_tinted:
		_target.modulate = Color.WHITE
		_is_tinted = false


func _tint(tint: Color) -> void:
	_target.modulate = tint
	_is_tinted = true


func _on_damaged(_amount: float) -> void:
	_flash_left = flash_time
	_blink_clock = 0.0
