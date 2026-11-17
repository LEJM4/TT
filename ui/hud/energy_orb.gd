extends TextureProgressBar
## EnergyOrb - die Energie einer Spielfigur als Kugel, die sich von unten füllt (M12).
##
## Die Bilder stehen im Inspektor: texture_under ist der Rahmen, texture_progress
## die Füllung - versetzt um texture_progress_offset -, texture_over der
## Glanzpunkt. Die Füllung steigt in ganzen Pixeln; solange noch Energie da
## ist, bleibt mindestens ein Pixel zu sehen.
## Hört auf das Signal changed des Vorrats supply_name der Figur (ein Supply);
## das HUD ruft bind().
##
## Abschalten: den Knoten aus hud.tscn löschen.

## Name des Vorrats an der Figur.
@export var supply_name := "Energy"

var _supply: Supply


func _ready() -> void:
	# Ohne step 0 rundet die Leiste auf ganze Zahlen - bei 0 bis 1 also auf leer oder voll.
	step = 0.0
	min_value = 0.0
	max_value = 1.0
	visible = false


## Zeigt den Vorrat dieser Figur; null blendet die Kugel aus.
func bind(player: Node) -> void:
	if _supply != null and _supply.changed.is_connected(_on_supply_changed):
		_supply.changed.disconnect(_on_supply_changed)
	_supply = null
	if player != null:
		_supply = player.get_node_or_null(supply_name) as Supply
	visible = _supply != null
	if _supply == null:
		return
	_supply.changed.connect(_on_supply_changed)
	_on_supply_changed(_supply.current, _supply.get_maximum())


func _on_supply_changed(current: float, maximum: float) -> void:
	var ratio := 0.0
	if maximum > 0.0:
		ratio = clampf(current / maximum, 0.0, 1.0)
	var pixels := 1.0
	if texture_progress != null:
		pixels = maxf(texture_progress.get_height(), 1.0)
	var filled := roundf(ratio * pixels)
	if current > 0.0:
		filled = maxf(filled, 1.0)
	value = filled / pixels
