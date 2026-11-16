# TimeTraveller – Projektstand

Diese Datei führt Claude. Sie hält fest, wo das Projekt steht und was im Code existiert.
Nach jedem abgeschlossenen Schritt liefert Claude eine neue, vollständige Fassung.
Sie ersetzt die alte an zwei Orten: im Repo unter `docs/projekt_stand.md` und im Projektwissen des Claude-Projekts.

Der ausführliche Plan steht im Projektdokument: https://claude.ai/artifact/VsJhWxFHsnRPmCMFcH483R
Er ist eine Richtlinie, kein Zwang. Was vorgezogen oder eingeschoben wird, steht unten unter „Außer der Reihe“.

## Stand

| | |
| --- | --- |
| Stand vom | 16.11.2026 |
| In Arbeit | M4 – Zielen & Nahkampf: Dateien geliefert, der Test des Nutzers in Godot steht aus |
| Als Nächstes | M5 – Dash |
| Zuletzt abgeschlossen | M3 – Kamera, am 16.11.2026 |
| Repo | https://github.com/LEJM4/TT – öffentlich, Zweig `main`; dort liegt erst M2, M3 ist noch nicht hochgeladen |

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
| 1 – Spielfigur | M2 Bewegung | fertig |
| | M3 Kamera | fertig |
| | M4 Zielen & Nahkampf | im Test |
| | M5 Dash | als Nächstes |
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
| Sprint und Schleichen | Solange die Taste gehalten wird, kein Umschalten | entschieden am 16.11.2026 |
| Kamera | Bildmitte folgt der Figur auf ganzen Pixeln; Vorausschau ein Stück zur Maus und in Laufrichtung, weich nachgleitend; die Raumgrenzen meldet das Level | entschieden am 16.11.2026; die Werte bleiben einstellbar |
| Pixelraster | „Snap 2D Transforms to Pixel“ ist an: Alles wird auf ganzen Pixeln gezeichnet | entschieden am 16.11.2026 |
| Tod | Vorläufig: Stirbt eine Spielfigur, startet der Raum nach einer Sekunde neu. Die endgültige Regel folgt mit dem Speichern in M16. | vorläufig entschieden am 16.11.2026 |
| Zuschlagen | Die Figur läuft weiter, während sie schlägt. Geschlagen wird stufenlos in Zielrichtung; die vier Blickrichtungen betreffen später nur das Bild. | entschieden am 16.11.2026 |
| Mauszeiger | Im Spielfenster ersetzt ihn das Fadenkreuz | entschieden am 16.11.2026 |

Noch offen laut Plan, jeweils fällig vor dem genannten Modul: Fernkampf-Kosten (M6), Zauber (M7), Tod & Speichern endgültig (M16), Story (Phase 5), Anzahl Level (Phase 6).

## Prüfungen

**M4 – Zielen & Nahkampf**

- Noch nicht getestet. Claude hat die Dateien nur am Text geprüft: Verweise, Knotenpfade, Meldungen, exportierte Werte und Klassennamen.
- Nachgerechnet, nicht ausprobiert: Der Hieb trifft eine anliegende Puppe von allen vier Seiten und schräg; er reicht bis 17 Pixel Lücke zwischen Figur und Puppe; zielt das Fadenkreuz auf die Lücke im Puppenpaar, trifft ein Hieb beide; bei gehaltener Taste fallen 28 Hiebe in 10 Sekunden; das Schadensfeld trifft die Figur alle 0,6 Sekunden.
- Grundlage war Claudes M3-Lieferung, nicht das Repo, weil M3 dort noch fehlt. Die Testkammer-Szene beim Nutzer kann davon um Kennungen abweichen, die Godot beim Speichern vergeben hat; das ZIP ersetzt sie.

**M3 – Kamera**

- Getestet hat der Nutzer am 16.11.2026 in Godot 4.7.2. Alle acht Punkte der Prüfliste sind bestanden: größerer Raum, das Bild wandert mit, kein Zittern und kein Ruckeln beim Laufen, Sprinten und Schleichen, Vorausschau zur Maus, nie Blick über den Raumrand, Neustart, Vorausschau ohne Code abschaltbar, die Kammer läuft ohne `PlayerCamera`.
- Zum Gefühl der Kamera kam keine eigene Rückmeldung; die Startwerte bleiben.
- Claude hat die Dateien nur am Text geprüft. Abgleich mit dem Repo am 16.11.2026, zu Beginn von M4: M3 ist dort noch nicht angekommen, der letzte Commit ist `098b405` (M2). Der Abgleich wird nach dem Push nachgeholt.

