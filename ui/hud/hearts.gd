extends Control
## Hearts - das Leben einer Spielfigur als Reihe von Herzen (M12).
##
## Ein Herz steht für health_per_heart Leben aus der Werte-Datei und zeigt
## Viertel. Das Bild texture hat fünf gleich breite Zellen nebeneinander:
## leer, ein Viertel, halb, drei Viertel, voll. Es gibt so viele Herzen, wie
## der Höchstwert braucht - mit einem Anhänger mehr. Solange noch Leben übrig
## ist, bleibt mindestens ein Viertel zu sehen.
## Hört auf das Signal changed des Bausteins Health der Figur; das HUD ruft bind().
##
## Abschalten: den Knoten aus hud.tscn löschen.

## Zellen im Bild: leer bis voll.
const FRAMES := 5

## Werte-Datei mit den Leben je Herz.
@export var stats: HudStats
## Bild der Herzen: fünf Zellen nebeneinander.
@export var texture: Texture2D
## Abstand von Herz zu Herz in Pixeln.
@export var step := 16

var _health: Health
var _hearts := 0
var _quarters := 0


func _ready() -> void:
	if stats == null:
		push_warning("Hearts: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = HudStats.new()
	visible = false


## Zeigt das Leben dieser Figur; null blendet die Herzen aus.
func bind(player: Node) -> void:
	if _health != null and _health.changed.is_connected(_on_health_changed):
		_health.changed.disconnect(_on_health_changed)
	_health = null
	if player != null:
		_health = player.get_node_or_null("Health") as Health
	visible = _health != null
	if _health == null:
		return
	_health.changed.connect(_on_health_changed)
	_on_health_changed(_health.current, _health.get_maximum())


func _on_health_changed(current: float, maximum: float) -> void:
	var per_heart := maxf(stats.health_per_heart, 0.001)
	# Ein kleiner Abzug, damit 100 Leben genau 5 Herzen sind und nicht durch Rundung 6.
	_hearts = maxi(ceili(maximum / per_heart - 0.001), 0)
	_quarters = maxi(ceili(current / (per_heart / 4.0) - 0.001), 0)
	if current > 0.0:
		_quarters = maxi(_quarters, 1)
	queue_redraw()


func _draw() -> void:
	if texture == null:
		return
	var cell := Vector2(floorf(texture.get_width() / float(FRAMES)), texture.get_height())
	for index in _hearts:
		var frame := clampi(_quarters - index * 4, 0, FRAMES - 1)
		var source := Rect2(Vector2(frame * cell.x, 0.0), cell)
		draw_texture_rect_region(texture, Rect2(Vector2(index * step, 0.0), cell), source)
