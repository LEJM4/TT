# TimeTraveller – Projektstand

Diese Datei führt Claude. Sie hält fest, wo das Projekt steht und was im Code existiert.
Nach jedem abgeschlossenen Schritt liefert Claude eine neue, vollständige Fassung.
Sie ersetzt die alte an zwei Orten: im Repo unter `docs/projekt_stand.md` und im Projektwissen des Claude-Projekts.

Der ausführliche Plan steht im Projektdokument: https://claude.ai/artifact/VsJhWxFHsnRPmCMFcH483R – der Grafik-Plan dort im Tab „Grafik & Assets“.
Er ist eine Richtlinie, kein Zwang. Was vorgezogen oder eingeschoben wird, steht unten unter „Außer der Reihe“.

## Stand

| | |
| --- | --- |
| Stand vom | 17.11.2026 |
| In Arbeit | Grafik & Assets, Schritt A0 – Sichtung & Auswahl: Der Plan steht im Plan-Dokument im Tab „Grafik & Assets“; die Antworten des Nutzers auf die vier Entscheidungen E1 bis E4 stehen aus |
| Als Nächstes | A1 – Figuren-Bild, danach A2 – Kampf-Bilder und A3 – Ton; dann Gate G1 und Phase 2 mit M8 – Interaktion |
| Zuletzt abgeschlossen | M7 – Fähigkeiten, am 16.11.2026; damit ist Phase 1 gebaut |
| Repo | https://github.com/LEJM4/TT – öffentlich, Zweig `main`; zuletzt gelesen am 16.11.2026 vor M4, damals lag dort M2 (Commit `098b405`). M3 bis M7 hat der Nutzer lokal eingespielt und getestet; ob sie hochgeladen sind, hat Claude seither nicht geprüft |

## Übergabe an einen neuen Chat

Der Chat vom 15. bis 17.11.2026 endet hier. Ein neuer Chat hat keine Kopie der bisherigen Lieferungen: Er kennt nur diese Datei, den Grafik-Katalog, das Plan-Dokument und das Repo.

**Vorher erledigt der Nutzer**

1. Das ZIP `uebergabe_grafikplan.zip` nach `E:\GitHub\TT` entpacken; es ersetzt `docs/projekt_stand.md` und `docs/asset_katalog.md`.
2. In GitHub Desktop alles committen und hochladen, was seit M2 dazugekommen ist: M3 bis M7 und die beiden Dateien unter `docs/`. Vor dem Push unter „History“ prüfen, dass beim Commit `LEJM4` steht.
3. In den Projektanweisungen zwei Stellen ändern, Text unten.
4. Im Projekt „TimeTraveller“ einen neuen Chat beginnen, mit dem Startsatz unten.

Im Projektwissen liegen beide Dateien schon in der neuen Fassung; dort ist nichts zu tun.

**Text für die Projektanweisungen**

- Unter „Wo alles steht“, Punkt 2: den Platzhalter `[LINK EINTRAGEN, SOBALD ANGELEGT]` durch `https://github.com/LEJM4/TT` ersetzen.
- Unter „Arbeitsweise“ den Satz „Liefere jede neue oder geänderte Datei einzeln und vollständig, mit ihrem Pfad im Projekt. Ich lege sie ab und lade sie hoch.“ ersetzen durch: „Liefere alle neuen oder geänderten Dateien zusammen als ein ZIP mit ihren Pfaden im Projekt. Ich entpacke es nach E:\GitHub\TT und lade es hoch.“

**Startsatz für den neuen Chat**

> Lies projekt_stand.md und im Plan-Dokument den Tab „Grafik & Assets“. E1 bis E4: alle vier ok. Dann weiter mit A1.

Wer bei einer Entscheidung etwas anderes will, schreibt das statt „alle vier ok“.

**Was der neue Chat zuerst tut**

1. Diese Datei lesen, dann im Plan-Dokument den Tab „Grafik & Assets“.
2. Das Repo klonen und den Code lesen. Fehlen dort M3 bis M7, bittet Claude den Nutzer, sie hochzuladen, statt sie aus dieser Datei nachzubauen.
3. Die Antworten auf E1 bis E4 in Plan-Dokument und Stand-Datei eintragen.
4. A1 – Figuren-Bild bauen, wie jede Mechanik zuerst in der Testkammer.

**Arbeitsweise, wie der Nutzer sie zuletzt wollte**

- Antworten kurz und auf Deutsch, das Ergebnis zuerst.
- Code kommt als ein ZIP mit Projektpfaden, im Chat dazu nur eine Zeile. Die Prüfliste steht im Plan-Dokument bei den nächsten Schritten und in dieser Datei, nicht im Chat.
- Kein Abgleich mit dem Repo vor jedem Modul. Zu Beginn eines neuen Chats liest Claude das Repo trotzdem einmal, weil es sonst keine Kopie des Codes gibt.
- Auf „weiter“ geht es mit dem nächsten Schritt weiter.
- Nach jedem abgeschlossenen Schritt: eine neue, vollständige Stand-Datei, ins Projektwissen geschrieben und im ZIP unter `docs/`; im Plan-Dokument Status, Prüfliste, nächste Schritte und Verlauf nachziehen.

## Arbeitsumgebung

| | |
| --- | --- |
| Godot | 4.7.2 stable, Windows 64-Bit, Standard-Version (GDScript) |
| Lokaler Projektordner | `E:\GitHub\TT` |
| Git-Werkzeug | GitHub Desktop |
| Commit-Identität | `LEJM4` mit der privaten GitHub-Adresse (`…@users.noreply.github.com`) |
| So liest Claude das Repo | per `git clone` über den Link, nur lesend – Dateien wörtlich, Grafiken als Bild |
| So liefert Claude Dateien | als ZIP zum Entpacken nach `E:\GitHub\TT`; bis M4 zusätzlich jede Datei einzeln, seit M5 auf Wunsch des Nutzers nur das ZIP |

## Fahrplan in Kurzform

Status: offen · als Nächstes · in Arbeit · im Test · fertig

| Phase | Modul | Status |
| --- | --- | --- |
| 0 – Fundament | M0 Projekt-Setup | fertig |
| | M1 Testkammer & Debug | fertig |
| 1 – Spielfigur | M2 Bewegung | fertig |
| | M3 Kamera | fertig |
| | M4 Zielen & Nahkampf | fertig |
| | M5 Dash | fertig |
| | M6 Fernkampf | fertig |
| | M7 Fähigkeiten | fertig |
| 2 – Welt & Interaktion | M8 Interaktion | als Nächstes |
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

**Grafik & Assets** – eingeschoben am 16.11.2026; der Plan steht im Tab „Grafik & Assets“ des Plan-Dokuments

