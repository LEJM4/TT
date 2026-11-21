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

## Ein Schalter meldet, ob er an ist - ein Hebel oder eine Druckplatte (M8).
## channel nennt den Kanal, switch_id den Schalter (seine Instanz-Kennung).
## Eine Tür ist offen, solange mindestens ein Schalter auf ihrem Kanal an ist.
@warning_ignore("unused_signal")
signal switch_changed(channel: StringName, switch_id: int, is_on: bool)

## Ein Ding lässt Beute fallen: Der LootSpawner des Levels soll sie hinlegen (M9).
## item ist der Gegenstand (ein ItemData), amount seine Anzahl, origin der Ort,
## von dem die Beute wegspringt.
@warning_ignore("unused_signal")
signal loot_requested(item: Resource, amount: int, origin: Vector2)

## Ein Menü einer Spielfigur ist auf- oder zugegangen, etwa das Inventar (M11).
## Solange es offen ist, nimmt die Figur keine Eingaben an; die Welt läuft weiter.
@warning_ignore("unused_signal")
signal menu_changed(player_id: int, is_open: bool)

## Ein NPC möchte mit einer Spielfigur sprechen: Ihr Dialogfenster soll das
## Gespräch zeigen (M15). dialog ist das Gespräch (DialogData), source_id die
## Instanz-Kennung des NPC. Ist das Fenster belegt, bleibt die Bitte ohne Antwort.
@warning_ignore("unused_signal")
signal dialog_requested(player_id: int, dialog: Resource, source_id: int)

## Ein Gespräch hat begonnen: Das Dialogfenster der Figur zeigt es jetzt (M15).
@warning_ignore("unused_signal")
signal dialog_started(player_id: int, source_id: int)

## Das Dialogfenster zeigt eine neue Zeile (M15); line ist die Zeile (DialogLine).
## Der NPC mit source_id entscheidet daran, ob er etwas gibt.
@warning_ignore("unused_signal")
signal dialog_line_shown(player_id: int, source_id: int, line: Resource)

## Ein Gespräch ist vorbei (M15). completed heißt: bis zum Ende gelaufen;
## falsch: abgebrochen, etwa mit Esc.
@warning_ignore("unused_signal")
signal dialog_finished(player_id: int, source_id: int, completed: bool)

## Jemand bittet, den Spielstand in die Datei zu schreiben (M16), etwa der
## Zeitanker beim Rasten oder das Level beim Tod. reason nennt den Anlass, etwa
## "Rasten". Der SaveManager schreibt; ohne ihn geschieht nichts.
@warning_ignore("unused_signal")
signal save_requested(reason: String)

## Der Spielstand steht jetzt in der Datei (M16); reason wie bei save_requested.
@warning_ignore("unused_signal")
signal game_saved(reason: String)

## Der Rückkehrpunkt hat sich geändert (M16): Hier erwacht die Figur nach dem Tod
## und beim nächsten Start. anchor_id ist die Kennung des Zeitankers im Level
## level_id; leer heißt: der Landepunkt des Levels.
@warning_ignore("unused_signal")
signal respawn_changed(level_id: String, anchor_id: String)

## Ein Lauf durch ein Level hat sich geändert (M16). event ist "begin" (begonnen),
## "complete" (abgeschlossen), "leave" (verlassen), "load" (aus der Datei geladen)
## oder "new_game" (neues Spiel, level_id leer).
@warning_ignore("unused_signal")
signal level_run_changed(level_id: String, event: String)
