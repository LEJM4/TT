# TimeTraveller – Projektstand

Diese Datei führt Claude. Sie hält fest, wo das Projekt steht und was im Code existiert.
Nach jedem abgeschlossenen Schritt liefert Claude eine neue, vollständige Fassung.
Sie ersetzt die alte an zwei Orten: im Repo unter `docs/projekt_stand.md` und im Projektwissen des Claude-Projekts.

Der ausführliche Plan steht im Projektdokument: https://claude.ai/artifact/VsJhWxFHsnRPmCMFcH483R
Er ist eine Richtlinie, kein Zwang. Was vorgezogen oder eingeschoben wird, steht unten unter „Außer der Reihe“.

## Stand

| | |
| --- | --- |
| Stand vom | 15.11.2026 |
| In Arbeit | – |
| Als Nächstes | M2 – Bewegung (Vorschlag steht unten, noch nicht bestätigt) |
| Zuletzt abgeschlossen | M1 – Testkammer & Debug, am 15.11.2026 |
| Repo | https://github.com/LEJM4/TT – öffentlich, Zweig `main` |

## Arbeitsumgebung

| | |
| --- | --- |
| Godot | 4.7.2 stable, Windows 64-Bit, Standard-Version (GDScript) |
| Lokaler Projektordner | `E:\GitHub\TT` |
| Git-Werkzeug | GitHub Desktop |
| Commit-Identität | `LEJM4` mit der privaten GitHub-Adresse (`…@users.noreply.github.com`) |
| So liest Claude das Repo | per `git clone` über den Link, nur lesend – Dateien wörtlich, Grafiken als Bild |
| So liefert Claude Dateien | jede Datei einzeln mit Pfad, dazu ein ZIP zum Entpacken nach `E:\GitHub\TT` |

## Fahrplan in Kurzform

Status: offen · als Nächstes · in Arbeit · im Test · fertig

| Phase | Modul | Status |
| --- | --- | --- |
| 0 – Fundament | M0 Projekt-Setup | fertig |
| | M1 Testkammer & Debug | fertig |
| 1 – Spielfigur | M2 Bewegung | als Nächstes |
| | M3 Kamera | offen |
| | M4 Zielen & Nahkampf | offen |
| | M5 Dash | offen |
| | M6 Fernkampf | offen |
| | M7 Fähigkeiten | offen |
| 2 – Welt & Interaktion | M8 Interaktion | offen |
| | M9 Zerstörbares | offen |
| | M10 Truhen & Beute | offen |
| | M11 Inventar & Ausrüstung | offen |
| | M12 HUD | offen |
| 3 – Gegner & NPCs | M13 Erster Gegner | offen |
| | M14 Gegnertypen | offen |
| | M15 NPCs & Dialog | offen |
| 4 – Spielrahmen | M16 Speichern & Laden | offen |
| | M17 Missionen | offen |
| | M18 Räume & Levelwechsel | offen |
| | M19 Freischaltungen | offen |
| | M20 Menüs | offen |
| 5 | Level 1 – Steinzeit | offen |
| 6 | Zeitkapsel & weitere Level | offen |
| 7 | Feinschliff & Veröffentlichung | offen |
| 8 | Online-Mehrspieler | offen |

**Gates**

- G1 nach Phase 1: Die Spielfigur fühlt sich gut an – Bewegen, Zielen, Zuschlagen, Ausweichen.
- G2 nach Phase 4: Alle Mechaniken laufen in der Testkammer zusammen, auch nach Speichern und Laden.
- G3 nach Phase 5: Level 1 ist vom Start bis zur Zeitkapsel durchspielbar.

## Außer der Reihe

Hier steht, was vorgezogen, eingeschoben oder neu gewünscht wurde.

| Datum | Was | Status |
| --- | --- | --- |
| 15.11.2026 | Commits laufen unter `LEJM4` mit privater GitHub-Adresse. Dafür wurde das Repo neu angelegt; die erste Historie ist gelöscht. | erledigt |

## Festlegungen