| Schritt | Inhalt | Wann | Status |
| --- | --- | --- | --- |
| A0 Sichtung & Auswahl | Katalog am Bild prüfen; Grafiken, Kacheln, Effekte und Töne für die Testkammer auswählen | jetzt | in Arbeit, wartet auf E1 bis E4 |
| A1 Figuren-Bild | Baustein `CharacterView`, Skins als Werte-Dateien, Spielfigur mit Stehen, Laufen, Rolle, Treffer und Tod in vier Richtungen, Schatten, Bild der Übungspuppen | vor Phase 2 | als Nächstes |
| A2 Kampf-Bilder | Hieb-Effekt, Pfeil, Effekte für Treffer, Tod und Stun; Baustein `EffectCue`; Pixel-Schrift für Schadenszahlen | vor Phase 2 | offen |
| A3 Ton | `AudioManager` füllen, Baustein `SoundCue`, Ton-Tabelle als Werte-Datei, Musik in der Testkammer | vor Phase 2 | offen |
| A4 Kacheln & Räume | Kachel-Sets mit Kollision, Testkammer mit Kacheln, Anleitung zum Malen im Editor | mit M8, spätestens vor Level 1 | offen |
| A5 Oberfläche | Schrift und Thema, Herzen, Leisten, Fähigkeits- und Tastensymbole, Dialogfeld | mit M11, M12, M15 und M20 | offen |
| A6 Gegner, NPCs, Bosse | Skins für Monster, einfache Figuren und Bosse | mit M13 bis M15 | offen |

Ab A1 bringt jedes neue Modul Bild und Ton gleich mit: M8 aus `TilesetDungeon`, M9 aus `TilesetElement`, M10 aus `Items/Treasure`.

**Gates**

- G1 nach Phase 1: Die Spielfigur fühlt sich gut an – Bewegen, Zielen, Zuschlagen, Ausweichen.
- G2 nach Phase 4: Alle Mechaniken laufen in der Testkammer zusammen, auch nach Speichern und Laden.
- G3 nach Phase 5: Level 1 ist vom Start bis zur Zeitkapsel durchspielbar.

## Außer der Reihe

Hier steht, was vorgezogen, eingeschoben oder neu gewünscht wurde.

| Datum | Was | Status |
| --- | --- | --- |
| 15.11.2026 | Commits laufen unter `LEJM4` mit privater GitHub-Adresse. Dafür wurde das Repo neu angelegt; die erste Historie ist gelöscht. | erledigt |
| 16.11.2026 | Wunsch des Nutzers nach dem Test von M4: nichts mit dem Repo abgleichen, nur programmieren, nur das ZIP liefern. M4 wurde deshalb ohne eigenen Abschluss-Schritt abgeschlossen und M5 ohne vorherigen Vorschlag gebaut. Der Nutzer hat das bis M7 beibehalten; es gilt, bis er etwas anderes sagt. | gilt weiter |
| 16.11.2026 | Auf „weiter“ direkt nach der Lieferung von M5 hat Claude M6 gebaut, ohne dass ein Testergebnis zu M5 vorlag, wieder ohne Abgleich und nur als ZIP. Das ZIP zu M6 enthält deshalb auch alle Dateien von M5. | so umgesetzt |
| 16.11.2026 | Auf „Ja alles passt -> weiter“ hat Claude M7 gebaut, wieder ohne Abgleich und nur als ZIP. Die Entscheidung zu Zaubern hat Claude vorläufig selbst getroffen. | so umgesetzt |
| 16./17.11.2026 | Nach dem Test von M7 wollte der Nutzer zuerst einen Plan für Grafik und Assets, ohne Code. Er steht im Plan-Dokument im Tab „Grafik & Assets“: Schritte A0 bis A6, Regeln zur Einbindung, Auswahl der Grafiken und vier Entscheidungen. Vorschlag: A1 bis A3 vor Phase 2. | Plan fertig, Entscheidungen offen |

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
| Dash | In Laufrichtung, im Stehen in Blickrichtung; währenddessen unverwundbar und nicht lenkbar; neue Hiebe erst danach; begrenzt durch eine Abklingzeit, ohne Ausdauer-Kosten | von Claude gewählt; vom Nutzer nach dem Test am 16.11.2026 mit „Ja alles passt“ bestätigt |
| Fernkampf | Rechtsklick schießt in Zielrichtung, gehalten zwei Schüsse pro Sekunde; ein Geschoss fliegt geradeaus, trifft genau ein Ziel und endet an Wänden und Blöcken; während des Dashs fällt kein Schuss | von Claude gewählt; vom Nutzer nach dem Test am 16.11.2026 mit „Ja alles passt“ bestätigt |
| Fernkampf-Kosten | Munition: 12 Schuss, jeder Schuss kostet 1, nichts kommt von selbst nach. Nachschub folgt mit Truhen und Beute in M10. | von Claude vorgeschlagen; vom Nutzer am 16.11.2026 mit „Ja alles passt“ bestätigt |
| Fähigkeiten | Drei Plätze auf den Tasten 1, 2 und 3: Schnelligkeit, Unsichtbarkeit, Stun. Jede kostet Energie, wirkt eine Dauer lang und hat danach eine Abklingzeit. Der Platz unter dem Knoten `Abilities` bestimmt die Taste. | von Claude gewählt; vom Nutzer nach dem Test am 16.11.2026 mit „Ja alles funktioniert“ bestätigt |
| Energie | 100 Punkte, eine Leiste für alle Fähigkeiten. Sie füllt sich nicht von selbst, sondern laut Konzept durch Treffer: jeder Schwerttreffer bringt 10. Fläschchen und Speicherpunkte folgen später. | laut Konzept; die Zahlen hat Claude gewählt |
| Zauber | Keine eigene Kategorie: Ein Zauber ist eine Fähigkeit wie jede andere, mit demselben Baustein und derselben Energie | vorläufig von Claude gewählt am 16.11.2026; die Entscheidung liegt beim Nutzer |
| Grafik einbinden | Eigene Schicht über der Mechanik: je Figur ein Bild-Baustein `CharacterView` statt `PlaceholderView`; Effekte und Töne als Zusatz-Bausteine `EffectCue` und `SoundCue`, die auf Signale reagieren; welche Grafik, steht als Skin in einer Werte-Datei; das Paket bleibt unverändert | von Claude vorgeschlagen am 17.11.2026 im Grafik-Plan |
| E1 Spielfigur | Die animierte `NinjaGreen`, 32 × 32 je Bild, mit eigener Rolle für den Dash und Treffer-Animation; die 16er-Figuren werden NPCs und Gegner | Vorschlag, Antwort des Nutzers offen |
| E2 Reihenfolge | A1 bis A3 vor Phase 2; danach bringt jedes Modul Bild und Ton gleich mit | Vorschlag, Antwort des Nutzers offen |
| E3 Räume malen | Der Nutzer malt im Godot-Editor; Claude liefert Kachel-Sets mit Kollision und eine Anleitung; den Boden der Testkammer füllt Code | Vorschlag, Antwort des Nutzers offen |
| E4 Schrift | `NormalFont` aus dem Paket; ihr fehlt das ß, im Spiel steht dafür „ss“ | Vorschlag, Antwort des Nutzers offen |

Noch offen, jeweils fällig vor dem genannten Schritt: Grafik E1 bis E4 (A1), Zauber (vorläufig gewählt, siehe oben), Tod & Speichern endgültig (M16), Story (Phase 5), Anzahl Level (Phase 6).

## Prüfungen

**M7 – Fähigkeiten**

