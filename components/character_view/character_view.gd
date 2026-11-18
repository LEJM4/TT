class_name CharacterView
extends Node2D
## CharacterView - zeigt eine Figur mit der Grafik aus einem Skin (A1).
##
## Benutzung: die Szene character_view.tscn als Kind an eine Figur hängen und
## im Inspektor einen Skin wählen (eine Werte-Datei CharacterSkin aus data/skins/).
## Der Baustein schaut nur zu und entscheidet nichts. Er liest:
##   - die Blickrichtung: den Wert "facing" der Figur; hat sie keinen, die Laufrichtung,
##   - das Tempo: wie weit sich die Figur je Physik-Schritt bewegt,
##   - die Signale der Geschwister "Health" (Treffer, Tod, Wiederaufstehen),
##     "Dash" (Rolle), "MeleeAttack" (Hieb) und "RangedAttack" (Wurf, M14).
## Einen Wurf zeigt er nur, wenn der Skin ein Bild dafür hat ("shoot"); sonst
## läuft das Bild weiter wie bisher - so bei der Spielfigur.
## Gezeigt wird die nächstliegende der vier Blickrichtungen; gezielt und
## getroffen wird weiter in jeden Winkel.
## Hat der Baustein ein brauchbares Bild, blendet er das Geschwister
## "PlaceholderView" aus. Ohne Skin bleibt der Platzhalter sichtbar.
##
## Abschalten: Knoten löschen oder im Editor ausblenden - die Figur zeigt
## wieder ihren Platzhalter.

## Blickrichtungen in der Reihenfolge der Blätter des Grafik-Pakets.
enum Direction { DOWN, UP, LEFT, RIGHT }

## Namen der Blickrichtungen; sie bilden die Namen der Animationen, etwa "walk_left".
const DIRECTION_NAMES: Array[String] = ["down", "up", "left", "right"]
## Die Blickrichtungen als Vektoren, in derselben Reihenfolge.
const DIRECTION_VECTORS: Array[Vector2] = [Vector2.DOWN, Vector2.UP, Vector2.LEFT, Vector2.RIGHT]
## Animationen, die ein Skin haben kann - die Namen der Felder in CharacterSkin.
const ANIMATIONS: Array[String] = ["idle", "walk", "attack", "shoot", "dash", "hit", "dead"]
## Name des Geschwisters, das der Baustein ausblendet.
const PLACEHOLDER_NAME := "PlaceholderView"
## Springt die Figur in einem Schritt weiter als so viele Pixel, wurde sie versetzt und läuft nicht.
const TELEPORT_DISTANCE := 32.0

## Werte-Datei mit Bildgröße, Lage, Schatten und Animationen.
@export var skin: CharacterSkin
## Ab diesem Tempo zeigt die Figur Laufbilder, in Pixeln pro Sekunde.
@export var walk_threshold := 10.0
## So viele Grad über die Diagonale hinaus bleibt die alte Blickrichtung stehen.
## Das verhindert Flackern, wenn das Ziel genau schräg liegt.
@export_range(0.0, 30.0, 1.0) var direction_hysteresis := 8.0
## Langsamste Laufanimation, als Faktor auf ihre Bilder je Sekunde.
@export var min_walk_rate := 0.5
## Schnellste Laufanimation, als Faktor auf ihre Bilder je Sekunde.
@export var max_walk_rate := 2.5

## Die gezeigte Blickrichtung.
var direction := Direction.DOWN
## Die laufende Animation ohne Richtung, etwa "walk".
var current_animation := ""

var _sprite: AnimatedSprite2D
var _shadow: Sprite2D
var _body: Node2D
var _placeholder: CanvasItem
var _last_position := Vector2.ZERO
var _has_last_position := false
var _speed := 0.0
var _move_direction := Vector2.ZERO
var _one_shot := ""
var _attack_direction := Vector2.ZERO
var _is_dashing := false
var _dash_direction := Vector2.ZERO
var _is_dead := false


func _ready() -> void:
	_sprite = get_node_or_null("Sprite") as AnimatedSprite2D
	_shadow = get_node_or_null("Shadow") as Sprite2D
	_body = get_parent() as Node2D
	# Im Editor ausgeblendet oder ohne brauchbaren Skin: Der Platzhalter bleibt.
	if not visible or get_parent() == null or not _apply_skin():
		visible = false
		set_physics_process(false)
		return
	_hide_placeholder()
	_connect_parts()
	_refresh()


func _exit_tree() -> void:
	# Fällt der Baustein zur Laufzeit weg, kommt der Platzhalter zurück.
	if is_instance_valid(_placeholder):
		_placeholder.visible = true


