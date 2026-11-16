extends Node2D
## DamageNumbers - zeigt bei jedem Schaden die Zahl über dem Elternknoten.
##
## Benutzung: die Szene damage_numbers.tscn als Kind an eine Figur hängen, die
## auch ein Kind mit dem Namen "Health" hat. Die Zahl steigt kurz auf,
## verblasst und verschwindet.
##
## Abschalten: Knoten löschen - Schaden wirkt weiter, nur ohne Zahl.

## Farbe der Zahl.
@export var color := Color(1.0, 0.9, 0.4)
## Schriftgröße in Pixeln.
@export var font_size := 10
## Breite des dunklen Rands um die Zahl, in Pixeln.
@export var outline_size := 1
## So weit steigt die Zahl auf, in Pixeln.
@export var rise_distance := 14.0
## So lange ist die Zahl zu sehen, in Sekunden.
@export var duration := 0.6
## Startpunkt der Zahl, vom Elternknoten aus gesehen.
@export var start_offset := Vector2(0.0, -22.0)


func _ready() -> void:
	var health := get_parent().get_node_or_null("Health") as Health
	if health != null:
		health.damaged.connect(_on_damaged)


func _on_damaged(amount: float) -> void:
	var scene_root := get_tree().current_scene
	if scene_root == null:
		return
	var label := Label.new()
	label.text = "%d" % roundi(amount)
	label.z_index = 100
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", color)
	label.add_theme_color_override("font_outline_color", Color.BLACK)
	label.add_theme_constant_override("outline_size", outline_size)
	scene_root.add_child(label)
	label.reset_size()
	label.global_position = global_position + start_offset - Vector2(label.size.x * 0.5, 0.0)
	var tween := label.create_tween()
	tween.set_parallel(true)
	tween.tween_property(label, "position:y", label.position.y - rise_distance, duration)
	tween.tween_property(label, "modulate:a", 0.0, duration)
	tween.chain().tween_callback(label.queue_free)
