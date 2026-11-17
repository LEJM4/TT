class_name OneShotEffect
extends AnimatedSprite2D
## OneShotEffect - spielt einen Effekt ab und verschwindet danach (M11a, A2).
##
## Erzeugt wird er mit OneShotEffect.spawn(effekt, ort, eltern, winkel, wiederholen).
## Ohne Wiederholung läuft er einmal ab und löscht sich selbst. Mit Wiederholung
## läuft er, bis ihn jemand mit queue_free() entfernt - etwa EffectCue beim
## Ende einer Betäubung. Hängt er nicht an der Figur, läuft er zu Ende, auch
## wenn das Geschoss oder die Figur schon weg ist. Gedreht wird um die Bildmitte;
## die Verschiebung aus der Werte-Datei dreht nicht mit. Rein fürs Auge - er entscheidet nichts.

## Zeichenebene der Effekte: über den Figuren, unter den Schadenszahlen.
const EFFECT_Z_INDEX := 50


## Spielt den Effekt am Ort ab, gedreht um angle (Bogenmaß). Liefert den neuen Knoten oder null.
static func spawn(effect: EffectData, at: Vector2, parent: Node, angle := 0.0, looping := false) -> OneShotEffect:
	if effect == null or effect.texture == null or parent == null:
		return null
	var frames := _build_frames(effect, looping)
	if frames.get_frame_count(&"default") == 0:
		return null
	var node := OneShotEffect.new()
	node.sprite_frames = frames
	node.centered = false
	node.offset = -Vector2(effect.frame_size / 2)
	node.z_index = EFFECT_Z_INDEX
	parent.add_child(node)
	node.global_position = at + Vector2(effect.offset)
	node.global_rotation = angle
	if not looping:
		node.animation_finished.connect(node.queue_free)
	node.play(&"default")
	return node


static func _build_frames(effect: EffectData, looping: bool) -> SpriteFrames:
	var frames := SpriteFrames.new()
	frames.set_animation_speed(&"default", effect.fps)
	frames.set_animation_loop(&"default", looping)
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