**M2 – Bewegung**

- Getestet hat der Nutzer am 16.11.2026 in Godot 4.7.2. Alle neun Punkte der Prüfliste sind bestanden: Figur am Startpunkt, acht Richtungen mit Anlauf und Bremsweg, Kollision und Gleiten, Sprinten mit Ausdauer und Erschöpfung, Schleichen, Tempo ohne Code änderbar, Neustart, Kammer läuft ohne `PlayerSpawner`.
- Claude hat das Repo danach gegengelesen, Stand Commit `098b405`: Zwölf der dreizehn gelieferten Dateien sind unverändert angekommen; die Testkammer-Szene hat Godot neu gespeichert, sie weicht nur um eine Knoten-Kennung ab. Dazu kommen sieben `.gd.uid`-Dateien. Der Commit läuft unter `LEJM4`.

**M1 – Testkammer & Debug**

- Getestet hat der Nutzer am 15.11.2026: alle sieben Punkte bestanden.
- Repo gegengelesen, Stand Commit `62d5811`: alle Dateien wie geliefert.

**M0 – Projekt-Setup**

- Getestet hat der Nutzer am 15.11.2026: alle sechs Punkte bestanden.
- Repo gegengelesen, Stand Commit `8ed9ffb`: 4.374 Dateien, keine unter `.godot/`; Grafik-Paket vollständig laut Katalog, alle 2.104 Importe gültig.

Claude selbst kann Godot nicht starten; der Test des Nutzers ist die einzige echte Prüfung.

## Code-Übersicht

### Projekteinstellungen – `project.godot`

- Spielfläche 480 × 270, Fenster beim Start 1440 × 810
- Streckmodus `viewport` mit ganzzahliger Vergrößerung
- Texturfilter „Nearest“ für scharfe Pixel
- Renderer `gl_compatibility`
- Startszene: die Testkammer `res://levels/test_chamber/test_chamber.tscn`
- Von Godot ergänzt: `config/features=PackedStringArray("4.7")`
- Mit M3 vom Nutzer gesetzt: „Snap 2D Transforms to Pixel“ – alle 2D-Objekte werden auf ganze Pixel gerundet gezeichnet. Im Repo ist das noch nicht zu sehen, weil M3 dort fehlt.
- Bewusst aus: Physik-Interpolation. Bewegung läuft im Takt von 60 Schritten pro Sekunde.

### Globale Dienste (Autoloads)

| Name | Datei | Stand |
| --- | --- | --- |
| `EventBus` | `autoload/event_bus.gd` | aktiv, 4 Meldungen |
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
| `camera_bounds_changed` | `bounds: Rect2` | Ein Level meldet seine Grenzen; Kameras bleiben innerhalb |
| `player_died` | `player_id: int` | Das Leben einer Spielfigur ist auf 0 gefallen; was dann geschieht, entscheidet das Level |

### Debug-Werte, die Module melden

| Schlüssel | Von wem | Inhalt |
| --- | --- | --- |
| `Raumzeit` | Testkammer | Sekunden seit dem Start des Raums |
| `S1 Position` | Spielfigur | Ort in der Welt, gerundet; die Zahl hinter S ist die Spielernummer |
| `S1 Tempo` | Spielfigur | Tempo in Pixeln pro Sekunde und Zustand: Stehen, Laufen, Sprinten, Schleichen |
| `S1 Ausdauer` | Spielfigur | Vorrat und Höchstwert, bei Erschöpfung mit Zusatz |
| `S1 Leben` | Spielfigur | Leben und Höchstwert |
| `Kamera` | Kamera | Bildmitte in der Welt |

Der Hinweis „Neustart: F2“ ist mit M4 entfallen, damit die Anzeige bei zehn Zeilen bleibt; F2 gilt weiter.

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

Genutzt werden bisher: die vier Laufrichtungen, `sprint`, `sneak`, `attack_primary` und die beiden Entwickler-Tasten.

### Kollisions-Ebenen

