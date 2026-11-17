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
| In Arbeit | A2 – Kampf-Bilder: geliefert am 17.11.2026 als `a2_kampf_bilder.zip`, der Test des Nutzers steht aus |
| Als Nächstes | A3 – Ton; dann Gate G1 und Phase 2 mit M8 – Interaktion |
| Zuletzt abgeschlossen | M11a – Inventar-Logik, am 17.11.2026: Test bestanden. Davor am selben Tag A1 – Figuren-Bild und A0 – Sichtung & Auswahl mit E1 bis E4, am 16.11.2026 M7 – Fähigkeiten; damit ist Phase 1 gebaut |
| Repo | https://github.com/LEJM4/TT – öffentlich, Zweig `main`; gelesen am 17.11.2026 nach dem Test von M11a: Commit `369a648` mit A1 und M11a, davor `9b6d28a` mit M0 bis M7 und den Übergabe-Dateien unter `docs/`; alle Commits unter `LEJM4`. A2 lädt der Nutzer nach bestandenem Test hoch; die Stand-Datei im ZIP von A2 ersetzt die aus `m11a_inventar.zip` |

## Neuer Chat und Arbeitsweise

Ein neuer Chat hat keine Kopie früherer Lieferungen. Er kennt nur diese Datei, den Grafik-Katalog, das Plan-Dokument und das Repo.

**Was ein neuer Chat zuerst tut**

1. Diese Datei lesen, dann im Plan-Dokument den Tab, um den es geht.
2. Das Repo einmal klonen und den Code lesen. Fehlt dort etwas, das hier als fertig steht, bittet Claude den Nutzer, es hochzuladen, statt es aus dieser Datei nachzubauen.

Die Übergabe vom 17.11.2026 ist erledigt: Der Nutzer hat M3 bis M7 hochgeladen und die Projektanweisungen angepasst; der neue Chat hat mit A1 begonnen.

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
| 2 – Welt & Interaktion | M11a Inventar-Logik | fertig am 17.11.2026 – vorgezogen vor A2 |
| | M8 Interaktion | offen, nach A1 bis A3 und Gate G1 |
| | M9 Zerstörbares | offen |
| | M10 Truhen & Beute | offen |
| | M11 Inventar & Ausrüstung | offen; die Logik kommt vorher mit M11a, hier folgen Inventarfenster und Ausrüstungsplätze |
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
| A0 Sichtung & Auswahl | Katalog am Bild prüfen; Grafiken, Kacheln, Effekte und Töne für die Testkammer auswählen | 16./17.11.2026 | fertig am 17.11.2026; was noch ungeprüft ist, klärt der Schritt, der es braucht |
| A1 Figuren-Bild | Baustein `CharacterView`, Skins als Werte-Dateien, Spielfigur mit Stehen, Laufen, Hieb, Rolle, Treffer und Tod in vier Richtungen, Schatten, Bild der Übungspuppen | vor Phase 2 | fertig am 17.11.2026 |
| A2 Kampf-Bilder | Hieb-Effekt, Effekte für Treffer, Tod und Stun; Baustein `EffectCue`; Pixel-Schrift für Schadenszahlen. Die Bilder der Geschosse kamen mit M11a. | vor Phase 2, nach M11a | im Test |
| A3 Ton | `AudioManager` füllen, Baustein `SoundCue`, Ton-Tabelle als Werte-Datei, Musik in der Testkammer | vor Phase 2 | als Nächstes |
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
| 16./17.11.2026 | Nach dem Test von M7 wollte der Nutzer zuerst einen Plan für Grafik und Assets, ohne Code. Er steht im Plan-Dokument im Tab „Grafik & Assets“: Schritte A0 bis A6, Regeln zur Einbindung, Auswahl der Grafiken und vier Entscheidungen. Vorschlag: A1 bis A3 vor Phase 2. | Plan fertig; E1 bis E4 am 17.11.2026 bestätigt |
| 17.11.2026 | Neuer Chat. Der Nutzer bestätigt E1 bis E4 mit „alle vier ok“; Claude hat A1 gebaut. Zusätzlich zum Plan: der Probe-Skin `caveman.tres` für einen Skin-Tausch an der Spielfigur und ein Hieb-Bild der Figur. | A1 fertig am 17.11.2026 |
| 17.11.2026 | Wunsch des Nutzers zu A2: Beim Schuss gibt es vier Geschosse aus `Items/Projectile` – Pfeil, Kunai, Shuriken, Dynamit –, je nachdem, was im Inventar ist. Das Inventar gab es noch nicht; auf Wunsch des Nutzers kommt seine Logik als M11a vor A2. Die Bilder der Geschosse wandern aus A2 nach M11a. Auf „weiter“ hat Claude M11a gebaut. | M11a fertig am 17.11.2026 |

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
| Fernkampf-Kosten | Munition: 12 Schuss, jeder Schuss kostet 1, nichts kommt von selbst nach. Nachschub folgt mit Truhen und Beute in M10. | von Claude vorgeschlagen; vom Nutzer am 16.11.2026 mit „Ja alles passt“ bestätigt; mit M11a durch Geschosse aus dem Inventar ersetzt |
| Geschosse | Vier Geschosse – Pfeil, Kunai, Shuriken, Dynamit aus `Items/Projectile`, nur diese –; geworfen wird, was im Inventar der Spielfigur ist | Wunsch des Nutzers am 17.11.2026; mit M11a gebaut |
| Geschoss-Werte | Pfeil 10 Schaden, Tempo 220, 240 Pixel weit, 0,5 s Pause. Kunai 15, Tempo 300, 180 Pixel, 0,5 s. Shuriken 6, fliegt durch bis zu 3 Ziele, Tempo 200, 200 Pixel, 0,4 s. Dynamit: kein Aufprall-Schaden, explodiert beim Aufprall oder am Ende und trifft alles im Umkreis von 24 Pixeln mit 20 Schaden, die Spielfigur nicht; Tempo 140, 120 Pixel, 1 s Pause | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „okay alles passt“ |
| Geschoss-Wahl | Mausrad runter: nächstes Geschoss, hoch: voriges, in der Reihenfolge der Plätze. Ist das gewählte aufgebraucht, rückt das nächste nach; ohne Geschosse fällt kein Schuss. Die alte Munition (12 Schuss) entfällt | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „okay alles passt“ |
| Inventar | 20 Plätze; Gleiches stapelt sich – Pfeile bis 99, Kunai und Shuriken bis 30, Dynamit bis 10. Hinein nur über `add()`, heraus nur über `remove()`. Gegenstände sind Werte-Dateien in `data/items/` | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „okay alles passt“ |
| Fähigkeiten | Drei Plätze auf den Tasten 1, 2 und 3: Schnelligkeit, Unsichtbarkeit, Stun. Jede kostet Energie, wirkt eine Dauer lang und hat danach eine Abklingzeit. Der Platz unter dem Knoten `Abilities` bestimmt die Taste. | von Claude gewählt; vom Nutzer nach dem Test am 16.11.2026 mit „Ja alles funktioniert“ bestätigt |
| Energie | 100 Punkte, eine Leiste für alle Fähigkeiten. Sie füllt sich nicht von selbst, sondern laut Konzept durch Treffer: jeder Schwerttreffer bringt 10. Fläschchen und Speicherpunkte folgen später. | laut Konzept; die Zahlen hat Claude gewählt |
| Zauber | Keine eigene Kategorie: Ein Zauber ist eine Fähigkeit wie jede andere, mit demselben Baustein und derselben Energie | vorläufig von Claude gewählt am 16.11.2026; die Entscheidung liegt beim Nutzer |
| Grafik einbinden | Eigene Schicht über der Mechanik: je Figur ein Bild-Baustein `CharacterView` statt `PlaceholderView`; Effekte und Töne als Zusatz-Bausteine `EffectCue` und `SoundCue`, die auf Signale reagieren; welche Grafik, steht als Skin in einer Werte-Datei; das Paket bleibt unverändert | von Claude vorgeschlagen am 17.11.2026 im Grafik-Plan; `CharacterView` mit A1 gebaut, `EffectCue` mit A2 |
| E1 Spielfigur | Die animierte `NinjaGreen`, 32 × 32 je Bild, mit eigener Rolle für den Dash und Treffer-Animation; die 16er-Figuren werden NPCs und Gegner | vom Nutzer am 17.11.2026 mit „alle vier ok“ bestätigt |
| E2 Reihenfolge | A1 bis A3 vor Phase 2; danach bringt jedes Modul Bild und Ton gleich mit | vom Nutzer am 17.11.2026 mit „alle vier ok“ bestätigt |
| E3 Räume malen | Der Nutzer malt im Godot-Editor; Claude liefert Kachel-Sets mit Kollision und eine Anleitung; den Boden der Testkammer füllt Code | vom Nutzer am 17.11.2026 mit „alle vier ok“ bestätigt |
| E4 Schrift | `NormalFont` aus dem Paket; ihr fehlt das ß, im Spiel steht dafür „ss“ | vom Nutzer am 17.11.2026 mit „alle vier ok“ bestätigt |
| Figuren-Bild | Ein Skin nennt Bildgröße, Lage, Schatten und je Animation Blatt, erste Zelle, Schritte und Bilder je Sekunde; Pflicht ist nur Stehen. Die Füße stehen auf der Unterkante der Kollisionsform: Bild 2 Pixel angehoben, Schattenmitte 5 Pixel unter der Mitte. Gezeigt wird die nächstliegende von vier Richtungen; die alte bleibt bis 8° über die Diagonale hinaus. Laufbilder laufen im Takt des Tempos. Mit Bild entfällt der weiße Richtungspunkt. | von Claude gewählt; vom Nutzer nach dem Test am 17.11.2026 mit „Okay das passt alles“ bestätigt |
| Bild der Übungspuppen | Feste Puppen `BambooYellow` (orange), das bewegliche Ziel `Bamboo` (grün). Sie stehen im ersten Laufbild; das bewegliche Ziel läuft mit Laufbildern; im Tod werden sie grau. | von Claude gewählt; vom Nutzer nach dem Test am 17.11.2026 mit „Okay das passt alles“ bestätigt |
| Unsichtbarkeit und Bild | Durchscheinend werden alle Bild-Knoten der Figur, die in `view_names` stehen: `CharacterView` samt Schatten und der Platzhalter | von Claude gewählt; vom Nutzer nach dem Test am 17.11.2026 mit „Okay das passt alles“ bestätigt |
| Kampf-Bilder | Hieb: Der Bogen `SlashCurved` schwingt vor der Figur in Hiebrichtung, stufenlos gedreht, und deckt die Trefferzone; das gelbe Feld ist unsichtbar. Treffer: Am Getroffenen blitzt der Schnitt `Cut` auf, gedreht in Schlagrichtung – bei Puppen und bei der Spielfigur. Tod: Bei Puppen steigt Rauch auf (`Smoke`); die Spielfigur behält ihr Tod-Bild. Stun: Um jedes betäubte Ziel pulsiert der weiße Kreis (`Circle`) statt des gelben Rings; der Ring, mit dem sich die Fähigkeit ausbreitet, bleibt. Schadenszahlen in `NormalFont`, Größe 9. Jeder Effekt ist ein eigener Knoten und lässt sich einzeln löschen | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „Ja passt“ bestätigt; Test steht aus |

