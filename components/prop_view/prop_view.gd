class_name PropView
extends Sprite2D
## PropView - zeigt ein Ding der Welt mit zwei Bildern: aus und an (M8).
##
## Benutzung: die Szene prop_view.tscn als Kind an eine Tür, einen Hebel oder
## eine Druckplatte hängen und im Inspektor den Skin wählen (PropSkin aus
## data/skins/). Der Baustein liest is_on des Elternknotens und hört auf dessen
## Signal state_changed(is_on). Fehlt für einen Zustand das Bild, ist dann nichts
## zu sehen - so verschwindet eine offene Tür. Das Geschwister "PlaceholderView"
## blendet er aus. Rein fürs Auge - er entscheidet nichts.
##
## Abschalten: Knoten löschen - das Ding zeigt wieder seinen Platzhalter.

## Name des Platzhalters, den das Bild ersetzt.
const PLACEHOLDER_NAME := "PlaceholderView"
## Signal des Elternknotens, das den Zustand meldet.
const STATE_SIGNAL := "state_changed"

## Werte-Datei mit Blatt und Zellen.
@export var skin: PropSkin

var _placeholder: CanvasItem


func _ready() -> void:
	centered = false
	region_enabled = true
	if skin == null or skin.texture == null:
		push_warning("PropView %s: kein Skin oder kein Blatt; der Platzhalter bleibt." % get_parent().name)
		visible = false
		return
	texture = skin.texture
	offset = Vector2(skin.offset - skin.frame_size / 2)
	var holder := get_parent()
	_placeholder = holder.get_node_or_null(PLACEHOLDER_NAME) as CanvasItem
	if _placeholder != null:
		_placeholder.visible = false
	if holder.has_signal(STATE_SIGNAL):
		holder.connect(STATE_SIGNAL, _show)
	_show(holder.get("is_on") == true)


func _exit_tree() -> void:
	# Fällt der Baustein zur Laufzeit weg, kommt der Platzhalter zurück.
	if is_instance_valid(_placeholder):
		_placeholder.visible = true


func _show(is_on: bool) -> void:
	var cell := skin.off_cell
	if is_on:
		cell = skin.on_cell
	if cell.x < 0 or cell.y < 0:
		visible = false
		return
	var region := Rect2i(cell * skin.frame_size, skin.frame_size)
	var sheet := Rect2i(Vector2i.ZERO, Vector2i(skin.texture.get_size()))
	if not sheet.encloses(region):
		push_warning("PropView: Zelle %s liegt außerhalb von %s." % [cell, skin.texture.resource_path])
		visible = false
		return
	region_rect = Rect2(region)
	visible = true