- Getestet hat der Nutzer am 16.11.2026 in Godot. Rückmeldung: „Ja alles funktioniert“ – die zehn Punkte der Prüfliste gelten als bestanden.
- Claude hat die Dateien nur am Text geprüft: Verweise, Knotenpfade, Meldungen, exportierte Werte, Klassennamen und alle Aufrufe zwischen den Bausteinen.
- Grundlage waren Claudes Lieferungen zu M5 und M6. Kein Abgleich mit dem Repo.

**M6 – Fernkampf**

- Getestet hat der Nutzer am 16.11.2026 in Godot. Rückmeldung: „Ja alles passt“ – die neun Punkte der Prüfliste gelten als bestanden.
- Claude hat die Dateien nur am Text geprüft: Verweise, Knotenpfade, Meldungen, exportierte Werte und Klassennamen.
- Nachgerechnet, nicht ausprobiert: Ein Geschoss legt je Physik-Schritt 3,7 Pixel zurück und überdeckt eine Puppe rund fünf Schritte lang; die Hitbox prüft in jedem Schritt, ein Durchfliegen ohne Treffer ist so nicht möglich. Die Reichweite von 240 Pixeln entspricht 15 Kacheln und gut einer Sekunde Flug.
- Grundlage war Claudes M5-Lieferung. Kein Abgleich mit dem Repo.

**M5 – Dash**

- Getestet hat der Nutzer am 16.11.2026 in Godot, zusammen mit M6. Rückmeldung: „Ja alles passt“ – die neun Punkte der Prüfliste gelten als bestanden.
- Claude hat die Dateien nur am Text geprüft: Verweise, Knotenpfade, Meldungen, exportierte Werte und Klassennamen.
- Nachgerechnet, nicht ausprobiert: Ein Dash dauert 12 Physik-Schritte und legt genau 64 Pixel zurück. Der Dash durch den Schadensstreifen bleibt ohne Schaden, wenn die Mitte der Figur beim Start 5 bis 43 Pixel vor dem Streifen steht; wer den Streifen vorher berührt, wird getroffen.
- Grundlage war Claudes M4-Lieferung. Auf Wunsch des Nutzers gab es keinen Abgleich mit dem Repo.

**M4 – Zielen & Nahkampf**

- Getestet hat der Nutzer am 16.11.2026 in Godot. Rückmeldung: „Alles passt“ – die zehn Punkte der Prüfliste gelten als bestanden.
- Claude hat die Dateien nur am Text geprüft. Grundlage war Claudes M3-Lieferung, weil M3 damals im Repo fehlte. Ein Abgleich mit dem Repo steht aus; der Nutzer hat ihn vorerst abbestellt.

**M3 – Kamera**

- Getestet hat der Nutzer am 16.11.2026 in Godot 4.7.2. Alle acht Punkte der Prüfliste sind bestanden: größerer Raum, das Bild wandert mit, kein Zittern und kein Ruckeln beim Laufen, Sprinten und Schleichen, Vorausschau zur Maus, nie Blick über den Raumrand, Neustart, Vorausschau ohne Code abschaltbar, die Kammer läuft ohne `PlayerCamera`.
- Zum Gefühl der Kamera kam keine eigene Rückmeldung; die Startwerte bleiben.
- Claude hat die Dateien nur am Text geprüft. Abgleich mit dem Repo am 16.11.2026, zu Beginn von M4: M3 ist dort noch nicht angekommen, der letzte Commit war `098b405` (M2). Der Abgleich steht aus; der Nutzer hat ihn vorerst abbestellt.

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
- Mit M3 vom Nutzer gesetzt: „Snap 2D Transforms to Pixel“ – alle 2D-Objekte werden auf ganze Pixel gerundet gezeichnet. Im Repo war das am 16.11.2026 noch nicht zu sehen, weil M3 dort fehlte.
- Bewusst aus: Physik-Interpolation. Bewegung läuft im Takt von 60 Schritten pro Sekunde.

### Globale Dienste (Autoloads)

| Name | Datei | Stand |
| --- | --- | --- |
| `EventBus` | `autoload/event_bus.gd` | aktiv, 5 Meldungen |
| `InputSetup` | `autoload/input_setup.gd` | aktiv; legt die Aktionen an, `all_actions()` liefert ihre Namen |
| `GameState` | `autoload/game_state.gd` | leer, wird in M16 und M19 gefüllt |
| `SaveManager` | `autoload/save_manager.gd` | leer, wird in M16 gefüllt |
| `SceneManager` | `autoload/scene_manager.gd` | leer, wird in M18 gefüllt |
| `AudioManager` | `autoload/audio_manager.gd` | leer, wird mit A3 – Ton gefüllt |

### Meldungen im EventBus

| Meldung | Werte | Zweck |
| --- | --- | --- |
| `setup_checked` | `source: String` | Testmeldung für den Setup-Check in M0 |
| `debug_value_changed` | `key: String`, `value: String` | Ein Modul meldet einen Wert für die Debug-Anzeige; ein leerer Wert entfernt den Eintrag |
| `camera_bounds_changed` | `bounds: Rect2` | Ein Level meldet seine Grenzen; Kameras bleiben innerhalb |
| `player_died` | `player_id: int` | Das Leben einer Spielfigur ist auf 0 gefallen; was dann geschieht, entscheidet das Level |
| `projectile_requested` | `scene: PackedScene`, `origin: Vector2`, `direction: Vector2`, `stats: Resource`, `target_mask: int` | Jemand schießt; der `ProjectileSpawner` des Levels erzeugt das Geschoss. `stats` ist ein `RangedStats` |

### Debug-Werte, die Module melden

| Schlüssel | Von wem | Inhalt |
| --- | --- | --- |
| `Raumzeit` | Testkammer | Sekunden seit dem Start des Raums |
| `S1 Position` | Spielfigur | Ort in der Welt, gerundet; die Zahl hinter S ist die Spielernummer |
| `S1 Tempo` | Spielfigur | Tempo in Pixeln pro Sekunde und Zustand: Stehen, Laufen, Sprinten, Schleichen |
| `S1 Ausdauer` | Spielfigur | Vorrat und Höchstwert, bei Erschöpfung mit Zusatz |
| `S1 Leben` | Spielfigur | Leben und Höchstwert |
| `S1 Dash` | Spielfigur | „bereit“ oder die Sekunden bis zum nächsten Dash |
| `S1 Munition` | Spielfigur | Vorrat und Höchstwert |
| `S1 Energie` | Spielfigur | Vorrat und Höchstwert |
| `S1 Fähigkeiten` | Spielfigur | „bereit“ oder je beschäftigter Fähigkeit: Platz, „aktiv“ mit Restdauer oder „Pause“ mit Rest der Abklingzeit |
| `Kamera` | Kamera | Bildmitte in der Welt |

Der Hinweis „Neustart: F2“ ist mit M4 entfallen; F2 gilt weiter. In der Testkammer sind seit M7 die Zeilen „Maus“, „Kamera“ und „Raumzeit“ ausgeblendet, damit die Anzeige bei elf Zeilen bleibt. Einschalten lassen sie sich im Inspektor des Knotens `DebugOverlay` über `show_mouse` und `hidden_keys`.

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