Noch offen, jeweils fällig vor dem genannten Schritt: Zauber (vorläufig gewählt, siehe oben), Tod & Speichern endgültig (M16), Story (Phase 5), Anzahl Level (Phase 6).

## Prüfungen

**A2 – Kampf-Bilder**

- Geliefert am 17.11.2026 als `a2_kampf_bilder.zip`. Der Test des Nutzers steht aus; die Prüfliste steht darunter und im Plan-Dokument.
- Claude hat die Dateien am Text geprüft: Verweise, Knotenpfade, Signale und ihre Werte, exportierte Werte, Klassennamen und das Format der Werte-Dateien. Grundlage war das Repo, Commit `369a648`.
- Nachgerechnet, nicht ausprobiert: Alle Bilder der vier Effekte liegen im Blatt und sind nicht leer. Die Sichel des Hiebs liegt im Bild rechts der Mitte, in den Spalten 14 bis 31; um 8 Pixel vorgerückt deckt sie 6 bis 24 Pixel vor der Figur – genau die Trefferzone des Schwerts. Die Schrift ist für 9 Pixel gebaut; in Größe 9 fällt jeder Schrift-Pixel auf einen Bild-Pixel.

Prüfliste A2:

1. Godot schließen, ZIP nach `E:\GitHub\TT` entpacken, Godot öffnen, F5. Keine roten Fehler.
2. Linksklick in verschiedene Richtungen, auch schräg: Vor der Figur schwingt ein weiß-gelber Bogen in Zielrichtung; das gelbe Feld ist weg. Der Bogen liegt dort, wo das Schwert Puppen trifft.
3. Schwert oder Geschoss auf eine Puppe: Am Getroffenen blitzt ein Schnitt auf. Die Schadenszahl steht in der Pixel-Schrift des Pakets, mit scharfen Rändern, und steigt wie bisher auf.
4. Eine Puppe auf 0 bringen: Rauch steigt auf und vergeht; die Puppe wird grau und steht nach 2 s wieder auf wie bisher.
5. Ins Schadensfeld laufen: Bei jedem Treffer blitzt der Schnitt auch an der Spielfigur.
6. Zwischen beweglichem Ziel und Schadensstreifen Taste 3 (Stun) drücken: Um beide pulsiert der weiße Kreis statt des gelben Rings, 2 s lang, dann ist er weg. Der Ring, mit dem sich der Stun ausbreitet, sieht aus wie bisher.
7. Dynamit werfen: Die Explosion sieht aus wie in M11a und sitzt an derselben Stelle.
8. Ohne Code: in `data/effects/hit.tres` `fps` auf 4 stellen – der Treffer-Schnitt läuft eine Sekunde lang; danach zurück auf 20.
9. Abschalt-Test: in `entities/dummy/training_dummy.tscn` den Knoten `DeathEffect` löschen, F5 – Puppen fallen ohne Rauch, keine roten Fehler. Danach Strg+Z.

**M11a – Inventar-Logik**

- Getestet hat der Nutzer am 17.11.2026 in Godot. Rückmeldung: „okay alles passt“ – die elf Punkte der Prüfliste gelten als bestanden.
- Claude hat die Dateien am Text geprüft: Verweise, Knotenpfade, Signale, exportierte Werte, Klassennamen und das Format der Werte-Dateien. Grundlage war das Repo, Commit `9b6d28a`, plus Claudes Lieferung zu A1.
- Nachgerechnet, nicht ausprobiert: Die Flugbilder und die 9 Explosionsbilder liegen im Blatt und sind nicht leer. Eine Explosion trifft 5 Physik-Schritte lang, jedes Ziel höchstens einmal. Das Puppenpaar steht 20 Pixel auseinander und liegt damit im Umkreis von 24.

**A1 – Figuren-Bild**

- Getestet hat der Nutzer am 17.11.2026 in Godot. Rückmeldung: „Okay das passt alles“ – die Prüfliste gilt als bestanden.
- Claude hat die Dateien am Text geprüft: Verweise, Knotenpfade, Signale, exportierte Werte und Klassennamen. Grundlage war das Repo, Commit `9b6d28a`.
- Nachgerechnet, nicht ausprobiert: Für alle vier Skins hat Claude den Aufbau der Bilder nachgestellt – 56 Animationen in je einer Richtung, jedes Bild liegt im Blatt und ist nicht leer, die Richtungen stimmen. Bild, Schatten und Kollisionsform hat Claude als Probe übereinander gezeichnet: Die Füße stehen auf der Unterkante der 12 × 12 Pixel.

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
| `S1 Geschoss` | Spielfigur | gewähltes Geschoss mit Anzahl und belegte Plätze im Inventar, etwa „Pfeil 30 · Plätze 4/20“, sonst „keins“ (M11a) |
| `S1 Munition` | Spielfigur | Vorrat und Höchstwert; nur ohne `AmmoSelector`, also seit M11a nicht mehr zu sehen |
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
| `ammo_next`, `ammo_previous` | Mausrad runter, Mausrad hoch (M11a) |
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

