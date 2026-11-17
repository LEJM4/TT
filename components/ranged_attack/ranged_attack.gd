class_name RangedAttack
extends Node2D
## RangedAttack - Fernkampf-Angriff als Baustein.
##
## Benutzung: die Szene ranged_attack.tscn als Kind an eine Figur hängen und
## im Inspektor wählen: eine Werte-Datei (RangedStats), die Geschoss-Szene und
## die Ebene der Ziele. Die Figur ruft try_shoot(richtung) auf.
## Das Geschoss erzeugt der Baustein nicht selbst: Er bestellt es über den
## EventBus (projectile_requested) beim ProjectileSpawner des Levels.
## Bezahlt wird aus dem Geschwister mit dem Namen aus supply_name (ein Supply).
## Liegt daneben ein AmmoSelector (Name aus ammo_name, M11a), kommen Werte und
## Kosten von dort: geworfen wird das gewählte Geschoss aus dem Inventar, und
## stats und supply_name gelten nicht.
## damage_bonus macht jedes Geschoss beim Aufprall härter, etwa mit einem
## angelegten Bogen (M11); die Werte-Datei des Geschosses bleibt dabei unberührt.
##
## Abschalten: Knoten löschen - die Figur kann dann nicht mehr schießen.
## Ohne Supply und AmmoSelector ist jeder Schuss kostenlos.

## Ein Schuss wurde abgegeben.
signal shot_fired(direction: Vector2)

## Werte-Datei mit Schaden, Geschoss, Pause und Kosten.
@export var stats: RangedStats
## Szene des Geschosses; ihre Wurzel muss ein Projectile sein.
@export var projectile_scene: PackedScene
## Ebenen, deren Hurtboxen das Geschoss trifft.
@export_flags_2d_physics var target_mask := 0
## Name des Geschwisters, das den Schuss bezahlt. Leer: Schüsse sind kostenlos.
@export var supply_name := "Ammo"
## Name des Geschwisters, das das Geschoss aus dem Inventar wählt (ein AmmoSelector, M11a).
## Fehlt es, gelten stats und supply_name.
@export var ammo_name := "AmmoSelector"

## Tempo-Faktor für die Pause zwischen zwei Schüssen; über 1 geht es schneller (M7).
var rate_factor := 1.0
## So viel mehr Schaden macht jedes Geschoss beim Aufprall (M11). Setzt der Baustein Equipment.
var damage_bonus := 0.0

var _cooldown_left := 0.0
var _supply: Supply
var _ammo: AmmoSelector


func _ready() -> void:
	if stats == null:
		push_warning("RangedAttack: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = RangedStats.new()
	if not supply_name.is_empty():
		_supply = get_parent().get_node_or_null(supply_name) as Supply
	if not ammo_name.is_empty():
		_ammo = get_parent().get_node_or_null(ammo_name) as AmmoSelector


func _physics_process(delta: float) -> void:
	if _cooldown_left > 0.0:
		_cooldown_left -= delta * rate_factor


## Ist gerade ein Schuss möglich? Der Vorrat wird erst beim Schuss geprüft.
func can_shoot() -> bool:
	return _cooldown_left <= 0.0 and projectile_scene != null and get_shot() != null


## Die Werte des nächsten Schusses: vom AmmoSelector, sonst aus stats. null: Es gibt nichts zu werfen.
func get_shot() -> RangedStats:
	if _ammo != null:
		return _ammo.get_shot()
	return stats


## Schießt in die Richtung, wenn es gerade möglich ist. Liefert, ob der Schuss fiel.
func try_shoot(direction: Vector2) -> bool:
	if not can_shoot() or direction == Vector2.ZERO:
		return false
	# Ohne Geschoss-Erzeuger im Level gibt es keinen Schuss und keine Kosten.
	if EventBus.projectile_requested.get_connections().is_empty():
		return false
	var shot := get_shot()
	if not _pay(shot):
		return false
	_cooldown_left = shot.cooldown
	if damage_bonus > 0.0 and shot.damage > 0.0:
		# Eine Kopie: Die Werte-Datei des Geschosses teilen sich alle Würfe.
		shot = shot.duplicate() as RangedStats
		shot.damage += damage_bonus
	var aim := direction.normalized()
	var origin := global_position + aim * shot.spawn_distance
	EventBus.projectile_requested.emit(projectile_scene, origin, aim, shot, target_mask)
	shot_fired.emit(aim)
	return true


func _pay(shot: RangedStats) -> bool:
	if _ammo != null:
		return _ammo.consume(roundi(shot.cost))
	if _supply != null:
		return _supply.spend(shot.cost)
	return true
