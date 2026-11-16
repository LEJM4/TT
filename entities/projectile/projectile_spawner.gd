extends Node2D
## ProjectileSpawner - erzeugt alle Geschosse eines Levels an einer Stelle (M6).
##
## Wer schießt, bestellt sein Geschoss über den EventBus (projectile_requested).
## Dieser Knoten baut es, hängt es als eigenes Kind ein und startet es.
## Im Online-Spiel entscheidet später allein der Gastgeber hier über Geschosse.
##
## Abschalten: Knoten aus dem Level löschen - dann fällt kein Schuss mehr,
## und Schüsse kosten auch nichts.


func _ready() -> void:
	EventBus.projectile_requested.connect(_on_projectile_requested)


func _on_projectile_requested(scene: PackedScene, origin: Vector2, direction: Vector2, stats: Resource, target_mask: int) -> void:
	var shot_stats := stats as RangedStats
	if scene == null or shot_stats == null:
		return
	var node := scene.instantiate()
	var projectile := node as Projectile
	if projectile == null:
		push_warning("ProjectileSpawner: Die Wurzel der Geschoss-Szene ist kein Projectile.")
		node.queue_free()
		return
	add_child(projectile)
	projectile.global_position = origin
	projectile.launch(direction, shot_stats, target_mask)
