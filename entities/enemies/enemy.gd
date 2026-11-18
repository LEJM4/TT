class_name Enemy
extends CharacterBody2D
## Enemy - ein Gegner (M13).
##
## Was er tut, entscheidet sein Kind "Brain", ein Zustandsautomat mit je einem
## Knoten pro Zustand (entities/enemies/states/): Patrol, Alert, Chase, Attack,
## Search, Return, Stunned, Dead. Die Zustände steuern ihn über move_to(),
## stop() und face(); er selbst bewegt sich nur mit move_and_slide().
## Bemerken tut er über "Perception", zuschlagen über "MeleeAttack": sofort, ohne
## Ausholen, sobald die Figur in der Trefferzone steht - Treffer und erstes Bild
## der Hieb-Animation kommen zusammen.
## Abstände rechnet er in Kacheln (ViewSettings.TILE_SIZE); der Zoom ändert sie nicht.
## Einen bestimmten Gegner beschreibt eine geerbte Szene wie caveman.tscn:
## Skin, Werte-Dateien, Beute.
##
## Über Schaden entscheidet Health. Solange er die Figur nicht bemerkt hat,
## setzt er dort nur den Faktor surprise_factor: Überraschungstreffer zählen mehr.
## Wird er dabei getroffen, dreht er sich zum Angreifer und sucht. Stun hält ihn
## an. Stirbt er, bleibt er kurz liegen und verschwindet; F2 bringt ihn zurück.
## Zustand und Leben meldet er der Debug-Anzeige.
##
## Kinder und was ohne sie passiert:
##   Brain         Zustände      - ohne: Er steht nur da.
##   Perception    Sehen, Hören  - ohne: Er bemerkt niemanden.
##   MeleeAttack   Schlag        - ohne: Er verfolgt, schlägt aber nie zu.
##   Health        Leben         - ohne: Er nimmt keinen Schaden.
##   Hurtbox       Trefferzone   - ohne: Er ist nicht zu treffen.
##   Stunnable     Betäubung     - ohne: Stun wirkt nicht auf ihn.
##   LootDropper   Beute         - ohne: Er lässt nichts fallen.
##   CharacterView, LifeBar, HitFlash, DamageNumbers und die Effekte sind nur
##   fürs Auge. Aufblitzen zeigt nur Schaden, den er nimmt, nie seinen Angriff.
##
## Abschalten: den Knoten aus dem Level löschen.

## Er hat eine Figur bemerkt - für das "!" über dem Kopf.
signal alerted
## Er sucht eine verlorene Figur - für das "?" über dem Kopf.
signal search_started

## Unter diesem Abstand gilt ein Punkt als erreicht, in Pixeln.
const ARRIVE_DISTANCE := 2.0

## Werte-Datei mit Tempo, Zeiten und Kampfwerten.
@export var stats: EnemyStats
## Strecke der Patrouille vom Startpunkt aus, in Kacheln. Null: Er steht und wacht.
@export var patrol_tiles := Vector2.ZERO

## Blickrichtung; Perception sieht dorthin, CharacterView zeigt sie.
var facing := Vector2.DOWN
## Tot: Das Leben ist auf 0.
var is_dead := false
## Hat er die Figur bemerkt? Solange nicht, zählen Treffer mit surprise_factor.
var is_aware := false
## Die Figur, die er verfolgt; null, wenn keine.
var target: Node2D
## Wo er die Figur zuletzt bemerkt hat - oder wohin er nach einem Treffer schaut.
var last_known_position := Vector2.ZERO
## Startpunkt der Patrouille.
var home := Vector2.ZERO

@onready var brain := get_node_or_null("Brain") as StateMachine
@onready var perception := get_node_or_null("Perception") as Perception
@onready var melee := get_node_or_null("MeleeAttack") as MeleeAttack
@onready var health := get_node_or_null("Health") as Health
@onready var _hurtbox := get_node_or_null("Hurtbox") as Hurtbox
@onready var _stunnable := get_node_or_null("Stunnable") as Stunnable