Genutzt werden bisher: die vier Laufrichtungen, `sprint`, `sneak`, `attack_primary`, `attack_secondary`, `dash`, `ability_1` bis `ability_3`, `ammo_next`, `ammo_previous` und die beiden Entwickler-Tasten.

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
| `IntentSource` | `entities/intent_source.gd` | Knoten: die Absichten einer Figur – `move_direction`, `wants_sprint`, `wants_sneak`, `aim_direction`, `wants_attack`, `wants_dash`, `wants_shoot`, `wants_ability`, `wants_ammo_cycle` (M11a) |
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
| `RangedStats` | `components/ranged_attack/ranged_stats.gd` | Bauplan einer Werte-Datei für einen Fernkampf-Angriff; seit M11a auch Durchschlag, Explosion und Bild |
| `Projectile` | `entities/projectile/projectile.gd` | Geschoss |
| `ProjectileView` | `entities/projectile/projectile_view.gd` | zeigt ein Geschoss mit seinem Bild und spielt seine Explosion ab (M11a) |
| `ProjectileSkin` | `entities/projectile/projectile_skin.gd` | Bauplan: Flugbild, Einzelbilder, Drehung, Explosions-Effekt eines Geschosses (M11a) |
| `EffectData` | `entities/effect/effect_data.gd` | Bauplan einer Werte-Datei für einen kurzen Effekt: Blatt, Bilder, Tempo (M11a) |
| `OneShotEffect` | `entities/effect/one_shot_effect.gd` | spielt einen Effekt ab und verschwindet; `OneShotEffect.spawn(effekt, ort, eltern, winkel, wiederholen)` (M11a; Winkel und Wiederholung seit A2) |
| `EffectCue` | `components/effect_cue/effect_cue.gd` | Baustein: spielt einen Effekt, wenn ein Baustein daneben ein Signal sendet (A2) |
| `ItemData` | `items/item_data.gd` | Bauplan eines Gegenstands: `id`, Name, Art, Symbol, Stapelgröße (M11a) |
| `AmmoData` | `items/ammo_data.gd` | erweitert `ItemData` um `shot`, die Werte des Wurfs (M11a) |
| `Inventory` | `components/inventory/inventory.gd` | Baustein Inventar (M11a) |
| `InventoryStats` | `components/inventory/inventory_stats.gd` | Bauplan einer Werte-Datei fürs Inventar: Plätze, Startinhalt (M11a) |
| `ItemStack` | `components/inventory/item_stack.gd` | ein Gegenstand mit Anzahl, etwa im Startinhalt (M11a) |
| `AmmoSelector` | `components/ammo_selector/ammo_selector.gd` | Baustein: wählt das Geschoss aus dem Inventar (M11a) |
| `Ability` | `abilities/ability.gd` | Grundgerüst jeder Fähigkeit |
| `AbilityStats` | `abilities/ability_stats.gd` | Bauplan einer Werte-Datei für Fähigkeiten: Name, Kosten, Dauer, Abklingzeit |
| `HasteStats` | `abilities/haste/haste_stats.gd` | erweitert `AbilityStats` um `speed_factor` |
| `InvisibilityStats` | `abilities/invisibility/invisibility_stats.gd` | erweitert `AbilityStats` um `alpha` |
| `StunStats` | `abilities/stun/stun_stats.gd` | erweitert `AbilityStats` um `radius` |
| `Stunnable` | `components/stunnable/stunnable.gd` | Baustein: macht ein Ziel betäubbar |
| `CharacterView` | `components/character_view/character_view.gd` | Baustein: zeigt eine Figur mit der Grafik aus einem Skin (A1) |
| `CharacterSkin` | `components/character_view/character_skin.gd` | Bauplan einer Werte-Datei für einen Skin: Bildgröße, Lage, Schatten, Animationen |
| `SkinAnimation` | `components/character_view/skin_animation.gd` | Bauplan einer Animation im Skin: Blatt, erste Zelle, Schritte, Bilder je Sekunde |

### Werte-Dateien – `data/`

| Datei | Bauplan | Werte |
| --- | --- | --- |
| `data/player/movement.tres` | `MovementStats` | `walk_speed` 80, `sprint_speed` 130, `sneak_speed` 40, `acceleration` 600, `friction` 800, `sprint_cost_per_second` 25 |
| `data/player/stamina.tres` | `StaminaStats` | `max_stamina` 100, `regen_per_second` 30, `regen_delay` 0,8, `recover_threshold` 25 |
| `data/player/camera.tres` | `CameraStats` | `mouse_look_factor` 0,15, `mouse_look_max` 40, `move_look_seconds` 0,12, `move_look_max` 24, `smooth_time` 0,2, `min_speed` 24 |
| `data/player/health.tres` | `HealthStats` | `max_health` 100, `invulnerable_time` 0,6 |
| `data/player/sword.tres` | `MeleeStats` | `damage` 10, `gain_per_hit` 10, `start_distance` 6, `reach` 18, `width` 20, `active_time` 0,12, `cooldown` 0,35 |
| `data/player/dash.tres` | `DashStats` | `distance` 64, `duration` 0,2, `invulnerable_time` 0,25, `cooldown` 0,8, `buffer_time` 0,12 |
| `data/player/bow.tres` | `RangedStats` | seit M11a nur noch Rückfall ohne `AmmoSelector`: `damage` 10, `projectile_speed` 220, `max_distance` 240, `spawn_distance` 8, `cooldown` 0,5, `cost` 1 |
| `data/player/ammo.tres` | `SupplyStats` | `max_amount` 12, `regen_per_second` 0, `regen_delay` 1; seit M11a nicht mehr eingehängt |
| `data/player/inventory.tres` | `InventoryStats` | `slot_count` 20; Start: 30 Pfeile, 10 Kunai, 10 Shuriken, 5 Dynamit |
| `data/items/arrow.tres` | `AmmoData` | Pfeil, Stapel 99; Wurf: `damage` 10, `pierce` 1, `projectile_speed` 220, `max_distance` 240, `cooldown` 0,5; Flugbild `FX/Projectile/Arrow.png` |
| `data/items/kunai.tres` | `AmmoData` | Kunai, Stapel 30; Wurf: `damage` 15, `pierce` 1, `projectile_speed` 300, `max_distance` 180, `cooldown` 0,5; Flugbild `FX/Projectile/Kunai.png` |
| `data/items/shuriken.tres` | `AmmoData` | Shuriken, Stapel 30; Wurf: `damage` 6, `pierce` 3, `projectile_speed` 200, `max_distance` 200, `cooldown` 0,4; Flugbild `FX/Projectile/Shuriken.png`, 2 Bilder, `spin` 720 |
| `data/items/dynamite.tres` | `AmmoData` | Dynamit, Stapel 10; Wurf: `damage` 0, `explosion_radius` 24, `explosion_damage` 20, `projectile_speed` 140, `max_distance` 120, `cooldown` 1; Flugbild das Symbol, `spin` 540; Explosion `data/effects/explosion.tres` |
| `data/effects/explosion.tres` | `EffectData` | `FX/Elemental/Explosion/SpriteSheet.png`, 9 Bilder à 40, 15 Bilder je Sekunde |
| `data/effects/sword_slash.tres` | `EffectData` | Hieb (A2): `FX/Attack/SlashCurved/SpriteSheet.png`, 4 Bilder à 32, 20 je Sekunde |
| `data/effects/hit.tres` | `EffectData` | Treffer (A2): `FX/Attack/Cut/SpriteSheet.png`, 4 Bilder à 32, 20 je Sekunde, `offset` (0, −2) |
| `data/effects/death_smoke.tres` | `EffectData` | Tod der Puppen (A2): `FX/Smoke/Smoke/SpriteSheet.png`, 6 Bilder à 32, 12 je Sekunde, `offset` (0, −2) |
| `data/effects/stun.tres` | `EffectData` | Betäubung (A2): `FX/Magic/Circle/SpriteSheetWhite.png`, 4 Bilder à 32, 8 je Sekunde, wiederholt sich |
| `data/player/energy.tres` | `SupplyStats` | `max_amount` 100, `regen_per_second` 0, `regen_delay` 1 |
| `data/abilities/haste.tres` | `HasteStats` | `display_name` Schnelligkeit, `cost` 30, `duration` 4, `cooldown` 6, `speed_factor` 1,5 |
| `data/abilities/invisibility.tres` | `InvisibilityStats` | `display_name` Unsichtbarkeit, `cost` 40, `duration` 5, `cooldown` 8, `alpha` 0,3 |
| `data/abilities/stun.tres` | `StunStats` | `display_name` Stun, `cost` 30, `duration` 2, `cooldown` 6, `radius` 64 |
| `data/dummy/health.tres` | `HealthStats` | `max_health` 50, `invulnerable_time` 0 |
| `data/skins/ninja_green.tres` | `CharacterSkin` | Spielfigur `NinjaGreen`: Bild 32 × 32, `offset` (0, −2), Schatten bei (0, 5), `walk_reference_speed` 80; Stehen 4 Bilder à 5/s, Laufen 4 à 8/s, Hieb 4 à 11/s, Rolle 3 à 15/s, Treffer 2 à 8/s, Tod 2 à 5/s |
| `data/skins/bamboo_yellow.tres` | `CharacterSkin` | feste Übungspuppen, `BambooYellow`: Bild 16 × 16, `offset` (0, −2), Schatten bei (0, 5), `walk_reference_speed` 40; Stehen 1 Bild, Laufen 4 à 6/s; im Tod grau |
| `data/skins/bamboo.tres` | `CharacterSkin` | bewegliches Ziel, `Bamboo`; Werte wie `bamboo_yellow.tres` |
| `data/skins/caveman.tres` | `CharacterSkin` | Probe-Skin `Caveman` für einen Skin-Tausch: Bild 16 × 16; Stehen 1 Bild, Laufen 4 à 8/s, Hieb 1 Bild, Tod 1 Bild; keine Rolle, kein Treffer-Bild |