| Ebene | Name | Wer liegt darauf |
| --- | --- | --- |
| 1 | `world` | Wände und Blöcke der Testkammer |
| 2 | `player` | Spielfigur; ihre Maske ist `world` und `enemy` |
| 3 | `enemy` | Übungspuppen als feste Körper |
| 4 | `player_hurtbox` | `Hurtbox` der Spielfigur; das Schadensfeld sucht hier |
| 5 | `enemy_hurtbox` | `Hurtbox` der Übungspuppen; das Schwert sucht hier |
| 6 | `interactable` | – |
| 7 | `pickup` | – |

Trefferzonen sind `Area2D`: Eine `Hurtbox` liegt auf ihrer Ebene und sucht selbst nichts. Eine `Hitbox` liegt auf keiner Ebene und sucht über ihre Maske.

### Gruppen

| Gruppe | Mitglieder | Wer sie nutzt |
| --- | --- | --- |
| `player_spawn` | Startpunkte im Level (`Marker2D`) | `PlayerSpawner` |
| `players` | jede Spielfigur | `PlayerCamera`; später Gegner und HUD |

### Globale Klassen (`class_name`)

| Klasse | Datei | Art |
| --- | --- | --- |
| `IntentSource` | `entities/intent_source.gd` | Knoten: die Absichten einer Figur – `move_direction`, `wants_sprint`, `wants_sneak`, `aim_direction`, `wants_attack` |
| `MovementStats` | `entities/movement_stats.gd` | Bauplan einer Werte-Datei für Bewegung |
| `Stamina` | `components/stamina/stamina.gd` | Baustein Ausdauer |
| `StaminaStats` | `components/stamina/stamina_stats.gd` | Bauplan einer Werte-Datei für Ausdauer |
| `CameraStats` | `entities/player/camera_stats.gd` | Bauplan einer Werte-Datei für die Kamera |
| `Health` | `components/health/health.gd` | Baustein Leben |
| `HealthStats` | `components/health/health_stats.gd` | Bauplan einer Werte-Datei für Leben |
| `Hurtbox` | `components/hurtbox/hurtbox.gd` | Baustein: nimmt Treffer an |
| `Hitbox` | `components/hitbox/hitbox.gd` | Baustein: teilt Treffer aus |
| `MeleeAttack` | `components/melee_attack/melee_attack.gd` | Baustein Nahkampf-Angriff |
| `MeleeStats` | `components/melee_attack/melee_stats.gd` | Bauplan einer Werte-Datei für einen Nahkampf-Angriff |

### Werte-Dateien – `data/`

| Datei | Bauplan | Werte |
| --- | --- | --- |
| `data/player/movement.tres` | `MovementStats` | `walk_speed` 80, `sprint_speed` 130, `sneak_speed` 40, `acceleration` 600, `friction` 800, `sprint_cost_per_second` 25 |
| `data/player/stamina.tres` | `StaminaStats` | `max_stamina` 100, `regen_per_second` 30, `regen_delay` 0,8, `recover_threshold` 25 |
| `data/player/camera.tres` | `CameraStats` | `mouse_look_factor` 0,15, `mouse_look_max` 40, `move_look_seconds` 0,12, `move_look_max` 24, `smooth_time` 0,2, `min_speed` 24 |
| `data/player/health.tres` | `HealthStats` | `max_health` 100, `invulnerable_time` 0,6 |
| `data/player/sword.tres` | `MeleeStats` | `damage` 10, `start_distance` 6, `reach` 18, `width` 20, `active_time` 0,12, `cooldown` 0,35 |
| `data/dummy/health.tres` | `HealthStats` | `max_health` 50, `invulnerable_time` 0 |

Tempo in Pixeln pro Sekunde, Strecken in Pixeln, Zeiten in Sekunden.

### Bausteine – `components/`

