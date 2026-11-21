extends Button
## ChoiceButton - eine Antwort im Dialogfenster: ein Kästchen mit Taste davor (M15).
##
## Das Dialogfenster setzt den Text und hört auf pressed. Das Kind "Key" zeigt,
## mit welcher Zahl die Antwort gewählt wird; liegt die Maus auf dem Kästchen,
## zeigt das Kind "Focus" einen Rahmen. Aussehen: Variante "DialogChoice" in
## ui/dialog/dialog_theme.tres.

## Bild der Taste, etwa Ui/Input/Keyboard/Key1.png.
@export var key_icon: Texture2D

@onready var _key := get_node_or_null("Key") as TextureRect
@onready var _focus := get_node_or_null("Focus") as CanvasItem


func _ready() -> void:
	if _key != null:
		_key.texture = key_icon
	if _focus != null:
		_focus.visible = false


func _process(_delta: float) -> void:
	if _focus != null:
		_focus.visible = is_visible_in_tree() and is_hovered()