Tempo in Pixeln pro Sekunde, Strecken in Pixeln, Zeiten in Sekunden; „4 à 8/s“ heißt 4 Bilder, 8 Bilder je Sekunde.

### Bausteine – `components/`

| Baustein | Ordner | Was er tut | Einstellbar |
| --- | --- | --- | --- |
| `PlaceholderView` | `components/placeholder_view/` | Malt die Rechtecke, Kreise und Kapseln der `CollisionShape2D`-Geschwister als Farbfläche. Platzhalter-Grafik; wo ein `CharacterView` daneben ein Bild zeigt, ist sie ausgeblendet und bleibt als Rückfall. | `color` |
| `CharacterView` | `components/character_view/` | Zeigt die Figur mit der Grafik aus einem Skin, in der nächstliegenden von vier Blickrichtungen. Liest den Wert `facing` der Figur, sonst die Laufrichtung, und misst das Tempo am Ort. Hört auf `Health` (Treffer, Tod, Wiederaufstehen), `Dash` und `MeleeAttack`. Blendet das Geschwister `PlaceholderView` aus. Fragt: `has_skin_animation(name)`; liest: `direction`, `current_animation`. | `skin`, `walk_threshold`, `direction_hysteresis`, `min_walk_rate`, `max_walk_rate` |
| `Stamina` | `components/stamina/` | Ausdauer-Vorrat: `spend(amount)` verbraucht und liefert, ob es ging; nach `regen_delay` füllt er sich. Bei 0 gilt `is_exhausted`, bis `recover_threshold` erreicht ist. Meldet `changed`, `exhausted`, `recovered`. | `stats` |
| `Health` | `components/health/` | Leben. `apply_damage(amount)` ist die einzige Stelle, an der über Schaden entschieden wird: Tote und gerade Unverwundbare nehmen keinen. `make_invulnerable(seconds)` schützt für eine Dauer, etwa beim Dash. `reset()` füllt auf, auch nach dem Tod. Meldet `changed`, `damaged`, `died`, `revived`. | `stats` |
| `Hurtbox` | `components/hurtbox/` | `Area2D`, die Treffer annimmt und an das Geschwister `Health` weiterreicht: `receive_hit(damage, direction)`. Meldet `hit_received`. Braucht eine eigene `CollisionShape2D`. | Ebene |
| `Hitbox` | `components/hitbox/` | `Area2D`, die jede berührte `Hurtbox` trifft, solange sie scharf ist: `activate()`, `deactivate()`. Meldet `hit_landed`; entschärft ein Zuhörer sie dabei, trifft sie in diesem Schritt nichts weiter. Braucht eine eigene `CollisionShape2D`. | `damage`, `hit_interval`, `active_on_start`, Maske |
| `MeleeAttack` | `components/melee_attack/` | Nahkampf-Angriff: `try_attack(richtung)` dreht die Trefferzone in die Richtung und macht sie kurz scharf. Zone und Zeiten kommen aus der Werte-Datei. Jeder Treffer füllt das Geschwister `gain_supply_name` um `gain_per_hit` auf. `rate_factor` über 1 verkürzt die Pause. Meldet `attack_started`, `attack_finished`. Das Feld in `swing_color` ist an der Spielfigur seit A2 durchsichtig; dort zeigt `SlashEffect` den Hieb. | `stats`, `target_mask`, `swing_color`, `gain_supply_name` |
| `HitFlash` | `components/hit_flash/` | Lässt den Elternknoten bei Schaden hell aufblitzen; solange er unverwundbar ist, blinkt er. Hört auf das Geschwister `Health`. | `flash_time`, `flash_strength`, `blink_while_invulnerable`, `blink_interval`, `blink_alpha` |
| `DamageNumbers` | `components/damage_numbers/` | Zeigt bei Schaden die Zahl über dem Elternknoten; sie steigt auf und verblasst. Hört auf das Geschwister `Health`. Seit A2 in der Pixel-Schrift `NormalFont`, Größe 9; ohne `font` die Standardschrift. | `color`, `font`, `font_size`, `outline_size`, `rise_distance`, `duration`, `start_offset` |
| `Dash` | `components/dash/` | Kurzer, schneller Satz: `request()` merkt den Tastendruck vor, `try_start(richtung)` startet, sobald es möglich ist; solange `is_dashing` gilt, liefert `get_velocity()` das Tempo. Macht das Geschwister `Health` beim Start kurz unverwundbar. Meldet `dash_started`, `dash_finished`. | `stats` |
| `Supply` | `components/supply/` | Zählbarer Vorrat: `spend(menge)` verbraucht und liefert, ob genug da war; `add(menge)` füllt auf. Mit `regen_per_second` über 0 füllt er sich nach `regen_delay` von selbst. Meldet `changed`. | `stats` |
| `RangedAttack` | `components/ranged_attack/` | Fernkampf-Angriff: `try_shoot(richtung)` bezahlt aus dem Geschwister `supply_name` und bestellt das Geschoss über `projectile_requested`. Liegt ein `AmmoSelector` daneben (M11a), kommen Werte und Kosten von dort, und `stats` und `supply_name` gelten nicht. Ohne `ProjectileSpawner` im Level fällt kein Schuss und nichts wird bezahlt. `rate_factor` über 1 verkürzt die Pause. Meldet `shot_fired`. | `stats`, `projectile_scene`, `target_mask`, `supply_name`, `ammo_name` |
| `Inventory` | `components/inventory/` | Inventar mit begrenzten Plätzen; Gleiches stapelt sich bis zur Stapelgröße. `add(gegenstand, anzahl)` liefert, was keinen Platz fand; `remove(gegenstand, anzahl)` nimmt nur, wenn genug da ist. Die einzige Stelle, die über den Inhalt entscheidet. Lesen: `count()`, `has()`, `get_items()`, `get_slots()`, `get_used_slots()`, `get_slot_count()`. Meldet `changed`, `item_added`, `item_removed`. | `stats` |
| `AmmoSelector` | `components/ammo_selector/` | Wählt das Geschoss: jedes `AmmoData` im Inventar, in der Reihenfolge der Plätze. `cycle(schritt)` wechselt, `get_shot()` liefert die Werte des Wurfs, `consume(anzahl)` nimmt aus dem Inventar. Ist das gewählte aufgebraucht, rückt das nächste nach. Meldet `selection_changed`. | `inventory_name` |
| `PatrolMover` | `components/patrol_mover/` | Lässt seinen Elternknoten zwischen Startpunkt und Startpunkt + `travel` pendeln. Für Dinge, die nichts wegschieben müssen. | `travel`, `speed` |
| `Stunnable` | `components/stunnable/` | Macht seinen Elternknoten betäubbar: `apply_stun(sekunden)`, `is_stunned()`. Solange die Betäubung anhält, ruht der Knoten aus `paused_node`, und um das Ziel pulsiert der weiße Kreis aus seinem Kind `StunEffect` (A2). Der gelbe Ring aus M7 ist durchsichtig gestellt. Steht in der Gruppe `stunnable`. Meldet `stunned`, `recovered`. | `paused_node`, `ring_radius`, `ring_color` |
| `EffectCue` | `components/effect_cue/` | Spielt einen Effekt aus einer Werte-Datei, wenn ein Baustein daneben ein Signal sendet (A2). Liefert das Signal eine Richtung, rückt der Effekt um `distance` dorthin und dreht sich auf Wunsch mit. Mit `stop_signal_name` wiederholt er sich, bis dieses Signal kommt. Er entscheidet nichts. | `effect`, `source_name`, `signal_name`, `stop_signal_name`, `follow`, `use_direction`, `distance` |

