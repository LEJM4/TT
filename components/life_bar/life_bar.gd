extends Node2D
## LifeBar - eine kleine Lebensleiste über einer Figur (M13).
##
## Benutzung: die Szene life_bar.tscn als Kind an eine Figur mit dem Baustein
## Health hängen und über den Kopf schieben. Gezeichnet werden zwei gleich
## große Bilder übereinander, mittig: texture_under als leere Leiste und
## texture_progress als Füllung von links; der Rand border bleibt immer stehen.
## Die Leiste erscheint erst nach dem ersten Schaden und verschwindet beim Tod.
## Hört auf changed, died und revived von Health.
##
## Abschalten: Knoten löschen - die Figur hat dann keine Leiste.

## Bild der leeren Leiste.
@export var texture_under: Texture2D
## Bild der vollen Leiste, gleich groß; davon wird der linke Teil gezeigt.
@export var texture_progress: Texture2D
## Breite des Rands in Pixeln, der links und rechts immer zu sehen ist.
@export var border := 1
## Bei vollem Leben ausblenden?
@export var hide_when_full := true
## Name des Geschwisters mit dem Leben.
@export var health_name := "Health"

var _health: Health
var _ratio := 1.0


func _ready() -> void:
	_health = get_parent().get_node_or_null(health_name) as Health
	if _health == null:
		visible = false
		return
	_health.changed.connect(_on_health_changed)
	_health.died.connect(_refresh)
	_health.revived.connect(_refresh)
	_on_health_changed(_health.current, _health.get_maximum())


func _on_health_changed(current: float, maximum: float) -> void:
	_ratio = 0.0
	if maximum > 0.0:
		_ratio = clampf(current / maximum, 0.0, 1.0)
	_refresh()


func _refresh() -> void:
	if _health == null:
		return
	visible = not _health.is_dead and not (hide_when_full and _ratio >= 1.0)
	queue_redraw()


func _draw() -> void:
	if texture_under == null:
		return
	var size := texture_under.get_size()
	var origin := -(size / 2.0).floor()
	draw_texture(texture_under, origin)
	if texture_progress == null or _ratio <= 0.0:
		return
	var inner := maxf(size.x - 2.0 * border, 0.0)
	var width := border + maxf(roundf(inner * _ratio), 1.0)
	var part := Rect2(Vector2.ZERO, Vector2(width, size.y))
	draw_texture_rect_region(texture_progress, Rect2(origin, part.size), part)
