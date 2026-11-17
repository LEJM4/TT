class_name AbilityStats
extends Resource
## AbilityStats - Werte-Datei einer Fähigkeit: das, was alle Fähigkeiten haben.
##
## Die Werte stehen in data/abilities/. Fähigkeiten mit eigenen Werten haben
## einen eigenen Bauplan, der diesen erweitert: HasteStats, InvisibilityStats
## und StunStats. Seit M12 steht hier auch das Symbol für das HUD.

## Name der Fähigkeit, wie er im Spiel erscheint.
@export var display_name := "Fähigkeit"
## Symbol der Fähigkeit, etwa im HUD; 24 × 24 aus Ui/Skill Icon (M12).
@export var icon: Texture2D
## Graue Fassung des Symbols: in der Abklingzeit und ohne genug Energie (M12).
@export var icon_disabled: Texture2D
## Kosten aus dem Vorrat, etwa Energie.
@export var cost := 30.0
## Dauer der Wirkung in Sekunden.
@export var duration := 4.0
## Pause nach dem Ende der Wirkung bis zum nächsten Einsatz, in Sekunden.
@export var cooldown := 6.0
