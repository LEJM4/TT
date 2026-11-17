class_name Interactable
extends Area2D
## Interactable - macht seinen Elternknoten mit der Taste E bedienbar (M8).
##
## Benutzung: die Szene interactable.tscn als Kind an ein Ding hängen, darunter
## eine CollisionShape2D legen - die Fläche, in deren Nähe E wirkt - und im
## Elternknoten auf das Signal interacted hören. Was dann geschieht, entscheidet
## der Elternknoten: Eine Tür geht auf, ein Hebel legt um. Die Figur findet den
## Baustein mit ihrem Interactor über die Ebene "interactable".
## Nur solange enabled gilt, zeigt sich die Taste E und E wirkt.
##
## Abschalten: Knoten löschen - das Ding reagiert nicht mehr auf E.

## Jemand hat E gedrückt; actor ist die Figur, die es war.
signal interacted(actor: Node)

## Reagiert das Ding gerade auf E?
@export var enabled := true
## Hier sitzt die Unterkante der Taste E, vom Ding aus gemessen, in Pixeln -
## nur wenn der Interactor sie über dem Ding zeigt (prompt_above_target).
@export var prompt_offset := Vector2(0.0, -10.0)


## Lässt sich das Ding gerade bedienen?
func can_interact() -> bool:
	return enabled


## Bedient das Ding, wenn es gerade geht. Liefert, ob es ging.
func interact(actor: Node) -> bool:
	if not can_interact():
		return false
	interacted.emit(actor)
	return true
