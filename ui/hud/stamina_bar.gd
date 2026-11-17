extends Control
## StaminaBar - die Ausdauer einer Spielfigur als schmale Leiste (M12).
##
## Kinder: Frame (NinePatchRect, der Rahmen) und Fill (ColorRect, die Füllung
## im Rahmen). Die Füllung ist grün und wird rot, solange die Figur erschöpft
## ist - bis wieder genug Ausdauer da ist. Sie wächst in ganzen Pixeln.
## Hört auf die Signale changed, exhausted und recovered des Bausteins Stamina
## der Figur; das HUD ruft bind().
##
## Abschalten: den Knoten aus hud.tscn löschen.

## Farbe der Füllung - das Grün aus dem Paket.
@export var fill_color := Color(0.678, 0.737, 0.227)
## Farbe der Füllung, solange die Figur erschöpft ist - das Rot aus dem Paket.
@export var exhausted_color := Color(0.878, 0.224, 0.298)
## Breite des Rahmens in Pixeln; um so viel ist die Füllung eingerückt.
@export var border := 1

var _stamina: Stamina

@onready var _fill := get_node_or_null("Fill") as ColorRect


func _ready() -> void:
	visible = false


## Zeigt die Ausdauer dieser Figur; null blendet die Leiste aus.
func bind(player: Node) -> void:
	if _stamina != null:
		if _stamina.changed.is_connected(_on_stamina_changed):
			_stamina.changed.disconnect(_on_stamina_changed)
		if _stamina.exhausted.is_connected(_update_color):
			_stamina.exhausted.disconnect(_update_color)
		if _stamina.recovered.is_connected(_update_color):
			_stamina.recovered.disconnect(_update_color)
	_stamina = null
	if player != null:
		_stamina = player.get_node_or_null("Stamina") as Stamina
	visible = _stamina != null and _fill != null
	if not visible:
		return
	_stamina.changed.connect(_on_stamina_changed)
	_stamina.exhausted.connect(_update_color)
	_stamina.recovered.connect(_update_color)
	_on_stamina_changed(_stamina.current, _stamina.get_maximum())


func _on_stamina_changed(current: float, maximum: float) -> void:
	var ratio := 0.0
	if maximum > 0.0:
		ratio = clampf(current / maximum, 0.0, 1.0)
	var inner := maxf(size.x - 2.0 * border, 0.0)
	var width := roundf(inner * ratio)
	if current > 0.0:
		width = maxf(width, 1.0)
	_fill.position = Vector2(border, border)
	_fill.size = Vector2(width, maxf(size.y - 2.0 * border, 0.0))
	_fill.visible = width > 0.0
	_update_color()


func _update_color() -> void:
	if _stamina == null or _fill == null:
		return
	if _stamina.is_exhausted:
		_fill.color = exhausted_color
	else:
		_fill.color = fill_color
