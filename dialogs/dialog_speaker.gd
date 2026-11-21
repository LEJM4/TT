class_name DialogSpeaker
extends Resource
## DialogSpeaker - wer spricht: Name im Reiter und Porträt im Dialogfenster (M15).
##
## Eine Datei je Sprecher in data/dialogs/speakers/, etwa shaman.tres.

## Name im Reiter des Fensters. Leer: Der Reiter bleibt ohne Namen.
@export var display_name := ""
## Porträt links im Fenster, 38 × 38 Pixel - die Faceset.png des Grafik-Pakets.
## Leer: Das Fenster hat kein Porträt, der Text beginnt weiter links.
@export var portrait: Texture2D