| Thema | Festlegung | Stand |
| --- | --- | --- |
| Engine | Godot 4, entwickelt mit 4.7.2 | entschieden |
| Spielstruktur | Level je Epoche; Zeitkapsel als Lobby nach Level 1 | entschieden |
| Steuerung | WASD plus Maus-Fadenkreuz | entschieden |
| Grafik | Ninja Adventure Asset Pack, 16 × 16 Pixel, CC0 | entschieden |
| Mehrspieler | Online, gebaut erst in Phase 8, vorbereitet ab dem ersten Modul | entschieden |
| Repo | GitHub, öffentlich: https://github.com/LEJM4/TT; Claude liest über den Link und liefert Dateien | entschieden |
| Commit-Identität | `LEJM4` mit privater GitHub-Adresse; auf dem Rechner des Nutzers global eingestellt | entschieden am 15.11.2026 |
| Perspektive | Draufsicht mit vier Blickrichtungen; gesprungen wird nicht | entschieden am 15.11.2026 |
| Programmiersprache | GDScript | entschieden am 15.11.2026 |
| Namen | Dateien und Code englisch, Texte im Spiel deutsch | entschieden am 15.11.2026 |
| Auflösung | Spielfläche 480 × 270, vierfach vergrößert auf 1920 × 1080 | entschieden am 15.11.2026 |
| Entwickler-Tasten | F1 Debug-Anzeige ein und aus, F2 Raum neu starten | entschieden am 15.11.2026 |
| Testkammer | Zunächst genau ein Bildschirm, 480 × 270; sie wächst mit den Modulen | entschieden am 15.11.2026 |

Noch offen laut Plan, jeweils fällig vor dem genannten Modul: Kamera (M3), Tod & Speichern (M4), Fernkampf-Kosten (M6), Zauber (M7), Story (Phase 5), Anzahl Level (Phase 6).

## Prüfungen

**M1 – Testkammer & Debug**

- Getestet hat der Nutzer am 15.11.2026 in Godot 4.7.2. Alle sieben Punkte der Prüfliste sind bestanden: keine roten Fehler, Kammer mit Boden, Raster, Wänden, Blöcken und Startpunkten, Anzeige lesbar, Raumzeit, Maus und Aktionen laufen, F1 blendet aus und ein, F2 startet neu, die Kammer läuft auch ohne `DebugOverlay`.
- Claude hat die acht gelieferten Dateien nur am Text geprüft: Verweise zwischen Szenen und Skripten, Knotenpfade, Aktionen, Meldungen.
- Der Abgleich mit dem Repo steht noch aus; er folgt zu Beginn von M2.

**M0 – Projekt-Setup**

- Getestet hat der Nutzer am 15.11.2026 in Godot 4.7.2. Alle sechs Punkte der Prüfliste sind bestanden.
- Claude hat das Repo danach gegengelesen, Stand Commit `8ed9ffb`: 4.374 Dateien, keine unter `.godot/`; Projektdateien wie im Start-ZIP plus Godots Zutaten; Grafik-Paket vollständig laut Katalog, alle 2.104 Importe gültig; beide Commits unter `LEJM4`.

Claude selbst kann Godot nicht starten; der Test des Nutzers ist die einzige echte Prüfung.

## Code-Übersicht

### Projekteinstellungen – `project.godot`

- Spielfläche 480 × 270, Fenster beim Start 1440 × 810
- Streckmodus `viewport` mit ganzzahliger Vergrößerung
- Texturfilter „Nearest“ für scharfe Pixel
- Renderer `gl_compatibility`
- Startszene: die Testkammer `res://levels/test_chamber/test_chamber.tscn`, vom Nutzer in Godot umgestellt
- Von Godot ergänzt: `config/features=PackedStringArray("4.7")`

### Globale Dienste (Autoloads)

| Name | Datei | Stand |
| --- | --- | --- |
| `EventBus` | `autoload/event_bus.gd` | aktiv, 2 Meldungen |
| `InputSetup` | `autoload/input_setup.gd` | aktiv; legt die Aktionen an, `all_actions()` liefert ihre Namen |
| `GameState` | `autoload/game_state.gd` | leer, wird in M16 und M19 gefüllt |
| `SaveManager` | `autoload/save_manager.gd` | leer, wird in M16 gefüllt |
| `SceneManager` | `autoload/scene_manager.gd` | leer, wird in M18 gefüllt |
| `AudioManager` | `autoload/audio_manager.gd` | leer, wird in Phase 5 gefüllt |

### Meldungen im EventBus

| Meldung | Werte | Zweck |
| --- | --- | --- |
| `setup_checked` | `source: String` | Testmeldung für den Setup-Check in M0 |
| `debug_value_changed` | `key: String`, `value: String` | Ein Modul meldet einen Wert für die Debug-Anzeige; ein leerer Wert entfernt den Eintrag |

### Debug-Werte, die Module melden

| Schlüssel | Von wem | Inhalt |
| --- | --- | --- |
| `Neustart` | Testkammer | Hinweis auf die Taste F2 |
| `Raumzeit` | Testkammer | Sekunden seit dem Start des Raums |

### Eingabe-Aktionen – `autoload/input_setup.gd`

| Aktion | Standard-Eingabe |
| --- | --- |
| `move_up`, `move_down`, `move_left`, `move_right` | W, S, A, D |
| `attack_primary` | Linksklick |
| `attack_secondary` | Rechtsklick |
| `dash` | Leertaste, Maustaste 4 |
| `sprint` | Umschalt |
| `sneak` | Strg |
| `interact` | E |
| `use_potion` | Q |
| `ability_1`, `ability_2`, `ability_3` | 1, 2, 3 |
| `inventory` | Tab |
| `map` | M |
| `pause` | Esc |
| `debug_toggle_overlay` | F1 |
| `debug_restart_room` | F2 |

