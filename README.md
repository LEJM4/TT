# TimeTraveller

2D-Action-RPG über einen Zeitreisenden, gebaut mit Godot 4 – Modul für Modul.

- Wo das Projekt steht und was im Code existiert: `docs/projekt_stand.md`
- Der ausführliche Plan als Richtlinie: https://claude.ai/artifact/VsJhWxFHsnRPmCMFcH483R

## Öffnen

1. Godot 4.7 starten, im Projektmanager „Importieren“ wählen und diesen Ordner angeben.
2. F5 startet die Testkammer – den Raum, in dem jede Mechanik zuerst ausprobiert wird.

## Ordner

| Ordner | Inhalt |
| --- | --- |
| `autoload/` | Globale Dienste: EventBus, Tastenbelegung, Spielstand, Szenenwechsel, Ton |
| `components/` | Bausteine für alle: Bild, Effekte, Leben, Trefferzonen, Angriffe, Dash, Vorräte, Inventar, Geschoss-Wahl; später Zustandsautomat, Interaktion |
| `entities/` | Figuren und Bewegliches: `player/`, `dummy/`, `projectile/`, `effect/`; später `enemies/`, `npcs/` |
| `abilities/` | Fähigkeiten: Schnelligkeit, Unsichtbarkeit, Stun; der Dash ist ein Baustein in `components/dash/` |
| `items/` | Baupläne für Gegenstände und Geschosse; die Gegenstände selbst liegen in `data/items/`; später Beutetabellen |
| `world/` | Truhen, Türen, Hebel, Zerstörbares |
| `levels/` | `test_chamber/`, später die Level und die Zeitkapsel |
| `ui/` | HUD, Inventar, Dialog, Menüs; `ui/debug/` für Entwickler-Anzeigen |
| `data/` | Werte-Dateien (`.tres`): Balancing, Skins, Gegenstände, Effekte |
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
| Esc | `pause` |

**Entwickler-Tasten**

| Eingabe | Aktion im Code | Wirkung |
| --- | --- | --- |
| F1 | `debug_toggle_overlay` | Debug-Anzeige ein- und ausblenden |
| F2 | `debug_restart_room` | Raum neu starten |

## Regeln

- Ein Modul ist ein Ordner mit eigener Szene und eigenem Skript.
- Module kennen sich nicht direkt; Übergreifendes läuft über den EventBus.
- Zahlenwerte stehen in Werte-Dateien, nicht im Code.
- Jedes Modul lässt sich abschalten, ohne dass der Rest abstürzt.
- Dateinamen und Code sind englisch, Texte im Spiel deutsch.
