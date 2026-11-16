extends Node
## EventBus - die zentrale Meldestelle des Spiels.
##
## Module kennen sich nicht direkt. Wer etwas mitzuteilen hat, sendet hier
## eine Meldung; wer es wissen will, hört zu.
##
## Neue Meldung:  eine Zeile "signal ..." in dieser Datei ergänzen
## Senden:        EventBus.name_der_meldung.emit(werte)
## Zuhören:       EventBus.name_der_meldung.connect(funktion)

## Testmeldung für den Setup-Check (M0).
@warning_ignore("unused_signal")
signal setup_checked(source: String)

## Ein Modul meldet einen Wert für die Debug-Anzeige (M1).
## Ein leerer Wert entfernt den Eintrag wieder.
@warning_ignore("unused_signal")
signal debug_value_changed(key: String, value: String)

## Ein Level meldet seine Grenzen; Kameras bleiben innerhalb (M3).
@warning_ignore("unused_signal")
signal camera_bounds_changed(bounds: Rect2)

## Das Leben einer Spielfigur ist auf 0 gefallen (M4).
@warning_ignore("unused_signal")
signal player_died(player_id: int)

## Jemand schießt: Der ProjectileSpawner des Levels soll ein Geschoss erzeugen (M6).
## scene ist die Geschoss-Szene, stats die Werte-Datei des Schusses (RangedStats),
## target_mask nennt die Ebenen der Hurtboxen, die getroffen werden.
@warning_ignore("unused_signal")
signal projectile_requested(scene: PackedScene, origin: Vector2, direction: Vector2, stats: Resource, target_mask: int)