func _ready() -> void:
	if stats == null:
		push_warning("Enemy: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = EnemyStats.new()
	home = global_position
	last_known_position = global_position
	if health != null:
		health.died.connect(_on_died)
		health.changed.connect(_on_health_changed)
		_on_health_changed(health.current, health.get_maximum())
	if _hurtbox != null:
		_hurtbox.hit_received.connect(_on_hit_received)
	if _stunnable != null:
		_stunnable.stunned.connect(_on_stunned)
		_stunnable.recovered.connect(_on_recovered)
	if brain != null:
		brain.state_changed.connect(_on_state_changed)
	set_aware(false)


func _physics_process(_delta: float) -> void:
	if is_dead or is_stunned():
		velocity = Vector2.ZERO
	move_and_slide()


## Geht auf den Punkt zu; liefert true, sobald er dort ist.
func move_to(point: Vector2, speed: float) -> bool:
	var to := point - global_position
	var distance := to.length()
	if distance <= ARRIVE_DISTANCE:
		velocity = Vector2.ZERO
		return true
	face(to)
	# Nicht über den Punkt hinausschießen.
	var step := maxf(get_physics_process_delta_time(), 0.0001)
	velocity = to / distance * minf(speed, distance / step)
	return false


## Bleibt stehen.
func stop() -> void:
	velocity = Vector2.ZERO


## Das andere Ende der Patrouille.
func patrol_end() -> Vector2:
	return home + patrol_tiles * ViewSettings.TILE_SIZE


## Bis zu diesem Abstand (Mitte zu Mitte) schlägt er zu: so weit, wie die
## Trefferzone seines Schlags reicht. Ohne MeleeAttack: 0.
func attack_distance() -> float:
	if melee == null:
		return 0.0
	return melee.reach_distance()


## Blickt in die Richtung.
func face(direction: Vector2) -> void:
	if direction.length_squared() > 0.0001:
		facing = direction.normalized()


## Blickt zu dem Punkt.
func face_point(point: Vector2) -> void:
	face(point - global_position)


## Die Figur, die er gerade bemerkt; null: keine. aware: Er kennt sie schon -
## dann sieht er rundum und weiter.
func look_for_target(aware := false) -> Node2D:
	if perception == null:
		return null
	return perception.find_target(facing, aware)


## Bemerkt er diese Figur gerade noch - als Verfolger, also rundum?
func can_track(node: Variant) -> bool:
	if not is_valid_target(node) or perception == null:
		return false
	return perception.can_perceive(node as Node2D, facing, true)


## Ist das noch ein Ziel - da, nicht tot und nicht unsichtbar?
func is_valid_target(node: Variant) -> bool:
	if not is_instance_valid(node):
		return false
	var other := node as Node2D
	if other == null or not other.is_inside_tree():
		return false
	if other.get("is_dead") == true:
		return false
	return not other.is_in_group(Perception.INVISIBLE_GROUP)


## Ist er gerade betäubt?
func is_stunned() -> bool:
	return _stunnable != null and _stunnable.is_stunned()


## Merkt er die Figur? Ohne zählen Treffer mit surprise_factor - entschieden wird in Health.
func set_aware(value: bool) -> void:
	is_aware = value
	if health == null:
		return
	if value:
		health.damage_factor = 1.0
	else:
		health.damage_factor = stats.surprise_factor


func _on_hit_received(_damage: float, direction: Vector2) -> void:
	if is_dead or is_aware:
		return
	# Getroffen, ohne die Figur bemerkt zu haben: zum Angreifer drehen und nachsehen.
	var toward_attacker := -direction
	face(toward_attacker)
	var search_distance := ViewSettings.tiles(stats.hit_search_tiles)
	last_known_position = global_position + toward_attacker.normalized() * search_distance
	if is_stunned() or brain == null:
		return
	var found := look_for_target(true)
	if found != null:
		target = found
		brain.transition_to(&"Alert")
	else:
		brain.transition_to(&"Search")


func _on_stunned(_seconds: float) -> void:
	if is_dead or brain == null:
		return
	brain.transition_to(&"Stunned")


func _on_recovered() -> void:
	if is_dead or brain == null:
		return
	if is_aware and is_valid_target(target):
		brain.transition_to(&"Chase")
		return
	last_known_position = global_position
	brain.transition_to(&"Search")


func _on_died() -> void:
	is_dead = true
	set_aware(true)
	stop()
	if brain != null:
		brain.transition_to(&"Dead")
	if _stunnable != null:
		_stunnable.remove_from_group(Stunnable.GROUP)
	set_deferred("collision_layer", 0)
	set_deferred("collision_mask", 0)
	if _hurtbox != null:
		_hurtbox.set_deferred("monitorable", false)
	get_tree().create_timer(stats.remove_delay).timeout.connect(queue_free)


func _on_state_changed(_previous: StringName, _current: StringName) -> void:
	_report("Zustand", brain.get_display_name())


func _on_health_changed(current: float, maximum: float) -> void:
	_report("Leben", "%d / %d" % [roundi(current), roundi(maximum)])


func _report(key: String, value: String) -> void:
	EventBus.debug_value_changed.emit("%s %s" % [name, key], value)