Die Bausteine finden das Leben über den Namen: Der Knoten muss genau `Health` heißen und neben ihnen liegen.

### Fähigkeiten – `abilities/`

| Fähigkeit | Ordner | Was sie tut | Einstellbar |
| --- | --- | --- | --- |
| `Ability` | `abilities/` | Grundgerüst: `try_activate()` prüft Bereitschaft und Vorrat, bezahlt und startet die Wirkung; nach `duration` endet sie, dann läuft `cooldown`. Erbende Skripte füllen nur `_begin_effect()` und `_end_effect()`. Meldet `activated`, `finished`. | `stats`, `supply_name` |
| Schnelligkeit | `abilities/haste/` | Setzt bei der Figur `speed_factor` und bei ihren Kindern `rate_factor`: schneller laufen, schlagen und schießen. | `stats` |
| Unsichtbarkeit | `abilities/invisibility/` | Macht das Bild der Figur durchscheinend – jedes Kind aus `view_names`, die es gibt – und stellt sie in die Gruppe `invisible`. Gegner und Bonus-Schaden folgen in Phase 3. | `stats`, `view_names` (Standard: `CharacterView`, `PlaceholderView`) |
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
| `entities/projectile/projectile.tscn` | `projectile.gd` | Geschoss; Kinder `Hitbox` mit `PlaceholderView`, `WorldSensor`, `TargetSensor`, `ExplosionHitbox`, `ProjectileView` |
| `entities/projectile/projectile_spawner.tscn` | `projectile_spawner.gd` | erzeugt alle Geschosse eines Levels |
| `ui/crosshair/crosshair.tscn` | `crosshair.gd` | Fadenkreuz |
| `ui/debug/debug_overlay.tscn` | `debug_overlay.gd` | Debug-Anzeige |
| `components/placeholder_view/placeholder_view.tscn` | `placeholder_view.gd` | Baustein, siehe oben |
| `components/character_view/character_view.tscn` | `character_view.gd` | Baustein, siehe oben; Kinder `Shadow` (`Sprite2D`) und `Sprite` (`AnimatedSprite2D`) |
| `components/inventory/inventory.tscn` | `inventory.gd` | Baustein, siehe oben |
| `components/ammo_selector/ammo_selector.tscn` | `ammo_selector.gd` | Baustein, siehe oben |
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
| `components/stunnable/stunnable.tscn` | `stunnable.gd` | Baustein, siehe oben; Kind `StunEffect` (ein `EffectCue`) |
| `components/effect_cue/effect_cue.tscn` | `effect_cue.gd` | Baustein, siehe oben |
| `abilities/haste/haste.tscn` | `haste.gd` | Fähigkeit, siehe oben |
| `abilities/invisibility/invisibility.tscn` | `invisibility.gd` | Fähigkeit, siehe oben |
| `abilities/stun/stun.tscn` | `stun.gd` | Fähigkeit, siehe oben |
| `ui/debug/setup_check.tscn` | `setup_check.gd` | Setup-Check aus M0; bleibt als Werkzeug |

**Spielfigur im Einzelnen**

- `Player` ist ein `CharacterBody2D` im schwebenden Modus, Ebene `player`, Maske `world` und `enemy`, Gruppe `players`. Körper 12 × 12 Pixel. Bild seit A1: der Ninja aus `data/skins/ninja_green.tres` über `CharacterView`; ohne ihn der grüne Platzhalter mit weißem Punkt in Blickrichtung.
- Kinder: `CollisionShape2D`, `PlaceholderView`, `CharacterView`, `PlayerInput` (ein `IntentSource`, läuft vor der Figur), `Stamina`, `Health`, `Hurtbox` (10 × 10 Pixel, Ebene `player_hurtbox`), `HitFlash`, `MeleeAttack` (sucht auf `enemy_hurtbox`), `Dash`, `Inventory`, `AmmoSelector`, `RangedAttack` (Ziele auf `enemy_hurtbox`), `Energy` (ein `Supply`), `Abilities` mit den Kindern `Haste`, `Invisibility` und `Stun`, dazu seit A2 `SlashEffect` und `HitEffect` (je ein `EffectCue`).
- Die Figur liest nur Absichten. `PlayerInput` füllt sie aus den Aktionen und aus der Mausposition; später kann eine andere Quelle dasselbe tun.
- Blick und Hieb: Die Figur blickt stufenlos in die Zielrichtung, also zur Maus. Solange `attack_primary` gehalten wird, schlägt sie dorthin. Laufen, Sprinten und Schleichen gehen dabei weiter.
- Zustände: Stehen, Laufen, Sprinten, Schleichen, Dash. Schleichen geht vor Sprinten. Sprinten kostet Ausdauer; ohne Vorrat läuft die Figur normal.
- Dash: Ein Druck auf `dash` schnellt die Figur 64 Pixel weit – in Laufrichtung, im Stehen in Blickrichtung. Solange er läuft, lenkt sie nicht, verbraucht keine Ausdauer und beginnt keinen Hieb; ein laufender Hieb geht weiter. Danach läuft sie höchstens mit Lauftempo weiter. Halten der Taste löst keinen zweiten Dash aus.
- Fernkampf: Solange `attack_secondary` gehalten wird, wirft die Figur das gewählte Geschoss in Zielrichtung; jeder Wurf nimmt eins aus dem Inventar, die Pause hängt am Geschoss. Das Mausrad wechselt das Geschoss. Laufen geht dabei weiter; während des Dashs fällt kein Schuss.
- Fähigkeiten: Ein Druck auf `ability_1`, `ability_2` oder `ability_3` setzt das erste, zweite oder dritte Kind von `Abilities` ein. Das geht jederzeit, auch im Dash. Die Figur selbst kennt keine einzelne Fähigkeit; sie bietet nur `speed_factor` an, den die Schnelligkeit setzt.
- Energie: Fähigkeiten bezahlen aus `Energy`. Der Vorrat füllt sich nur durch Schwerttreffer, über `MeleeAttack`.
- Tod: Fällt das Leben auf 0, bleibt die Figur stehen, zeigt das Tod-Bild (der Platzhalter wird grau) und sendet `player_died`. Was dann geschieht, entscheidet das Level.
- Einstellbar: `stats` (Werte-Datei), `player_id`, `defeated_color`. Ohne `PlayerInput` bleibt sie stehen, ohne `Stamina` sprintet sie unbegrenzt, ohne `Health` nimmt sie keinen Schaden, ohne `Hurtbox` ist sie nicht zu treffen, ohne `MeleeAttack` schlägt sie nicht zu, ohne `Dash` dasht sie nicht, ohne `RangedAttack` schießt sie nicht, ohne `Inventory` hat sie nichts zu werfen, ohne `AmmoSelector` schießt sie wie vor M11a mit `bow.tres` kostenlos, ohne `Abilities` hat sie keine Fähigkeiten, ohne `Energy` kosten Fähigkeiten nichts, ohne `CharacterView` zeigt sie den Platzhalter, ohne `SlashEffect` oder `HitEffect` fehlt nur dieser Effekt.
- Einen Zustandsautomaten als Baustein gibt es noch nicht: Der Dash bringt seinen Zeitablauf selbst mit, die Figur fragt nur `is_dashing`. Vorgesehen ist er für den ersten Gegner in M13.

