class_name DialogSettings
extends Resource
## DialogSettings - Werte des Dialogfensters (M15).
##
## Die Werte stehen in data/ui/dialog.tres.

## So viele Buchstaben erscheinen je Sekunde; 0 zeigt den Text sofort ganz.
@export_range(0.0, 400.0, 1.0) var characters_per_second := 40.0
## So oft wippt der Pfeil unten rechts je Sekunde, solange er auf E wartet.
@export_range(0.0, 10.0, 0.1) var arrow_bob_rate := 2.0
