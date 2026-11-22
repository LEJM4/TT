# TimeTraveller

2D-Action-RPG über einen Zeitreisenden, gebaut mit Godot 4 – Modul für Modul.

- Wo das Projekt steht und was im Code existiert: `docs/projekt_stand.md`
- Der ausführliche Plan als Richtlinie: https://claude.ai/artifact/VsJhWxFHsnRPmCMFcH483R

## Öffnen

1. Godot 4.7 starten, im Projektmanager „Importieren“ wählen und diesen Ordner angeben.
2. F5 startet die Startszene `levels/boot/boot.tscn`: Sie setzt das Spiel dort fort, wo es aufgehört hat – im laufenden Level, in der Zeitkapsel oder mit einem neuen Lauf in der Testkammer, dem Raum, in dem jede Mechanik zuerst ausprobiert wird.

## Ordner

| Ordner | Inhalt |
| --- | --- |
| `autoload/` | Globale Dienste: EventBus, Tastenbelegung, Spielstand, Szenenwechsel, Ton |
| `components/` | Bausteine für alle: Bild, Effekte, Splitter, Leben, Lebensleiste, Trefferzonen, Angriffe, Dash, Vorräte, Inventar, Geschoss-Wahl, Interaktion, Beute, Aufsammeln, Ausrüstung, Zustandsautomat, Sehen und Hören, Sprechblase, Blick im Gespräch, Spielstand (`persistent/` für Dinge der Welt, `player_progress/` für die Spielfigur), Ereignisse für Missionen (`mission_cue/`), Gespräch mit Aktion (`talk_action/`), Sperre für Gesperrtes an der Spielfigur (`unlock_gate/`) |
| `entities/` | Figuren und Bewegliches: `player/`, `enemies/` – Grundszene, Gegnertypen (Nahkämpfer, Fernkämpfer), fertige Gegner, Angriffs-Module in `attacks/`, Zustände in `states/` –, `npcs/` – Grundszene, fertige NPCs und Auftraggeber –, `dummy/`, `projectile/`, `effect/`, `debris/`, `pickup/` |
| `abilities/` | Fähigkeiten: Schnelligkeit, Unsichtbarkeit, Stun; der Dash ist ein Baustein in `components/dash/` |
| `items/` | Baupläne für Gegenstände, Geschosse, Ausrüstung und Beute-Listen; die Gegenstände selbst liegen in `data/items/` – Geschosse, Materialien, Schlüssel, Ausrüstung –, die Listen in `data/loot/` |
| `dialogs/` | Baupläne für Gespräche: Gespräch, Zeile, Antwort, Sprecher und der DialogRunner, der den Weg durch ein Gespräch kennt; die Gespräche selbst liegen in `data/dialogs/` |
| `unlocks/` | Baupläne für Freischaltungen – eine Freischaltung und die Liste aller; die Liste selbst steht in `data/unlocks/unlocks.tres` |
| `missions/` | Baupläne für Missionen – Missionen-Datei eines Levels, Mission, Ziele – und der `MissionTracker`, die eine Stelle für die Missionen eines Levels; die Missionen selbst liegen je Level in `data/missions/` |
| `world/` | Dinge der Welt: `view/` die Ansicht – Zoom der Welt und die Kachel als Maß –, Schadensfeld, Türen, Hebel, Druckplatten, Zerstörbares, Truhen, Zeitanker, Ausgang eines Levels, `room/` Räume und der `RoomWatcher`, `time_capsule/` die Zeitkapsel im Level, `time_console/` die Zeitsteuerung in der Zeitkapsel, `unlock_pickup/` Fundstücke, die eine Mechanik freischalten |
| `levels/` | `boot/` die Startszene, `level.gd` die Grundlage der Level, `level_frame/` was jedes Level braucht, `test_chamber/` die Testkammer, `test_field/` das Testfeld, `time_capsule/` die Zeitkapsel innen; dazu die Baupläne der Reisedaten (`level_info.gd`, `travel_settings.gd`) – die Reisedaten selbst stehen in `data/world/travel.tres` |
| `ui/` | Oberfläche: `hud/` die Anzeige am Bildrand, `inventory/` das Inventarfenster, `theme/` das Holz-Thema für alle Fenster, `dialog/` das Dialogfenster mit eigenem Thema, `missions/` die Missionsliste und die Hinweise, `crosshair/`, `debug/` für Entwickler-Anzeigen; später Menüs |
| `data/` | Werte-Dateien (`.tres`): Balancing, Gegner, Skins, Gegenstände, Effekte, Beute, Gespräche, Missionen, Freischaltungen, Oberfläche, Reisedaten |
| `assets/` | Grafik und Ton – siehe `assets/README.md` |
| `docs/` | Stand-Datei und Grafik-Katalog; von Godot ignoriert |
| `tools/` | Hilfsskripte; von Godot ignoriert |