**Kampf im Einzelnen**

- Weg eines Treffers: `Hitbox` berührt `Hurtbox` → `Hurtbox.receive_hit()` → `Health.apply_damage()`. Nur `Health` entscheidet, ob und wie viel Schaden ankommt.
- Schwert: Die Trefferzone ist 18 Pixel lang und 20 breit und beginnt 6 Pixel vor der Mitte der Figur. Sie ist 0,12 s scharf; von Hieb zu Hieb vergehen 0,35 s. Ein Hieb trifft jedes Ziel höchstens einmal, kann aber mehrere Ziele treffen.
- Die Trefferzone wird erst einen Physik-Schritt nach Hiebbeginn ausgewertet, weil Godot Berührungen erst dann kennt.
- Unverwundbarkeit: Nach einem Treffer nimmt die Spielfigur 0,6 s lang keinen Schaden. Das steht als `invulnerable_time` in ihrer Werte-Datei und gilt für jede Schadensquelle. Auch ein Dash schützt, 0,25 s ab seinem Beginn. Solange die Figur unverwundbar ist, blinkt sie.
- Dash: 64 Pixel in 0,2 s, also 12 Physik-Schritte mit Tempo 320. Von Dash zu Dash vergehen 0,8 s. Ein Tastendruck kurz vor Ablauf der Pause bleibt 0,12 s lang vorgemerkt.
- Geschosse seit M11a: Pfeil, Kunai, Shuriken und Dynamit aus dem Inventar, Werte in `data/items/`. Jedes entsteht 8 Pixel vor der Mitte der Figur. Ohne `AmmoSelector` gilt der alte Bogen aus `bow.tres`.
- Geschoss: fliegt geradeaus mit Tempo und Reichweite aus seinen Werten. Es endet, wenn es `pierce` Ziele getroffen hat, an Wänden und Blöcken oder am Ende der Reichweite. Schaden teilt seine `Hitbox` aus, Wände bemerkt sein `WorldSensor` über die Ebene `world`. Den Schützen kann es nicht treffen, weil es nur auf der Ziel-Ebene sucht.
- Explosion (M11a): Hat ein Geschoss `explosion_radius`, bleibt es an seinem Ende 0,1 s liegen; sein `ExplosionHitbox` trifft dann jedes Ziel im Umkreis einmal mit `explosion_damage`, nur auf der Ziel-Ebene. Ohne Aufprall-Schaden (`damage` 0) merkt sein `TargetSensor`, dass es ein Ziel berührt.
- Bild (M11a): `ProjectileView` baut das Flugbild aus `RangedStats.skin`, dreht es um `spin` und blendet den gelben Platzhalter aus. Bei der Explosion spielt es den Effekt über `OneShotEffect` in der Szene ab, unabhängig vom Geschoss.
- Geschosse entstehen an genau einer Stelle: `RangedAttack` bestellt über `projectile_requested`, der `ProjectileSpawner` des Levels baut und startet. Je Level darf es nur einen geben.
- Übungspuppe: fester Körper auf Ebene `enemy`, 12 × 12 Pixel, 50 Leben. Bild seit A1: orange Bambus-Figur aus `data/skins/bamboo_yellow.tres`; der Platzhalter darunter ist violett. Bei 0 wird sie grau und steht nach `revive_delay` (2 s) mit vollem Leben wieder auf. Seit A2 zeigen ihre Kinder `HitEffect` und `DeathEffect` Treffer und Rauch. Einstellbar: `revive_delay`, `alive_color`, `defeated_color` – die Farben gelten nur für den Platzhalter.
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
- Bewegliches Ziel `DummyD`: eine Übungspuppe ohne Kollisions-Ebene, Start bei (592, 72). Ihr `CharacterView` trägt den Skin `bamboo.tres` (grüner Bambus); der Platzhalter wäre türkis. Ihr Kind `PatrolMover` lässt sie mit Tempo 40 um 96 Pixel nach unten und zurück pendeln; ihr Kind `Stunnable` hält den `PatrolMover` bei einer Betäubung an.
- Schadensfeld `DamageZone`: Mitte bei (240, 240).
- Schadensstreifen `DamageStrip`: 16 × 96 Pixel, Mitte bei (528, 120), rechts neben den Puppen; 10 Schaden, gebaut direkt aus `hitbox.tscn`. Er dient dem Test des Dashs. Sein Kind `Stunnable` schaltet ihn bei einer Betäubung ab.
- Die Puppen, `DamageZone`, `DamageStrip`, `PlayerSpawner`, `ProjectileSpawner`, `PlayerCamera`, `Crosshair` und `DebugOverlay` sind eingehängt und lassen sich einzeln löschen.
- `DebugOverlay` blendet hier „Maus“, „Kamera“ und „Raumzeit“ aus.
- F2 und der Tod einer Figur laden die Szene neu, direkt in `test_chamber.gd`. Ab M18 übernimmt das der `SceneManager`.

**Inventar im Einzelnen (M11a)**

- Gegenstände sind Werte-Dateien in `data/items/` mit `id`, Name, Art (Waffen, Rüstung, Verbrauchbares, Schlüssel, Materialien – die Geschosse zählen zu Verbrauchbares), Symbol und Stapelgröße. Zwei Einträge mit derselben `id` gelten als derselbe Gegenstand.
- Neues füllt erst angefangene Stapel derselben Sorte, dann freie Plätze. Entnommen wird vom hintersten Stapel; ein leerer Platz wird frei.
- Die Reihenfolge der Geschosse beim Wechseln ist die der Plätze; der Startinhalt legt sie fest: Pfeil, Kunai, Shuriken, Dynamit.
- Speichern und Laden des Inhalts kommt mit M16, das Inventarfenster und Ausrüstungsplätze mit M11, Aufsammeln und Truhen mit M10.

**Figuren-Bild im Einzelnen (A1)**

- `CharacterView` baut beim Start aus dem Skin die Animationen für alle vier Richtungen, etwa `walk_left`. Die Richtungen folgen der Reihenfolge des Pakets: unten, oben, links, rechts.
- Eine Animation im Skin nennt ihr Blatt, die Zelle des ersten Bildes für „unten“, den Schritt zum nächsten Bild, den Schritt zur nächsten Richtung, die Zahl der Bilder, Bilder je Sekunde und ob sie sich wiederholt. Die Zellgröße gilt für den ganzen Skin.
- Was gezeigt wird, in dieser Rangfolge: Tod, Dash, das letzte einmalige Bild (Hieb oder Treffer), Laufen ab 10 Pixeln pro Sekunde, Stehen.
- Blickrichtung: beim Hieb die Hiebrichtung, beim Dash die Dash-Richtung, sonst `facing` der Figur, bei Figuren ohne `facing` die letzte Laufrichtung. Die alte Richtung bleibt, bis das Ziel 8° über die Diagonale hinaus liegt; im Tod ändert sie sich nicht mehr.
- Tempo der Laufbilder: Tempo der Figur geteilt durch `walk_reference_speed` des Skins, begrenzt auf 0,5 bis 2,5. Beim Spieler: Schleichen 0,5, Laufen 1, Sprinten 1,6.
- Ersatz, wenn dem Skin etwas fehlt: Dash zeigt Laufen, Laufen zeigt Stehen, Tod zeigt Stehen in `defeated_tint`; ohne Hieb- oder Treffer-Bild bleibt das laufende Bild. Ohne Bild zum Stehen gilt der Skin als unbrauchbar: Warnung, Platzhalter bleibt.
- Lage: Die Bildmitte liegt um `offset` neben der Mitte der Figur, die Schattenmitte bei `shadow_center`; beides auf ganzen Pixeln. Bei den gewählten Blättern stehen die Füße so auf der Unterkante der Kollisionsform.
- Abschalten: Knoten löschen oder im Editor ausblenden; dann bleibt der Platzhalter sichtbar. Fällt der Knoten zur Laufzeit weg, holt er den Platzhalter zurück.
- `HitFlash` und Unsichtbarkeit färben weiter über `modulate`; das Bild macht beides mit. Der Tod färbt das Bild selbst über `self_modulate` des Kindes `Sprite`.

