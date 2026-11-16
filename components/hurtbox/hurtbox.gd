class_name Hurtbox
extends Area2D
## Hurtbox - nimmt Treffer an und reicht den Schaden an Health weiter.
##
## Benutzung: die Szene hurtbox.tscn als Kind an eine Figur hängen, darunter
## eine CollisionShape2D legen und im Inspektor die Ebene wählen:
## "player_hurtbox" für Spieler, "enemy_hurtbox" für Gegner.
## Ob und wie viel Schaden ankommt, entscheidet das Geschwister "Health".
##
## Abschalten: Knoten löschen - die Figur ist dann nicht mehr zu treffen.

## Ein Treffer hat Schaden gemacht. direction zeigt vom Angreifer zum Ziel.
signal hit_received(damage: float, direction: Vector2)

var _health: Health


func _ready() -> void:
	_health = get_parent().get_node_or_null("Health") as Health


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
