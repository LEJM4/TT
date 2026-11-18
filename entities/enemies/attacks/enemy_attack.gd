class_name EnemyAttack
extends Node
## EnemyAttack - ein Angriff, den ein Gegner einsetzen kann: ein Angriffs-Modul (M14).
##
## Benutzung: als Kind unter den Knoten "Attacks" eines Gegners hängen und im
## Inspektor eine Werte-Datei (EnemyAttackStats) wählen. Das Modul sagt nur,
## wann der Angriff passt - Abstand, freie Sicht, Waffe bereit - und löst die
## Waffe aus: den Baustein neben dem Gegner, dessen Name in weapon_name steht,
## etwa "MeleeAttack" oder "RangedAttack". Zuschlagen oder werfen tut die Waffe,
## über Schaden entscheidet wie immer Health.
##
## Rangfolge: die Reihenfolge der Kinder unter "Attacks". Der erste Angriff
## bestimmt, auf welchen Abstand der Gegner geht (Zustand "Chase"); eingesetzt
## wird der erste, der gerade passt (Zustand "Attack").
##
## Ein neuer Angriff ist ein Skript, das von EnemyAttack erbt und füllt:
##   _weapon_ready()   Ist die Waffe bereit?
##   _weapon_reach()   Wie weit trifft sie, in Pixeln von der Mitte des Gegners?
##   _trigger(dir)     Waffe in diese Richtung auslösen; liefert, ob es klappte.
##   is_busy()         Läuft der Angriff noch? Standard: nein.
##   update(delta)     Ein Schritt, solange er läuft - etwa für einen Ansturm.
##                     Standard: Der Gegner steht still.
## Beispiele: EnemyMeleeAttack (Nahkampf), EnemyRangedAttack (Fernkampf).
##
## Abschalten: enabled aus oder den Knoten löschen - der Gegner greift dann nur
## mit seinen übrigen Angriffen an; ohne jeden verfolgt er nur.

## Der Angriff hat begonnen; direction zeigt vom Gegner zum Ziel.
signal started(direction: Vector2)

## Setzt der Gegner diesen Angriff ein? Aus: Er tut, als gäbe es ihn nicht.
@export var enabled := true
## Werte-Datei: Abstand, freie Sicht, Pause danach.
@export var stats: EnemyAttackStats
## Name der Waffe: ein Kind des Gegners, etwa "MeleeAttack".
@export var weapon_name := ""

## Der Gegner, zu dem der Angriff gehört.
var enemy: Enemy
## Die Waffe, die der Angriff auslöst; null, wenn sie fehlt.
var weapon: Node


func _ready() -> void:
	if stats == null:
		push_warning("EnemyAttack %s: keine Werte-Datei gesetzt, nutze Standardwerte." % name)
		stats = EnemyAttackStats.new()
	enemy = _find_enemy()
	if enemy == null:
		push_warning("EnemyAttack %s: gehört zu keinem Gegner." % name)
		return
	if not weapon_name.is_empty():
		weapon = enemy.get_node_or_null(weapon_name)
	if weapon == null:
		push_warning("EnemyAttack %s: Waffe \"%s\" fehlt, der Angriff bleibt aus." % [name, weapon_name])


## Kann der Gegner diesen Angriff überhaupt einsetzen - eingeschaltet, mit Waffe?
func is_usable() -> bool:
	return enabled and enemy != null and weapon != null


## Ist der Angriff jetzt bereit - die Waffe nicht mehr in ihrer Pause?
func is_ready() -> bool:
	return is_usable() and _weapon_ready()


## Näher als das weicht der Gegner zurück, in Pixeln.
func min_distance() -> float:
	return ViewSettings.tiles(stats.min_tiles)


## Bis zu diesem Abstand trifft der Angriff, in Pixeln von Mitte zu Mitte.
func max_distance() -> float:
	if not is_usable():
		return 0.0
	var reach := _weapon_reach()
	if stats.max_tiles > 0.0:
		reach = minf(reach, ViewSettings.tiles(stats.max_tiles))
	return reach


## Trifft der Angriff dieses Ziel von hier aus - nah genug und, falls nötig, mit freier Sicht?
func can_hit(target: Node2D) -> bool:
	if not is_usable() or not is_instance_valid(target):
		return false
	var distance := enemy.global_position.distance_to(target.global_position)
	if distance > max_distance():
		return false
	if stats.needs_line_of_sight:
		return enemy.has_line_of_sight_to(target.global_position)
	return true


## Setzt den Angriff gegen das Ziel ein. Liefert, ob er begann.
func start(target: Node2D) -> bool:
	if not is_ready() or not is_instance_valid(target):
		return false
	var direction := target.global_position - enemy.global_position
	if direction.length_squared() < 0.0001:
		direction = enemy.facing
	direction = direction.normalized()
	if not _trigger(direction):
		return false
	started.emit(direction)
	return true


## Ein Physik-Schritt, solange der Angriff läuft. Liefert, ob er noch läuft.
## Standard: Der Gegner steht still, bis die Waffe fertig ist.
func update(_delta: float) -> bool:
	enemy.stop()
	return is_busy()


## Läuft der Angriff noch? Ein erbendes Skript fragt seine Waffe.
func is_busy() -> bool:
	return false


## So lange steht der Gegner nach dem Angriff still, in Sekunden.
func get_recover_time() -> float:
	return stats.recover_time


## Ist die Waffe bereit? Füllt ein erbendes Skript.
func _weapon_ready() -> bool:
	return false


## Wie weit trifft die Waffe, in Pixeln von der Mitte des Gegners? Füllt ein erbendes Skript.
func _weapon_reach() -> float:
	return 0.0


## Löst die Waffe in die Richtung aus; liefert, ob es klappte. Füllt ein erbendes Skript.
func _trigger(_direction: Vector2) -> bool:
	return false


func _find_enemy() -> Enemy:
	var node := get_parent()
	while node != null:
		if node is Enemy:
			return node as Enemy
		node = node.get_parent()
	return null