**Kampf-Bilder im Einzelnen (A2)**

- Ein `EffectCue` hängt neben einem Baustein und hört auf eines seiner Signale; welcher Effekt, steht in einer Werte-Datei unter `data/effects/`. Er findet den Baustein über `source_name`, leer heißt: der Elternknoten. Signale mit bis zu vier Werten gehen.
- Richtung: Liefert das Signal einen `Vector2`, rückt der Effekt um `distance` Pixel dorthin; mit `use_direction` dreht er sich danach, stufenlos. Gedreht wird um die Bildmitte; das `offset` der Werte-Datei dreht nicht mit.
- Mit `follow` hängt der Effekt am `EffectCue` und läuft mit der Figur; ohne bleibt er in der Szene an seinem Ort und läuft zu Ende, auch wenn die Figur verschwindet. Mit `stop_signal_name` wiederholt er sich, bis dieses Signal kommt.
- Eingehängt: an der Spielfigur `SlashEffect` (Hieb über `MeleeAttack.attack_started`, 8 Pixel vor der Mitte, gedreht) und `HitEffect` (`Hurtbox.hit_received`, gedreht); an der Übungspuppe `HitEffect` und `DeathEffect` (`Health.died`, bleibt am Ort); im `Stunnable` das Kind `StunEffect` (`stunned` bis `recovered`).
- `StunEffect` erbt den Verarbeitungs-Modus des `Stunnable`. So läuft der Kreis auch dort, wo die Betäubung den Elternknoten selbst anhält, etwa beim Schadensstreifen.
- Effekte zeichnen auf Ebene 50 über den Figuren, Schadenszahlen auf Ebene 100 darüber.
- Das gelbe Hieb-Feld und der gelbe Stun-Ring sind nur durchsichtig gestellt (Deckkraft 0 in `swing_color` und `ring_color`). Wer einen Effekt löscht und das alte Bild zurück will, stellt die Deckkraft dort wieder hoch.
- Die Schrift der Schadenszahlen zeichnet Godot mit den Import-Einstellungen, die es für `NormalFont.ttf` angelegt hat; die Glättung ist dort an.
- Effekte entscheiden nichts. Im Mehrspieler zeigt sie jeder Rechner selbst, ausgelöst von denselben Signalen.

**Debug-Anzeige im Einzelnen**

- `CanvasLayer` auf Ebene 100, läuft auch bei pausiertem Spiel. Zeigt FPS, Mausposition im Bild, gedrückte Aktionen und alle gemeldeten Werte.
- Einstellbar: `refresh_interval` (0,1 s), `font_size` (12), `visible_on_start`, `show_mouse`, `hidden_keys`.
- Im Editor zeigt die Testkammer nur die blauen Kollisionsflächen; Farben, Raster und Anzeige erscheinen erst im laufenden Spiel.

### Dateien je Modul

**A2 – Kampf-Bilder**

- Neu: `components/effect_cue/` mit `effect_cue.tscn`, `effect_cue.gd`; `data/effects/sword_slash.tres`, `hit.tres`, `death_smoke.tres`, `stun.tres`
- Geändert: `entities/effect/one_shot_effect.gd` (Winkel, Wiederholung, `offset` dreht nicht mit), `components/damage_numbers/damage_numbers.gd` (`font`) und `damage_numbers.tscn` (`NormalFont`, Größe 9), `components/stunnable/stunnable.tscn` (Kind `StunEffect`, Ring durchsichtig)
- Geändert: `entities/player/player.tscn` (`SlashEffect`, `HitEffect`, Hieb-Feld durchsichtig), `entities/dummy/training_dummy.tscn` (`HitEffect`, `DeathEffect`)
- Geändert: `README.md` (Effekte bei den Bausteinen), `docs/projekt_stand.md`, `docs/asset_katalog.md`

**M11a – Inventar-Logik**

- Neu: `items/item_data.gd`, `items/ammo_data.gd`; `components/inventory/` mit `inventory.tscn`, `inventory.gd`, `inventory_stats.gd`, `item_stack.gd`; `components/ammo_selector/` mit `ammo_selector.tscn`, `ammo_selector.gd`
- Neu: `entities/projectile/projectile_view.gd`, `projectile_skin.gd`; `entities/effect/effect_data.gd`, `one_shot_effect.gd`
- Neu: `data/items/arrow.tres`, `kunai.tres`, `shuriken.tres`, `dynamite.tres`; `data/player/inventory.tres`; `data/effects/explosion.tres`
- Geändert: `components/ranged_attack/ranged_attack.gd` (`ammo_name`, `get_shot()`), `ranged_stats.gd` (Durchschlag, Explosion, Bild), `entities/projectile/projectile.gd` und `projectile.tscn` (Durchschlag, Explosion, drei Kinder dazu)
- Geändert: `autoload/input_setup.gd` (Mausrad), `entities/intent_source.gd` (`wants_ammo_cycle`), `entities/player/player_input.gd` (liest das Mausrad), `entities/player/player.gd` (Geschoss-Wechsel, Debug-Zeile), `entities/player/player.tscn` (`Inventory` und `AmmoSelector` statt `Ammo`)
- Geändert: `README.md` (Ordner, Mausrad), `docs/projekt_stand.md`, `docs/asset_katalog.md`

**A1 – Figuren-Bild**

