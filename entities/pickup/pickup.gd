class_name Pickup
extends Area2D
## Pickup - ein Gegenstand am Boden, der darauf wartet, aufgesammelt zu werden (M9).
##
## Erzeugt wird er vom LootSpawner des Levels; der ruft direkt nach dem Einhängen
## drop() auf. Der Gegenstand springt dann vom Ort der Beute auf seinen Platz und
## lässt sich erst danach aufsammeln. Aufsammeln tut ein Collector: Er nimmt mit
## take(), so viel ins Inventar passt; der Rest bleibt liegen. Ist nichts mehr
## übrig, verschwindet der Pickup.
## Das Bild ist das Symbol des Gegenstands (Kind "Icon"), bei mehr als einem
## Stück mit Zahl (Kind "Icon/Count"); darunter ein kleiner Schatten.
## Er liegt auf der Ebene "pickup". Von Hand ins Level gelegt, liegt er gleich
## bereit - dann im Inspektor item und amount wählen. Was von einem solchen
## Pickup schon aufgesammelt ist, merkt sich sein Kind "Persistent" im
## Spielstand (M16); Beute aus dem LootSpawner merkt es sich nicht - sie ist
## nach Tod, Neustart und Laden weg.

## Es wurde etwas weggenommen; amount_left ist, was noch liegt (M16).
signal taken(amount_left: int)
## Der Pickup ist leer und verschwindet.
signal emptied

## Der Gegenstand.
@export var item: ItemData
## Wie viele davon hier liegen.
@export_range(1, 999) var amount := 1
## So hoch springt der Gegenstand beim Hinfallen, in Pixeln.
@export var hop_height := 10.0
## So lange dauert der Sprung, in Sekunden.
@export var hop_time := 0.35
## So weit wippt das Symbol am Boden auf und ab, in Pixeln; 0 schaltet es ab.
@export var bob_height := 1.0
## Farbe des Schattens.
@export var shadow_color := Color(0.0, 0.0, 0.0, 0.3)

var _landed := true
var _from := Vector2.ZERO
var _to := Vector2.ZERO
var _clock := 0.0
var _icon_rest := Vector2.ZERO

@onready var _icon := get_node_or_null("Icon") as Sprite2D
@onready var _count := get_node_or_null("Icon/Count") as Label


func _ready() -> void:
	if _icon != null:
		_icon_rest = _icon.position
	_show_item()


func _process(delta: float) -> void:
	if not _landed or _icon == null or bob_height <= 0.0:
		return
	_clock += delta
	_icon.position.y = _icon_rest.y - roundf((sin(_clock * 4.0) + 1.0) * 0.5 * bob_height)


func _draw() -> void:
	draw_set_transform(Vector2(0.0, 1.0), 0.0, Vector2(1.0, 0.45))
	draw_circle(Vector2.ZERO, 5.0, shadow_color)
	draw_set_transform_matrix(Transform2D.IDENTITY)


## Lässt den Gegenstand von from nach to springen; erst danach ist er zu haben.
func drop(from: Vector2, to: Vector2) -> void:
	_from = from
	_to = to
	_landed = false
	global_position = from
	var hop := create_tween()
	hop.tween_method(_hop_step, 0.0, 1.0, maxf(hop_time, 0.01))
	hop.tween_callback(_land)


## Liegt er bereit zum Aufsammeln?
func can_collect() -> bool:
	return _landed and amount > 0 and item != null


## Nimmt count Stück weg; ist nichts mehr übrig, verschwindet der Pickup.
func take(count: int) -> void:
	if count <= 0:
		return
	amount = maxi(amount - count, 0)
	taken.emit(amount)
	if amount > 0:
		_show_item()
		return
	emptied.emit()
	queue_free()


## Zustand für den Spielstand (M16): wie viele noch liegen.
func get_saved_state() -> Dictionary:
	return {"amount": amount}


## Stellt den Zustand aus dem Spielstand her (M16): Liegt nichts mehr da, verschwindet er.
func apply_saved_state(data: Dictionary) -> void:
	var left: Variant = data.get("amount")
	if not (left is int or left is float):
		return
	amount = maxi(int(left), 0)
	if amount > 0:
		_show_item()
		return
	visible = false
	set_deferred("monitorable", false)
	queue_free()


func _hop_step(progress: float) -> void:
	global_position = _from.lerp(_to, progress)
	if _icon != null:
		_icon.position.y = _icon_rest.y - sin(progress * PI) * hop_height


func _land() -> void:
	global_position = _to
	if _icon != null:
		_icon.position = _icon_rest
	_clock = 0.0
	_landed = true


func _show_item() -> void:
	if _icon != null and item != null:
		_icon.texture = item.icon
		# Mittig, auch bei Symbolen, die nicht 16 x 16 groß sind (M11).
		if item.icon != null:
			_icon.offset = -(item.icon.get_size() / 2.0).floor()
	if _count != null:
		_count.text = str(amount)
		_count.visible = amount > 1