Genutzt werden bisher: die vier Laufrichtungen, `sprint`, `sneak`, `attack_primary`, `attack_secondary`, `dash`, `ability_1` bis `ability_3` und die beiden Entwickler-Tasten.

### Kollisions-Ebenen

| Ebene | Name | Wer liegt darauf |
| --- | --- | --- |
| 1 | `world` | Wände und Blöcke der Testkammer; Geschosse enden an ihnen |
| 2 | `player` | Spielfigur; ihre Maske ist `world` und `enemy` |
| 3 | `enemy` | Übungspuppen als feste Körper; das bewegliche Ziel liegt auf keiner Ebene und lässt sich durchlaufen |
| 4 | `player_hurtbox` | `Hurtbox` der Spielfigur; Schadensfeld und Schadensstreifen suchen hier |
| 5 | `enemy_hurtbox` | `Hurtbox` der Übungspuppen; Schwert und Geschosse suchen hier |
| 6 | `interactable` | – |
| 7 | `pickup` | – |

Trefferzonen sind `Area2D`: Eine `Hurtbox` liegt auf ihrer Ebene und sucht selbst nichts. Eine `Hitbox` liegt auf keiner Ebene und sucht über ihre Maske.

### Gruppen

| Gruppe | Mitglieder | Wer sie nutzt |
| --- | --- | --- |
| `player_spawn` | Startpunkte im Level (`Marker2D`) | `PlayerSpawner` |
| `players` | jede Spielfigur | `PlayerCamera`; später Gegner und HUD |
| `invisible` | Figuren, solange ihre Unsichtbarkeit wirkt | noch niemand; ab Phase 3 die Wahrnehmung der Gegner |
| `stunnable` | jeder Baustein `Stunnable` | die Fähigkeit Stun |

### Globale Klassen (`class_name`)

| Klasse | Datei | Art |
| --- | --- | --- |
| `IntentSource` | `entities/intent_source.gd` | Knoten: die Absichten einer Figur – `move_direction`, `wants_sprint`, `wants_sneak`, `aim_direction`, `wants_attack`, `wants_dash`, `wants_shoot`, `wants_ability` |
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
| `Dash` | `components/dash/dash.gd` | Baustein Dash |
| `DashStats` | `components/dash/dash_stats.gd` | Bauplan einer Werte-Datei für den Dash |
| `Supply` | `components/supply/supply.gd` | Baustein Vorrat, etwa Munition |
| `SupplyStats` | `components/supply/supply_stats.gd` | Bauplan einer Werte-Datei für einen Vorrat |
| `RangedAttack` | `components/ranged_attack/ranged_attack.gd` | Baustein Fernkampf-Angriff |
| `RangedStats` | `components/ranged_attack/ranged_stats.gd` | Bauplan einer Werte-Datei für einen Fernkampf-Angriff |
| `Projectile` | `entities/projectile/projectile.gd` | Geschoss |
| `Ability` | `abilities/ability.gd` | Grundgerüst jeder Fähigkeit |
| `AbilityStats` | `abilities/ability_stats.gd` | Bauplan einer Werte-Datei für Fähigkeiten: Name, Kosten, Dauer, Abklingzeit |
| `HasteStats` | `abilities/haste/haste_stats.gd` | erweitert `AbilityStats` um `speed_factor` |
| `InvisibilityStats` | `abilities/invisibility/invisibility_stats.gd` | erweitert `AbilityStats` um `alpha` |
| `StunStats` | `abilities/stun/stun_stats.gd` | erweitert `AbilityStats` um `radius` |
| `Stunnable` | `components/stunnable/stunnable.gd` | Baustein: macht ein Ziel betäubbar |

### Werte-Dateien – `data/`

| Datei | Bauplan | Werte |
| --- | --- | --- |
| `data/player/movement.tres` | `MovementStats` | `walk_speed` 80, `sprint_speed` 130, `sneak_speed` 40, `acceleration` 600, `friction` 800, `sprint_cost_per_second` 25 |
| `data/player/stamina.tres` | `StaminaStats` | `max_stamina` 100, `regen_per_second` 30, `regen_delay` 0,8, `recover_threshold` 25 |
| `data/player/camera.tres` | `CameraStats` | `mouse_look_factor` 0,15, `mouse_look_max` 40, `move_look_seconds` 0,12, `move_look_max` 24, `smooth_time` 0,2, `min_speed` 24 |
| `data/player/health.tres` | `HealthStats` | `max_health` 100, `invulnerable_time` 0,6 |
| `data/player/sword.tres` | `MeleeStats` | `damage` 10, `gain_per_hit` 10, `start_distance` 6, `reach` 18, `width` 20, `active_time` 0,12, `cooldown` 0,35 |
| `data/player/dash.tres` | `DashStats` | `distance` 64, `duration` 0,2, `invulnerable_time` 0,25, `cooldown` 0,8, `buffer_time` 0,12 |
| `data/player/bow.tres` | `RangedStats` | `damage` 10, `projectile_speed` 220, `max_distance` 240, `spawn_distance` 8, `cooldown` 0,5, `cost` 1 |
| `data/player/ammo.tres` | `SupplyStats` | `max_amount` 12, `regen_per_second` 0, `regen_delay` 1 |
| `data/player/energy.tres` | `SupplyStats` | `max_amount` 100, `regen_per_second` 0, `regen_delay` 1 |
| `data/abilities/haste.tres` | `HasteStats` | `display_name` Schnelligkeit, `cost` 30, `duration` 4, `cooldown` 6, `speed_factor` 1,5 |
| `data/abilities/invisibility.tres` | `InvisibilityStats` | `display_name` Unsichtbarkeit, `cost` 40, `duration` 5, `cooldown` 8, `alpha` 0,3 |
| `data/abilities/stun.tres` | `StunStats` | `display_name` Stun, `cost` 30, `duration` 2, `cooldown` 6, `radius` 64 |
| `data/dummy/health.tres` | `HealthStats` | `max_health` 50, `invulnerable_time` 0 |

Tempo in Pixeln pro Sekunde, Strecken in Pixeln, Zeiten in Sekunden.

### Bausteine – `components/`

