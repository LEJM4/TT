extends StaticBody2D
## TrainingDummy - Übungspuppe für die Testkammer (M4).
##
## Steht fest, hat Leben, blitzt bei Treffern auf und zeigt Schadenszahlen.
## Ist das Leben auf 0, wird sie grau und steht nach kurzer Zeit mit vollem
## Leben wieder auf. Alles Wesentliche machen die Bausteine Health, Hurtbox,
## HitFlash und DamageNumbers; dieses Skript wechselt nur die Farbe und weckt
## die Puppe wieder. Ihr Leben steht in data/dummy/health.tres.

## Sekunden vom Umfallen bis zum Wiederaufstehen.
@export var revive_delay := 2.0
## Farbe der Puppe, solange sie Leben hat.
@export var alive_color := Color(0.72, 0.45, 0.85)
## Farbe der Puppe, wenn ihr Leben auf 0 ist.
@export var defeated_color := Color(0.35, 0.35, 0.38)

@onready var _health := get_node_or_null("Health") as Health
@onready var _view := get_node_or_null("PlaceholderView") as Node2D


func _ready() -> void:
	_show_color(alive_color)
	if _health == null:
		return
	_health.died.connect(_on_died)
	_health.revived.connect(_on_revived)


func _on_died() -> void:
	_show_color(defeated_color)
	get_tree().create_timer(revive_delay).timeout.connect(_revive)


func _revive() -> void:
	if _health != null:
		_health.reset()


func _on_revived() -> void:
	_show_color(alive_color)


func _show_color(new_color: Color) -> void:
	if _view == null:
		return
	_view.set("color", new_color)
	_view.queue_redraw()