## Tastenbelegung

Sie steht in `autoload/input_setup.gd` und lässt sich dort ändern.

| Eingabe | Aktion im Code |
| --- | --- |
| W A S D | `move_up`, `move_left`, `move_down`, `move_right` |
| Maus bewegen | Fadenkreuz |
| Linksklick | `attack_primary` |
| Rechtsklick | `attack_secondary` |
| Mausrad runter / hoch | `ammo_next`, `ammo_previous` – nächstes oder voriges Geschoss |
| Leertaste, Maustaste 4 | `dash` |
| Umschalt | `sprint` |
| Strg | `sneak` |
| E | `interact` |
| Q | `use_potion` |
| 1 2 3 | `ability_1`, `ability_2`, `ability_3` |
| Tab | `inventory` |
| M | `map` |
| J | `mission_toggle` – Missionsliste ein- und ausklappen; ein Klick auf ihre Überschrift geht auch |
| Esc | `pause` – schließt auch Inventar und Gespräch |

**Im Gespräch** – die Figur nimmt dann keine Eingaben an, deshalb dürfen die Tasten doppelt belegt sein:

| Eingabe | Aktion im Code | Wirkung |
| --- | --- | --- |
| E, Leertaste, Linksklick | `dialog_next` | Text ganz zeigen, dann weiter |
| 1 2 3 | `dialog_choice_1`, `dialog_choice_2`, `dialog_choice_3` | Antwort wählen; die Maus geht auch |
| Esc | `pause` | Gespräch abbrechen |

**Entwickler-Tasten**

| Eingabe | Aktion im Code | Wirkung |
| --- | --- | --- |
| F1 | `debug_toggle_overlay` | Debug-Anzeige ein- und ausblenden |
| F2 | `debug_restart_room` | Raum neu laden wie ein Tod ohne Tod |
| F3 | `debug_cycle_zoom` | in der Testkammer: Zoom der Welt 1 bis 4 durchschalten; der Wert steht in `data/world/view.tres` |
| F4 | `debug_delete_save` | nur im Debug-Build: Spielstand löschen, neues Spiel in der Testkammer |
| Bild auf | `debug_complete_level` | nur im Debug-Build: Level abschließen ohne Nachfrage – wie „Einsteigen“ an der Zeitkapsel |
| Bild ab | `debug_leave_level` | nur im Debug-Build: Reise abbrechen ohne Nachfrage – wie „Abbrechen“ an der Zeitkapsel |
| Ende | `debug_quit_game` | nur im Debug-Build: Spiel beenden wie mit dem X am Fenster, mit Speichern |
| Pos1 | `debug_unlock_all` | nur im Debug-Build: alles freischalten |

F2, F4, Bild auf, Bild ab, Ende und Pos1 gelten in jedem Level und in der Zeitkapsel; sie liegen im Knoten `DebugKeys`.

F5 bis F8 sind im Godot-Editor belegt (Starten, Szene starten, Pause, Stopp); läuft das Spiel im Editor eingebettet, kämen sie nicht im Spiel an.

## Spielstand

