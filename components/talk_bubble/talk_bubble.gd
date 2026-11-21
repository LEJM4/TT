class_name TalkBubble
extends Sprite2D
## TalkBubble - Sprechblase "..." über einer Figur, die etwas Neues zu sagen hat (M15).
##
## Benutzung: die Szene talk_bubble.tscn als Kind an eine Figur hängen und über
## ihren Kopf schieben. Sie spielt die Bilder aus Ui/Dialog/DialogInfo.png der
## Reihe nach ab: ein, zwei, drei Punkte. Ob sie zu sehen ist, entscheidet der
## Elternknoten (visible); hier wird nur gemalt.
##
## Abschalten: Knoten löschen - die Figur zeigt keine Blase mehr.

## Bilder je Sekunde.
@export var fps := 3.0
## Diese Bilder des Blatts laufen der Reihe nach, ab 0 gezählt; 0 ist die leere Blase.
@export var cycle := PackedInt32Array([1, 2, 3])

var _clock := 0.0


func _process(delta: float) -> void:
	if not visible or cycle.is_empty() or fps <= 0.0:
		return
	_clock += delta
	var step := int(_clock * fps) % cycle.size()
	frame = clampi(cycle[step], 0, hframes * vframes - 1)