func _physics_process(delta: float) -> void:
	_measure_motion(delta)
	_refresh()


## Hat der Skin diese Animation, etwa "walk"?
func has_skin_animation(animation_name: String) -> bool:
	if _sprite == null or _sprite.sprite_frames == null:
		return false
	return _sprite.sprite_frames.has_animation(_full_name(animation_name, Direction.DOWN))


func _apply_skin() -> bool:
	if skin == null:
		push_warning("CharacterView: kein Skin gesetzt, die Figur behält ihren Platzhalter.")
		return false
	if _sprite == null:
		push_warning("CharacterView: Das Kind \"Sprite\" fehlt, die Figur behält ihren Platzhalter.")
		return false
	var frames := _build_frames()
	if not frames.has_animation(_full_name("idle", Direction.DOWN)):
		push_warning("CharacterView: Der Skin %s hat kein Bild zum Stehen, die Figur behält ihren Platzhalter." % skin.resource_path)
		return false
	_sprite.sprite_frames = frames
	_sprite.centered = false
	_sprite.offset = Vector2(skin.offset - skin.frame_size / 2)
	if _shadow != null:
		_shadow.texture = skin.shadow
		_shadow.centered = false
		_shadow.visible = skin.shadow != null
		if skin.shadow != null:
			var shadow_size := Vector2i(skin.shadow.get_size())
			_shadow.offset = Vector2(skin.shadow_center - shadow_size / 2)
	return true


func _build_frames() -> SpriteFrames:
	var frames := SpriteFrames.new()
	frames.remove_animation(&"default")
	for animation_name in ANIMATIONS:
		var animation := skin.get(animation_name) as SkinAnimation
		if animation == null or animation.texture == null:
			continue
		for index in DIRECTION_NAMES.size():
			_add_animation(frames, animation, _full_name(animation_name, index), index)
	return frames


func _add_animation(frames: SpriteFrames, animation: SkinAnimation, full_name: StringName, direction_index: int) -> void:
	frames.add_animation(full_name)
	frames.set_animation_speed(full_name, animation.fps)
	frames.set_animation_loop(full_name, animation.loop)
	var sheet := Rect2i(Vector2i.ZERO, Vector2i(animation.texture.get_size()))
	for frame_index in animation.frame_count:
		var cell := animation.first_cell + animation.direction_step * direction_index + animation.frame_step * frame_index
		var region := Rect2i(cell * skin.frame_size, skin.frame_size)
		if not sheet.encloses(region):
			push_warning("CharacterView: Bild %d von \"%s\" liegt außerhalb von %s." % [frame_index + 1, full_name, animation.texture.resource_path])
			break
		var image := AtlasTexture.new()
		image.atlas = animation.texture
		image.region = Rect2(region)
		frames.add_frame(full_name, image)
	if frames.get_frame_count(full_name) == 0:
		frames.remove_animation(full_name)


func _hide_placeholder() -> void:
	_placeholder = get_parent().get_node_or_null(PLACEHOLDER_NAME) as CanvasItem
	if _placeholder != null:
		_placeholder.visible = false


func _connect_parts() -> void:
	var holder := get_parent()
	var health := holder.get_node_or_null("Health") as Health
	if health != null:
		health.damaged.connect(_on_damaged)
		health.died.connect(_on_died)
		health.revived.connect(_on_revived)
		_is_dead = health.is_dead
	var dash := holder.get_node_or_null("Dash") as Dash
	if dash != null:
		dash.dash_started.connect(_on_dash_started)
		dash.dash_finished.connect(_on_dash_finished)
	var melee := holder.get_node_or_null("MeleeAttack") as MeleeAttack
	if melee != null:
		melee.attack_started.connect(_on_attack_started)
	var ranged := holder.get_node_or_null("RangedAttack") as RangedAttack
	if ranged != null:
		ranged.shot_fired.connect(_on_shot_fired)
	_sprite.animation_finished.connect(_on_animation_finished)
	# Hat ein Hieb- oder Treffer-Bild im Skin versehentlich "loop", endet es nach einem Durchlauf.
	_sprite.animation_looped.connect(_on_animation_finished)


func _measure_motion(delta: float) -> void:
	if _body == null or delta <= 0.0:
		return
	var now := _body.global_position
	# Der erste Schritt misst nur: Beim Erzeugen wird die Figur oft noch versetzt.
	if _has_last_position:
		var step := now - _last_position
		if step.length() > TELEPORT_DISTANCE:
			_speed = 0.0
		else:
			_speed = step.length() / delta
			if _speed > walk_threshold:
				_move_direction = step
	_last_position = now
	_has_last_position = true


