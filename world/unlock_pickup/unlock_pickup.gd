class_name UnlockPickup
extends Node2D
## UnlockPickup - ein Fundstück, das eine Mechanik freischaltet (M19).
##
## Eine Schriftrolle am Boden; sie wippt leicht und funkelt (Kind "Sparkle").
## E nimmt sie auf (Kind "Interactable"): Das Fundstück bittet GameState,
## unlock_id freizuschalten (EventBus.unlock_requested), und verschwindet. Oben in
## der Mitte steht dann etwa "Neu freigeschaltet" und "Dash (Leertaste)" - das
## meldet GameState. Die Kennungen stehen in data/unlocks/unlocks.tres.
## Dass es aufgenommen ist, merkt sich sein Kind "Persistent" im Spielstand:
## Tod und Beenden behalten das, ein Abbruch der Reise legt es wieder hin -
## die Freischaltung ist dann ebenfalls verworfen.
## Die Figur läuft darüber hinweg; es hält nichts auf.
##
## Abschalten: Knoten löschen - die Freischaltung kommt dann nur noch auf
## anderen Wegen, etwa über eine Mission.

## Das Fundstück ist aufgenommen; danach merkt sich Persistent das.
signal taken
## Es funkelt gerade - für den Effekt im Kind "Sparkle".
signal sparkled

## Kennung der Freischaltung, etwa "dash".
@export var unlock_id: StringName = &""
## So weit wippt die Rolle auf und ab, in Pixeln; 0 schaltet es ab.
@export var bob_height := 1.0
## So oft funkelt es, in Sekunden; 0 schaltet es ab.
@export var sparkle_interval := 1.5
## Farbe des Schattens.
@export var shadow_color := Color(0.0, 0.0, 0.0, 0.3)

## Ist es schon aufgenommen?
var is_taken := false

var _clock := 0.0
var _sparkle_left := 0.0
var _icon_rest := Vector2.ZERO

@onready var _icon := get_node_or_null("Icon") as Node2D
@onready var _interactable := get_node_or_null("Interactable") as Interactable


func _ready() -> void:
	if unlock_id == &"":
		push_warning("UnlockPickup %s: keine Freischaltung gewählt (unlock_id)." % name)
	if _icon != null:
		_icon_rest = _icon.position
	if _interactable != null:
		_interactable.interacted.connect(_on_interacted)
	# Nicht alle Fundstücke im selben Takt.
	_sparkle_left = sparkle_interval * (0.3 + 0.7 * fposmod(global_position.x * 0.013, 1.0))


func _process(delta: float) -> void:
	if is_taken:
		return
	_clock += delta
	if _icon != null and bob_height > 0.0:
		_icon.position.y = _icon_rest.y - roundf((sin(_clock * 3.0) + 1.0) * 0.5 * bob_height)
	if sparkle_interval > 0.0:
		_sparkle_left -= delta
		if _sparkle_left <= 0.0:
			_sparkle_left = sparkle_interval
			sparkled.emit()


func _draw() -> void:
	draw_set_transform(Vector2(0.0, 1.0), 0.0, Vector2(1.0, 0.45))
	draw_circle(Vector2.ZERO, 5.0, shadow_color)
	draw_set_transform_matrix(Transform2D.IDENTITY)


## Für Persistent: aufgenommen oder nicht. Leer: Es liegt noch da.
func get_saved_state() -> Dictionary:
	if is_taken:
		return {"taken": true}
	return {}


## Für Persistent: Was aufgenommen ist, liegt nach dem Laden nicht mehr da.
func apply_saved_state(data: Dictionary) -> void:
	if bool(data.get("taken", false)):
		_set_taken()


func _on_interacted(actor: Node) -> void:
	if is_taken:
		return
	var player_id := 1
	if actor != null and actor.get("player_id") is int:
		player_id = int(actor.get("player_id"))
	_set_taken()
	if unlock_id != &"":
		EventBus.unlock_requested.emit(player_id, unlock_id)
	taken.emit()


func _set_taken() -> void:
	is_taken = true
	visible = false
	set_process(false)
	if _interactable != null:
		_interactable.enabled = false