| Baustein | Ordner | Was er tut | Einstellbar |
| --- | --- | --- | --- |
| `PlaceholderView` | `components/placeholder_view/` | Malt die Rechtecke, Kreise und Kapseln der `CollisionShape2D`-Geschwister als Farbfläche. Platzhalter-Grafik bis Gate G2. | `color` |
| `Stamina` | `components/stamina/` | Ausdauer-Vorrat: `spend(amount)` verbraucht und liefert, ob es ging; nach `regen_delay` füllt er sich. Bei 0 gilt `is_exhausted`, bis `recover_threshold` erreicht ist. Meldet `changed`, `exhausted`, `recovered`. | `stats` |
| `Health` | `components/health/` | Leben. `apply_damage(amount)` ist die einzige Stelle, an der über Schaden entschieden wird: Tote und gerade Unverwundbare nehmen keinen. `reset()` füllt auf, auch nach dem Tod. Meldet `changed`, `damaged`, `died`, `revived`. | `stats` |
| `Hurtbox` | `components/hurtbox/` | `Area2D`, die Treffer annimmt und an das Geschwister `Health` weiterreicht: `receive_hit(damage, direction)`. Meldet `hit_received`. Braucht eine eigene `CollisionShape2D`. | Ebene |
| `Hitbox` | `components/hitbox/` | `Area2D`, die jede berührte `Hurtbox` trifft, solange sie scharf ist: `activate()`, `deactivate()`. Meldet `hit_landed`. Braucht eine eigene `CollisionShape2D`. | `damage`, `hit_interval`, `active_on_start`, Maske |
| `MeleeAttack` | `components/melee_attack/` | Nahkampf-Angriff: `try_attack(richtung)` dreht die Trefferzone in die Richtung und macht sie kurz scharf. Zone und Zeiten kommen aus der Werte-Datei. Meldet `attack_started`, `attack_finished`. | `stats`, `target_mask`, `swing_color` |
| `HitFlash` | `components/hit_flash/` | Lässt den Elternknoten bei Schaden hell aufblitzen; solange er unverwundbar ist, blinkt er. Hört auf das Geschwister `Health`. | `flash_time`, `flash_strength`, `blink_while_invulnerable`, `blink_interval`, `blink_alpha` |
| `DamageNumbers` | `components/damage_numbers/` | Zeigt bei Schaden die Zahl über dem Elternknoten; sie steigt auf und verblasst. Hört auf das Geschwister `Health`. | `color`, `font_size`, `outline_size`, `rise_distance`, `duration`, `start_offset` |

Die Bausteine finden das Leben über den Namen: Der Knoten muss genau `Health` heißen und neben ihnen liegen.

### Szenen

| Szene | Skript | Zweck |
| --- | --- | --- |
| `levels/test_chamber/test_chamber.tscn` | `test_chamber.gd` | Testkammer und Startszene |
| `entities/player/player.tscn` | `player.gd` | Spielfigur |
| `entities/player/player_spawner.tscn` | `player_spawner.gd` | erzeugt die Spielfiguren eines Levels |
| `entities/player/player_camera.tscn` | `player_camera.gd` | Kamera, die der Spielfigur folgt |
| `entities/dummy/training_dummy.tscn` | `training_dummy.gd` | Übungspuppe |
| `world/damage_zone/damage_zone.tscn` | keins; die Szene erbt von `hitbox.tscn` | Schadensfeld |
| `ui/crosshair/crosshair.tscn` | `crosshair.gd` | Fadenkreuz |
| `ui/debug/debug_overlay.tscn` | `debug_overlay.gd` | Debug-Anzeige |
| `components/placeholder_view/placeholder_view.tscn` | `placeholder_view.gd` | Baustein, siehe oben |
| `components/stamina/stamina.tscn` | `stamina.gd` | Baustein, siehe oben |
| `components/health/health.tscn` | `health.gd` | Baustein, siehe oben |
| `components/hurtbox/hurtbox.tscn` | `hurtbox.gd` | Baustein, siehe oben |
| `components/hitbox/hitbox.tscn` | `hitbox.gd` | Baustein, siehe oben |
| `components/melee_attack/melee_attack.tscn` | `melee_attack.gd` | Baustein, siehe oben |
| `components/hit_flash/hit_flash.tscn` | `hit_flash.gd` | Baustein, siehe oben |
| `components/damage_numbers/damage_numbers.tscn` | `damage_numbers.gd` | Baustein, siehe oben |
| `ui/debug/setup_check.tscn` | `setup_check.gd` | Setup-Check aus M0; bleibt als Werkzeug |

**Spielfigur im Einzelnen**