func _refresh(restart := false) -> void:
	var animation_name := "idle"
	var look := _look_direction()
	if _is_dead:
		if has_skin_animation("dead"):
			animation_name = "dead"
	elif _is_dashing:
		animation_name = "dash"
		if not has_skin_animation("dash"):
			animation_name = "walk"
		look = _dash_direction
	elif not _one_shot.is_empty():
		animation_name = _one_shot
		if _one_shot == "attack" or _one_shot == "shoot":
			look = _attack_direction
	elif _speed > walk_threshold:
		animation_name = "walk"
	var rate := 1.0
	if animation_name == "walk":
		if has_skin_animation("walk"):
			rate = _walk_rate()
		else:
			animation_name = "idle"
	# Im Tod bleibt die Richtung stehen.
	if not _is_dead:
		direction = _pick_direction(look)
	_sprite.self_modulate = Color.WHITE
	if _is_dead and not has_skin_animation("dead"):
		_sprite.self_modulate = skin.defeated_tint
	_play(animation_name, rate, restart)


func _play(animation_name: String, rate: float, restart: bool) -> void:
	var full_name := _full_name(animation_name, direction)
	_sprite.speed_scale = rate
	if full_name == _sprite.animation and not restart:
		# Läuft schon. Eine abgelaufene Animation ohne Wiederholung bleibt auf ihrem letzten Bild.
		if not _sprite.is_playing() and _sprite.sprite_frames.get_animation_loop(full_name):
			_sprite.play(full_name)
		return
	var same_kind := animation_name == current_animation and not restart
	var frame := _sprite.frame
	var progress := _sprite.frame_progress
	_sprite.play(full_name)
	if same_kind:
		# Nur die Richtung wechselt: im Takt weiterlaufen.
		_sprite.set_frame_and_progress(frame, progress)
	elif restart:
		_sprite.set_frame_and_progress(0, 0.0)
	current_animation = animation_name


func _look_direction() -> Vector2:
	if _body != null:
		var body_facing: Variant = _body.get("facing")
		if body_facing is Vector2 and body_facing != Vector2.ZERO:
			return body_facing as Vector2
	return _move_direction


func _pick_direction(look: Vector2) -> Direction:
	if look.length_squared() < 0.0001:
		return direction
	var unit := look.normalized()
	# Die alte Richtung bleibt, solange das Ziel nicht deutlich über die Diagonale hinaus liegt.
	var keep_limit := cos(deg_to_rad(45.0 + direction_hysteresis))
	if unit.dot(DIRECTION_VECTORS[direction]) >= keep_limit:
		return direction
	if absf(unit.x) > absf(unit.y):
		if unit.x > 0.0:
			return Direction.RIGHT
		return Direction.LEFT
	if unit.y > 0.0:
		return Direction.DOWN
	return Direction.UP


func _walk_rate() -> float:
	if skin.walk_reference_speed <= 0.0:
		return 1.0
	return clampf(_speed / skin.walk_reference_speed, min_walk_rate, max_walk_rate)


func _full_name(animation_name: String, direction_index: int) -> StringName:
	return StringName("%s_%s" % [animation_name, DIRECTION_NAMES[direction_index]])


func _on_damaged(_amount: float) -> void:
	if _is_dead or _is_dashing or not has_skin_animation("hit"):
		return
	_one_shot = "hit"
	_refresh(true)


func _on_died() -> void:
	_is_dead = true
	_is_dashing = false
	_one_shot = ""
	_refresh(true)


func _on_revived() -> void:
	_is_dead = false
	_one_shot = ""
	_refresh(true)


func _on_dash_started(dash_direction: Vector2) -> void:
	_is_dashing = true
	_dash_direction = dash_direction
	_one_shot = ""
	_refresh(true)


func _on_dash_finished() -> void:
	_is_dashing = false
	_refresh()


func _on_attack_started(attack_direction: Vector2) -> void:
	if _is_dead or _is_dashing or not has_skin_animation("attack"):
		return
	_one_shot = "attack"
	_attack_direction = attack_direction
	_refresh(true)


# Ein Wurf (M14): nur mit Bild "shoot" im Skin, sonst bleibt das laufende Bild.
func _on_shot_fired(shot_direction: Vector2) -> void:
	if _is_dead or _is_dashing or not has_skin_animation("shoot"):
		return
	_one_shot = "shoot"
	_attack_direction = shot_direction
	_refresh(true)


func _on_animation_finished() -> void:
	if _one_shot.is_empty():
		return
	_one_shot = ""
	_refresh()
