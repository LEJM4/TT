class_name Hurtbox
extends Area2D
## Hurtbox - nimmt Treffer an und reicht den Schaden an Health weiter.
##
## Benutzung: die Szene hurtbox.tscn als Kind an eine Figur hängen, darunter
## eine CollisionShape2D legen und im Inspektor die Ebene wählen:
## "player_hurtbox" für Spieler, "enemy_hurtbox" für Gegner.
## Ob und wie viel Schaden ankommt, entscheidet das Geschwister "Health".
## Welche Arten von Treffern sie annimmt, steht in accepted_kinds (M9); die
## übrigen prallen ab und melden hit_blocked - so nimmt ein Stein nur Explosionen.
##
## Abschalten: Knoten löschen - die Figur ist dann nicht mehr zu treffen.

## Ein Treffer hat Schaden gemacht. direction zeigt vom Angreifer zum Ziel.
signal hit_received(damage: float, direction: Vector2)
## Ein Treffer ist abgeprallt, weil seine Art nicht angenommen wird (M9).
## direction zeigt vom Angreifer zum Ziel.
signal hit_blocked(direction: Vector2)

## Arten von Treffern, die Schaden machen; die übrigen prallen ab (M9).
## Die Reihenfolge passt zu Hitbox.Kind.
@export_flags("Blade", "Projectile", "Explosion") var accepted_kinds := 7
## Füllt ein Treffer hier beim Angreifer etwas auf, etwa die Energie beim
## Schwerthieb? Bei Zerstörbarem nicht (M9).
@export var feeds_attacker := true

var _health: Health


func _ready() -> void:
	_health = get_parent().get_node_or_null("Health") as Health


## Nimmt diese Hurtbox Treffer dieser Art an (Hitbox.Kind)? (M9)
func accepts(kind: int) -> bool:
	return (accepted_kinds & (1 << kind)) != 0


## Meldet einen abgeprallten Treffer; Schaden gibt es keinen (M9).
func block_hit(direction: Vector2 = Vector2.ZERO) -> void:
	hit_blocked.emit(direction)


## Nimmt einen Treffer an und liefert, ob er Schaden gemacht hat.
## direction zeigt vom Angreifer zum Ziel.
func receive_hit(damage: float, direction: Vector2 = Vector2.ZERO) -> bool:
	if _health == null:
		return false
	var dealt := _health.apply_damage(damage)
	if dealt <= 0.0:
		return false
	hit_received.emit(dealt, direction)
	return true