| Baustein | Ordner | Was er tut | Einstellbar |
| --- | --- | --- | --- |
| `PlaceholderView` | `components/placeholder_view/` | Malt die Rechtecke, Kreise und Kapseln der `CollisionShape2D`-Geschwister als Farbfläche. Platzhalter-Grafik; ab A1 tritt `CharacterView` an ihre Stelle, sie selbst bleibt als Rückfall. | `color` |
| `Stamina` | `components/stamina/` | Ausdauer-Vorrat: `spend(amount)` verbraucht und liefert, ob es ging; nach `regen_delay` füllt er sich. Bei 0 gilt `is_exhausted`, bis `recover_threshold` erreicht ist. Meldet `changed`, `exhausted`, `recovered`. | `stats` |
| `Health` | `components/health/` | Leben. `apply_damage(amount)` ist die einzige Stelle, an der über Schaden entschieden wird: Tote und gerade Unverwundbare nehmen keinen. `make_invulnerable(seconds)` schützt für eine Dauer, etwa beim Dash. `reset()` füllt auf, auch nach dem Tod. Meldet `changed`, `damaged`, `died`, `revived`. | `stats` |
| `Hurtbox` | `components/hurtbox/` | `Area2D`, die Treffer annimmt und an das Geschwister `Health` weiterreicht: `receive_hit(damage, direction)`. Meldet `hit_received`. Braucht eine eigene `CollisionShape2D`. | Ebene |
| `Hitbox` | `components/hitbox/` | `Area2D`, die jede berührte `Hurtbox` trifft, solange sie scharf ist: `activate()`, `deactivate()`. Meldet `hit_landed`; entschärft ein Zuhörer sie dabei, trifft sie in diesem Schritt nichts weiter. Braucht eine eigene `CollisionShape2D`. | `damage`, `hit_interval`, `active_on_start`, Maske |
| `MeleeAttack` | `components/melee_attack/` | Nahkampf-Angriff: `try_attack(richtung)` dreht die Trefferzone in die Richtung und macht sie kurz scharf. Zone und Zeiten kommen aus der Werte-Datei. Jeder Treffer füllt das Geschwister `gain_supply_name` um `gain_per_hit` auf. `rate_factor` über 1 verkürzt die Pause. Meldet `attack_started`, `attack_finished`. | `stats`, `target_mask`, `swing_color`, `gain_supply_name` |
| `HitFlash` | `components/hit_flash/` | Lässt den Elternknoten bei Schaden hell aufblitzen; solange er unverwundbar ist, blinkt er. Hört auf das Geschwister `Health`. | `flash_time`, `flash_strength`, `blink_while_invulnerable`, `blink_interval`, `blink_alpha` |
| `DamageNumbers` | `components/damage_numbers/` | Zeigt bei Schaden die Zahl über dem Elternknoten; sie steigt auf und verblasst. Hört auf das Geschwister `Health`. | `color`, `font_size`, `outline_size`, `rise_distance`, `duration`, `start_offset` |
| `Dash` | `components/dash/` | Kurzer, schneller Satz: `request()` merkt den Tastendruck vor, `try_start(richtung)` startet, sobald es möglich ist; solange `is_dashing` gilt, liefert `get_velocity()` das Tempo. Macht das Geschwister `Health` beim Start kurz unverwundbar. Meldet `dash_started`, `dash_finished`. | `stats` |
| `Supply` | `components/supply/` | Zählbarer Vorrat: `spend(menge)` verbraucht und liefert, ob genug da war; `add(menge)` füllt auf. Mit `regen_per_second` über 0 füllt er sich nach `regen_delay` von selbst. Meldet `changed`. | `stats` |
| `RangedAttack` | `components/ranged_attack/` | Fernkampf-Angriff: `try_shoot(richtung)` bezahlt aus dem Geschwister `supply_name` und bestellt das Geschoss über `projectile_requested`. Ohne `ProjectileSpawner` im Level fällt kein Schuss und nichts wird bezahlt. `rate_factor` über 1 verkürzt die Pause. Meldet `shot_fired`. | `stats`, `projectile_scene`, `target_mask`, `supply_name` |
| `PatrolMover` | `components/patrol_mover/` | Lässt seinen Elternknoten zwischen Startpunkt und Startpunkt + `travel` pendeln. Für Dinge, die nichts wegschieben müssen. | `travel`, `speed` |
| `Stunnable` | `components/stunnable/` | Macht seinen Elternknoten betäubbar: `apply_stun(sekunden)`, `is_stunned()`. Solange die Betäubung anhält, ruht der Knoten aus `paused_node` und um das Ziel liegt ein Ring. Steht in der Gruppe `stunnable`. Meldet `stunned`, `recovered`. | `paused_node`, `ring_radius`, `ring_color` |

Die Bausteine finden das Leben über den Namen: Der Knoten muss genau `Health` heißen und neben ihnen liegen.

### Fähigkeiten – `abilities/`

| Fähigkeit | Ordner | Was sie tut | Einstellbar |
| --- | --- | --- | --- |
| `Ability` | `abilities/` | Grundgerüst: `try_activate()` prüft Bereitschaft und Vorrat, bezahlt und startet die Wirkung; nach `duration` endet sie, dann läuft `cooldown`. Erbende Skripte füllen nur `_begin_effect()` und `_end_effect()`. Meldet `activated`, `finished`. | `stats`, `supply_name` |
| Schnelligkeit | `abilities/haste/` | Setzt bei der Figur `speed_factor` und bei ihren Kindern `rate_factor`: schneller laufen, schlagen und schießen. | `stats` |
| Unsichtbarkeit | `abilities/invisibility/` | Macht das Bild der Figur durchscheinend und stellt sie in die Gruppe `invisible`. Gegner und Bonus-Schaden folgen in Phase 3. | `stats`, `view_name` |
| Stun | `abilities/stun/` | Betäubt jeden `Stunnable` im Umkreis für die Dauer der Fähigkeit und zeigt einen Ring. | `stats`, `pulse_time`, `pulse_color` |

Eine neue Fähigkeit ist ein Ordner mit Szene, Skript und Werte-Datei; das Skript erbt von `Ability`.

### Szenen

| Szene | Skript | Zweck |
| --- | --- | --- |
| `levels/test_chamber/test_chamber.tscn` | `test_chamber.gd` | Testkammer und Startszene |
| `entities/player/player.tscn` | `player.gd` | Spielfigur |
| `entities/player/player_spawner.tscn` | `player_spawner.gd` | erzeugt die Spielfiguren eines Levels |
| `entities/player/player_camera.tscn` | `player_camera.gd` | Kamera, die der Spielfigur folgt |
| `entities/dummy/training_dummy.tscn` | `training_dummy.gd` | Übungspuppe |
| `world/damage_zone/damage_zone.tscn` | keins; die Szene erbt von `hitbox.tscn` | Schadensfeld |
| `entities/projectile/projectile.tscn` | `projectile.gd` | Geschoss |
| `entities/projectile/projectile_spawner.tscn` | `projectile_spawner.gd` | erzeugt alle Geschosse eines Levels |
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
| `components/dash/dash.tscn` | `dash.gd` | Baustein, siehe oben |
| `components/supply/supply.tscn` | `supply.gd` | Baustein, siehe oben |
| `components/ranged_attack/ranged_attack.tscn` | `ranged_attack.gd` | Baustein, siehe oben |
| `components/patrol_mover/patrol_mover.tscn` | `patrol_mover.gd` | Baustein, siehe oben |
| `components/stunnable/stunnable.tscn` | `stunnable.gd` | Baustein, siehe oben |
| `abilities/haste/haste.tscn` | `haste.gd` | Fähigkeit, siehe oben |
| `abilities/invisibility/invisibility.tscn` | `invisibility.gd` | Fähigkeit, siehe oben |
| `abilities/stun/stun.tscn` | `stun.gd` | Fähigkeit, siehe oben |
| `ui/debug/setup_check.tscn` | `setup_check.gd` | Setup-Check aus M0; bleibt als Werkzeug |

**Spielfigur im Einzelnen**