- Die Datei liegt unter `user://saves/slot_1.json`, unter Windows in `%APPDATA%\Godot\app_userdata\TimeTraveller\saves\`. Sie ist lesbares JSON.
- Gespeichert wird beim Rasten am Zeitanker, beim Tod, bei F2, beim Einsteigen in die Zeitkapsel und beim Abbrechen einer Reise, vor jeder Reise in ein Level und beim Schließen des Fensters. Der Stopp-Knopf des Editors beendet ohne Speichern.
- Den Fortschritt führt `GameState`, in die Datei schreibt `SaveManager`. Ohne Datei beginnt ein neues Spiel.

## Missionen

- Je Level eine Datei mit allen seinen Missionen, etwa `data/missions/test_chamber.tres`; das Level trägt sie beim Knoten `MissionTracker` ein. Jede Mission hat einen Namen, einen Titel, Ziele – ein Ereignis oder Gegenstände – und auf Wunsch eine Belohnung.
- Ein Ereignis meldet der Baustein `components/mission_cue/`, etwa am Höhlenmenschen „caveman_defeated“, wenn er fällt.
- Gesprächszeilen starten oder übergeben eine Mission (`start_mission`, `hand_in_mission`); ein Auftraggeber ist ein NPC mit dem Skript `entities/npcs/quest_giver.gd`.
- Sind alle Pflichtmissionen erfüllt, meldet der `MissionTracker` den Kanal `missions_done`: Die Zeitkapsel im Level ist dann bereit zur Rückreise.

## Zeitkapsel, Level und Räume

- Die Zeitkapsel steht am Landepunkt jedes Levels (`world/time_capsule/`). Vor ihr erscheint die Figur bei der Ankunft – die Zeitkapsel landet – und nach dem Tod, solange sie an keinem Zeitanker gerastet hat.
- E an der Zeitkapsel: Sind alle Pflichtmissionen erfüllt, geht es mit „Einsteigen“ zurück – das Level ist abgeschlossen. Sonst fragt sie, ob die Reise abgebrochen wird; dann ist der Fortschritt im Level verloren.
- Innen ist die Zeitkapsel die Lobby (`levels/time_capsule/`): ausrüsten mit Tab, an der Zeitsteuerung das Ziel wählen. Es gibt sie, sobald ein Level abgeschlossen ist; vorher beginnt ein Abbruch das Level von vorn.
- Szenenwechsel macht nur der `SceneManager`, mit Überblendung. Die Ziele stehen in `data/world/travel.tres`.
- Ein neues Level: eine Szene mit dem Skript `levels/level.gd` an der Wurzel, Räume aus `world/room/room.tscn`, Wände, die Zeitkapsel, ein `MissionTracker` mit seiner Missionen-Datei und als letztes Kind `levels/level_frame/level_frame.tscn`; dazu ein Eintrag in `data/world/travel.tres` und eine Antwort an der Zeitsteuerung in `data/dialogs/time_console.tres`.
- Räume: Ein Level besteht aus Räumen in seiner Szene. Die Kamera bleibt im Raum der Figur und gleitet beim Wechsel hinüber.

## Freischaltungen

- Fernkampf, Dash, Schleichen, Stun, Unsichtbarkeit und Schnelligkeit sind zu Beginn gesperrt; die Taste bewirkt dann nichts, und das HUD zeigt nur, was frei ist. Laufen, Sprinten, Nahkampf, Zerstören, E und Inventar sind immer frei.
- Alle Freischaltungen stehen in `data/unlocks/unlocks.tres`: Kennung, Name, Taste für den Hinweis, Symbol, von Anfang an frei oder nicht.
- Frei schaltet nur `GameState`. Darum bitten ein Fundstück (`world/unlock_pickup/`, E daran), die Belohnung einer Mission (`reward_unlocks`) und eine Gesprächszeile (`unlock`). Oben in der Mitte steht dann „Neu freigeschaltet“.
- Freischaltungen gelten für alle Spielfiguren und stehen im Spielstand wie alles andere: Tod und Beenden behalten sie, ein Abbruch der Reise verwirft, was im Level dazukam.
- An der Spielfigur fragt der Baustein `Unlocks` (`components/unlock_gate/`), was frei ist; eine Fähigkeit nennt ihre Freischaltung selbst (`unlock_id`).

## Regeln

- Ein Modul ist ein Ordner mit eigener Szene und eigenem Skript.
- Module kennen sich nicht direkt; Übergreifendes läuft über den EventBus.
- Zahlenwerte stehen in Werte-Dateien, nicht im Code.
- Jedes Modul lässt sich abschalten, ohne dass der Rest abstürzt.
- Dateinamen und Code sind englisch, Texte im Spiel deutsch.
