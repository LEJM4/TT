extends Control
## AbilitySlot - ein Platz der Fähigkeiten-Leiste im HUD (M12).
##
## Kinder: Icon (TextureProgressBar, im Uhrzeigersinn gefüllt), ActiveFrame
## (der orange Rahmen) und Key (die Taste darunter). Die Symbole kommen aus
## der Werte-Datei der Fähigkeit: icon farbig, icon_disabled grau.
## Wirkt die Fähigkeit, steht der Rahmen um das Symbol. In der Abklingzeit ist
## es grau und füllt sich im Uhrzeigersinn wieder mit Farbe. Reicht der Vorrat
## der Figur nicht für die Kosten, bleibt es grau. Den Zustand liest der Platz
## in jedem Bild an der Fähigkeit ab; er ändert nichts an ihr.
## Die AbilityBar erzeugt die Plätze und ruft setup().

var _ability: Ability
var _supply: Supply

@onready var _icon := $Icon as TextureProgressBar
@onready var _frame := $ActiveFrame as Control
@onready var _key := $Key as TextureRect


## Verbindet den Platz mit einer Fähigkeit und zeigt die Taste darunter.
func setup(ability: Ability, key_icon: Texture2D) -> void:
	_ability = ability
	_supply = null
	_key.texture = key_icon
	_key.visible = key_icon != null
	# Ohne step 0 rundet die Füllung auf ganze Zahlen - bei 0 bis 1 also auf grau oder farbig.
	_icon.step = 0.0
	_icon.min_value = 0.0
	_icon.max_value = 1.0
	if ability.stats != null:
		_icon.texture_progress = ability.stats.icon
		_icon.texture_under = ability.stats.icon_disabled
	var user := ability.get_user()
	if user != null and not ability.supply_name.is_empty():
		_supply = user.get_node_or_null(ability.supply_name) as Supply
	_refresh()


func _process(_delta: float) -> void:
	_refresh()


func _refresh() -> void:
	if _ability == null or not is_instance_valid(_ability):
		return
	_frame.visible = _ability.is_active
	_icon.value = _colored_part()


# Anteil des Symbols in Farbe: 1 bereit, 0 grau, dazwischen die Abklingzeit.
func _colored_part() -> float:
	if _ability.is_active:
		return 1.0
	var left := _ability.get_cooldown_left()
	var cooldown := _ability.stats.cooldown
	if left > 0.0 and cooldown > 0.0:
		return clampf(1.0 - left / cooldown, 0.0, 1.0)
	if _supply != null and is_instance_valid(_supply) and _supply.current + 0.0001 < _ability.stats.cost:
		return 0.0
	return 1.0