### Kollisions-Ebenen

| Ebene | Name |
| --- | --- |
| 1 | `world` |
| 2 | `player` |
| 3 | `enemy` |
| 4 | `player_hurtbox` |
| 5 | `enemy_hurtbox` |
| 6 | `interactable` |
| 7 | `pickup` |

### Bausteine – `components/`

| Baustein | Ordner | Was er tut | Einstellbar |
| --- | --- | --- | --- |
| `PlaceholderView` | `components/placeholder_view/` | Malt die Rechtecke, Kreise und Kapseln der `CollisionShape2D`-Geschwister als Farbfläche. Platzhalter-Grafik bis Gate G2. Wird als Kind an einen Körper gehängt. | `color` |

### Szenen

| Szene | Skript | Zweck |
| --- | --- | --- |
| `levels/test_chamber/test_chamber.tscn` | `test_chamber.gd` | Testkammer und Startszene |
| `ui/debug/debug_overlay.tscn` | `debug_overlay.gd` | Debug-Anzeige, in der Testkammer als Kind eingehängt |
| `components/placeholder_view/placeholder_view.tscn` | `placeholder_view.gd` | Baustein, siehe oben |
| `ui/debug/setup_check.tscn` | `setup_check.gd` | Setup-Check aus M0; bleibt als Werkzeug, Start über „Aktuelle Szene abspielen“ |

**Testkammer im Einzelnen**

- Wurzel `TestChamber` (Node2D) malt Boden, Raster und Kreuze an den Startpunkten. Einstellbar: `room_size`, `cell_size`, `show_grid`, `floor_color`, `grid_color`, `spawn_color`.
- `Walls` und `Blocks` sind je ein `StaticBody2D` auf Ebene `world`, ohne Maske. Jede Wand und jeder Block ist eine `CollisionShape2D` mit eigenem Rechteck; die Farbe malt `PlaceholderView`.
- Freie Fläche innen: x 16 bis 464, y 16 bis 256 – das sind 28 × 15 Kacheln.
- Blöcke, alle am 16er-Raster: `Square` 32 × 32 bei (160, 64), `Pillar` 16 × 64 bei (352, 64), `Bar` 64 × 16 bei (96, 192), `GateTop` und `GateBottom` je 48 × 16 bei (336, 176) und (336, 224) mit 32 Pixeln Durchgang. Die Koordinaten nennen die linke obere Ecke.
- `SpawnPoints` enthält `Spawn1` bei (216, 136) und `Spawn2` bei (264, 136), beide in der Gruppe `player_spawn`. Genutzt ab M2.
- `DebugOverlay` ist eingehängt und lässt sich löschen, ohne dass die Kammer abstürzt.
- F2 lädt die Szene neu, direkt in `test_chamber.gd`. Ab M18 übernimmt das der `SceneManager`.

**Debug-Anzeige im Einzelnen**

- `CanvasLayer` auf Ebene 100, läuft auch bei pausiertem Spiel. Kind `ValuesLabel` mit halbtransparentem Hintergrund.
- Zeigt FPS, Mausposition im Bild, gedrückte Aktionen und alle über `debug_value_changed` gemeldeten Werte.
- Einstellbar: `refresh_interval` (0,1 s), `font_size` (12), `visible_on_start`.
- Im Editor zeigt die Testkammer nur die blauen Kollisionsflächen; Farben, Raster und Anzeige erscheinen erst im laufenden Spiel.

### Dateien je Modul

**M1 – Testkammer & Debug**

- Neu: `levels/test_chamber/test_chamber.tscn`, `levels/test_chamber/test_chamber.gd`
- Neu: `ui/debug/debug_overlay.tscn`, `ui/debug/debug_overlay.gd`
- Neu: `components/placeholder_view/placeholder_view.tscn`, `components/placeholder_view/placeholder_view.gd`
- Geändert: `autoload/event_bus.gd` (eine Meldung dazu), `autoload/input_setup.gd` (zwei Aktionen dazu)
- Geändert: `README.md`, `docs/projekt_stand.md`
- Von Godot: je eine `.gd.uid` zu den drei neuen Skripten; `project.godot` mit neuer Startszene

**M0 – Projekt-Setup**

