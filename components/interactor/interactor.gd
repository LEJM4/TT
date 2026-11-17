class_name Interactor
extends Area2D
## Interactor - findet das nächste Ding, das auf E reagiert, und bedient es (M8).
##
## Benutzung: die Szene interactor.tscn als Kind an eine Figur hängen und im
## Inspektor die Werte-Datei wählen (InteractorStats, etwa data/player/interactor.tres).
## Ein Kreis um die Figur sucht auf der Ebene "interactable". Von allem, was er
## berührt und gerade bedienbar ist, gilt das Nächste - das ist focus.
## Solange es eins gibt, zeigt das Kind "Prompt" die Taste E über dem Kopf der
## Figur - oder mit prompt_above_target über dem Ding. try_interact() bedient
## focus; was dann geschieht, entscheidet das Ding selbst.
##
## Abschalten: Knoten löschen - die Figur bedient nichts mehr mit E.
## Ohne das Kind "Prompt" wirkt E weiter, nur ohne die Taste im Bild.

## Das nächste bedienbare Ding hat gewechselt; null heißt: keins in Reichweite.
signal focus_changed(target: Interactable)

const PROMPT_NAME := "Prompt"
const SHAPE_NAME := "CollisionShape2D"

## Werte-Datei mit der Reichweite.
@export var stats: InteractorStats
## Sitzt die Taste E über dem Ding statt über der Figur?
@export var prompt_above_target := false
## Unterkante der Taste E über der Figur, von ihrer Mitte aus gemessen, in Pixeln.
@export var prompt_offset := Vector2(0.0, -12.0)

## Das nächste bedienbare Ding oder null.
var focus: Interactable

var _prompt: Node2D
var _focus_id := 0


func _ready() -> void:
	if stats == null:
		push_warning("Interactor: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = InteractorStats.new()
	var shape_node := get_node_or_null(SHAPE_NAME) as CollisionShape2D
	if shape_node != null:
		# Eigene Form je Figur, damit die Szene ihre Vorlage nicht teilt.
		var circle := CircleShape2D.new()
		circle.radius = stats.reach
		shape_node.shape = circle
	_prompt = get_node_or_null(PROMPT_NAME) as Node2D
	if _prompt != null:
		_prompt.visible = false


func _physics_process(_delta: float) -> void:
	var best: Interactable = null
	var best_distance := INF
	for area in get_overlapping_areas():
		var target := area as Interactable
		if target == null or not target.can_interact():
			continue
		var distance := global_position.distance_squared_to(target.global_position)
		if distance < best_distance:
			best_distance = distance
			best = target
	# Jeden Schritt neu setzen: So hält focus nie ein Ding, das es nicht mehr gibt.
	focus = best
	var best_id := 0
	if best != null:
		best_id = best.get_instance_id()
	if best_id != _focus_id:
		_focus_id = best_id
		focus_changed.emit(focus)
	_place_prompt()


## Bedient das nächste Ding, wenn es eins gibt. Liefert, ob es ging.
func try_interact() -> bool:
	if not is_instance_valid(focus) or not focus.can_interact():
		return false
	return focus.interact(get_parent())


func _place_prompt() -> void:
	if _prompt == null:
		return
	if focus == null:
		_prompt.visible = false
		return
	if prompt_above_target:
		_prompt.global_position = focus.global_position + focus.prompt_offset
	else:
		_prompt.global_position = global_position + prompt_offset
	_prompt.visible = true
