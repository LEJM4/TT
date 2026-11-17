class_name CharacterSkin
extends Resource
## CharacterSkin - welche Grafik eine Figur trägt: Bildgröße, Lage, Schatten
## und Animationen (A1).
##
## Werte-Datei für den Baustein CharacterView. Ein anderer Skin ist eine andere
## Datei, kein Code. Beispiele in data/skins/: ninja_green.tres (Spielfigur),
## bamboo_yellow.tres und bamboo.tres (Übungspuppen), caveman.tres (Probe).
##
## Pflicht ist nur "idle". Fehlt eine andere Animation, nimmt CharacterView
## Ersatz: beim Dash Laufen, beim Laufen Stehen, beim Tod Stehen mit
## defeated_tint; ohne Hieb- oder Treffer-Bild bleibt das laufende Bild.

@export_group("Bild")
## Größe eines Einzelbilds in Pixeln, für alle Animationen dieses Skins.
@export var frame_size := Vector2i(16, 16)
## Lage der Bildmitte zur Mitte der Figur, in Pixeln. Negatives y hebt das Bild an.
@export var offset := Vector2i.ZERO
## Färbung im Tod, wenn der Skin keine Animation "dead" hat. Weiß: unverändert.
@export var defeated_tint := Color(0.45, 0.45, 0.5)
## Bei diesem Tempo laufen die Laufbilder genau mit ihren Bildern je Sekunde;
## schneller oder langsamer wird die Animation entsprechend schneller oder
## langsamer. In Pixeln pro Sekunde; 0 schaltet das aus.
@export var walk_reference_speed := 80.0

@export_group("Schatten")
## Bild des Schattens unter der Figur. Leer: kein Schatten.
@export var shadow: Texture2D
## Lage der Schattenmitte zur Mitte der Figur, in Pixeln.
@export var shadow_center := Vector2i.ZERO

@export_group("Animationen")
## Stehen. Pflicht.
@export var idle: SkinAnimation
## Laufen.
@export var walk: SkinAnimation
## Hieb mit dem Schwert.
@export var attack: SkinAnimation
## Dash, etwa eine Rolle.
@export var dash: SkinAnimation
## Treffer: Schaden kommt an.
@export var hit: SkinAnimation
## Tod.
@export var dead: SkinAnimation