- `Player` ist ein `CharacterBody2D` im schwebenden Modus, Ebene `player`, Maske `world` und `enemy`, Gruppe `players`. Körper 12 × 12 Pixel, grüner Platzhalter, weißer Punkt in Blickrichtung.
- Kinder: `CollisionShape2D`, `PlaceholderView`, `PlayerInput` (ein `IntentSource`, läuft vor der Figur), `Stamina`, `Health`, `Hurtbox` (10 × 10 Pixel, Ebene `player_hurtbox`), `HitFlash`, `MeleeAttack` (sucht auf `enemy_hurtbox`).
- Die Figur liest nur Absichten. `PlayerInput` füllt sie aus den Aktionen und aus der Mausposition; später kann eine andere Quelle dasselbe tun.
- Blick und Hieb: Die Figur blickt stufenlos in die Zielrichtung, also zur Maus. Solange `attack_primary` gehalten wird, schlägt sie dorthin. Laufen, Sprinten und Schleichen gehen dabei weiter.
- Zustände: Stehen, Laufen, Sprinten, Schleichen. Schleichen geht vor Sprinten. Sprinten kostet Ausdauer; ohne Vorrat läuft die Figur normal.
- Tod: Fällt das Leben auf 0, bleibt die Figur stehen, wird grau und sendet `player_died`. Was dann geschieht, entscheidet das Level.
- Einstellbar: `stats` (Werte-Datei), `player_id`, `defeated_color`. Ohne `PlayerInput` bleibt sie stehen, ohne `Stamina` sprintet sie unbegrenzt, ohne `Health` nimmt sie keinen Schaden, ohne `Hurtbox` ist sie nicht zu treffen, ohne `MeleeAttack` schlägt sie nicht zu.
- Ein Zustandsautomat als Baustein kommt, sobald sich Zustände gegenseitig ausschließen – voraussichtlich mit dem Dash in M5. In M4 läuft der Hieb neben der Bewegung her und braucht ihn nicht.

**Kampf im Einzelnen**

- Weg eines Treffers: `Hitbox` berührt `Hurtbox` → `Hurtbox.receive_hit()` → `Health.apply_damage()`. Nur `Health` entscheidet, ob und wie viel Schaden ankommt.
- Schwert: Die Trefferzone ist 18 Pixel lang und 20 breit und beginnt 6 Pixel vor der Mitte der Figur. Sie ist 0,12 s scharf; von Hieb zu Hieb vergehen 0,35 s. Ein Hieb trifft jedes Ziel höchstens einmal, kann aber mehrere Ziele treffen.
- Die Trefferzone wird erst einen Physik-Schritt nach Hiebbeginn ausgewertet, weil Godot Berührungen erst dann kennt.
- Unverwundbarkeit: Nach einem Treffer nimmt die Spielfigur 0,6 s lang keinen Schaden. Das steht als `invulnerable_time` in ihrer Werte-Datei und gilt für jede Schadensquelle.
- Übungspuppe: fester Körper auf Ebene `enemy`, 12 × 12 Pixel, 50 Leben, violett. Bei 0 wird sie grau und steht nach `revive_delay` (2 s) mit vollem Leben wieder auf. Einstellbar: `revive_delay`, `alive_color`, `defeated_color`.
- Schadensfeld: 48 × 48 Pixel, 10 Schaden, sucht auf `player_hurtbox`. Es versucht alle 0,5 s zu treffen; wegen der Unverwundbarkeit kommt der Schaden alle 0,6 s an.
- Fadenkreuz: `CanvasLayer` auf Ebene 110, also über allem. Es versteckt den Mauszeiger im Spielfenster und läuft auch bei pausiertem Spiel. Einstellbar: `color`, `arm_length`, `gap`, `hide_system_cursor`.

**PlayerSpawner im Einzelnen**

- Setzt je Spieler eine Figur auf einen Startpunkt der Gruppe `player_spawn`; die Figuren hängen als Kinder am Spawner und heißen `Player1`, `Player2` …
- Einstellbar: `player_scene`, `player_count` (1 bis 4; mehr als 1 nur zum Testen, alle folgen denselben Tasten).

**Kamera im Einzelnen**

- `PlayerCamera` ist eine `Camera2D`, die nach allen Figuren rechnet. Sie sucht in der Gruppe `players` die Figur mit `follow_player_id`.
- Bildmitte = gerundeter Ort der Figur + gerundeter Versatz. Der Versatz zeigt ein Stück zur Maus und in Laufrichtung und gleitet seinem Ziel nach.
- Die Grenzen kommen über `camera_bounds_changed`; ist der Raum kleiner als das Bild, steht er mittig.
- Einstellbar: `stats` (Werte-Datei), `follow_player_id`.

