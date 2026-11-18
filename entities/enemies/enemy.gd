class_name Enemy
extends CharacterBody2D
## Enemy - ein Gegner (M13; seit M14 mit Angriffs-Modulen).
##
## Was er tut, entscheidet sein Kind "Brain", ein Zustandsautomat mit je einem
## Knoten pro Zustand (entities/enemies/states/): Patrol, Alert, Chase, Attack,
## Search, Return, Stunned, Dead. Die Zustände steuern ihn über move_to(),
## move_away_from(), stop() und face(); er selbst bewegt sich nur mit move_and_slide().
## Bemerken tut er über "Perception".
##
## Angreifen (M14): Jedes Kind von "Attacks" ist ein Angriffs-Modul (EnemyAttack)
## und löst eine Waffe neben ihm aus, etwa MeleeAttack oder RangedAttack. Der
## erste Angriff bestimmt, auf welchen Abstand er geht; eingesetzt wird der erste,
## der gerade passt. Die Grundszene enemy.tscn hat noch keinen Angriff - die
## Gegnertypen bringen ihn mit: melee_enemy.tscn (Nahkämpfer) und
## ranged_enemy.tscn (Fernkämpfer).
## Abstände rechnet er in Kacheln (ViewSettings.TILE_SIZE); der Zoom ändert sie nicht.
## Einen bestimmten Gegner beschreibt eine geerbte Szene eines Gegnertyps, etwa
## caveman.tscn oder stone_thrower.tscn: Skin, Werte-Dateien, Beute.
##
## Über Schaden entscheidet Health. Solange er die Figur nicht bemerkt hat,
## setzt er dort nur den Faktor surprise_factor: Überraschungstreffer zählen mehr.
## Wird er dabei getroffen, dreht er sich zum Angreifer und sucht. Stun hält ihn
## an. Stirbt er, bleibt er kurz liegen und verschwindet; F2 bringt ihn zurück.
## Zustand und Leben meldet er der Debug-Anzeige in einer Zeile mit seinem Namen;
## verschwindet er nach dem Tod, verschwindet die Zeile mit.
##
## Kinder und was ohne sie passiert:
##   Brain         Zustände        - ohne: Er steht nur da.
##   Perception    Sehen, Hören    - ohne: Er bemerkt niemanden.
##   Attacks       Angriffs-Module - ohne oder leer: Er verfolgt, greift aber nie an.
##   Health        Leben           - ohne: Er nimmt keinen Schaden.
##   Hurtbox       Trefferzone     - ohne: Er ist nicht zu treffen.
##   Stunnable     Betäubung       - ohne: Stun wirkt nicht auf ihn.
##   LootDropper   Beute           - ohne: Er lässt nichts fallen.
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
## Name des Kindes mit den Angriffs-Modulen (M14).
const ATTACKS_NAME := "Attacks"

## Werte-Datei mit Tempo, Zeiten und Überraschung.
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

var _state_text := "-"
var _life_text := ""

@onready var brain := get_node_or_null("Brain") as StateMachine
@onready var perception := get_node_or_null("Perception") as Perception
@onready var health := get_node_or_null("Health") as Health
@onready var _attacks := get_node_or_null(ATTACKS_NAME)
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


## Weicht vom Punkt zurück und blickt dabei zu ihm hin (M14).
func move_away_from(point: Vector2, speed: float) -> void:
	var away := global_position - point
	if away.length_squared() < 0.0001:
		away = -facing
	velocity = away.normalized() * speed
	face_point(point)


## Bleibt stehen.
func stop() -> void:
	velocity = Vector2.ZERO


## Das andere Ende der Patrouille.
func patrol_end() -> Vector2:
	return home + patrol_tiles * ViewSettings.TILE_SIZE


## Seine Angriffe in Rangfolge, die er einsetzen kann: eingeschaltet und mit Waffe (M14).
func get_attacks() -> Array[EnemyAttack]:
	var list: Array[EnemyAttack] = []
	if _attacks == null:
		return list
	for child in _attacks.get_children():
		var attack := child as EnemyAttack
		if attack != null and attack.is_usable():
			list.append(attack)
	return list


## Der Angriff, nach dem er seinen Abstand richtet: der erste in der Rangfolge.
## null: Er hat keinen (M14).
func main_attack() -> EnemyAttack:
	var list := get_attacks()
	if list.is_empty():
		return null
	return list[0]


## Der erste Angriff, der jetzt geht: bereit, und das Ziel ist von hier aus zu
## treffen. null: gerade keiner (M14).
func choose_attack(victim: Node2D) -> EnemyAttack:
	for attack in get_attacks():
		if attack.is_ready() and attack.can_hit(victim):
			return attack
	return null


## Ist der Weg von hier bis zum Punkt frei von Wänden und Blöcken (M14)?
## Ohne Perception: ja.
func has_line_of_sight_to(point: Vector2) -> bool:
	if perception == null:
		return true
	return perception.has_line_of_sight(point)


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


## Meldet den Zustand neu an die Debug-Anzeige - etwa wenn ein Zustand seinen
## Anzeigenamen ändert (M14).
func report_state() -> void:
	if brain != null:
		_state_text = brain.get_display_name()
	_report()


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
	get_tree().create_timer(stats.remove_delay).timeout.connect(_remove)


# Nach dem Tod: aus dem Level und aus der Debug-Anzeige verschwinden.
func _remove() -> void:
	EventBus.debug_value_changed.emit(String(name), "")
	queue_free()


func _on_state_changed(_previous: StringName, _current: StringName) -> void:
	report_state()


func _on_health_changed(current: float, maximum: float) -> void:
	_life_text = "%d/%d" % [roundi(current), roundi(maximum)]
	_report()


# Eine Zeile je Gegner, etwa "Caveman: Verfolgen · Leben 30/30" (M14).
func _report() -> void:
	var text := _state_text
	if not _life_text.is_empty():
		text += " · Leben " + _life_text
	EventBus.debug_value_changed.emit(String(name), text)
