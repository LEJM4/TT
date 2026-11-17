extends CanvasLayer
## Hud - die Anzeige am Bildrand für eine Spielfigur (M12).
##
## Zeigt Leben, Energie, Ausdauer, Fähigkeiten und das gewählte Geschoss der
## Figur mit der Nummer player_id. Das HUD sucht sie in der Gruppe "players",
## auch wenn sie erst nach ihm erscheint, und gibt sie an jeden Knoten unter
## sich weiter, der bind(figur) kennt. Die Teile hören nur auf die Signale der
## Bausteine der Figur und entscheiden nichts. Verschwindet die Figur, bekommen
## die Teile bind(null) und blenden sich aus; eine neue Figur mit derselben
## Nummer übernehmen sie wieder.
##
## Teile in hud.tscn: EnergyOrb, Hearts, StaminaBar und unten BottomBar mit
## AbilityBar und AmmoSlot. Jedes Teil lässt sich einzeln löschen.
## Das HUD liegt auf Bildebene 90: unter der Debug-Anzeige (100), dem
## Inventarfenster (105) und dem Fadenkreuz (110).
##
## Abschalten: den Knoten aus dem Level löschen - kein anderes Modul braucht ihn.

## Nummer der Spielfigur, deren Werte das HUD zeigt.
@export var player_id := 1

var _player: Node


func _ready() -> void:
	get_tree().node_added.connect(_on_node_added)
	for node in get_tree().get_nodes_in_group("players"):
		_on_node_added(node)


func _on_node_added(node: Node) -> void:
	if _player != null or not node.is_in_group("players"):
		return
	if node.get("player_id") != player_id:
		return
	if node.is_node_ready():
		_bind(node)
	else:
		# Die Figur ist gerade erst erschienen; ihre Bausteine sind noch nicht bereit.
		node.ready.connect(_bind.bind(node), CONNECT_ONE_SHOT)


func _bind(player: Node) -> void:
	if _player != null or not is_inside_tree():
		return
	_player = player
	player.tree_exiting.connect(_on_player_exiting, CONNECT_ONE_SHOT)
	_bind_parts(player)


func _on_player_exiting() -> void:
	_player = null
	_bind_parts(null)


func _bind_parts(player: Node) -> void:
	for part in find_children("*", "", true, false):
		if part.has_method("bind"):
			part.call("bind", player)