**Testkammer im Einzelnen**

- Größe seit M3: 960 × 544 Pixel, also 60 × 34 Kacheln. Freie Fläche innen: x 16 bis 944, y 16 bis 528.
- Wurzel `TestChamber` malt Boden, Raster und Kreuze an den Startpunkten und meldet Grenzen und Raumzeit. Auf `player_died` startet sie den Raum nach `death_restart_delay` neu. Einstellbar: `room_size`, `cell_size`, `show_grid`, `death_restart_delay` (1 s), drei Farben.
- `Walls` und `Blocks` sind je ein `StaticBody2D` auf Ebene `world`; jede Wand und jeder Block ist eine `CollisionShape2D` mit eigenem Rechteck.
- Blöcke, linke obere Ecke und Größe: `Square` (160, 64) 32 × 32; `Pillar` (352, 64) 16 × 64; `Bar` (96, 192) 64 × 16; `GateTop` (336, 176) und `GateBottom` (336, 224) je 48 × 16 mit 32 Pixeln Durchgang; `BigSquare` (640, 128) 64 × 64; `LongBar` (560, 400) 160 × 16; `PillarB` (848, 240) 16 × 96; `SquareB` (288, 368) 32 × 32; `SquareC` (784, 80) 32 × 32.
- `SpawnPoints` enthält `Spawn1` bei (216, 136) und `Spawn2` bei (264, 136).
- Übungspuppen, jeweils die Mitte: `DummyA` bei (440, 72) steht allein; `DummyB` bei (430, 144) und `DummyC` bei (450, 144) bilden ein Paar mit 8 Pixeln Lücke.
- Schadensfeld `DamageZone`: Mitte bei (240, 240).
- Die Puppen, `DamageZone`, `PlayerSpawner`, `PlayerCamera`, `Crosshair` und `DebugOverlay` sind eingehängt und lassen sich einzeln löschen.
- F2 und der Tod einer Figur laden die Szene neu, direkt in `test_chamber.gd`. Ab M18 übernimmt das der `SceneManager`.

**Debug-Anzeige im Einzelnen**

- `CanvasLayer` auf Ebene 100, läuft auch bei pausiertem Spiel. Zeigt FPS, Mausposition im Bild, gedrückte Aktionen und alle gemeldeten Werte.
- Einstellbar: `refresh_interval` (0,1 s), `font_size` (12), `visible_on_start`.
- Im Editor zeigt die Testkammer nur die blauen Kollisionsflächen; Farben, Raster und Anzeige erscheinen erst im laufenden Spiel.

### Dateien je Modul

**M4 – Zielen & Nahkampf**

- Neu, Bausteine: `components/health/` mit `health.tscn`, `health.gd`, `health_stats.gd`; `components/hurtbox/` mit `hurtbox.tscn`, `hurtbox.gd`; `components/hitbox/` mit `hitbox.tscn`, `hitbox.gd`; `components/melee_attack/` mit `melee_attack.tscn`, `melee_attack.gd`, `melee_stats.gd`; `components/hit_flash/` mit `hit_flash.tscn`, `hit_flash.gd`; `components/damage_numbers/` mit `damage_numbers.tscn`, `damage_numbers.gd`
- Neu: `entities/dummy/training_dummy.tscn`, `training_dummy.gd`; `world/damage_zone/damage_zone.tscn`; `ui/crosshair/crosshair.tscn`, `crosshair.gd`
- Neu: `data/player/health.tres`, `data/player/sword.tres`, `data/dummy/health.tres`
- Geändert: `entities/intent_source.gd` (Zielrichtung und Angriffswunsch), `entities/player/player_input.gd` (liest Maus und Linksklick), `entities/player/player.gd` (Blick zur Maus, Hieb, Tod), `entities/player/player.tscn` (vier Bausteine dazu, Maske)
- Geändert: `autoload/event_bus.gd` (eine Meldung dazu), `levels/test_chamber/test_chamber.gd` (Neustart beim Tod), `levels/test_chamber/test_chamber.tscn` (drei Puppen, Schadensfeld, Fadenkreuz)
- Geändert: `docs/projekt_stand.md`