- `Player` ist ein `CharacterBody2D` im schwebenden Modus, Ebene `player`, Maske `world` und `enemy`, Gruppe `players`. Körper 12 × 12 Pixel, grüner Platzhalter, weißer Punkt in Blickrichtung.
- Kinder: `CollisionShape2D`, `PlaceholderView`, `PlayerInput` (ein `IntentSource`, läuft vor der Figur), `Stamina`, `Health`, `Hurtbox` (10 × 10 Pixel, Ebene `player_hurtbox`), `HitFlash`, `MeleeAttack` (sucht auf `enemy_hurtbox`), `Dash`, `Ammo` (ein `Supply`), `RangedAttack` (Ziele auf `enemy_hurtbox`), `Energy` (ein `Supply`), `Abilities` mit den Kindern `Haste`, `Invisibility` und `Stun`.
- Die Figur liest nur Absichten. `PlayerInput` füllt sie aus den Aktionen und aus der Mausposition; später kann eine andere Quelle dasselbe tun.
- Blick und Hieb: Die Figur blickt stufenlos in die Zielrichtung, also zur Maus. Solange `attack_primary` gehalten wird, schlägt sie dorthin. Laufen, Sprinten und Schleichen gehen dabei weiter.
- Zustände: Stehen, Laufen, Sprinten, Schleichen, Dash. Schleichen geht vor Sprinten. Sprinten kostet Ausdauer; ohne Vorrat läuft die Figur normal.
- Dash: Ein Druck auf `dash` schnellt die Figur 64 Pixel weit – in Laufrichtung, im Stehen in Blickrichtung. Solange er läuft, lenkt sie nicht, verbraucht keine Ausdauer und beginnt keinen Hieb; ein laufender Hieb geht weiter. Danach läuft sie höchstens mit Lauftempo weiter. Halten der Taste löst keinen zweiten Dash aus.
- Fernkampf: Solange `attack_secondary` gehalten wird, schießt die Figur in Zielrichtung, zwei Schüsse pro Sekunde, jeder kostet 1 Munition. Laufen geht dabei weiter; während des Dashs fällt kein Schuss.
- Fähigkeiten: Ein Druck auf `ability_1`, `ability_2` oder `ability_3` setzt das erste, zweite oder dritte Kind von `Abilities` ein. Das geht jederzeit, auch im Dash. Die Figur selbst kennt keine einzelne Fähigkeit; sie bietet nur `speed_factor` an, den die Schnelligkeit setzt.
- Energie: Fähigkeiten bezahlen aus `Energy`. Der Vorrat füllt sich nur durch Schwerttreffer, über `MeleeAttack`.
- Tod: Fällt das Leben auf 0, bleibt die Figur stehen, wird grau und sendet `player_died`. Was dann geschieht, entscheidet das Level.
- Einstellbar: `stats` (Werte-Datei), `player_id`, `defeated_color`. Ohne `PlayerInput` bleibt sie stehen, ohne `Stamina` sprintet sie unbegrenzt, ohne `Health` nimmt sie keinen Schaden, ohne `Hurtbox` ist sie nicht zu treffen, ohne `MeleeAttack` schlägt sie nicht zu, ohne `Dash` dasht sie nicht, ohne `RangedAttack` schießt sie nicht, ohne `Ammo` kosten Schüsse nichts, ohne `Abilities` hat sie keine Fähigkeiten, ohne `Energy` kosten Fähigkeiten nichts.
- Einen Zustandsautomaten als Baustein gibt es noch nicht: Der Dash bringt seinen Zeitablauf selbst mit, die Figur fragt nur `is_dashing`. Vorgesehen ist er für den ersten Gegner in M13.

**Kampf im Einzelnen**

- Weg eines Treffers: `Hitbox` berührt `Hurtbox` → `Hurtbox.receive_hit()` → `Health.apply_damage()`. Nur `Health` entscheidet, ob und wie viel Schaden ankommt.
- Schwert: Die Trefferzone ist 18 Pixel lang und 20 breit und beginnt 6 Pixel vor der Mitte der Figur. Sie ist 0,12 s scharf; von Hieb zu Hieb vergehen 0,35 s. Ein Hieb trifft jedes Ziel höchstens einmal, kann aber mehrere Ziele treffen.
- Die Trefferzone wird erst einen Physik-Schritt nach Hiebbeginn ausgewertet, weil Godot Berührungen erst dann kennt.
- Unverwundbarkeit: Nach einem Treffer nimmt die Spielfigur 0,6 s lang keinen Schaden. Das steht als `invulnerable_time` in ihrer Werte-Datei und gilt für jede Schadensquelle. Auch ein Dash schützt, 0,25 s ab seinem Beginn. Solange die Figur unverwundbar ist, blinkt sie.
- Dash: 64 Pixel in 0,2 s, also 12 Physik-Schritte mit Tempo 320. Von Dash zu Dash vergehen 0,8 s. Ein Tastendruck kurz vor Ablauf der Pause bleibt 0,12 s lang vorgemerkt.
- Bogen: 10 Schaden je Treffer, 0,5 s Pause zwischen zwei Schüssen, 1 Munition je Schuss. Das Geschoss entsteht 8 Pixel vor der Mitte der Figur.
- Geschoss: fliegt mit Tempo 220 geradeaus, höchstens 240 Pixel weit. Es endet beim ersten Treffer, an Wänden und Blöcken oder am Ende der Reichweite. Schaden teilt seine `Hitbox` aus, Wände bemerkt sein `WorldSensor` über die Ebene `world`. Den Schützen kann es nicht treffen, weil es nur auf der Ziel-Ebene sucht.
- Geschosse entstehen an genau einer Stelle: `RangedAttack` bestellt über `projectile_requested`, der `ProjectileSpawner` des Levels baut und startet. Je Level darf es nur einen geben.
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
- Bewegliches Ziel `DummyD`: eine türkise Übungspuppe ohne Kollisions-Ebene, Start bei (592, 72). Ihr Kind `PatrolMover` lässt sie mit Tempo 40 um 96 Pixel nach unten und zurück pendeln; ihr Kind `Stunnable` hält den `PatrolMover` bei einer Betäubung an.
- Schadensfeld `DamageZone`: Mitte bei (240, 240).
- Schadensstreifen `DamageStrip`: 16 × 96 Pixel, Mitte bei (528, 120), rechts neben den Puppen; 10 Schaden, gebaut direkt aus `hitbox.tscn`. Er dient dem Test des Dashs. Sein Kind `Stunnable` schaltet ihn bei einer Betäubung ab.
- Die Puppen, `DamageZone`, `DamageStrip`, `PlayerSpawner`, `ProjectileSpawner`, `PlayerCamera`, `Crosshair` und `DebugOverlay` sind eingehängt und lassen sich einzeln löschen.
- `DebugOverlay` blendet hier „Maus“, „Kamera“ und „Raumzeit“ aus.
- F2 und der Tod einer Figur laden die Szene neu, direkt in `test_chamber.gd`. Ab M18 übernimmt das der `SceneManager`.

**Debug-Anzeige im Einzelnen**

