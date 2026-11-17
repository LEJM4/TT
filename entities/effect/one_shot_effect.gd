class_name OneShotEffect
extends AnimatedSprite2D
## OneShotEffect - spielt einen Effekt einmal ab und verschwindet (M11a).
##
## Erzeugt wird er mit OneShotEffect.spawn(effekt, ort, eltern). Er hängt
## nicht an dem, der ihn auslöst: Er läuft zu Ende, auch wenn das Geschoss
## oder die Figur schon weg ist. Rein fürs Auge - er entscheidet nichts.

## Zeichenebene der Effekte: über den Figuren, unter den Schadenszahlen.
const EFFECT_Z_INDEX := 50


## Spielt den Effekt einmal am Ort ab. Liefert den neuen Knoten oder null.
static func spawn(effect: EffectData, at: Vector2, parent: Node) -> OneShotEffect:
	if effect == null or effect.texture == null or parent == null:
		return null
	var frames := _build_frames(effect)
	if frames.get_frame_count(&"default") == 0:
		return null
	var node := OneShotEffect.new()
	node.sprite_frames = frames
	node.centered = false
	node.offset = Vector2(effect.offset - effect.frame_size / 2)
	node.z_index = EFFECT_Z_INDEX
	parent.add_child(node)
	node.global_position = at
	node.animation_finished.connect(node.queue_free)
	node.play(&"default")
	return node


static func _build_frames(effect: EffectData) -> SpriteFrames:
	var frames := SpriteFrames.new()
	frames.set_animation_speed(&"default", effect.fps)
	frames.set_animation_loop(&"default", false)
	var sheet := Rect2i(Vector2i.ZERO, Vector2i(effect.texture.get_size()))
	for index in effect.frame_count:
		var region := Rect2i(Vector2i(effect.frame_size.x * index, 0), effect.frame_size)
		if not sheet.encloses(region):
			push_warning("OneShotEffect: Bild %d liegt außerhalb von %s." % [index + 1, effect.texture.resource_path])
			break
		var image := AtlasTexture.new()
		image.atlas = effect.texture
		image.region = Rect2(region)
		frames.add_frame(&"default", image)
	return frames
