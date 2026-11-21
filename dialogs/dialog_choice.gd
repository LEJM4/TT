class_name DialogChoice
extends Resource
## DialogChoice - eine Antwort der Spielfigur auf eine Frage im Gespräch (M15).
##
## Steht in einem Kästchen über dem Dialogfenster; gewählt wird mit 1 bis 3 oder
## mit der Maus. Teil einer Zeile (DialogLine).

## Text der Antwort - eine kurze Zeile.
@export var text := ""
## Wohin die Antwort führt: Name einer Zeile; "end" beendet das Gespräch;
## leer: die Zeile nach der Frage.
@export var next: StringName = &""