- `CanvasLayer` auf Ebene 100, läuft auch bei pausiertem Spiel. Zeigt FPS, Mausposition im Bild, gedrückte Aktionen und alle gemeldeten Werte.
- Einstellbar: `refresh_interval` (0,1 s), `font_size` (12), `visible_on_start`, `show_mouse`, `hidden_keys`.
- Im Editor zeigt die Testkammer nur die blauen Kollisionsflächen; Farben, Raster und Anzeige erscheinen erst im laufenden Spiel.

### Dateien je Modul

**M7 – Fähigkeiten**

- Neu: `abilities/ability.gd`, `abilities/ability_stats.gd`; `abilities/haste/` mit `haste.tscn`, `haste.gd`, `haste_stats.gd`; `abilities/invisibility/` mit `invisibility.tscn`, `invisibility.gd`, `invisibility_stats.gd`; `abilities/stun/` mit `stun.tscn`, `stun.gd`, `stun_stats.gd`
- Neu: `components/stunnable/stunnable.tscn`, `stunnable.gd`; `data/player/energy.tres`; `data/abilities/haste.tres`, `invisibility.tres`, `stun.tres`
- Geändert: `components/supply/supply.gd` (`add` dazu), `components/melee_attack/melee_attack.gd` und `melee_stats.gd` (Treffer füllen einen Vorrat, `rate_factor`), `components/ranged_attack/ranged_attack.gd` (`rate_factor`), `data/player/sword.tres` (`gain_per_hit`)
- Geändert: `entities/intent_source.gd` (Fähigkeits-Wunsch), `entities/player/player_input.gd` (liest 1, 2, 3), `entities/player/player.gd` (Fähigkeiten, `speed_factor`, zwei Debug-Zeilen), `entities/player/player.tscn` (Knoten `Energy` und `Abilities`)
- Geändert: `ui/debug/debug_overlay.gd` (Zeilen ausblenden), `levels/test_chamber/test_chamber.tscn` (zwei `Stunnable`, kürzere Anzeige), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `docs/projekt_stand.md`

**M6 – Fernkampf**

- Neu, Bausteine: `components/supply/` mit `supply.tscn`, `supply.gd`, `supply_stats.gd`; `components/ranged_attack/` mit `ranged_attack.tscn`, `ranged_attack.gd`, `ranged_stats.gd`; `components/patrol_mover/` mit `patrol_mover.tscn`, `patrol_mover.gd`
- Neu: `entities/projectile/projectile.tscn`, `projectile.gd`, `projectile_spawner.tscn`, `projectile_spawner.gd`; `data/player/bow.tres`, `data/player/ammo.tres`
- Geändert: `autoload/event_bus.gd` (eine Meldung dazu), `components/hitbox/hitbox.gd` (Abbruch nach dem Entschärfen), `entities/intent_source.gd` (Schusswunsch), `entities/player/player_input.gd` (liest den Rechtsklick), `entities/player/player.gd` (Schuss, Debug-Zeile), `entities/player/player.tscn` (Knoten `Ammo` und `RangedAttack`)
- Geändert: `levels/test_chamber/test_chamber.tscn` (bewegliches Ziel, `ProjectileSpawner`), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `docs/projekt_stand.md`
- Das ZIP `m6_fernkampf.zip` enthält zusätzlich alle Dateien von M5.

**M5 – Dash**

- Neu: `components/dash/dash.tscn`, `dash.gd`, `dash_stats.gd`; `data/player/dash.tres`
- Geändert: `components/health/health.gd` (`make_invulnerable` dazu), `entities/intent_source.gd` (Dash-Wunsch), `entities/player/player_input.gd` (liest die Dash-Taste), `entities/player/player.gd` (Dash, Zustand, Debug-Zeile), `entities/player/player.tscn` (Knoten `Dash`)
- Geändert: `levels/test_chamber/test_chamber.tscn` (Schadensstreifen), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `docs/projekt_stand.md`

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
- Lose Dateien im Stamm des Pakets und in `Actor/Character/` führt der Katalog seit 17.11.2026 im Abschnitt „Lose Dateien“.
- Am 16.11.2026 hat Claude die Blätter vergrößert angesehen, die A1 bis A4 brauchen. Wo das Bild die Annahme bestätigt, ist das ⚠ im Katalog entfernt; was noch fehlt, steht dort unter „Prüfstand am Bild“.

## Grafik-Plan in Kürze

Der vollständige Plan steht im Plan-Dokument im Tab „Grafik & Assets“. Die Kurzfassung hier gilt, falls der Tab nicht lesbar ist.

- Die Mechanik bleibt unberührt: Kollisionsformen und Werte-Dateien entscheiden, das Bild schaut nur zu.
- `CharacterView` ersetzt `PlaceholderView`, das als Rückfall bleibt. Der Baustein liest Blickrichtung und Tempo der Figur und hört auf die Signale ihrer Bausteine: Hieb, Dash, Schaden, Tod.
- Das Bild zeigt die nächstliegende von vier Blickrichtungen; gezielt und getroffen wird weiter stufenlos.
- Ein Skin ist eine Werte-Datei: Blatt, Bildgröße und Bilder je Animation. Ein anderer Skin ist eine andere Datei, kein Code.
- `EffectCue` und `SoundCue` hängen neben einem Baustein und reagieren auf eines seiner Signale. Töne spielt der `AudioManager` nach einer Ton-Tabelle.
- Das Paket unter `assets/ninja_adventure/` wird nie verändert. Eigenes – Skins, Kachel-Sets, Ton-Tabelle, Thema – liegt unter `data/` und `ui/`.
- Alles ist abschaltbar. Bild und Ton sind rein lokal und entscheiden im Mehrspieler nichts.

**Ausgewählte Grafiken** – Pfade relativ zu `assets/ninja_adventure/`; „geprüft“ heißt: am 16.11.2026 vergrößert angesehen

