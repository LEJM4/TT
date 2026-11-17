extends Node2D
## LootSpawner - legt alle Beute eines Levels hin, an einer Stelle (M9).
##
## Wer Beute fallen lässt, bestellt sie über den EventBus (loot_requested).
## Dieser Knoten baut daraus je Gegenstand einen Pickup, hängt ihn als eigenes
## Kind ein und lässt ihn vom Ort der Bestellung auf einen freien Platz in der
## Nähe springen - zur Seite oder nach vorn, nicht hinter das Ding und nicht in
## eine Wand, einen Block oder ein anderes Ding. Mehrere Gegenstände vom selben
## Ort verteilen sich.
## Bestellungen sammelt er und erledigt sie im nächsten Physik-Schritt.
## Im Online-Spiel entscheidet später allein der Gastgeber hier über Beute.
##
## Abschalten: Knoten aus dem Level löschen - dann fällt keine Beute mehr.

## So viele Plätze probiert er je Gegenstand, bevor er ihn an den Ort der Bestellung legt.
const TRIES := 12
## Abstand zweier Gegenstände vom selben Ort, als Anteil des Winkelbereichs (goldener Schnitt).
const ITEM_STEP := 0.618034
## Abstand zweier Versuche für denselben Gegenstand, als Anteil des Winkelbereichs.
const TRY_STEP := 0.29

## Szene eines Gegenstands am Boden (Pickup).
@export var pickup_scene: PackedScene
## Kleinster Abstand vom Ort der Bestellung, in Pixeln.
@export var min_distance := 10.0
## Größter Abstand vom Ort der Bestellung, in Pixeln.
@export var max_distance := 18.0
## Winkelbereich, in den die Beute springt, in Grad: 0 rechts, 90 nach unten, 180 links.
@export var min_angle := -20.0
## Ende des Winkelbereichs, in Grad.
@export var max_angle := 200.0
## Ebenen, auf denen keine Beute landen darf.
@export_flags_2d_physics var blocking_mask := 5

var _pending: Array[Dictionary] = []


func _ready() -> void:
	if pickup_scene == null:
		push_warning("LootSpawner: keine Pickup-Szene gesetzt; es fällt keine Beute.")
	EventBus.loot_requested.connect(_on_loot_requested)


func _physics_process(_delta: float) -> void:
	if _pending.is_empty():
		return
	var batch := _pending
	_pending = []
	# Je Ort ein gemeinsamer Startwinkel und ein Zähler, damit sich die Gegenstände verteilen.
	var per_origin := {}
	for request in batch:
		var origin: Vector2 = request["origin"]
		if not per_origin.has(origin):
			per_origin[origin] = {"start": randf(), "count": 0}
		var slot: Dictionary = per_origin[origin]
		_spawn(request["item"], request["amount"], origin, slot["start"], slot["count"])
		slot["count"] = int(slot["count"]) + 1


func _on_loot_requested(item: Resource, amount: int, origin: Vector2) -> void:
	var data := item as ItemData
	if data == null or amount <= 0 or pickup_scene == null:
		return
	_pending.append({"item": data, "amount": amount, "origin": origin})


func _spawn(item: ItemData, amount: int, origin: Vector2, start: float, index: int) -> void:
	var node := pickup_scene.instantiate()
	var pickup := node as Pickup
	if pickup == null:
		push_warning("LootSpawner: Die Wurzel der Pickup-Szene ist kein Pickup.")
		node.queue_free()
		return
	pickup.item = item
	pickup.amount = amount
	add_child(pickup)
	pickup.drop(origin, _find_spot(origin, start, index))


# Sucht einen freien Platz um origin. start (0 bis 1) ist der gemeinsame Startwinkel
# aller Gegenstände vom selben Ort, index die Nummer dieses Gegenstands.
func _find_spot(origin: Vector2, start: float, index: int) -> Vector2:
	for attempt in TRIES:
		var share := fposmod(start + ITEM_STEP * index + TRY_STEP * attempt, 1.0)
		var angle := deg_to_rad(lerpf(min_angle, max_angle, share))
		var distance := randf_range(min_distance, maxf(min_distance, max_distance))
		var spot := origin + Vector2.from_angle(angle) * distance
		if _is_free(spot) and _is_reachable(origin, spot):
			return spot
	return origin


# Liegt an der Stelle kein Körper auf den sperrenden Ebenen?
func _is_free(spot: Vector2) -> bool:
	var query := PhysicsPointQueryParameters2D.new()
	query.position = spot
	query.collision_mask = blocking_mask
	query.collide_with_bodies = true
	query.collide_with_areas = false
	return get_world_2d().direct_space_state.intersect_point(query, 1).is_empty()


# Liegt nichts dazwischen? Das Ding selbst zählt nicht: Der Strahl beginnt in ihm.
func _is_reachable(origin: Vector2, spot: Vector2) -> bool:
	var query := PhysicsRayQueryParameters2D.create(origin, spot, blocking_mask)
	query.collide_with_areas = false
	query.hit_from_inside = false
	return get_world_2d().direct_space_state.intersect_ray(query).is_empty()
