class_name HudStats
extends Resource
## HudStats - Werte-Datei des HUD (M12).
##
## Die Werte stehen in data/ui/hud.tres.

## Leben je Herz. Ein Herz zeigt Viertel, ein Viertel ist also ein Viertel davon.
## Der Höchstwert der Figur sollte ein Vielfaches sein; sonst bleibt das letzte
## Herz auch bei vollem Leben angebrochen.
@export var health_per_heart := 20.0