- `project.godot`, `icon.svg`, `icon.svg.import`, `.gitignore`, `.gitattributes`, `README.md`
- `autoload/event_bus.gd`, `autoload/input_setup.gd`
- `autoload/game_state.gd`, `autoload/save_manager.gd`, `autoload/scene_manager.gd`, `autoload/audio_manager.gd`
- `ui/debug/setup_check.tscn`, `ui/debug/setup_check.gd`
- Zu jedem der sieben Skripte eine `.gd.uid`-Datei von Godot
- `assets/README.md`
- `assets/ninja_adventure/` – das Grafik-Paket samt `.import`-Dateien, siehe unten
- `docs/projekt_stand.md`, `docs/asset_katalog.md`, `docs/.gdignore`
- `tools/grafik_liste.py`, `tools/.gdignore`
- Leere Ordner mit `.gitkeep`: `entities/player/`, `entities/enemies/`, `entities/npcs/`, `abilities/`, `items/`, `world/`, `data/`. In `components/` und `levels/test_chamber/` liegt die `.gitkeep` noch, wird aber nicht mehr gebraucht.

## Grafik-Paket im Repo

- Ablage: `assets/ninja_adventure/`; Einzelheiten stehen in `docs/asset_katalog.md`.
- Umfang, am Repo gezählt: 2.234 Dateien – 1.915 PNG, 128 GIF, 147 WAV, 41 OGG, 1 TTF, dazu `LICENSE.txt` und die `README.md` des Pakets. Das deckt sich mit dem Katalog.
- Godot hat 2.104 `.import`-Dateien angelegt: 1.915 Texturen, 147 WAV, 41 OGG, 1 Schrift. Sie gehören ins Repo.
- Lizenz: CC0 1.0, so steht es in `LICENSE.txt` und in der `README.md` des Pakets.
- Im Stamm des Pakets liegen Dateien, die der Katalog noch nicht führt: `Example 1.gif` bis `Example 4.gif`, `Example 5 ( Old Version).png`, `preview-part-1.png`, `preview-part-2.png`, `MusicCover.png`, `Palette.png`.
- In `Actor/Character/` liegen lose `Shadow.png`, `AllPreview.png` und `AllPreview2.png`; auch sie fehlen im Katalog.

## Vorschlag für M2 – Bewegung

Noch nicht bestätigt. Fertig laut Plan, wenn: Jede Bewegungsart ist spielbar; Tempo lässt sich ohne Code ändern.

- Spielfigur unter `entities/player/`: ein Körper mit Platzhalter-Rechteck, der in der Testkammer an `Spawn1` erscheint und an Wänden und Blöcken hängen bleibt.
- Laufen in acht Richtungen mit WASD, mit kurzem Anlauf und Bremsweg. Sprinten mit Umschalt, Schleichen mit Strg – jeweils solange die Taste gehalten wird.
- Ausdauer als eigener Baustein: Sprinten verbraucht sie, in Ruhe füllt sie sich wieder; ist sie leer, läuft die Figur normal weiter.
- Eingaben getrennt von der Figur: Ein eigener Knoten übersetzt Tasten in Absichten, die Figur führt nur Absichten aus. So kann die Quelle später das Netz sein.
- Alle Zahlen in einer Werte-Datei unter `data/`: Tempo für Laufen, Sprinten und Schleichen, Anlauf, Bremsweg, Ausdauer und ihr Verbrauch.
- Die Debug-Anzeige bekommt Position, Tempo, Zustand und Ausdauer der Figur gemeldet.
- Erzeugt wird die Figur an einer Stelle, nicht fest in der Szene – vorbereitet für mehrere Spieler.

## Hinweise aus M0 und M1

- Vor jedem Push in GitHub Desktop unter „History“ prüfen, dass beim neuen Commit `LEJM4` steht.
- Beim Kopieren eines Projektordners nie den Ordner `.git` mitnehmen.
- `.godot/` gehört nicht ins Repo und steht in der `.gitignore`; `.uid`- und `.import`-Dateien gehören hinein.
- Neue Dateien spielt der Nutzer per ZIP ein: „Alle extrahieren“ mit Ziel `E:\GitHub\TT`, vorhandene Dateien ersetzen.

## Offene Punkte

- Abgleich von M1 mit dem Repo: zu Beginn von M2, nach dem Push.
- Der Repo-Link ist in die Projektanweisungen einzutragen, falls dort noch der Platzhalter steht.
- Der Sicherungsordner `E:\GitHub\TT_alt` kann gelöscht werden, falls er noch existiert.
- Grafik-Katalog: Alle Einträge mit ⚠ sind am Bild zu prüfen, zuerst die Reihenfolge der Blickrichtungen und der Aufbau der animierten Hauptfigur. Claude kann die Bilder selbst im Repo ansehen. Fällig, bevor echte Grafik eingebaut wird.
- Grafik-Katalog: die losen Dateien im Stamm des Pakets und in `Actor/Character/` nachtragen.
- M2 ist vorgeschlagen, aber noch nicht bestätigt.
