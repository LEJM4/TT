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
| In Arbeit | M0 – Projekt-Setup: Start-ZIP liegt vor, Einrichtung und Test stehen aus |
| Als Nächstes | M1 – Testkammer & Debug |
| Zuletzt abgeschlossen | – |
| Repo | noch nicht angelegt |

## Fahrplan in Kurzform

Status: offen · in Arbeit · im Test · fertig

| Phase | Modul | Status |
| --- | --- | --- |
| 0 – Fundament | M0 Projekt-Setup | in Arbeit |
| | M1 Testkammer & Debug | offen |
| 1 – Spielfigur | M2 Bewegung | offen |
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

Noch nichts.

## Festlegungen

| Thema | Festlegung | Stand |
| --- | --- | --- |
| Engine | Godot 4, entwickelt mit 4.7 | entschieden |
| Spielstruktur | Level je Epoche; Zeitkapsel als Lobby nach Level 1 | entschieden |
| Steuerung | WASD plus Maus-Fadenkreuz | entschieden |
| Grafik | Ninja Adventure Asset Pack, 16 × 16 Pixel, CC0 | entschieden |
| Mehrspieler | Online, gebaut erst in Phase 8, vorbereitet ab dem ersten Modul | entschieden |
| Repo | GitHub, öffentlich; Claude liest über den Link und liefert Dateien | entschieden |
| Perspektive | Draufsicht mit vier Blickrichtungen | Vorschlag |
| Programmiersprache | GDScript | Vorschlag |
| Namen | Dateien und Code englisch, Texte im Spiel deutsch | Vorschlag |
| Auflösung | Spielfläche 480 × 270, vierfach vergrößert auf 1920 × 1080 | Vorschlag |

## Code-Übersicht

### Projekteinstellungen – `project.godot`

- Spielfläche 480 × 270, Fenster beim Start 1440 × 810
- Streckmodus `viewport` mit ganzzahliger Vergrößerung
- Texturfilter „Nearest“ für scharfe Pixel
- Renderer `gl_compatibility`
- Startszene `res://ui/debug/setup_check.tscn`

### Globale Dienste (Autoloads)

| Name | Datei | Stand |
| --- | --- | --- |
| `EventBus` | `autoload/event_bus.gd` | aktiv, 1 Meldung |
| `InputSetup` | `autoload/input_setup.gd` | aktiv; legt die Aktionen an, `all_actions()` liefert ihre Namen |
| `GameState` | `autoload/game_state.gd` | leer, wird in M16 und M19 gefüllt |
| `SaveManager` | `autoload/save_manager.gd` | leer, wird in M16 gefüllt |
| `SceneManager` | `autoload/scene_manager.gd` | leer, wird in M18 gefüllt |
| `AudioManager` | `autoload/audio_manager.gd` | leer, wird in Phase 5 gefüllt |

### Meldungen im EventBus

| Meldung | Werte | Zweck |
| --- | --- | --- |
| `setup_checked` | `source: String` | Testmeldung für den Setup-Check in M0 |

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

### Dateien je Modul

**M0 – Projekt-Setup**

- `project.godot`, `icon.svg`, `.gitignore`, `.gitattributes`, `README.md`
- `autoload/event_bus.gd`, `autoload/input_setup.gd`
- `autoload/game_state.gd`, `autoload/save_manager.gd`, `autoload/scene_manager.gd`, `autoload/audio_manager.gd`
- `ui/debug/setup_check.tscn`, `ui/debug/setup_check.gd`
- `assets/README.md`
- `docs/projekt_stand.md`, `docs/asset_katalog.md`
- `tools/grafik_liste.py`
- Leere Ordner mit `.gitkeep`: `components/`, `entities/player/`, `entities/enemies/`, `entities/npcs/`, `abilities/`, `items/`, `world/`, `levels/test_chamber/`, `data/`

## Offene Punkte

- M0 ist noch nicht in Godot gestartet worden; Claude kann Godot nicht selbst ausführen.
- Die vier Vorschläge unter „Festlegungen“ sind noch nicht bestätigt.
- Grafik-Katalog: Alle Einträge mit ⚠ sind am Bild zu prüfen, zuerst die Reihenfolge der Blickrichtungen und der Aufbau der animierten Hauptfigur.
- Das Grafik-Paket liegt noch nicht im Repo.
