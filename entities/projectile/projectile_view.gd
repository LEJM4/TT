class_name ProjectileView
extends Node2D
## ProjectileView - zeigt ein Geschoss mit dem Bild aus seinen Werten (M11a).
##
## Benutzung: als Kind "ProjectileView" in die Geschoss-Szene hängen. Der
## Baustein hört auf sein Geschoss, den Elternknoten: Beim Start baut er das
## Bild aus RangedStats.skin, bei der Explosion spielt er ihren Effekt ab.
## Hat das Geschoss ein Bild, blendet er den Platzhalter aus.
## Rein fürs Auge - Treffer und Explosion entscheidet das Geschoss.
##
## Abschalten: Knoten löschen - das Geschoss zeigt wieder den gelben Platzhalter.

## Der Platzhalter, der verschwindet, sobald das Geschoss ein Bild hat.
@export var placeholder_path := NodePath("../Hitbox/PlaceholderView")

var _spin := 0.0
var _explosion: EffectData


func _ready() -> void:
	set_process(false)
	var projectile := get_parent() as Projectile
	if projectile == null:
		return
	projectile.launched.connect(_on_launched)
	projectile.detonated.connect(_on_detonated)


func _process(delta: float) -> void:
	rotation += deg_to_rad(_spin) * delta


func _on_launched(shot: RangedStats) -> void:
	if shot == null or shot.skin == null or shot.skin.texture == null:
		return
	var skin := shot.skin
	var frames := _build_frames(skin)
	if frames.get_frame_count(&"default") == 0:
		return
	var size := _frame_size(skin)
	var sprite := AnimatedSprite2D.new()
	sprite.sprite_frames = frames
	sprite.centered = false
	sprite.offset = Vector2(-(size / 2))
	add_child(sprite)
	sprite.play(&"default")
	_explosion = skin.explosion
	_spin = skin.spin
	set_process(_spin != 0.0)
	var placeholder := get_node_or_null(placeholder_path) as CanvasItem
	if placeholder != null:
		placeholder.visible = false


func _on_detonated(at: Vector2) -> void:
	visible = false
	set_process(false)
	var scene_root := get_tree().current_scene
	if _explosion != null and scene_root != null:
		OneShotEffect.spawn(_explosion, at, scene_root)


func _frame_size(skin: ProjectileSkin) -> Vector2i:
	if skin.frame_size == Vector2i.ZERO:
		return Vector2i(skin.texture.get_size())
	return skin.frame_size


func _build_frames(skin: ProjectileSkin) -> SpriteFrames:
	var frames := SpriteFrames.new()
	frames.set_animation_speed(&"default", skin.fps)
	frames.set_animation_loop(&"default", true)
	var size := _frame_size(skin)
	var sheet := Rect2i(Vector2i.ZERO, Vector2i(skin.texture.get_size()))
	for index in skin.frame_count:
		var region := Rect2i(Vector2i(size.x * (skin.first_frame + index), 0), size)
		if not sheet.encloses(region):
			push_warning("ProjectileView: Bild %d liegt außerhalb von %s." % [skin.first_frame + index + 1, skin.texture.resource_path])
			break
		var image := AtlasTexture.new()
		image.atlas = skin.texture
		image.region = Rect2(region)
		frames.add_frame(&"default", image)
	return frames