**M3 – Kamera**

- Neu: `entities/player/player_camera.tscn`, `entities/player/player_camera.gd`, `entities/player/camera_stats.gd`, `data/player/camera.tres`
- Geändert: `autoload/event_bus.gd` (eine Meldung dazu), `levels/test_chamber/test_chamber.gd` (meldet die Grenzen), `levels/test_chamber/test_chamber.tscn` (größerer Raum, fünf Blöcke, Kamera)
- Geändert: `docs/projekt_stand.md`

**M2 – Bewegung**

- Neu: `entities/player/player.tscn`, `player.gd`, `player_input.gd`, `player_spawner.tscn`, `player_spawner.gd`
- Neu: `entities/intent_source.gd`, `entities/movement_stats.gd`
- Neu: `components/stamina/stamina.tscn`, `stamina.gd`, `stamina_stats.gd`
- Neu: `data/player/movement.tres`, `data/player/stamina.tres`
- Geändert: `levels/test_chamber/test_chamber.tscn` (Knoten `PlayerSpawner`)

**M1 – Testkammer & Debug**

- Neu: `levels/test_chamber/test_chamber.tscn`, `test_chamber.gd`; `ui/debug/debug_overlay.tscn`, `debug_overlay.gd`; `components/placeholder_view/placeholder_view.tscn`, `placeholder_view.gd`
- Geändert: `autoload/event_bus.gd`, `autoload/input_setup.gd`, `README.md`

**M0 – Projekt-Setup**

- `project.godot`, `icon.svg`, `.gitignore`, `.gitattributes`, `README.md`, sechs Skripte unter `autoload/`, `ui/debug/setup_check.tscn` und `.gd`
- `assets/README.md`, `assets/ninja_adventure/`, `docs/`, `tools/grafik_liste.py`, leere Ordner mit `.gitkeep`

Zu jedem Skript legt Godot eine `.gd.uid`-Datei an, zu jeder Grafik und jedem Ton eine `.import`-Datei. Beide gehören ins Repo.

## Grafik-Paket im Repo

- Ablage: `assets/ninja_adventure/`; Einzelheiten stehen in `docs/asset_katalog.md`.
- Umfang, am Repo gezählt: 2.234 Dateien – 1.915 PNG, 128 GIF, 147 WAV, 41 OGG, 1 TTF, dazu `LICENSE.txt` und die `README.md` des Pakets. Das deckt sich mit dem Katalog.
- Godot hat 2.104 `.import`-Dateien angelegt. Lizenz: CC0 1.0.
- Im Stamm des Pakets liegen Dateien, die der Katalog noch nicht führt: `Example 1.gif` bis `Example 4.gif`, `Example 5 ( Old Version).png`, `preview-part-1.png`, `preview-part-2.png`, `MusicCover.png`, `Palette.png`.
- In `Actor/Character/` liegen lose `Shadow.png`, `AllPreview.png` und `AllPreview2.png`; auch sie fehlen im Katalog.

## M4 im Test – Prüfliste

Bestätigt am 16.11.2026 samt der drei Entscheidungen: Neustart beim Tod, Laufen beim Zuschlagen, Fadenkreuz statt Mauszeiger.

1. Godot zeigt nach dem Einlesen keine roten Fehler.
2. F5: Rechts im Bild stehen drei violette Puppen, unten in der Mitte liegt ein rotes Feld; die Anzeige zeigt „S1 Leben: 100 / 100“.
3. Statt des Mauszeigers ist im Spielfenster ein weißes Fadenkreuz zu sehen. Der weiße Punkt an der Figur zeigt immer dorthin, auch beim Laufen in eine andere Richtung.
4. Linksklick: Vor der Figur blitzt in Zielrichtung kurz eine helle Fläche auf. Bei gehaltener Taste folgen knapp drei Hiebe pro Sekunde; Laufen und Sprinten gehen dabei weiter.
5. Einzelne Puppe: je ein Hieb von links, rechts, oben und unten – jedes Mal blitzt sie auf und eine „10“ steigt auf. Aus zwei Kacheln Abstand trifft der Hieb nicht.
6. Der fünfte Treffer, diesmal schräg, macht die Puppe grau; weitere Hiebe wirken nicht. Nach 2 Sekunden ist sie wieder violett.
7. Puppenpaar: Fadenkreuz auf die Lücke zwischen beiden, ein Hieb – beide zeigen „10“.
8. Rotes Feld: „S1 Leben“ sinkt etwa alle 0,6 Sekunden um 10, die Figur blitzt und blinkt. Bei 0 wird sie grau und bleibt stehen; nach 1 Sekunde startet der Raum neu mit 100 / 100.
9. Ohne Code: `Damage` in `data/player/sword.tres` auf 25 stellen – die Puppe zeigt „25“ und wird nach zwei Treffern grau; danach zurück auf 10.
10. Abschalt-Test: Ohne den Knoten `Crosshair` erscheint der normale Mauszeiger, alles andere läuft, keine roten Fehler.

