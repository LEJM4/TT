class_name Debris
extends CPUParticles2D
## Debris - Splitter, die einmal auseinanderfliegen und danach verschwinden (M9).
##
## Erzeugt wird er mit Debris.spawn(werte, ort, eltern), meist über den Baustein
## DebrisCue. Die Werte kommen aus einer DebrisData. Jeder Splitter zeigt ein
## zufälliges Bruchstück aus dem Streifen und behält es. Sind alle Splitter
## verblasst, löscht sich der Knoten selbst. Rein fürs Auge - er entscheidet nichts.

## Zeichenebene der Splitter: über den Figuren, unter den Effekten (50).
const DEBRIS_Z_INDEX := 40
## Ab diesem Anteil ihrer Zeit verblassen die Splitter.
const FADE_START := 0.6


## Lässt die Splitter am Ort fliegen. Liefert den neuen Knoten oder null.
static func spawn(data: DebrisData, at: Vector2, parent: Node) -> Debris:
	if data == null or data.texture == null or parent == null:
		return null
	var node := Debris.new()
	node._setup(data)
	parent.add_child(node)
	node.global_position = at
	node.finished.connect(node.queue_free)
	node.emitting = true
	return node


func _setup(data: DebrisData) -> void:
	texture = data.texture
	# Der Streifen zählt als Bilder nebeneinander; jeder Splitter bekommt eins davon fest.
	var pieces := CanvasItemMaterial.new()
	pieces.particles_animation = true
	pieces.particles_anim_h_frames = maxi(data.piece_count, 1)
	pieces.particles_anim_v_frames = 1
	pieces.particles_anim_loop = false
	material = pieces
	anim_offset_min = 0.0
	anim_offset_max = 1.0
	anim_speed_min = 0.0
	anim_speed_max = 0.0
	amount = maxi(data.amount, 1)
	lifetime = maxf(data.lifetime, 0.05)
	lifetime_randomness = 0.2
	one_shot = true
	explosiveness = 1.0
	local_coords = false
	z_index = DEBRIS_Z_INDEX
	emission_shape = CPUParticles2D.EMISSION_SHAPE_SPHERE
	emission_sphere_radius = maxf(data.emission_radius, 0.0)
	direction = Vector2.UP
	spread = data.spread
	gravity = Vector2(0.0, data.gravity)
	initial_velocity_min = minf(data.speed_min, data.speed_max)
	initial_velocity_max = maxf(data.speed_min, data.speed_max)
	damping_min = data.damping
	damping_max = data.damping
	angle_min = 0.0
	angle_max = 360.0
	angular_velocity_min = -absf(data.spin)
	angular_velocity_max = absf(data.spin)
	scale_amount_min = minf(data.scale_min, data.scale_max)
	scale_amount_max = maxf(data.scale_min, data.scale_max)
	color = data.tint
	var fade := Gradient.new()
	fade.set_color(0, Color.WHITE)
	fade.set_color(1, Color(1.0, 1.0, 1.0, 0.0))
	fade.add_point(FADE_START, Color.WHITE)
	color_ramp = fade