| Zweck | Datei | Stand |
| --- | --- | --- |
| Spielfigur | `Actor/CharacterAnimated/NinjaGreen/Separate/` – Idle, Walk, Attack, Roll, Hit, Dead; 32 × 32 je Bild | geprüft: Spalten = Blick nach unten, oben, links, rechts; Zeilen = Bilder der Animation |
| Schwert an der Figur | `Actor/CharacterAnimated/Weapon/Katana.png`, 64 × 64 je Bild | geprüft: gleiches Raster wie `Attack.png`; die Lage über der Figur zeigt erst Godot |
| Hieb-Effekt | `FX/Attack/SlashCurved/SpriteSheet.png`, 4 à 32 | geprüft |
| Geschoss | `FX/Projectile/Arrow.png`, 13 × 5, zeigt nach rechts | geprüft |
| Treffer und Tod | `FX/Attack/Cut/SpriteSheet.png`, 4 à 32; `FX/Smoke/Smoke/SpriteSheet.png`, 6 à 32 | geprüft |
| Stun-Ring | `FX/Magic/Circle/SpriteSheetWhite.png`, 4 à 32 | geprüft |
| Schatten | `Actor/Character/Shadow.png`, 12 × 7 | geprüft |
| Übungspuppen | `Actor/Monster/Bamboo/` und `BambooYellow/`, 4 × 4 à 16 | Bamboo geprüft; BambooYellow nur dem Namen nach |
| Gegner | `Actor/Monster/<Name>/`, 4 × 4 à 16 | geprüft an Slime: Spalten wie bei den Figuren, Zeilen = Laufbilder |
| NPCs | `Actor/Character/<Name>/SpriteSheet.png`, 4 × 7 à 16, dazu `Faceset.png` | geprüft: Zeilen 1 bis 4 Laufen, 5 Angriff, 6 Sprung, 7 Tod, Gegenstand und zwei Sonderposen |
| Boden und Natur der Steinzeit | `Backgrounds/Tilesets/TilesetFloor.png`, `TilesetNature.png`, `TilesetRelief.png` | gesichtet; Regeln für Übergänge fehlen |
| Wände der Testkammer | `Backgrounds/Tilesets/Interior/TilesetWallSimple.png` | gesichtet: vier Mauer-Rahmen |
| Knöpfe, Platten, Stacheln (M8) | `Backgrounds/Tilesets/TilesetDungeon.png` | gesichtet |
| Kisten, Fässer, Möbel (M9) | `Backgrounds/Tilesets/TilesetElement.png` | gesichtet |
| Truhen (M10) | `Items/Treasure/LittleTreasureChest.png`, `BigTreasureChest.png` | geprüft: je zwei Bilder, zu und offen |
| Leben im HUD | `Ui/Receptacle/Heart.png`, 5 Bilder à 16 | geprüft: leer bis voll in Viertelschritten |
| Fähigkeits-Symbole | `Ui/Skill Icon/Spell/`, 24 × 24 | Camouflage für die Unsichtbarkeit geprüft; Schnelligkeit und Stun noch auszuwählen |
| Schrift | `Ui/Font/NormalFont.ttf` | Probe gerendert: Ziffern, Großbuchstaben und Umlaute da, das ß fehlt |
| Geräusche | `Audio/Sounds/Whoosh & Slash/`, `Hit & Impact/`, `Magic & Skill/`, `Jump & Bounce/` | nur die Namen; anhören kann nur der Nutzer |
| Musik | `Audio/Musics/`, 41 Stücke, etwa „2 - The Cave“ für die Steinzeit | nur die Namen |

## Gate G1 und Ausblick

Phase 1 ist gebaut. Gate G1 steht an: Fühlt sich die Spielfigur gut an – Bewegen, Zielen, Zuschlagen, Ausweichen? Das beurteilt der Nutzer; nachstellen lässt sich alles ohne Code über die Werte-Dateien in `data/`. Vorschlag: G1 nach A1 bis A3 beurteilen, wenn die Figur Bild und Ton hat.

Phase 2 beginnt mit M8 – Interaktion. Laut Konzept gehören in die Testkammer dafür Truhe, Tür, Hebel und Druckplatte nebeneinander; die Aktion `interact` liegt auf E. Bild und Ton kommen dann gleich mit.

## Hinweise aus der bisherigen Arbeit

- Vor jedem Push in GitHub Desktop unter „History“ prüfen, dass beim neuen Commit `LEJM4` steht.
- Beim Kopieren eines Projektordners nie den Ordner `.git` mitnehmen.
- `.godot/` gehört nicht ins Repo und steht in der `.gitignore`.
- Neue Dateien spielt der Nutzer per ZIP ein: „Alle extrahieren“ mit Ziel `E:\GitHub\TT`, vorhandene Dateien ersetzen.
- Ersetzt ein ZIP eine vorhandene Szene, muss Godot vorher geschlossen sein. Sonst kann Godot die Änderung überschreiben.
- Szenen, die Godot schon gespeichert hat, ändert Claude nur auf Grundlage der Fassung im Repo, damit Kennungen erhalten bleiben.
- Godot 4.7 schreibt Szenen ohne `load_steps` und mit `unique_id` je Knoten; handgeschriebene Szenen ohne beides lädt es problemlos.
- Nach jedem bestandenen Test committen und pushen, bevor das nächste Modul eingespielt wird. Sonst kann Claude den Stand nicht im Repo nachlesen und baut auf der eigenen Lieferung auf.
- Ein neuer Chat hat keine Kopie früherer Lieferungen. Vor einem Wechsel des Chats muss alles im Repo liegen.
- Die `README.md` nennt den Dash unter `abilities/`. Gebaut ist er als Baustein unter `components/dash/`, weil er keine Energie kostet und eine eigene Taste hat. Die README ist bei Gelegenheit anzupassen.
- In `hitbox.tscn`, `hurtbox.tscn` und `melee_attack.tscn` zeigt der Editor ein gelbes Warndreieck, weil dort keine Form liegt. Das ist gewollt: Die Form kommt beim Einhängen dazu, beim Schwert beim Start aus der Werte-Datei.

## Offene Punkte

- Grafik: Die Antworten des Nutzers auf E1 bis E4 stehen aus; ohne sie beginnt A1 nicht.
- Grafik, noch ungeprüft – Claude klärt das, bevor ein Schritt es braucht: Bild der Übungspuppe `BambooYellow` (A1); Lage des Katanas über der Figur (A2); Effekte, die im Katalog „unklar“ heißen (A2); alle Töne, bisher nur die Namen (A3); Übergangsregeln der Kacheln (A4); `TilesetFloor.png` mit 417 Pixeln Höhe, nicht durch 16 teilbar (A4); Symbole für Schnelligkeit und Stun (A5).
- Zauber: „keine eigene Kategorie“ ist nur vorläufig gewählt. Die Entscheidung liegt beim Nutzer.
- Gate G1: Der Nutzer beurteilt, ob sich die Spielfigur gut anfühlt; Vorschlag: nach A1 bis A3.
- Unsichtbarkeit: Dass Gegner die Figur verlieren und ein Angriff daraus Bonus-Schaden macht, folgt mit den Gegnern in Phase 3.
- Munition lässt sich bisher nur mit F2 auffüllen; Nachschub kommt mit Truhen und Beute in M10. Energie aus Fläschchen und Speicherpunkten folgt ebenfalls später.
- Die Debug-Anzeige stößt an ihre Grenze; die Leisten und Fähigkeits-Symbole des HUD kommen mit M12.
- Repo: Zuletzt gelesen hat Claude Commit `098b405` (M2). Ob M3 bis M7 inzwischen hochgeladen sind, ist offen; vor dem nächsten Chat muss alles im Repo liegen, siehe „Übergabe“.
- Tod & Speichern: Der Neustart des Raums ist vorläufig. Was beim Tod verloren geht und wo gespeichert wird, ist vor M16 zu entscheiden.
- Stottert die Bewegung auf einem Monitor mit mehr als 60 Hz, gibt es dafür die Physik-Interpolation als Projekteinstellung. Sie ist bewusst noch aus.
- Projektanweisungen: Repo-Link und Lieferung als ZIP nachtragen, Text unter „Übergabe“.
- Der Sicherungsordner `E:\GitHub\TT_alt` kann gelöscht werden, falls er noch existiert.
- In `components/`, `levels/test_chamber/`, `entities/player/` und `data/` liegt noch je eine `.gitkeep`, die nicht mehr gebraucht wird.