## Ausblick auf M5 – Dash

Laut Plan: Ausweichen, kurze Unverwundbarkeit, Abklingzeit. Fertig, wenn der Dash im Schadensfeld schützt und kein Dauer-Dash möglich ist.

Vorbereitet ist: Die Aktion `dash` liegt auf Leertaste und Maustaste 4; `Health` kennt Unverwundbarkeit; das Schadensfeld steht in der Testkammer. Voraussichtlich kommt mit M5 der Zustandsautomat als Baustein, falls der Dash Laufen und Zuschlagen unterbricht.

## Hinweise aus der bisherigen Arbeit

- Vor jedem Push in GitHub Desktop unter „History“ prüfen, dass beim neuen Commit `LEJM4` steht.
- Beim Kopieren eines Projektordners nie den Ordner `.git` mitnehmen.
- `.godot/` gehört nicht ins Repo und steht in der `.gitignore`.
- Neue Dateien spielt der Nutzer per ZIP ein: „Alle extrahieren“ mit Ziel `E:\GitHub\TT`, vorhandene Dateien ersetzen.
- Ersetzt ein ZIP eine vorhandene Szene, muss Godot vorher geschlossen sein. Sonst kann Godot die Änderung überschreiben.
- Szenen, die Godot schon gespeichert hat, ändert Claude nur auf Grundlage der Fassung im Repo, damit Kennungen erhalten bleiben.
- Godot 4.7 schreibt Szenen ohne `load_steps` und mit `unique_id` je Knoten; handgeschriebene Szenen ohne beides lädt es problemlos.
- Nach jedem bestandenen Test committen und pushen, bevor das nächste Modul eingespielt wird. Sonst kann Claude den Stand nicht im Repo nachlesen und baut auf der eigenen Lieferung auf.
- In `hitbox.tscn`, `hurtbox.tscn` und `melee_attack.tscn` zeigt der Editor ein gelbes Warndreieck, weil dort keine Form liegt. Das ist gewollt: Die Form kommt beim Einhängen dazu, beim Schwert beim Start aus der Werte-Datei.

## Offene Punkte

- M4 ist geliefert, der Test steht aus.
- M3 ist noch nicht im Repo. Der Nutzer committet es als `M03: Kamera` und pusht; danach gleicht Claude M3 ab.
- Tod & Speichern: Der Neustart des Raums ist vorläufig. Was beim Tod verloren geht und wo gespeichert wird, ist vor M16 zu entscheiden.
- Stottert die Bewegung auf einem Monitor mit mehr als 60 Hz, gibt es dafür die Physik-Interpolation als Projekteinstellung. Sie ist bewusst noch aus.
- Der Repo-Link ist in die Projektanweisungen einzutragen, falls dort noch der Platzhalter steht.
- Der Sicherungsordner `E:\GitHub\TT_alt` kann gelöscht werden, falls er noch existiert.
- Grafik-Katalog: Alle Einträge mit ⚠ sind am Bild zu prüfen, zuerst die Reihenfolge der Blickrichtungen und der Aufbau der animierten Hauptfigur. Claude kann die Bilder selbst im Repo ansehen. Fällig, bevor echte Grafik eingebaut wird.
- Grafik-Katalog: die losen Dateien im Stamm des Pakets und in `Actor/Character/` nachtragen.
- In `components/`, `levels/test_chamber/`, `entities/player/` und `data/` liegt noch je eine `.gitkeep`, die nicht mehr gebraucht wird.