- Neu: `components/character_view/` mit `character_view.tscn`, `character_view.gd`, `character_skin.gd`, `skin_animation.gd`
- Neu: `data/skins/ninja_green.tres`, `bamboo_yellow.tres`, `bamboo.tres`, `caveman.tres`
- Geändert: `entities/player/player.tscn` (Knoten `CharacterView`), `entities/player/player.gd` (Richtungspunkt nur mit sichtbarem Platzhalter, Kommentar), `entities/dummy/training_dummy.tscn` (Knoten `CharacterView`)
- Geändert: `abilities/invisibility/invisibility.gd` (`view_names` statt `view_name`), `levels/test_chamber/test_chamber.tscn` (Skin `bamboo.tres` für `DummyD`), `levels/test_chamber/test_chamber.gd` (nur der Kommentar)
- Geändert: `docs/projekt_stand.md`, `docs/asset_katalog.md`

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
- Am 17.11.2026 dazu geprüft: `BambooYellow` und die Einzelblätter von `Caveman`; aus den Vorschau-GIFs der `NinjaGreen` die Bildzeiten gelesen. Beides steht im Katalog.

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
| Spielfigur | `Actor/CharacterAnimated/NinjaGreen/Separate/` – Idle, Walk, Attack, Roll, Hit, Dead; 32 × 32 je Bild | geprüft: Spalten = Blick nach unten, oben, links, rechts; Zeilen = Bilder der Animation; eingebaut mit A1 |
| Schwert an der Figur | `Actor/CharacterAnimated/Weapon/Katana.png`, 64 × 64 je Bild | geprüft: gleiches Raster wie `Attack.png`; die Lage über der Figur zeigt erst Godot |
| Hieb-Effekt | `FX/Attack/SlashCurved/SpriteSheet.png`, 4 à 32 | geprüft; eingebaut mit A2 |
| Geschosse | `FX/Projectile/Arrow.png` 13 × 5, `Kunai.png` 14 × 5, `Shuriken.png` 2 à 16; Dynamit fliegt als `Items/Projectile/Dynamite.png`; Explosion `FX/Elemental/Explosion/SpriteSheet.png`, 9 à 40 | geprüft; eingebaut mit M11a |
| Treffer und Tod | `FX/Attack/Cut/SpriteSheet.png`, 4 à 32; `FX/Smoke/Smoke/SpriteSheet.png`, 6 à 32 | geprüft; eingebaut mit A2 |
| Stun-Ring | `FX/Magic/Circle/SpriteSheetWhite.png`, 4 à 32 | geprüft; eingebaut mit A2 |
| Schatten | `Actor/Character/Shadow.png`, 12 × 7 | geprüft; eingebaut mit A1 |
| Übungspuppen | `Actor/Monster/BambooYellow/` für die festen Puppen, `Bamboo/` für das bewegliche Ziel; 4 × 4 à 16 | beide geprüft, BambooYellow am 17.11.2026: orange, gleiches Raster wie Bamboo; eingebaut mit A1 |
| Gegner | `Actor/Monster/<Name>/`, 4 × 4 à 16 | geprüft an Slime: Spalten wie bei den Figuren, Zeilen = Laufbilder |
| NPCs | `Actor/Character/<Name>/SpriteSheet.png`, 4 × 7 à 16, dazu `Faceset.png` | geprüft: Zeilen 1 bis 4 Laufen, 5 Angriff, 6 Sprung, 7 Tod, Gegenstand und zwei Sonderposen |
| Boden und Natur der Steinzeit | `Backgrounds/Tilesets/TilesetFloor.png`, `TilesetNature.png`, `TilesetRelief.png` | gesichtet; Regeln für Übergänge fehlen |
| Wände der Testkammer | `Backgrounds/Tilesets/Interior/TilesetWallSimple.png` | gesichtet: vier Mauer-Rahmen |
| Knöpfe, Platten, Stacheln (M8) | `Backgrounds/Tilesets/TilesetDungeon.png` | gesichtet |
| Kisten, Fässer, Möbel (M9) | `Backgrounds/Tilesets/TilesetElement.png` | gesichtet |
| Truhen (M10) | `Items/Treasure/LittleTreasureChest.png`, `BigTreasureChest.png` | geprüft: je zwei Bilder, zu und offen |
| Leben im HUD | `Ui/Receptacle/Heart.png`, 5 Bilder à 16 | geprüft: leer bis voll in Viertelschritten |
| Fähigkeits-Symbole | `Ui/Skill Icon/Spell/`, 24 × 24 | Camouflage für die Unsichtbarkeit geprüft; Schnelligkeit und Stun noch auszuwählen |
| Schrift | `Ui/Font/NormalFont.ttf` | Probe gerendert: Ziffern, Großbuchstaben und Umlaute da, das ß fehlt; gebaut für 9 Pixel; mit A2 für die Schadenszahlen eingebaut |
| Geräusche | `Audio/Sounds/Whoosh & Slash/`, `Hit & Impact/`, `Magic & Skill/`, `Jump & Bounce/` | nur die Namen; anhören kann nur der Nutzer |
| Musik | `Audio/Musics/`, 41 Stücke, etwa „2 - The Cave“ für die Steinzeit | nur die Namen |

## Gate G1 und Ausblick

Phase 1 ist gebaut. Gate G1 steht an: Fühlt sich die Spielfigur gut an – Bewegen, Zielen, Zuschlagen, Ausweichen? Das beurteilt der Nutzer; nachstellen lässt sich alles ohne Code über die Werte-Dateien in `data/`. Laut E2 wird G1 nach A1 bis A3 beurteilt, wenn die Figur Bild und Ton hat.

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
- Die `README.md` ist seit M11a wieder aktuell: Der Dash steht als Baustein unter `components/dash/`, nicht bei den Fähigkeiten.
- In `hitbox.tscn`, `hurtbox.tscn` und `melee_attack.tscn` zeigt der Editor ein gelbes Warndreieck, weil dort keine Form liegt. Das ist gewollt: Die Form kommt beim Einhängen dazu, beim Schwert beim Start aus der Werte-Datei.
- Godot speichert offene Szenen, sobald F5 das Spiel startet. Wer zum Testen etwas in einer Szene ändert, stellt es danach zurück, bevor er committet.
- Ein neuer Skin ist eine Kopie einer Datei aus `data/skins/` mit anderem Blatt und anderen Zahlen. Die Lage stimmt ohne Änderung, wenn die Figur im Blatt unten steht wie im Paket üblich: bei 32er-Bildern mit den Füßen in Zeile 23, bei 16er-Bildern in Zeile 15, von 0 gezählt.
- `CharacterView` zeigt im Editor nichts, weil es das Bild erst beim Start baut – wie bisher der Platzhalter. Die Lage prüft man im laufenden Spiel.
- Ein neuer Effekt ist eine Kopie einer Datei aus `data/effects/` mit anderem Blatt und anderen Zahlen. Eingehängt wird er mit der Szene `components/effect_cue/effect_cue.tscn` neben dem Baustein, dessen Signal ihn auslösen soll; Signal und Lage stellt man im Inspektor ein.
- `NormalFont` ist für 9 Pixel gebaut. Scharf bleibt sie in Größe 9 und ihren Vielfachen, also 18, 27 und so weiter.

## Offene Punkte

- A2 – Kampf-Bilder: geliefert am 17.11.2026 als `a2_kampf_bilder.zip`, der Test des Nutzers steht aus. Danach schließt Claude A2 ab und schlägt A3 – Ton vor: `AudioManager` füllen, Baustein `SoundCue`, Ton-Tabelle als Werte-Datei, Musik in der Testkammer. Den Plan dazu enthält der Tab „Grafik & Assets“ im Plan-Dokument.
- Der Hieb-Effekt richtet sich nicht von selbst nach der Trefferzone: Ändern sich `start_distance` oder `reach` in `data/player/sword.tres`, ist `distance` am Knoten `SlashEffect` der Spielfigur nachzuziehen. Heute ist es 8, also `start_distance` + 2.
- Grafik, noch ungeprüft – Claude klärt das, bevor ein Schritt es braucht: Lage des Katanas über der Figur (erst wenn das Schwert sichtbar wird); Effekte, die im Katalog „unklar“ heißen (wenn ein Schritt sie braucht); alle Töne, bisher nur die Namen (A3); Übergangsregeln der Kacheln (A4); `TilesetFloor.png` mit 417 Pixeln Höhe, nicht durch 16 teilbar (A4); Symbole für Schnelligkeit und Stun (A5).
- Schießen zeigt kein eigenes Bild der Figur; das Paket hat für die `NinjaGreen` keins. Die Geschosse haben seit M11a ihr Flugbild.
- Wer vor wem gezeichnet wird, richtet sich noch nach der Reihenfolge der Knoten. Eine Sortierung nach Höhe im Bild folgt mit den Kacheln in A4.
- Zauber: „keine eigene Kategorie“ ist nur vorläufig gewählt. Die Entscheidung liegt beim Nutzer.
- Gate G1: Der Nutzer beurteilt nach A1 bis A3, ob sich die Spielfigur gut anfühlt.
- Unsichtbarkeit: Dass Gegner die Figur verlieren und ein Angriff daraus Bonus-Schaden macht, folgt mit den Gegnern in Phase 3.
- Geschosse lassen sich bisher nur mit F2 auffüllen; Nachschub ins Inventar kommt mit Truhen und Beute in M10. Energie aus Fläschchen und Speicherpunkten folgt ebenfalls später.
- Dynamit trifft die Spielfigur nicht. Ob es später auch eigenen Schaden geben soll, entscheidet der Nutzer.
- `data/player/ammo.tres` ist seit M11a nicht mehr eingehängt; `bow.tres` gilt nur noch ohne `AmmoSelector`. Beide bleiben vorerst liegen.
- Die Debug-Anzeige stößt an ihre Grenze; die Leisten und Fähigkeits-Symbole des HUD kommen mit M12.
- Tod & Speichern: Der Neustart des Raums ist vorläufig. Was beim Tod verloren geht und wo gespeichert wird, ist vor M16 zu entscheiden.
- Stottert die Bewegung auf einem Monitor mit mehr als 60 Hz, gibt es dafür die Physik-Interpolation als Projekteinstellung. Sie ist bewusst noch aus.
- Der Sicherungsordner `E:\GitHub\TT_alt` kann gelöscht werden, falls er noch existiert.
- In `components/`, `levels/test_chamber/`, `entities/player/` und `data/` liegt noch je eine `.gitkeep`, die nicht mehr gebraucht wird.
