class_name EquipmentData
extends ItemData
## EquipmentData - ein Gegenstand zum Anlegen: Waffe, Fernkampf, Rüstung oder Anhänger (M11).
##
## Er liegt im Inventar wie jeder Gegenstand; angelegt wird er über den Baustein
## Equipment der Figur, auf den Platz aus slot. Was er bewirkt, steht in seinen
## Werten; leere Werte wirken nicht. Gegenstände liegen unter data/items/,
## etwa katana.tres oder ruby_charm.tres.

## Ausrüstungsplätze einer Figur.
enum Slot { WEAPON, RANGED, ARMOR, CHARM }

## Namen der Plätze für die Anzeige, in der Reihenfolge von Slot.
const SLOT_NAMES: Array[String] = ["Waffe", "Fernkampf", "Rüstung", "Anhänger"]

## Auf welchen Platz er gehört.
@export var slot := Slot.WEAPON
## Waffe: die Werte des Schwerthiebs - Schaden, Trefferzone, Pause.
@export var melee: MeleeStats
## Fernkampf: so viel mehr Schaden macht jedes Geschoss beim Aufprall.
@export var projectile_damage_bonus := 0.0
## Rüstung: so viel weniger Schaden macht jeder Treffer; mindestens 1 bleibt.
@export var armor := 0.0
## Anhänger: so viel mehr Leben.
@export var max_health_bonus := 0.0


## Name des Platzes, etwa "Waffe".
func get_slot_name() -> String:
	return SLOT_NAMES[slot]


## Die Werte als kurzer Text für das Inventarfenster, etwa "Schaden 15, Pause 0,5 s".
func describe() -> String:
	var parts := PackedStringArray()
	if melee != null:
		parts.append("Schaden %s, Pause %s s" % [_number(melee.damage), _number(melee.cooldown)])
	if projectile_damage_bonus != 0.0:
		parts.append("Geschosse %+d Schaden" % roundi(projectile_damage_bonus))
	if armor != 0.0:
		parts.append("%s Schaden weniger je Treffer" % _number(armor))
	if max_health_bonus != 0.0:
		parts.append("%+d Leben" % roundi(max_health_bonus))
	return ", ".join(parts)


# Zahl mit deutschem Komma und ohne überflüssige Nullen: 0.5 wird "0,5", 15.0 wird "15".
func _number(value: float) -> String:
	if is_equal_approx(value, roundf(value)):
		return str(roundi(value))
	var text := ("%.2f" % value).rstrip("0").rstrip(".")
	return text.replace(".", ",")
