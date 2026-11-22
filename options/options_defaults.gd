class_name OptionsDefaults
extends Resource
## OptionsDefaults - die Grundwerte der Optionen (M20): So steht alles beim
## ersten Start, bevor der Spieler etwas einstellt.
##
## Die Werte stehen in data/ui/options.tres; GameOptions liest die Datei beim
## ersten Bedarf. Was der Spieler danach einstellt, steht in user://options.cfg.
## Ändern: data/ui/options.tres doppelklicken und im Inspektor anpassen.

@export_group("Lautstärke")
## Lautstärke für alles, von 0 bis 1.
@export_range(0.0, 1.0, 0.1) var master_volume := 1.0
## Lautstärke der Musik, von 0 bis 1 - zu hören erst mit A3 - Ton.
@export_range(0.0, 1.0, 0.1) var music_volume := 1.0
## Lautstärke der Geräusche, von 0 bis 1 - zu hören erst mit A3 - Ton.
@export_range(0.0, 1.0, 0.1) var sound_volume := 1.0

@export_group("Bild")
## Läuft das Spiel beim ersten Start im Vollbild?
@export var fullscreen := false

@export_group("Anzeige")
## Ist die Missionsliste beim ersten Start eingeklappt?
@export var missions_collapsed := false
