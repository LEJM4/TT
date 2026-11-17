class_name Destructible
extends StaticBody2D
## Destructible - ein Ding der Welt, das Treffer zerstören: Topf, Kiste, Baum, Stein (M9).
##
## Das Leben zählt das Kind "Health", Treffer nimmt das Kind "Hurtbox" an.
## Welche Arten von Treffern Schaden machen, steht an der Hurtbox
## (accepted_kinds): Der Stein nimmt nur Explosionen, an ihm prallen Schwert und
## Geschosse mit Funken ab. Schwerthiebe auf Zerstörbares füllen keine Energie.
## Fällt das Leben auf 0, ist das Ding zerstört: Die Hurtbox schaltet ab, und
## das Bild (Kind "PropView") wechselt auf "an" - Topf, Kiste und Stein zeigen
## dann nichts mehr, der Baum seinen Stumpf. Bleibt ein Rest stehen
## (leaves_remains), hält er weiter auf und liegt danach auf den Ebenen
## remains_layer; sonst ist der Weg frei.
## Splitter und Beute machen eigene Bausteine, die auf den Tod hören:
## DebrisCue und LootDropper. Die Zahlen stehen in data/destructibles/, die
## Beute in data/loot/. Fertige Dinge liegen daneben: pot.tscn, crate.tscn,
## tree.tscn und rock.tscn.
## Der Körper liegt wie die Übungspuppen auf der Ebene "enemy": Geschosse
## treffen ihn über die Hurtbox, statt an ihm zu enden wie an einer Wand.
##
## Abschalten: Knoten löschen - das Ding ist nicht da.

## Das Ding wurde zerstört; is_on heißt zerstört (für PropView).
signal state_changed(is_on: bool)

## Bleibt nach dem Zerstören ein Rest stehen, der weiter aufhält, etwa ein Baumstumpf?
@export var leaves_remains := false
## Ebenen des Rests. "world": Geschosse enden daran wie an einer Wand.
@export_flags_2d_physics var remains_layer := 1

## Ist das Ding zerstört? Unter diesem Namen liest PropView den Zustand.
var is_on := false

@onready var _health := get_node_or_null("Health") as Health
@onready var _hurtbox := get_node_or_null("Hurtbox") as Hurtbox
@onready var _shape := get_node_or_null("CollisionShape2D") as CollisionShape2D


func _ready() -> void:
	if _health != null:
		_health.died.connect(_on_died)


## Ist das Ding zerstört?
func is_destroyed() -> bool:
	return is_on


func _on_died() -> void:
	if is_on:
		return
	is_on = true
	# Verzögert: Der Tod kann mitten in einer Abfrage der Physik eintreten.
	if _hurtbox != null:
		_hurtbox.set_deferred("monitorable", false)
	if leaves_remains:
		set_deferred("collision_layer", remains_layer)
	else:
		if _shape != null:
			_shape.set_deferred("disabled", true)
		# Ohne PropView bliebe sonst der Platzhalter stehen.
		var placeholder := get_node_or_null("PlaceholderView") as CanvasItem
		if placeholder != null:
			placeholder.visible = false
	state_changed.emit(true)
