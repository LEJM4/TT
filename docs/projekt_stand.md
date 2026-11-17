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
| In Arbeit | M12 – HUD: geliefert am 17.11.2026 als `m12_hud.zip`, der Test des Nutzers steht aus |
| Als Nächstes | nach dem Test M12 abschließen – damit ist Phase 2 fertig –, dann Phase 3 mit M13 – Erster Gegner vorschlagen. A4 – Kacheln & Räume spätestens vor Level 1; A3 – Ton auf Wunsch des Nutzers erst fast am Ende des Projekts |
| Zuletzt abgeschlossen | M11 – Inventar & Ausrüstung, am 17.11.2026: Test bestanden. Davor am selben Tag M10 – Truhen & Beute, M9 – Zerstörbares, M8 – Interaktion, A2 – Kampf-Bilder und damit Gate G1, M11a – Inventar-Logik, A1 – Figuren-Bild und A0 – Sichtung & Auswahl, am 16.11.2026 M7 – Fähigkeiten |
| Repo | https://github.com/LEJM4/TT – öffentlich, Zweig `main`; gelesen am 17.11.2026 nach dem Test von M11: Commit `1b7abfc` „m11 inventar“ mit M9, M10 und M11 samt den Stand-Dateien aus `m9_abschluss.zip` und `m10_abschluss.zip`. Der Inhalt stimmt Datei für Datei mit den Lieferungen überein; dazu hat Godot die `.uid`-Dateien der neuen Skripte angelegt. Davor `e615355` mit M8, `e7909b2` mit A2, `369a648` mit A1 und M11a und `9b6d28a` mit M0 bis M7 und den Übergabe-Dateien unter `docs/`; alle Commits unter `LEJM4`. Vor dem Bau von M12 noch einmal gelesen: weiter `1b7abfc`, `m11_abschluss.zip` war noch nicht hochgeladen. Das muss nicht nachgeholt werden: Die Stand-Datei aus `m12_hud.zip` ersetzt alle früheren |

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
- Ein neues Modul beginnt mit einem kurzen Vorschlag im Plan-Dokument und im Chat; gebaut wird nach „weiter“ oder mit den Änderungen des Nutzers.
- Nach einem Test genügt dem Nutzer eine kurze Rückmeldung wie „alles passt, weiter“. Claude schließt das Modul dann ab und legt im selben Zug den Vorschlag für das nächste vor.
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
| | M8 Interaktion | fertig am 17.11.2026 |
| | M9 Zerstörbares | fertig am 17.11.2026 – mit Aufsammeln |
| | M10 Truhen & Beute | fertig am 17.11.2026; Beute-Listen und Aufsammeln kamen schon mit M9 |
| | M11 Inventar & Ausrüstung | fertig am 17.11.2026; die Logik kam mit M11a |
| | M12 HUD | im Test – geliefert am 17.11.2026 |
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
| A2 Kampf-Bilder | Hieb-Effekt, Effekte für Treffer, Tod und Stun; Baustein `EffectCue`; Pixel-Schrift für Schadenszahlen. Die Bilder der Geschosse kamen mit M11a. | vor Phase 2, nach M11a | fertig am 17.11.2026 |
| A3 Ton | `AudioManager` füllen, Baustein `SoundCue`, Ton-Tabelle als Werte-Datei, Musik in der Testkammer | fast am Ende des Projekts, mit Phase 7 – Feinschliff; am 17.11.2026 auf Wunsch des Nutzers verschoben | offen |
| A4 Kacheln & Räume | Kachel-Sets mit Kollision, Testkammer mit Kacheln, Anleitung zum Malen im Editor | mit M8, spätestens vor Level 1 | offen |
| A5 Oberfläche | Schrift und Thema, Herzen, Leisten, Fähigkeits- und Tastensymbole, Dialogfeld | mit M11, M12, M15 und M20 | in Arbeit – mit M11 das Holz-Thema für Fenster, mit M12 Herzen, Energie-Kugel, Ausdauer-Leiste, Fähigkeits- und Tastensymbole; es fehlen Dialogfeld (M15) und Menüs (M20) |
| A6 Gegner, NPCs, Bosse | Skins für Monster, einfache Figuren und Bosse | mit M13 bis M15 | offen |

Ab A1 bringt jedes neue Modul sein Bild gleich mit: M8 aus `TilesetDungeon`, `TilesetHouse` und `TilesetElement`, M9 aus `TilesetElement`, M10 aus `Items/Treasure`, M11 aus `Ui/Theme/Theme Wood` und `Items/Weapons`, M12 aus `Ui/Receptacle`, `Ui/Skill Icon` und `Ui/Input/Keyboard`. Den Ton bekommen alle Module erst mit A3, fast am Ende des Projekts.

**Gates**

- G1 nach Phase 1: Die Spielfigur fühlt sich gut an – Bewegen, Zielen, Zuschlagen, Ausweichen. Bestanden am 17.11.2026, siehe „Gate G1 und Ausblick“.
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
| 17.11.2026 | Wunsch des Nutzers nach dem Test von A2: den Ton (A3) ganz zum Schluss, fast am Ende des Projekts, weil sich bis dahin noch vieles ändert; weiter mit Phase 2. Claude hat A3 zu Phase 7 – Feinschliff gelegt und M8 – Interaktion vorgeschlagen. | A3 verschoben; M8 am 17.11.2026 bestätigt mit der Änderung: nur die Taste E, ohne Wort |
| 17.11.2026 | Im Vorschlag zu M9 hat Claude das Aufsammeln und die Beute-Listen aus M10 nach M9 gezogen, weil zerstörte Dinge sonst nichts fallen lassen könnten. Der Nutzer hat mit „weiter“ bestätigt. M10 bringt damit nur noch die Truhen. | M9 fertig am 17.11.2026 |

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
| E2 Reihenfolge | A1 und A2 vor Phase 2; danach bringt jedes Modul sein Bild gleich mit. Den Ton (A3) gibt es erst fast am Ende des Projekts, mit Phase 7 – Feinschliff | vom Nutzer am 17.11.2026 mit „alle vier ok“ bestätigt; den Ton hat der Nutzer am selben Tag ans Ende verschoben |
| E3 Räume malen | Der Nutzer malt im Godot-Editor; Claude liefert Kachel-Sets mit Kollision und eine Anleitung; den Boden der Testkammer füllt Code | vom Nutzer am 17.11.2026 mit „alle vier ok“ bestätigt |
| E4 Schrift | `NormalFont` aus dem Paket; ihr fehlt das ß, im Spiel steht dafür „ss“ | vom Nutzer am 17.11.2026 mit „alle vier ok“ bestätigt |
| Figuren-Bild | Ein Skin nennt Bildgröße, Lage, Schatten und je Animation Blatt, erste Zelle, Schritte und Bilder je Sekunde; Pflicht ist nur Stehen. Die Füße stehen auf der Unterkante der Kollisionsform: Bild 2 Pixel angehoben, Schattenmitte 5 Pixel unter der Mitte. Gezeigt wird die nächstliegende von vier Richtungen; die alte bleibt bis 8° über die Diagonale hinaus. Laufbilder laufen im Takt des Tempos. Mit Bild entfällt der weiße Richtungspunkt. | von Claude gewählt; vom Nutzer nach dem Test am 17.11.2026 mit „Okay das passt alles“ bestätigt |
| Bild der Übungspuppen | Feste Puppen `BambooYellow` (orange), das bewegliche Ziel `Bamboo` (grün). Sie stehen im ersten Laufbild; das bewegliche Ziel läuft mit Laufbildern; im Tod werden sie grau. | von Claude gewählt; vom Nutzer nach dem Test am 17.11.2026 mit „Okay das passt alles“ bestätigt |
| Unsichtbarkeit und Bild | Durchscheinend werden alle Bild-Knoten der Figur, die in `view_names` stehen: `CharacterView` samt Schatten und der Platzhalter | von Claude gewählt; vom Nutzer nach dem Test am 17.11.2026 mit „Okay das passt alles“ bestätigt |
| Kampf-Bilder | Hieb: Der Bogen `SlashCurved` schwingt vor der Figur in Hiebrichtung, stufenlos gedreht, und deckt die Trefferzone; das gelbe Feld ist unsichtbar. Treffer: Am Getroffenen blitzt der Schnitt `Cut` auf, gedreht in Schlagrichtung – bei Puppen und bei der Spielfigur. Tod: Bei Puppen steigt Rauch auf (`Smoke`); die Spielfigur behält ihr Tod-Bild. Stun: Um jedes betäubte Ziel pulsiert der weiße Kreis (`Circle`) statt des gelben Rings; der Ring, mit dem sich die Fähigkeit ausbreitet, bleibt. Schadenszahlen in `NormalFont`, Größe 9. Jeder Effekt ist ein eigener Knoten und lässt sich einzeln löschen | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „Ja passt“ bestätigt, nach dem Test mit „Alles getestet und alles funktioniert“ |
| Interaktion | Steht die Figur nah an etwas Bedienbarem – ihr Suchkreis reicht 16 Pixel –, erscheint die Taste E aus dem Paket, ohne Wort, über ihrem Kopf. Sind mehrere nah, gilt das nächste; E bedient es | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 bestätigt mit der Änderung „nur die Taste, keine Schrift“. Die Lage über dem Kopf hat Claude beim Bauen gewählt, weil die Taste über einer Tür die Figur verdeckt; über dem Ding geht per Schalter. Nach dem Test vom Nutzer mit „alles passt“ bestätigt |
| Türen und Schalter | Holztür: E öffnet und schließt sie. Gittertore folgen ihrem Kanal und sind offen, solange mindestens ein Schalter darauf an ist. Hebel: E legt ihn um. Druckplatte: gedrückt, solange jemand draufsteht; ihr Kanal bleibt danach 2 Sekunden an. Steht jemand im Durchgang, schließt keine Tür. Offene Türen verschwinden | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „Der Rest passt“ bestätigt, nach dem Test mit „alles passt“ |
| Zerstörbares | Topf 10 Leben (ein Hieb), Kiste 20, Baum 40, Stein 20. Topf, Kiste und Stein verschwinden, der Baum wird zum Stumpf, der weiter aufhält und an dem Pfeile enden. Der Stein nimmt nur Explosionen: Schwert und Geschosse prallen mit einem Funken ab, das Geschoss endet dort. Hiebe auf Zerstörbares füllen keine Energie. Splitter fliegen beim Zerbrechen, beim Baum fallen bei jedem Hieb Blätter. Es kommt nichts wieder, bis F2 den Raum neu lädt | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt; „keine Energie“ und die Blätter je Hieb hat Claude beim Bauen ergänzt. Nach dem Test vom Nutzer mit „Okay das programmierte passt“ bestätigt |
| Beute und Aufsammeln | Topf: mit 50 % 3 Shuriken. Kiste: 5 Pfeile, mit 30 % dazu 2 Kunai. Baum: 2 Äste. Stein: 1 Stein, mit 25 % dazu 1 Dynamit. Äste und Steine sind neue Gegenstände der Art Material, Stapel 99. Die Beute springt zur Seite oder nach vorn auf einen freien Platz, mit Zahl, wenn es mehr als eins ist. Drüberlaufen sammelt ins Inventar; was nicht passt, bleibt liegen | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „Okay das programmierte passt“ |
| Treffer-Arten | Jeder Treffer ist Klinge, Geschoss oder Explosion. Eine Hurtbox nimmt alle drei, außer sie ist anders eingestellt; die übrigen prallen ab | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „Okay das programmierte passt“ |
| Truhen | Kleine Truhe (türkis): E öffnet sie genau einmal, der Deckel geht auf, es funkelt, die Beute springt heraus – 10 Pfeile, mit 50 % dazu 5 Shuriken. Große Truhe (rot): verschlossen; mit einem Goldschlüssel im Inventar öffnet E sie und verbraucht ihn – 15 Pfeile, 5 Kunai, 3 Dynamit. Ohne Schlüssel wackelt sie kurz, und über ihr steht eine Sekunde lang das Symbol des Schlüssels. Offen bleibt eine Truhe, bis der Raum neu lädt. Der Goldschlüssel ist ein Gegenstand der Art Schlüssel, Stapel 9 | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt; das Funkeln beim Öffnen hat Claude beim Bauen ergänzt. Nach dem Test vom Nutzer mit „ja das passt alles“ bestätigt |
| Inventarfenster | Tab öffnet und schließt es, Esc schließt es. Links die vier Ausrüstungsplätze Waffe, Fernkampf, Rüstung, Anhänger, rechts die 20 Plätze als Raster mit Symbol und Anzahl, unten Name, Art und Werte des Gewählten. Ein Klick wählt, ein Doppelklick legt an oder ab. Solange es offen ist, bleibt die Figur stehen und greift nicht an; die Welt läuft weiter. Aussehen: das Holz-Thema des Pakets, Schrift `NormalFont` | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt; Esc zum Schließen hat Claude beim Bauen ergänzt. Nach dem Test vom Nutzer mit „alles klappt“ bestätigt |
| Ausrüstung | Angelegtes liegt nicht im Inventar; beim Anlegen wandert das Vorige zurück, Ablegen geht nur mit Platz im Inventar. Waffe: bringt die Werte des Schwerthiebs mit; ohne Waffe gelten die aus `sword.tres`. Fernkampf: mehr Aufprall-Schaden für jedes Geschoss. Rüstung: zieht von jedem Treffer etwas ab, mindestens 1 bleibt. Anhänger: mehr Leben, das aktuelle Leben bleibt. Zum Testen: Katana (beim Start angelegt, 10 Schaden, 0,35 s), Breitschwert (15, 0,5 s), Bogen (+3), Lederrüstung (−3), Rubin-Anhänger (+20 Leben) | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „alles klappt“ |
| HUD | Oben links die Energie als Kugel, die sich von unten blau füllt; rechts daneben das Leben als Herzen – ein Herz sind 20 Leben, in Vierteln, solange Leben übrig ist mindestens ein Viertel –; darunter die Ausdauer als schmale Leiste, grün, rot während der Erschöpfung. Unten links die Fähigkeiten 1 bis 3 mit der Taste darunter – Stiefel, Tarnung, Blitz-Buch –: orange umrahmt, solange sie wirken, grau mit Füllung im Uhrzeigersinn in der Abklingzeit, grau ohne genug Energie; daneben das gewählte Geschoss mit seiner Anzahl. Die Debug-Anzeige steht oben rechts. Keine Zahlen an Kugel und Leiste | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt; Test steht aus |

Noch offen, jeweils fällig vor dem genannten Schritt: Zauber (vorläufig gewählt, siehe oben), Tod & Speichern endgültig (M16), Story (Phase 5), Anzahl Level (Phase 6).

## Prüfungen

**M12 – HUD**

- Geliefert am 17.11.2026 als `m12_hud.zip`. Der Test des Nutzers steht aus; die Prüfliste steht darunter und im Plan-Dokument.
- Claude hat die Dateien am Text geprüft: Verweise in Szenen und Werte-Dateien, Knotenpfade, Signale und ihre Werte, exportierte Werte, Klassennamen und die Eigenschaften von `TextureProgressBar`, `NinePatchRect` und `HBoxContainer`. Grundlage war das Repo, Commit `1b7abfc`.
- Nachgerechnet, nicht ausprobiert: Das HUD hat Claude mit den Bildern des Pakets als Bild nachgestellt, auch Zwischenstände – 70 von 120 Leben sind drei volle und ein halbes von sechs Herzen, 30 Energie füllen 7 der 22 Pixel der Kugel, 20 Ausdauer 12 der 62 Pixel der Leiste. Alles liegt auf ganzen Pixeln: die Kugel bei (4, 4), die Herzen ab (38, 6), die Leiste bei (39, 25), unten die Symbole ab (4, 228), 24 Pixel groß mit 4 Pixeln Abstand, die Tasten 1 Pixel darunter, die Geschoss-Zelle bei (90, 228).

Prüfliste M12:

1. Godot schließen, `m12_hud.zip` nach `E:\GitHub\TT` entpacken, Godot öffnen, F5. Keine roten Fehler. Oben links die blaue Kugel und fünf volle Herzen, darunter die grüne Leiste; unten links drei farbige Symbole mit den Tasten 1, 2, 3 darunter, daneben eine Zelle mit dem Pfeil und 30. Die Debug-Anzeige steht oben rechts; F1 blendet sie aus und ein.
2. Ins rote Schadensfeld stellen: Je Treffer verschwindet ein halbes Herz. F1 „S1 Leben“ passt dazu – bei 70 sind es drei volle und ein halbes Herz.
3. Shift halten und laufen: Die Leiste sinkt. Ist sie leer, wird sie rot; nach kurzer Pause füllt sie sich wieder und wird ab einem Viertel grün.
4. Taste 1: Der Stiefel bekommt einen orangen Rahmen, die Kugel sinkt um knapp ein Drittel. Nach 4 s verschwindet der Rahmen; der Stiefel ist grau und füllt sich in 6 s im Uhrzeigersinn wieder mit Farbe.
5. Gleich danach Taste 2 und Taste 3: Die Kugel ist leer. Sind die Abklingzeiten vorbei, bleiben alle drei Symbole grau.
6. Abklingzeiten abwarten, dann Hiebe auf eine Übungspuppe: Jeder Treffer füllt die Kugel um ein Zehntel. Ab drei Treffern werden Stiefel und Blitz-Buch farbig, ab vier auch die Tarnung.
7. Mausrad: Die Zelle wechselt zu Kunai, Shuriken, Dynamit und zurück zum Pfeil, jeweils mit Anzahl. Rechtsklick: Die Zahl sinkt um 1.
8. Rubin-Anhänger unter den Startpunkten aufsammeln und anlegen (Tab, Doppelklick): 6 Herzen, das sechste leer. Ablegen: wieder 5.
9. Im Schadensfeld bleiben bis zum Tod: Alle Herzen sind leer; nach einer Sekunde startet der Raum neu, und das HUD ist wieder voll.
10. Ohne Code: in `data/ui/hud.tres` `health_per_heart` auf 10 stellen, F5 – 10 Herzen, ein Treffer nimmt ein ganzes. Danach zurück auf 20.
11. Abschalt-Test: in `entities/player/player.tscn` den Knoten `Energy` löschen, F5 – die Kugel fehlt, die drei Symbole bleiben farbig, weil die Fähigkeiten nichts kosten; keine roten Fehler. Danach Strg+Z und Strg+S.
12. Abschalt-Test: in `levels/test_chamber/test_chamber.tscn` den Knoten `Hud` löschen, F5 – alles läuft wie vor M12, keine roten Fehler. Danach Strg+Z und Strg+S.

**M11 – Inventar & Ausrüstung**

- Getestet hat der Nutzer am 17.11.2026 in Godot. Rückmeldung: „alles klappt“ – die zwölf Punkte der Prüfliste gelten als bestanden, auch Esc zum Schließen. Danach hat er M9, M10 und M11 in einem Commit hochgeladen.
- Claude hat die Dateien am Text geprüft: Verweise in Szenen, Werte-Dateien und im Thema, Knotenpfade, Signale und ihre Werte, exportierte Werte, Klassennamen. Grundlage war das Repo, Commit `e615355`, und die Dateien aus `m9_zerstoerbares.zip` und `m10_truhen.zip`.
- Nachgerechnet, nicht ausprobiert: Das Fenster hat Claude mit den Bildern des Holz-Themas und der Schrift als Bild nachgestellt – 268 × 196 Pixel in der Mitte der Spielfläche, Zellen 26 Pixel, Raster 5 × 4. Alles passt hinein, auch das 24 Pixel große Rüstungs-Symbol. Werte: Breitschwert 15 statt 10; Pfeil mit Bogen 13, Kunai 18, Shuriken 9; Schadensfeld mit Rüstung 7 statt 10; Leben mit Anhänger 100 von 120.

**M10 – Truhen & Beute**

- Getestet hat der Nutzer am 17.11.2026 in Godot. Rückmeldung: „ja das passt alles“ – die zwölf Punkte der Prüfliste gelten als bestanden, auch das Funkeln.
- Claude hat die Dateien am Text geprüft: Verweise in Szenen und Werte-Dateien, Knotenpfade der geerbten Szenen, Signale und ihre Werte, Ebenen und Masken, exportierte Werte, Klassennamen. Grundlage war das Repo, Commit `e615355`, und die Dateien aus `m9_zerstoerbares.zip`.
- Nachgerechnet, nicht ausprobiert: Truhen, Funkeln und Schlüssel-Symbol hat Claude als Bild nachgestellt. Beide Truhen stehen mit der Unterkante auf derselben Linie; das Funkeln sitzt über dem Deckel, das Schlüssel-Symbol 16 Pixel über der Mitte. Die Truhen stehen unter dem langen Balken, 64 Pixel auseinander; der Schlüssel liegt mitten im linken Raum der Interaktions-Ecke.

**M9 – Zerstörbares**

- Getestet hat der Nutzer am 17.11.2026 in Godot. Rückmeldung: „Okay das programmierte passt“ – die zwölf Punkte der Prüfliste gelten als bestanden, auch die drei Dinge, die Claude beim Bauen selbst entschieden hat.
- Claude hat die Dateien am Text geprüft: Verweise in Szenen und Werte-Dateien, Knotenpfade der geerbten Szenen, Signale und ihre Werte, Ebenen und Masken, exportierte Werte, Klassennamen. Grundlage war das Repo, Commit `e7909b2`, und die Dateien aus `m8_interaktion.zip`.
- Nachgerechnet, nicht ausprobiert: Das Feld hat Claude als Bild nachgestellt – alles im 16er-Raster, mindestens 32 Pixel Abstand, nur die beiden Kisten stehen Kante an Kante. Die Splitter hat Claude als Bildfolge nachgerechnet: Sie steigen etwa 8 Pixel, fliegen bis zu 25 Pixel zur Seite und sind nach gut einer halben Sekunde weg; die Blätter schweben gut eine Sekunde. Eine Explosion mit 24 Pixeln Radius an der Kante der einen Kiste erreicht auch die andere. Beute landet 10 bis 18 Pixel vom Ding entfernt.

**M8 – Interaktion**

- Getestet hat der Nutzer am 17.11.2026 in Godot. Rückmeldung: „alles passt“ – die elf Punkte der Prüfliste gelten als bestanden, auch die Taste über dem Kopf.
- Claude hat die Dateien am Text geprüft: Verweise, Knotenpfade, Signale, Ebenen und Masken, exportierte Werte, Klassennamen und das Format der Werte-Dateien. Grundlage war das Repo, Commit `e7909b2`.
- Nachgerechnet, nicht ausprobiert: Die Ecke hat Claude als Bild nachgestellt – Wände, Türen, Hebel und Platten liegen im 16er-Raster, die Durchgänge sind 16 Pixel breit für die 12 Pixel breite Figur, die Taste sitzt 2 Pixel über dem Kopf. Von der äußeren Platte bis in den Raum sind es 94 Pixel, zu Fuß gut 1,2 Sekunden; das Tor bleibt 2 Sekunden offen.

**A2 – Kampf-Bilder**

- Getestet hat der Nutzer am 17.11.2026 in Godot. Rückmeldung: „Alles getestet und alles funktioniert“ – die neun Punkte der Prüfliste gelten als bestanden.
- Claude hat die Dateien am Text geprüft: Verweise, Knotenpfade, Signale und ihre Werte, exportierte Werte, Klassennamen und das Format der Werte-Dateien. Grundlage war das Repo, Commit `369a648`.
- Nachgerechnet, nicht ausprobiert: Alle Bilder der vier Effekte liegen im Blatt und sind nicht leer. Die Sichel des Hiebs liegt im Bild rechts der Mitte, in den Spalten 14 bis 31; um 8 Pixel vorgerückt deckt sie 6 bis 24 Pixel vor der Figur – genau die Trefferzone des Schwerts. Die Schrift ist für 9 Pixel gebaut; in Größe 9 fällt jeder Schrift-Pixel auf einen Bild-Pixel.

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
| `EventBus` | `autoload/event_bus.gd` | aktiv, 8 Meldungen |
| `InputSetup` | `autoload/input_setup.gd` | aktiv; legt die Aktionen an, `all_actions()` liefert ihre Namen |
| `GameState` | `autoload/game_state.gd` | leer, wird in M16 und M19 gefüllt |
| `SaveManager` | `autoload/save_manager.gd` | leer, wird in M16 gefüllt |
| `SceneManager` | `autoload/scene_manager.gd` | leer, wird in M18 gefüllt |
| `AudioManager` | `autoload/audio_manager.gd` | leer, wird mit A3 – Ton gefüllt, fast am Ende des Projekts |

### Meldungen im EventBus

| Meldung | Werte | Zweck |
| --- | --- | --- |
| `setup_checked` | `source: String` | Testmeldung für den Setup-Check in M0 |
| `debug_value_changed` | `key: String`, `value: String` | Ein Modul meldet einen Wert für die Debug-Anzeige; ein leerer Wert entfernt den Eintrag |
| `camera_bounds_changed` | `bounds: Rect2` | Ein Level meldet seine Grenzen; Kameras bleiben innerhalb |
| `player_died` | `player_id: int` | Das Leben einer Spielfigur ist auf 0 gefallen; was dann geschieht, entscheidet das Level |
| `projectile_requested` | `scene: PackedScene`, `origin: Vector2`, `direction: Vector2`, `stats: Resource`, `target_mask: int` | Jemand schießt; der `ProjectileSpawner` des Levels erzeugt das Geschoss. `stats` ist ein `RangedStats` |
| `switch_changed` | `channel: StringName`, `switch_id: int`, `is_on: bool` | Ein Schalter – Hebel oder Druckplatte – meldet, ob er an ist; `switch_id` ist seine Instanz-Kennung. Türen mit demselben Kanal sind offen, solange mindestens einer an ist (M8) |
| `loot_requested` | `item: Resource`, `amount: int`, `origin: Vector2` | Ein Ding lässt Beute fallen; der `LootSpawner` des Levels legt sie hin. `item` ist ein `ItemData`, `origin` der Ort, von dem sie wegspringt (M9) |
| `menu_changed` | `player_id: int`, `is_open: bool` | Ein Menü einer Spielfigur ist auf- oder zugegangen, bisher das Inventarfenster. Solange es offen ist, meldet ihr `PlayerInput` keine Absichten; die Welt läuft weiter (M11) |

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
| `S1 Beute` | `Collector` der Spielfigur | zuletzt Aufgesammeltes, etwa „+5 × Pfeil (jetzt 35)“, oder „Ast: Inventar voll“ (M9) |
| `Kamera` | Kamera | Bildmitte in der Welt |

Der Hinweis „Neustart: F2“ ist mit M4 entfallen; F2 gilt weiter. In der Testkammer sind seit M7 die Zeilen „Maus“, „Kamera“ und „Raumzeit“ ausgeblendet, damit die Anzeige bei elf Zeilen bleibt; seit M9 kommt „S1 Beute“ dazu, sobald etwas aufgesammelt wurde. Einschalten lassen sie sich im Inspektor des Knotens `DebugOverlay` über `show_mouse` und `hidden_keys`.

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

Genutzt werden bisher: die vier Laufrichtungen, `sprint`, `sneak`, `attack_primary`, `attack_secondary`, `dash`, `ability_1` bis `ability_3`, `ammo_next`, `ammo_previous`, `interact` (M8), `inventory` (Tab, M11), `pause` (Esc schließt das Inventarfenster, M11) und die beiden Entwickler-Tasten.

### Kollisions-Ebenen

| Ebene | Name | Wer liegt darauf |
| --- | --- | --- |
| 1 | `world` | Wände und Blöcke der Testkammer, seit M8 auch geschlossene Türen und Hebel, seit M9 Baumstümpfe, seit M10 Truhen; Geschosse enden an ihnen |
| 2 | `player` | Spielfigur; ihre Maske ist `world` und `enemy`. Druckplatten und Türdurchgänge bemerken sie hier (M8) |
| 3 | `enemy` | Übungspuppen als feste Körper, seit M9 auch Zerstörbares, solange es heil ist – Geschosse treffen es über die Hurtbox, statt daran zu enden; das bewegliche Ziel liegt auf keiner Ebene und lässt sich durchlaufen. Druckplatten und Türdurchgänge bemerken auch diese Ebene (M8) |
| 4 | `player_hurtbox` | `Hurtbox` der Spielfigur; Schadensfeld und Schadensstreifen suchen hier |
| 5 | `enemy_hurtbox` | `Hurtbox` der Übungspuppen und, seit M9, von Zerstörbarem; Schwert und Geschosse suchen hier |
| 6 | `interactable` | `Interactable` von Holztür und Hebel; der `Interactor` der Spielfigur sucht hier (M8) |
| 7 | `pickup` | Beute am Boden (`Pickup`); der `Collector` der Spielfigur sucht hier (M9) |

Trefferzonen sind `Area2D`: Eine `Hurtbox` liegt auf ihrer Ebene und sucht selbst nichts. Eine `Hitbox` liegt auf keiner Ebene und sucht über ihre Maske.

### Gruppen

| Gruppe | Mitglieder | Wer sie nutzt |
| --- | --- | --- |
| `player_spawn` | Startpunkte im Level (`Marker2D`) | `PlayerSpawner` |
| `players` | jede Spielfigur | `PlayerCamera`, `InventoryWindow` (M11), `Hud` (M12); später Gegner |
| `invisible` | Figuren, solange ihre Unsichtbarkeit wirkt | noch niemand; ab Phase 3 die Wahrnehmung der Gegner |
| `stunnable` | jeder Baustein `Stunnable` | die Fähigkeit Stun |

### Globale Klassen (`class_name`)

| Klasse | Datei | Art |
| --- | --- | --- |
| `IntentSource` | `entities/intent_source.gd` | Knoten: die Absichten einer Figur – `move_direction`, `wants_sprint`, `wants_sneak`, `aim_direction`, `wants_attack`, `wants_dash`, `wants_shoot`, `wants_ability`, `wants_ammo_cycle` (M11a), `wants_interact` (M8) |
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
| `Interactable` | `components/interactable/interactable.gd` | Baustein: macht ein Ding mit E bedienbar (M8) |
| `Interactor` | `components/interactor/interactor.gd` | Baustein: findet das nächste bedienbare Ding und bedient es; zeigt die Taste E (M8) |
| `InteractorStats` | `components/interactor/interactor_stats.gd` | Bauplan einer Werte-Datei für den Interactor: Reichweite (M8) |
| `PropView` | `components/prop_view/prop_view.gd` | Baustein: zeigt ein Ding der Welt mit zwei Bildern, aus und an (M8) |
| `PropSkin` | `components/prop_view/prop_skin.gd` | Bauplan einer Werte-Datei für PropView: Blatt, Zellgröße, Zelle für aus und für an (M8) |
| `Door` | `world/door/door.gd` | Tür oder Gittertor (M8) |
| `Lever` | `world/lever/lever.gd` | Hebel (M8) |
| `PressurePlate` | `world/pressure_plate/pressure_plate.gd` | Druckplatte (M8) |
| `Destructible` | `world/destructible/destructible.gd` | Ding, das Treffer zerstören: Topf, Kiste, Baum, Stein (M9) |
| `DebrisData` | `entities/debris/debris_data.gd` | Bauplan einer Werte-Datei für Splitter: Streifen, Anzahl, Tempo, Zug nach unten, Drehung, Größe, Färbung (M9) |
| `Debris` | `entities/debris/debris.gd` | Splitter, die einmal auseinanderfliegen; `Debris.spawn(werte, ort, eltern)` (M9) |
| `DebrisCue` | `components/debris_cue/debris_cue.gd` | Baustein: lässt Splitter fliegen, wenn ein Baustein daneben ein Signal sendet (M9) |
| `LootEntry` | `items/loot_entry.gd` | eine Zeile einer Beute-Liste: Gegenstand, Anzahl, Wahrscheinlichkeit (M9) |
| `LootTable` | `items/loot_table.gd` | Beute-Liste; `roll()` würfelt jede Zeile einmal (M9) |
| `LootDropper` | `components/loot_dropper/loot_dropper.gd` | Baustein: würfelt die Beute-Liste auf ein Signal und bestellt die Beute (M9) |
| `Pickup` | `entities/pickup/pickup.gd` | Gegenstand am Boden, der aufgesammelt werden kann (M9) |
| `Collector` | `components/collector/collector.gd` | Baustein an der Figur: sammelt Beute ins Inventar (M9) |
| `Chest` | `world/chest/chest.gd` | Truhe: öffnet sich mit E genau einmal, auf Wunsch nur mit Schlüssel (M10) |
| `EquipmentData` | `items/equipment_data.gd` | erweitert `ItemData`: Platz (Waffe, Fernkampf, Rüstung, Anhänger) und Werte – `melee`, `projectile_damage_bonus`, `armor`, `max_health_bonus`; `describe()` liefert den Text fürs Fenster (M11) |
| `Equipment` | `components/equipment/equipment.gd` | Baustein: die Ausrüstung einer Figur (M11) |
| `EquipmentStats` | `components/equipment/equipment_stats.gd` | Bauplan einer Werte-Datei für Equipment: was beim Start angelegt ist (M11) |
| `HudStats` | `ui/hud/hud_stats.gd` | Bauplan der Werte-Datei des HUD: Leben je Herz (M12) |

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
| `data/player/interactor.tres` | `InteractorStats` | `reach` 16 (M8) |
| `data/player/equipment.tres` | `EquipmentStats` | beim Start angelegt: Katana (M11) |
| `data/items/katana.tres` | `EquipmentData` | Katana, Waffe, Werte `data/player/sword.tres`; Symbol `Items/Weapons/Katana/Sprite.png` (M11) |
| `data/items/broadsword.tres` | `EquipmentData` | Breitschwert, Waffe: `damage` 15, `cooldown` 0,5, sonst wie `sword.tres`; Symbol `Items/Weapons/BigSword/Sprite.png` (M11) |
| `data/items/bow.tres` | `EquipmentData` | Bogen, Fernkampf: `projectile_damage_bonus` 3; Symbol `Items/Weapons/Bow/Sprite.png` (M11) |
| `data/items/leather_armor.tres` | `EquipmentData` | Lederrüstung, Rüstung: `armor` 3; Symbol `Ui/Skill Icon/Items & Weapon/Armor.png`, 24 × 24 (M11) |
| `data/items/ruby_charm.tres` | `EquipmentData` | Rubin-Anhänger, Anhänger: `max_health_bonus` 20; Symbol `Items/Resource/GemRed.png` (M11) |
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
| `data/abilities/haste.tres` | `HasteStats` | `display_name` Schnelligkeit, `cost` 30, `duration` 4, `cooldown` 6, `speed_factor` 1,5; Symbol `Ui/Skill Icon/Items & Weapon/Boot.png` mit `BootDisabled.png` (M12) |
| `data/abilities/invisibility.tres` | `InvisibilityStats` | `display_name` Unsichtbarkeit, `cost` 40, `duration` 5, `cooldown` 8, `alpha` 0,3; Symbol `Ui/Skill Icon/Spell/Camouflage.png` mit `CamouflageDisabled.png` (M12) |
| `data/abilities/stun.tres` | `StunStats` | `display_name` Stun, `cost` 30, `duration` 2, `cooldown` 6, `radius` 64; Symbol `Ui/Skill Icon/Spell/BookThunder.png` mit `BookThunderDisabled.png` (M12) |
| `data/ui/hud.tres` | `HudStats` | `health_per_heart` 20 (M12) |
| `data/dummy/health.tres` | `HealthStats` | `max_health` 50, `invulnerable_time` 0 |
| `data/skins/ninja_green.tres` | `CharacterSkin` | Spielfigur `NinjaGreen`: Bild 32 × 32, `offset` (0, −2), Schatten bei (0, 5), `walk_reference_speed` 80; Stehen 4 Bilder à 5/s, Laufen 4 à 8/s, Hieb 4 à 11/s, Rolle 3 à 15/s, Treffer 2 à 8/s, Tod 2 à 5/s |
| `data/skins/bamboo_yellow.tres` | `CharacterSkin` | feste Übungspuppen, `BambooYellow`: Bild 16 × 16, `offset` (0, −2), Schatten bei (0, 5), `walk_reference_speed` 40; Stehen 1 Bild, Laufen 4 à 6/s; im Tod grau |
| `data/skins/bamboo.tres` | `CharacterSkin` | bewegliches Ziel, `Bamboo`; Werte wie `bamboo_yellow.tres` |
| `data/skins/caveman.tres` | `CharacterSkin` | Probe-Skin `Caveman` für einen Skin-Tausch: Bild 16 × 16; Stehen 1 Bild, Laufen 4 à 8/s, Hieb 1 Bild, Tod 1 Bild; keine Rolle, kein Treffer-Bild |
| `data/skins/door_wood.tres` | `PropSkin` | Holztür (M8): `TilesetHouse.png`, zu (2,3), offen kein Bild |
| `data/skins/gate_bars.tres` | `PropSkin` | Gittertor (M8): `TilesetElement.png`, zu (1,11), offen kein Bild |
| `data/skins/lever.tres` | `PropSkin` | Hebel (M8): `TilesetDungeon.png`, aus (3,3) rot, an (4,3) blau |
| `data/skins/pressure_plate.tres` | `PropSkin` | Druckplatte (M8): `TilesetDungeon.png`, oben (2,1), gedrückt (3,1) |
| `data/skins/pot.tres` | `PropSkin` | Topf (M9): `TilesetElement.png`, heil (1,0), zerstört kein Bild |
| `data/skins/crate.tres` | `PropSkin` | Kiste (M9): `TilesetElement.png`, heil (0,0), zerstört kein Bild |
| `data/skins/rock.tres` | `PropSkin` | Stein (M9): `TilesetNature.png`, heil (17,17), zerstört kein Bild |
| `data/skins/tree.tres` | `PropSkin` | Baum (M9): `TilesetNature.png`, Zellen à 32, heil (0,0) Baum, zerstört (1,4) Stumpf; `offset` (0, −12), damit der Fuß des Stamms auf der Mitte steht |
| `data/destructibles/pot_health.tres` | `HealthStats` | `max_health` 10, `invulnerable_time` 0 (M9) |
| `data/destructibles/crate_health.tres` | `HealthStats` | `max_health` 20 (M9) |
| `data/destructibles/tree_health.tres` | `HealthStats` | `max_health` 40 (M9) |
| `data/destructibles/rock_health.tres` | `HealthStats` | `max_health` 20 (M9) |
| `data/loot/pot.tres` | `LootTable` | 3 Shuriken, Wahrscheinlichkeit 0,5 (M9) |
| `data/loot/crate.tres` | `LootTable` | 5 Pfeile immer; 2 Kunai mit 0,3 (M9) |
| `data/loot/tree.tres` | `LootTable` | 2 Äste immer (M9) |
| `data/loot/rock.tres` | `LootTable` | 1 Stein immer; 1 Dynamit mit 0,25 (M9) |
| `data/items/branch.tres` | `ItemData` | Ast, Art Material, Stapel 99, Symbol `Items/Resource/Branch.png` (M9) |
| `data/items/stone.tres` | `ItemData` | Stein, Art Material, Stapel 99, Symbol `Items/Resource/Rock.png` (M9) |
| `data/effects/spark.tres` | `EffectData` | Funke beim Abprallen (M9): `FX/Particle/Spark.png`, 7 Bilder à 10 × 8, 24 je Sekunde |
| `data/effects/debris_pot.tres` | `DebrisData` | Scherben (M9): `FX/Particle/Vase.png`, 6 Stücke; 7 Splitter, 0,55 s, Tempo 50 bis 90, Streuung 70°, Zug 320, Bremsen 30, Drehung 420, Größe 0,6 bis 0,9 |
| `data/effects/debris_crate.tres` | `DebrisData` | Holzsplitter (M9): `FX/Particle/Wood.png`, 6 Stücke; 8 Splitter, 0,6 s, Tempo 50 bis 95, sonst wie die Scherben, Drehung 360 |
| `data/effects/debris_rock.tres` | `DebrisData` | Steinbrocken (M9): `FX/Particle/RockGray.png`, 5 Stücke; 8 Splitter, 0,6 s, Tempo 55 bis 100, Zug 340, Größe 0,5 bis 0,8, Färbung (0,67; 0,84; 1) ins Graugrüne des Steins |
| `data/effects/debris_tree.tres` | `DebrisData` | Blätter beim Fällen (M9): `FX/Particle/Leaf.png`, 6 Stücke; 12 Blätter, 1,1 s, Tempo 15 bis 55, in alle Richtungen, Zug 50 |
| `data/effects/debris_tree_hit.tres` | `DebrisData` | Blätter je Hieb (M9): wie oben, 3 Blätter, 0,9 s, Tempo 10 bis 30 |
| `data/effects/debris_tree_wood.tres` | `DebrisData` | Holzsplitter beim Fällen (M9): `FX/Particle/Wood.png`; 6 Splitter, Größe 0,5 bis 0,8 |
| `data/effects/chest_sparkle.tres` | `EffectData` | Funkeln beim Öffnen einer Truhe (M10): `FX/Magic/Spark/SpriteSheet.png`, 10 Bilder à 27 × 35, 12 je Sekunde, `offset` (0, −10) |
| `data/skins/chest_small.tres` | `PropSkin` | kleine Truhe (M10): `Items/Treasure/LittleTreasureChest.png`, Zellen à 16 × 16, zu (0,0), offen (1,0) |
| `data/skins/chest_big.tres` | `PropSkin` | große Truhe (M10): `Items/Treasure/BigTreasureChest.png`, Zellen à 16 × 14, zu (0,0), offen (1,0); `offset` (0, 1), damit die Unterkante wie bei der kleinen liegt |
| `data/loot/chest_small.tres` | `LootTable` | 10 Pfeile immer; 5 Shuriken mit 0,5 (M10) |
| `data/loot/chest_big.tres` | `LootTable` | 15 Pfeile, 5 Kunai, 3 Dynamit, alle immer (M10) |
| `data/items/gold_key.tres` | `ItemData` | Goldschlüssel, Art Schlüssel, Stapel 9, Symbol `Items/Treasure/GoldKey.png` (M10) |

Tempo in Pixeln pro Sekunde, Strecken in Pixeln, Zeiten in Sekunden; „4 à 8/s“ heißt 4 Bilder, 8 Bilder je Sekunde. Bei Splittern: Zug und Bremsen in Pixeln je Sekunde zum Quadrat, Drehung in Grad je Sekunde.

### Bausteine – `components/`

| Baustein | Ordner | Was er tut | Einstellbar |
| --- | --- | --- | --- |
| `PlaceholderView` | `components/placeholder_view/` | Malt die Rechtecke, Kreise und Kapseln der `CollisionShape2D`-Geschwister als Farbfläche. Platzhalter-Grafik; wo ein `CharacterView` daneben ein Bild zeigt, ist sie ausgeblendet und bleibt als Rückfall. | `color` |
| `CharacterView` | `components/character_view/` | Zeigt die Figur mit der Grafik aus einem Skin, in der nächstliegenden von vier Blickrichtungen. Liest den Wert `facing` der Figur, sonst die Laufrichtung, und misst das Tempo am Ort. Hört auf `Health` (Treffer, Tod, Wiederaufstehen), `Dash` und `MeleeAttack`. Blendet das Geschwister `PlaceholderView` aus. Fragt: `has_skin_animation(name)`; liest: `direction`, `current_animation`. | `skin`, `walk_threshold`, `direction_hysteresis`, `min_walk_rate`, `max_walk_rate` |
| `Stamina` | `components/stamina/` | Ausdauer-Vorrat: `spend(amount)` verbraucht und liefert, ob es ging; nach `regen_delay` füllt er sich. Bei 0 gilt `is_exhausted`, bis `recover_threshold` erreicht ist. Meldet `changed`, `exhausted`, `recovered`. | `stats` |
| `Health` | `components/health/` | Leben. `apply_damage(amount)` ist die einzige Stelle, an der über Schaden entschieden wird: Tote und gerade Unverwundbare nehmen keinen. `make_invulnerable(seconds)` schützt für eine Dauer, etwa beim Dash. `reset()` füllt auf, auch nach dem Tod. Seit M11: `armor` zieht von jedem Treffer ab, mindestens 1 bleibt; `set_bonus_maximum(wert)` gibt mehr Leben, `get_maximum()` zählt es mit. Beides setzt `Equipment`. Meldet `changed`, `damaged`, `died`, `revived`. | `stats` |
| `Hurtbox` | `components/hurtbox/` | `Area2D`, die Treffer annimmt und an das Geschwister `Health` weiterreicht: `receive_hit(damage, direction)`. Meldet `hit_received`. Seit M9: `accepted_kinds` nennt die Arten von Treffern, die Schaden machen – Klinge, Geschoss, Explosion; die übrigen prallen ab, `accepts(art)` fragt das, `block_hit(richtung)` meldet `hit_blocked`. Mit `feeds_attacker` aus füllt ein Treffer beim Angreifer nichts auf, etwa keine Energie. Braucht eine eigene `CollisionShape2D`. | Ebene, `accepted_kinds`, `feeds_attacker` |
| `Hitbox` | `components/hitbox/` | `Area2D`, die jede berührte `Hurtbox` trifft, solange sie scharf ist: `activate()`, `deactivate()`. Meldet `hit_landed`; entschärft ein Zuhörer sie dabei, trifft sie in diesem Schritt nichts weiter. Seit M9 hat jeder Treffer eine Art (`kind`: Klinge, Geschoss, Explosion); nimmt die Hurtbox sie nicht an, meldet sie `hit_blocked` – einmal je Ziel und Aktivierung, wie ein Treffer. Braucht eine eigene `CollisionShape2D`. | `damage`, `kind`, `hit_interval`, `active_on_start`, Maske |
| `MeleeAttack` | `components/melee_attack/` | Nahkampf-Angriff: `try_attack(richtung)` dreht die Trefferzone in die Richtung und macht sie kurz scharf. Zone und Zeiten kommen aus der Werte-Datei. Jeder Treffer füllt das Geschwister `gain_supply_name` um `gain_per_hit` auf, außer an einer Hurtbox mit `feeds_attacker` aus, etwa an Zerstörbarem (M9). `rate_factor` über 1 verkürzt die Pause. Meldet `attack_started`, `attack_finished`. Das Feld in `swing_color` ist an der Spielfigur seit A2 durchsichtig; dort zeigt `SlashEffect` den Hieb. Seit M11 wechselt `set_stats(werte)` die Werte, etwa für eine andere Waffe; `set_stats(null)` kehrt zu denen aus dem Inspektor zurück. | `stats`, `target_mask`, `swing_color`, `gain_supply_name` |
| `HitFlash` | `components/hit_flash/` | Lässt den Elternknoten bei Schaden hell aufblitzen; solange er unverwundbar ist, blinkt er. Hört auf das Geschwister `Health`. | `flash_time`, `flash_strength`, `blink_while_invulnerable`, `blink_interval`, `blink_alpha` |
| `DamageNumbers` | `components/damage_numbers/` | Zeigt bei Schaden die Zahl über dem Elternknoten; sie steigt auf und verblasst. Hört auf das Geschwister `Health`. Seit A2 in der Pixel-Schrift `NormalFont`, Größe 9; ohne `font` die Standardschrift. | `color`, `font`, `font_size`, `outline_size`, `rise_distance`, `duration`, `start_offset` |
| `Dash` | `components/dash/` | Kurzer, schneller Satz: `request()` merkt den Tastendruck vor, `try_start(richtung)` startet, sobald es möglich ist; solange `is_dashing` gilt, liefert `get_velocity()` das Tempo. Macht das Geschwister `Health` beim Start kurz unverwundbar. Meldet `dash_started`, `dash_finished`. | `stats` |
| `Supply` | `components/supply/` | Zählbarer Vorrat: `spend(menge)` verbraucht und liefert, ob genug da war; `add(menge)` füllt auf. Mit `regen_per_second` über 0 füllt er sich nach `regen_delay` von selbst. Meldet `changed`. | `stats` |
| `RangedAttack` | `components/ranged_attack/` | Fernkampf-Angriff: `try_shoot(richtung)` bezahlt aus dem Geschwister `supply_name` und bestellt das Geschoss über `projectile_requested`. Liegt ein `AmmoSelector` daneben (M11a), kommen Werte und Kosten von dort, und `stats` und `supply_name` gelten nicht. Ohne `ProjectileSpawner` im Level fällt kein Schuss und nichts wird bezahlt. `rate_factor` über 1 verkürzt die Pause. Seit M11 legt `damage_bonus` auf jedes Geschoss mit Aufprall-Schaden etwas drauf – in einer Kopie der Werte, die Werte-Datei bleibt. Meldet `shot_fired`. | `stats`, `projectile_scene`, `target_mask`, `supply_name`, `ammo_name` |
| `Inventory` | `components/inventory/` | Inventar mit begrenzten Plätzen; Gleiches stapelt sich bis zur Stapelgröße. `add(gegenstand, anzahl)` liefert, was keinen Platz fand; `remove(gegenstand, anzahl)` nimmt nur, wenn genug da ist. Die einzige Stelle, die über den Inhalt entscheidet. Lesen: `count()`, `has()`, `get_items()`, `get_slots()`, `get_used_slots()`, `get_slot_count()`. Meldet `changed`, `item_added`, `item_removed`. | `stats` |
| `AmmoSelector` | `components/ammo_selector/` | Wählt das Geschoss: jedes `AmmoData` im Inventar, in der Reihenfolge der Plätze. `cycle(schritt)` wechselt, `get_shot()` liefert die Werte des Wurfs, `consume(anzahl)` nimmt aus dem Inventar. Ist das gewählte aufgebraucht, rückt das nächste nach. Meldet `selection_changed`. | `inventory_name` |
| `PatrolMover` | `components/patrol_mover/` | Lässt seinen Elternknoten zwischen Startpunkt und Startpunkt + `travel` pendeln. Für Dinge, die nichts wegschieben müssen. | `travel`, `speed` |
| `Stunnable` | `components/stunnable/` | Macht seinen Elternknoten betäubbar: `apply_stun(sekunden)`, `is_stunned()`. Solange die Betäubung anhält, ruht der Knoten aus `paused_node`, und um das Ziel pulsiert der weiße Kreis aus seinem Kind `StunEffect` (A2). Der gelbe Ring aus M7 ist durchsichtig gestellt. Steht in der Gruppe `stunnable`. Meldet `stunned`, `recovered`. | `paused_node`, `ring_radius`, `ring_color` |
| `Interactable` | `components/interactable/` | `Area2D` auf der Ebene `interactable`: macht seinen Elternknoten mit E bedienbar. `interact(actor)` meldet `interacted`; was dann geschieht, entscheidet der Elternknoten. Nur mit `enabled` zeigt sich die Taste und E wirkt. Braucht eine eigene `CollisionShape2D` (M8). | `enabled`, `prompt_offset` |
| `Interactor` | `components/interactor/` | `Area2D` an der Figur: Ein Kreis mit `reach` sucht auf `interactable`; das nächste bedienbare Ding ist `focus` (Signal `focus_changed`). `try_interact()` bedient es. Das Kind `Prompt` zeigt die Taste E über dem Kopf der Figur oder mit `prompt_above_target` über dem Ding (M8). | `stats`, `prompt_above_target`, `prompt_offset` |
| `PropView` | `components/prop_view/` | `Sprite2D`: zeigt ein Ding der Welt mit dem Bild für aus oder an aus einem `PropSkin`; ohne Bild für einen Zustand ist dann nichts zu sehen. Liest `is_on` und hört auf `state_changed` des Elternknotens. Blendet das Geschwister `PlaceholderView` aus (M8). | `skin` |
| `EffectCue` | `components/effect_cue/` | Spielt einen Effekt aus einer Werte-Datei, wenn ein Baustein daneben ein Signal sendet (A2). Liefert das Signal eine Richtung, rückt der Effekt um `distance` dorthin und dreht sich auf Wunsch mit. Mit `stop_signal_name` wiederholt er sich, bis dieses Signal kommt. Er entscheidet nichts. | `effect`, `source_name`, `signal_name`, `stop_signal_name`, `follow`, `use_direction`, `distance` |
| `DebrisCue` | `components/debris_cue/` | Lässt Splitter aus einer `DebrisData` fliegen, wenn ein Baustein daneben ein Signal sendet, an seinem eigenen Ort; sie fliegen in der Szene zu Ende. Entscheidet nichts (M9). | `debris`, `source_name` (Standard `Health`), `signal_name` (Standard `died`) |
| `LootDropper` | `components/loot_dropper/` | Würfelt auf ein Signal seine Beute-Liste und bestellt jeden Treffer über `loot_requested`, mit seinem Ort als Absprung. `drop()` geht auch direkt. Meldet `dropped(anzahl)`. Die eine Stelle, an der gewürfelt wird (M9). | `table`, `source_name` (Standard `Health`), `signal_name` (Standard `died`) |
| `Equipment` | `components/equipment/` | Die Ausrüstung einer Figur: vier Plätze. `equip(gegenstand)` nimmt ihn aus dem Inventar und legt ihn an, das Vorige kommt zurück; `unequip(platz)` legt ab, wenn im Inventar Platz ist; `get_item(platz)` liest. Die einzige Stelle, die über Angelegtes entscheidet. Gibt die Werte an `MeleeAttack`, `RangedAttack` und `Health` weiter. Meldet `changed(platz, gegenstand)` (M11). | `stats` |
| `Collector` | `components/collector/` | `Area2D` an der Figur, Kreis 6 Pixel, Maske `pickup`. Nimmt aus jedem bereiten `Pickup` im Kreis so viel, wie das Geschwister `Inventory` annimmt; der Rest bleibt liegen. Meldet `collected`, `rejected` und schreibt „S1 Beute“ in die Debug-Anzeige (M9). | – |

Die Bausteine finden das Leben über den Namen: Der Knoten muss genau `Health` heißen und neben ihnen liegen.

### Fähigkeiten – `abilities/`

| Fähigkeit | Ordner | Was sie tut | Einstellbar |
| --- | --- | --- | --- |
| `Ability` | `abilities/` | Grundgerüst: `try_activate()` prüft Bereitschaft und Vorrat, bezahlt und startet die Wirkung; nach `duration` endet sie, dann läuft `cooldown`. Erbende Skripte füllen nur `_begin_effect()` und `_end_effect()`. Meldet `activated`, `finished`. | `stats`, `supply_name` |
| Schnelligkeit | `abilities/haste/` | Setzt bei der Figur `speed_factor` und bei ihren Kindern `rate_factor`: schneller laufen, schlagen und schießen. | `stats` |
| Unsichtbarkeit | `abilities/invisibility/` | Macht das Bild der Figur durchscheinend – jedes Kind aus `view_names`, die es gibt – und stellt sie in die Gruppe `invisible`. Gegner und Bonus-Schaden folgen in Phase 3. | `stats`, `view_names` (Standard: `CharacterView`, `PlaceholderView`) |
| Stun | `abilities/stun/` | Betäubt jeden `Stunnable` im Umkreis für die Dauer der Fähigkeit und zeigt einen Ring. | `stats`, `pulse_time`, `pulse_color` |

Eine neue Fähigkeit ist ein Ordner mit Szene, Skript und Werte-Datei; das Skript erbt von `Ability`. Seit M12 steht in der Werte-Datei auch ihr Symbol fürs HUD: `icon` und die graue Fassung `icon_disabled`.

### Szenen

| Szene | Skript | Zweck |
| --- | --- | --- |
| `levels/test_chamber/test_chamber.tscn` | `test_chamber.gd` | Testkammer und Startszene |
| `entities/player/player.tscn` | `player.gd` | Spielfigur |
| `entities/player/player_spawner.tscn` | `player_spawner.gd` | erzeugt die Spielfiguren eines Levels |
| `entities/player/player_camera.tscn` | `player_camera.gd` | Kamera, die der Spielfigur folgt |
| `entities/dummy/training_dummy.tscn` | `training_dummy.gd` | Übungspuppe |
| `world/damage_zone/damage_zone.tscn` | keins; die Szene erbt von `hitbox.tscn` | Schadensfeld |
| `world/door/door.tscn` | `door.gd` | Tür oder Gittertor; Kinder `CollisionShape2D`, `PlaceholderView`, `PropView`, `Interactable`, `DoorwaySensor` (M8) |
| `world/lever/lever.tscn` | `lever.gd` | Hebel; Kinder `CollisionShape2D`, `PlaceholderView`, `PropView`, `Interactable` (M8) |
| `world/pressure_plate/pressure_plate.tscn` | `pressure_plate.gd` | Druckplatte; Kinder `CollisionShape2D`, `PlaceholderView`, `PropView` (M8) |
| `world/destructible/destructible.tscn` | `destructible.gd` | Grundszene für Zerstörbares; Kinder `CollisionShape2D`, `PlaceholderView`, `PropView`, `Health`, `Hurtbox` (Ebene `enemy_hurtbox`, keine Energie), `HitFlash`, `HitEffect` (Schnitt), `BlockEffect` (Funke beim Abprallen), `Debris` (ein `DebrisCue`), `LootDropper` (M9) |
| `world/destructible/pot.tscn`, `crate.tscn`, `rock.tscn`, `tree.tscn` | erben von `destructible.tscn` | Topf, Kiste, Stein und Baum mit eigenem Skin, Leben, Splittern, Beute und eigenen Formen; der Stein nimmt nur Explosionen, der Baum hat dazu `WoodDebris` und `LeafHit` (M9) |
| `entities/pickup/pickup.tscn` | `pickup.gd` | Gegenstand am Boden; Kinder `CollisionShape2D` (Kreis 6), `Icon` (`Sprite2D`) mit `Count` (`Label`, `NormalFont` 9) (M9) |
| `entities/pickup/loot_spawner.tscn` | `loot_spawner.gd` | legt alle Beute eines Levels hin (M9) |
| `world/chest/chest.tscn` | `chest.gd` | Grundszene für Truhen; Kinder `CollisionShape2D` (14 × 10), `PlaceholderView`, `PropView`, `Interactable` (16 × 16), `LockHint` (`Sprite2D`, 16 Pixel über der Mitte), `LootDropper` (hört auf `opened`), `OpenEffect` (ein `EffectCue`, Funkeln) (M10) |
| `world/chest/chest_small.tscn`, `chest_big.tscn` | erben von `chest.tscn` | kleine Truhe mit eigenem Skin und eigener Beute; große Truhe dazu mit `required_key` Goldschlüssel und Körper 16 × 10 (M10) |
| `entities/projectile/projectile.tscn` | `projectile.gd` | Geschoss; Kinder `Hitbox` mit `PlaceholderView`, `WorldSensor`, `TargetSensor`, `ExplosionHitbox`, `ProjectileView` |
| `entities/projectile/projectile_spawner.tscn` | `projectile_spawner.gd` | erzeugt alle Geschosse eines Levels |
| `ui/crosshair/crosshair.tscn` | `crosshair.gd` | Fadenkreuz |
| `ui/debug/debug_overlay.tscn` | `debug_overlay.gd` | Debug-Anzeige; seit M12 oben rechts |
| `ui/hud/hud.tscn` | `hud.gd` | HUD (M12); `CanvasLayer` auf Ebene 90 mit `EnergyOrb`, `Hearts`, `StaminaBar` und `BottomBar` mit `AbilityBar` und `AmmoSlot`; jedes Teil mit eigenem Skript in `ui/hud/` |
| `ui/hud/ability_slot.tscn` | `ability_slot.gd` | ein Platz der Fähigkeiten-Leiste: `Icon`, `ActiveFrame`, `Key` (M12) |
| `ui/inventory/inventory_window.tscn` | `inventory_window.gd` | Inventarfenster; `CanvasLayer` auf Ebene 105, Kind `Root` mit dem Thema `ui/theme/wood_theme.tres`, darin `Frame` (`PanelContainer`) und `Interior` (`Panel`) mit `Title`, `EquipmentTitle`, `EquipmentSlots`, `Grid`, `InfoName`, `InfoText`, `InfoHint`; die Zellen baut das Skript (M11) |
| `components/equipment/equipment.tscn` | `equipment.gd` | Baustein, siehe oben (M11) |
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
| `components/interactable/interactable.tscn` | `interactable.gd` | Baustein, siehe oben |
| `components/interactor/interactor.tscn` | `interactor.gd` | Baustein, siehe oben; Kinder `CollisionShape2D` und `Prompt` (`Sprite2D` mit `KeyE.png`) |
| `components/prop_view/prop_view.tscn` | `prop_view.gd` | Baustein, siehe oben |
| `components/debris_cue/debris_cue.tscn` | `debris_cue.gd` | Baustein, siehe oben |
| `components/loot_dropper/loot_dropper.tscn` | `loot_dropper.gd` | Baustein, siehe oben |
| `components/collector/collector.tscn` | `collector.gd` | Baustein, siehe oben; Kind `CollisionShape2D` |
| `abilities/haste/haste.tscn` | `haste.gd` | Fähigkeit, siehe oben |
| `abilities/invisibility/invisibility.tscn` | `invisibility.gd` | Fähigkeit, siehe oben |
| `abilities/stun/stun.tscn` | `stun.gd` | Fähigkeit, siehe oben |
| `ui/debug/setup_check.tscn` | `setup_check.gd` | Setup-Check aus M0; bleibt als Werkzeug |

**Spielfigur im Einzelnen**

- `Player` ist ein `CharacterBody2D` im schwebenden Modus, Ebene `player`, Maske `world` und `enemy`, Gruppe `players`. Körper 12 × 12 Pixel. Bild seit A1: der Ninja aus `data/skins/ninja_green.tres` über `CharacterView`; ohne ihn der grüne Platzhalter mit weißem Punkt in Blickrichtung.
- Kinder: `CollisionShape2D`, `PlaceholderView`, `CharacterView`, `PlayerInput` (ein `IntentSource`, läuft vor der Figur), `Stamina`, `Health`, `Hurtbox` (10 × 10 Pixel, Ebene `player_hurtbox`), `HitFlash`, `MeleeAttack` (sucht auf `enemy_hurtbox`), `Dash`, `Inventory`, `AmmoSelector`, `RangedAttack` (Ziele auf `enemy_hurtbox`), `Energy` (ein `Supply`), `Abilities` mit den Kindern `Haste`, `Invisibility` und `Stun`, dazu seit A2 `SlashEffect` und `HitEffect` (je ein `EffectCue`), seit M8 `Interactor`, seit M9 `Collector` und seit M11 `Equipment` – als letztes Kind, damit die anderen Bausteine bereit sind, wenn es ihnen die Werte gibt.
- Die Figur liest nur Absichten. `PlayerInput` füllt sie aus den Aktionen und aus der Mausposition; später kann eine andere Quelle dasselbe tun.
- Blick und Hieb: Die Figur blickt stufenlos in die Zielrichtung, also zur Maus. Solange `attack_primary` gehalten wird, schlägt sie dorthin. Laufen, Sprinten und Schleichen gehen dabei weiter.
- Zustände: Stehen, Laufen, Sprinten, Schleichen, Dash. Schleichen geht vor Sprinten. Sprinten kostet Ausdauer; ohne Vorrat läuft die Figur normal.
- Dash: Ein Druck auf `dash` schnellt die Figur 64 Pixel weit – in Laufrichtung, im Stehen in Blickrichtung. Solange er läuft, lenkt sie nicht, verbraucht keine Ausdauer und beginnt keinen Hieb; ein laufender Hieb geht weiter. Danach läuft sie höchstens mit Lauftempo weiter. Halten der Taste löst keinen zweiten Dash aus.
- Fernkampf: Solange `attack_secondary` gehalten wird, wirft die Figur das gewählte Geschoss in Zielrichtung; jeder Wurf nimmt eins aus dem Inventar, die Pause hängt am Geschoss. Das Mausrad wechselt das Geschoss. Laufen geht dabei weiter; während des Dashs fällt kein Schuss.
- Fähigkeiten: Ein Druck auf `ability_1`, `ability_2` oder `ability_3` setzt das erste, zweite oder dritte Kind von `Abilities` ein. Das geht jederzeit, auch im Dash. Die Figur selbst kennt keine einzelne Fähigkeit; sie bietet nur `speed_factor` an, den die Schnelligkeit setzt.
- Energie: Fähigkeiten bezahlen aus `Energy`. Der Vorrat füllt sich nur durch Schwerttreffer, über `MeleeAttack`.
- Interaktion (M8): Ein Druck auf `interact` (E) bedient das nächste bedienbare Ding im Suchkreis des `Interactor`, 16 Pixel um die Mitte. Solange es eins gibt, steht die Taste E über dem Kopf der Figur. Das geht jederzeit, auch im Dash.
- Aufsammeln (M9): Läuft die Figur über Beute, nimmt ihr `Collector` so viel ins Inventar, wie hineinpasst; dafür gibt es keine Taste.
- Ausrüstung (M11): Was sie angelegt hat, verwaltet `Equipment`; beim Start ist es das Katana. Ist ein Menü der Figur offen, meldet `PlayerInput` keine Absichten: Sie bleibt stehen.
- Tod: Fällt das Leben auf 0, bleibt die Figur stehen, zeigt das Tod-Bild (der Platzhalter wird grau) und sendet `player_died`. Was dann geschieht, entscheidet das Level.
- Einstellbar: `stats` (Werte-Datei), `player_id`, `defeated_color`. Ohne `PlayerInput` bleibt sie stehen, ohne `Stamina` sprintet sie unbegrenzt, ohne `Health` nimmt sie keinen Schaden, ohne `Hurtbox` ist sie nicht zu treffen, ohne `MeleeAttack` schlägt sie nicht zu, ohne `Dash` dasht sie nicht, ohne `RangedAttack` schießt sie nicht, ohne `Inventory` hat sie nichts zu werfen, ohne `AmmoSelector` schießt sie wie vor M11a mit `bow.tres` kostenlos, ohne `Abilities` hat sie keine Fähigkeiten, ohne `Energy` kosten Fähigkeiten nichts, ohne `CharacterView` zeigt sie den Platzhalter, ohne `SlashEffect` oder `HitEffect` fehlt nur dieser Effekt, ohne `Interactor` bedient sie nichts mit E, ohne `Collector` läuft sie über Beute hinweg, ohne `Equipment` kämpft sie mit ihren Grundwerten.
- Einen Zustandsautomaten als Baustein gibt es noch nicht: Der Dash bringt seinen Zeitablauf selbst mit, die Figur fragt nur `is_dashing`. Vorgesehen ist er für den ersten Gegner in M13.

**Kampf im Einzelnen**

- Weg eines Treffers: `Hitbox` berührt `Hurtbox` → `Hurtbox.receive_hit()` → `Health.apply_damage()`. Nur `Health` entscheidet, ob und wie viel Schaden ankommt.
- Treffer-Arten (M9): Das Schwert und das Schadensfeld treffen als Klinge, die `Hitbox` eines Geschosses als Geschoss, seine `ExplosionHitbox` als Explosion. Nimmt eine `Hurtbox` die Art nicht an, prallt der Treffer ab: kein Schaden, keine Energie, die `Hurtbox` meldet `hit_blocked`. Ein Geschoss endet, sobald es abprallt, auch wenn es noch Ziele durchschlagen dürfte.
- Schwert: Die Trefferzone ist 18 Pixel lang und 20 breit und beginnt 6 Pixel vor der Mitte der Figur. Sie ist 0,12 s scharf; von Hieb zu Hieb vergehen 0,35 s. Ein Hieb trifft jedes Ziel höchstens einmal, kann aber mehrere Ziele treffen.
- Die Trefferzone wird erst einen Physik-Schritt nach Hiebbeginn ausgewertet, weil Godot Berührungen erst dann kennt.
- Unverwundbarkeit: Nach einem Treffer nimmt die Spielfigur 0,6 s lang keinen Schaden. Das steht als `invulnerable_time` in ihrer Werte-Datei und gilt für jede Schadensquelle. Auch ein Dash schützt, 0,25 s ab seinem Beginn. Solange die Figur unverwundbar ist, blinkt sie.
- Dash: 64 Pixel in 0,2 s, also 12 Physik-Schritte mit Tempo 320. Von Dash zu Dash vergehen 0,8 s. Ein Tastendruck kurz vor Ablauf der Pause bleibt 0,12 s lang vorgemerkt.
- Geschosse seit M11a: Pfeil, Kunai, Shuriken und Dynamit aus dem Inventar, Werte in `data/items/`. Jedes entsteht 8 Pixel vor der Mitte der Figur. Ohne `AmmoSelector` gilt der alte Bogen aus `bow.tres`.
- Geschoss: fliegt geradeaus mit Tempo und Reichweite aus seinen Werten. Es endet, wenn es `pierce` Ziele getroffen hat, an Wänden und Blöcken, wenn es abprallt (M9) oder am Ende der Reichweite. Schaden teilt seine `Hitbox` aus, Wände bemerkt sein `WorldSensor` über die Ebene `world`. Den Schützen kann es nicht treffen, weil es nur auf der Ziel-Ebene sucht.
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
- Interaktions-Ecke `InteractionCorner` (M8), Ursprung (752, 448): drei Räume nebeneinander, je 48 × 64 Pixel, zusammen x 768 bis 944 und y 464 bis 528; die Wände sind `RoomWalls`, ein `StaticBody2D` auf `world`. In der oberen Wand liegen drei Durchgänge, je 16 Pixel breit. `WoodDoor` bei (792, 456) ist eine Holztür für E. `LeverGate` bei (856, 456) ist ein Gittertor auf dem Kanal `lever_gate`, sein `Lever` steht bei (824, 424). `PlateGate` bei (920, 456) ist ein Gittertor auf `plate_gate`; die `PressurePlate` liegt davor bei (920, 376), die `PressurePlateInside` im Raum bei (920, 504), damit niemand eingesperrt bleibt.
- Feld mit Zerstörbarem `DestructibleField` (M9), Ursprung (72, 328), jeweils die Mitte: `PotA` (72, 328) und `PotB` (120, 328); `CrateA` (168, 328) und `CrateB` (184, 328) Kante an Kante; `RockA` (72, 408) und `RockB` (120, 408); `Tree` mit dem Fuß des Stamms bei (176, 428), das Bild reicht von (160, 400) bis (192, 432).
- Truhen (M10): `ChestSmall` bei (616, 488) und `ChestBig` bei (680, 488), unter dem langen Balken links vor der Interaktions-Ecke. Der Goldschlüssel ist ein von Hand gelegter `Pickup` namens `GoldKey` im linken Raum der Interaktions-Ecke, bei (792, 504).
- Ausrüstung zum Aufsammeln (M11): Unter `StartItems` liegen vier von Hand gelegte `Pickup` – `Broadsword` (192, 176), `Bow` (216, 176), `LeatherArmor` (240, 176), `RubyCharm` (264, 176).
- `InventoryWindow` (M11) und `Hud` (M12) hängen als letzte Kinder in der Kammer.
- `LootSpawner` (M9) liegt vor dem `PlayerSpawner`; so liegt Beute über dem Zerstörbaren und den Truhen, aber unter der Figur.
- Die Puppen, `DamageZone`, `DamageStrip`, `InteractionCorner`, `DestructibleField`, `ChestSmall`, `ChestBig`, `StartItems`, `LootSpawner`, `PlayerSpawner`, `ProjectileSpawner`, `PlayerCamera`, `Crosshair`, `DebugOverlay`, `InventoryWindow` und `Hud` sind eingehängt und lassen sich einzeln löschen.
- `DebugOverlay` blendet hier „Maus“, „Kamera“ und „Raumzeit“ aus.
- F2 und der Tod einer Figur laden die Szene neu, direkt in `test_chamber.gd`. Ab M18 übernimmt das der `SceneManager`.

**Inventar im Einzelnen (M11a)**

- Gegenstände sind Werte-Dateien in `data/items/` mit `id`, Name, Art (Waffen, Rüstung, Verbrauchbares, Schlüssel, Materialien – die Geschosse zählen zu Verbrauchbares), Symbol und Stapelgröße. Zwei Einträge mit derselben `id` gelten als derselbe Gegenstand.
- Neues füllt erst angefangene Stapel derselben Sorte, dann freie Plätze. Entnommen wird vom hintersten Stapel; ein leerer Platz wird frei.
- Die Reihenfolge der Geschosse beim Wechseln ist die der Plätze; der Startinhalt legt sie fest: Pfeil, Kunai, Shuriken, Dynamit.
- Seit M9 gibt es die ersten Materialien: Ast und Stein. Aufgesammelt wird seit M9 über den `Collector`.
- Seit M10 gibt es den ersten Schlüssel: den Goldschlüssel. Eine Truhe nimmt ihn mit `remove()` aus dem Inventar der Figur, die E drückt.
- Seit M11 gibt es das Inventarfenster (Tab) und die Ausrüstung. Angelegtes liegt nicht im Inventar.
- Speichern und Laden des Inhalts und des Angelegten kommt mit M16.

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

**Interaktion im Einzelnen (M8)**

- `Interactable` markiert ein Ding als bedienbar: eine `Area2D` auf `interactable` mit eigener Form, 16 × 16 bei Tür und Hebel. `interact(actor)` meldet `interacted`; was dann passiert, entscheidet das Ding – die eine Stelle für den Mehrspieler.
- `Interactor` hängt an der Figur: ein Kreis mit `reach` aus `data/player/interactor.tres`, Maske `interactable`. In jedem Physik-Schritt gilt das nächste bedienbare Ding als `focus`. Sein Kind `Prompt` (`KeyE.png`, Ebene 100, `top_level`) steht dann über dem Kopf der Figur: Unterkante 12 Pixel über ihrer Mitte, 2 Pixel über dem Ninja. Mit `prompt_above_target` steht es über dem Ding, an dessen `prompt_offset` (Standard 10 Pixel über der Mitte).
- Die Taste sitzt über dem Kopf, weil sie über einer Tür die Figur verdeckt, die von oben herantritt.
- Schalter melden über `EventBus.switch_changed(channel, switch_id, is_on)`. Beim Start melden sie einmal, um einen Schritt verzögert, damit alle Türen schon zuhören. Eine Tür merkt sich, welche Schalter auf ihrem Kanal an sind, und ist offen, solange es mindestens einer ist.
- `Door`: `StaticBody2D` auf `world`, 16 × 16; offen ist ihre Form abgeschaltet. Ohne Kanal bedient E sie über ihr `Interactable`; mit Kanal ist es aus. Ihr `DoorwaySensor` (14 × 14, Maske `player` und `enemy`) hält sie offen, solange dort jemand steht – dann zeigt sie auch keine Taste. Bild: `door_wood.tres`; die Gittertore der Testkammer tragen `gate_bars.tres`.
- `Lever`: `StaticBody2D` mit einem Pfosten von 10 × 10 Pixeln, den die Figur nicht durchläuft; E legt ihn um. `PressurePlate`: `Area2D` mit 10 × 10, Maske `player` und `enemy`; gedrückt, solange ein Körper sie berührt, ihr Kanal bleibt danach `release_delay` Sekunden an (2).
- `PropView` zeigt die Zelle für aus oder an; fehlt sie, ist nichts zu sehen. Er liest `is_on` und hört auf `state_changed`; der Platzhalter dahinter ist ausgeblendet.
- Mehrspieler: Jede Figur hat ihren eigenen `Interactor`. Die Taste zeigen noch alle Figuren, auch mehrere auf einem Rechner; nur die eigene zu zeigen, kommt mit Phase 8.

**Zerstörbares und Beute im Einzelnen (M9)**

- `Destructible` ist ein `StaticBody2D` auf `enemy`. Leben und Treffer kommen von den Bausteinen `Health` und `Hurtbox`; die Hurtbox liegt auf `enemy_hurtbox` und füllt keine Energie. Bei 0 Leben schaltet es die Hurtbox ab, meldet `state_changed(true)` und zeigt über `PropView` das Bild für „an“: Topf, Kiste und Stein nichts, der Baum seinen Stumpf. Ohne Rest wird auch die Körperform abgeschaltet; mit `leaves_remains` bleibt sie und wechselt auf `remains_layer` (Standard `world`).
- Formen, jeweils Körper und Hurtbox: Topf 12 × 10 (2 Pixel tiefer) und 14 × 14; Kiste 14 × 12 und 14 × 14; Stein 14 × 12 und 14 × 14, nimmt nur Explosionen (`accepted_kinds` 4); Baum 22 × 8 am Fuß des Stamms und 24 × 24 über Stamm und Krone.
- Der Baum hat drei `DebrisCue`: `Debris` mit Blättern beim Fällen, in der Krone; `WoodDebris` mit Holzsplittern am Stamm; `LeafHit` mit drei Blättern bei jedem Treffer.
- Splitter sind `CPUParticles2D`: Ein Streifen aus `FX/Particle/` zählt als Bilder nebeneinander, jeder Splitter zeigt eins davon fest. Sie springen hoch, fallen, drehen sich, verblassen ab 60 % ihrer Zeit und zeichnen auf Ebene 40 – über den Figuren, unter den Effekten.
- Beute: `LootDropper` würfelt bei `died` die Liste aus `data/loot/` und bestellt jeden Treffer über `loot_requested`. Der `LootSpawner` erledigt Bestellungen im nächsten Physik-Schritt: je Gegenstand ein `Pickup`, der in 0,35 s von der Mitte des Dings auf einen Platz 10 bis 18 Pixel entfernt springt, 10 Pixel hoch. Der Platz liegt zwischen −20° und 200°, also zur Seite oder nach vorn; er ist frei von Körpern auf `world` und `enemy` und ohne solche dazwischen. Mehrere Gegenstände vom selben Ort verteilen sich im goldenen Schnitt. Findet sich in 12 Versuchen nichts, landet die Beute in der Mitte.
- `Pickup`: `Area2D` auf `pickup`, Kreis 6 Pixel. Zeigt das Symbol des Gegenstands, darunter einen Schatten, bei mehr als einem Stück die Zahl; am Boden wippt es um 1 Pixel. Erst nach dem Sprung lässt es sich aufsammeln. `take(anzahl)` nimmt weg; leer verschwindet es. Von Hand ins Level gelegt, liegt es gleich bereit.
- Mehrspieler: Gewürfelt wird nur im `LootDropper`, erzeugt nur im `LootSpawner`, über den Inhalt entscheidet nur das Inventar – später jeweils der Gastgeber. Splitter und Funken zeigt jeder Rechner selbst.

**Truhen im Einzelnen (M10)**

- `Chest` ist ein `StaticBody2D` auf `world`. E kommt über ihr `Interactable`; `open(actor)` ist die einzige Stelle, die entscheidet, ob sie aufgeht. Mit `required_key` braucht sie diesen Gegenstand: Sie sucht beim `actor` das Kind `Inventory` und nimmt mit `remove()` einen heraus. Fehlt er, meldet sie `locked`, wackelt `shake_time` lang um `shake_distance` Pixel (0,3 s, 2 Pixel) und zeigt `hint_time` lang (1 s) das Symbol des Schlüssels über sich – das Kind `LockHint`, Ebene 100.
- Geht sie auf, wird `is_on` wahr, `PropView` zeigt das offene Bild, ihr `Interactable` schaltet ab, und sie meldet `state_changed(true)` und `opened(actor)`. Auf `opened` hören `LootDropper` (Beute-Liste) und `OpenEffect` (Funkeln aus `data/effects/chest_sparkle.tres`, bleibt am Ort).
- `start_open` stellt sie offen hin, ohne Beute. Offen bleibt sie, bis der Raum neu lädt; Speichern kommt mit M16.
- Mehrspieler: Ob eine Truhe aufgeht, entscheidet nur `open()`, über das Inventar nur `remove()` – später jeweils beim Gastgeber.

**Inventarfenster und Ausrüstung im Einzelnen (M11)**

- Das Fenster sucht beim Öffnen in der Gruppe `players` die Figur mit seiner `player_id` und hört dann auf ihr `Inventory` und ihr `Equipment`. Es baut so viele Zellen, wie das Inventar Plätze hat, fünf je Zeile; mehr als 20 Plätze passen noch nicht in den Rahmen.
- Zelle: `Panel` mit der Variante `InventoryCell` (Bild `inventory_cell.png`), darin `Icon` (`TextureRect`, Bild in Originalgröße, mittig), `Count` (`Label`, Variante `CountLabel`, weiß mit dunklem Rand, ab 2 Stück) und `Focus` (Variante `InventoryFocus`, der Rahmen `nine_path_focus.png`, nur wenn gewählt).
- Bedienung: Linksklick wählt, Doppelklick legt an (Raster) oder ab (Ausrüstungsplatz). Geht das nicht, steht unten „Kein Platz im Inventar“. Tab und Esc fängt das Fenster in `_input` ab, vor der übrigen Oberfläche.
- Unten drei Zeilen: Name; Art und Werte – bei Ausrüstung der Platz und `describe()`, bei Geschossen der Schaden, sonst die Art; dazu ein Hinweis oder die Anzahl.
- Holz-Thema `ui/theme/wood_theme.tres`: Schrift `NormalFont` 9; `PanelContainer` mit dem orangen Rahmen `nine_path_panel.png` (Ränder 6, 6, 5, 5), `Panel` mit dem braunen Inneren `nine_path_panel_interior.png`; Varianten `InventoryCell`, `InventoryFocus`, `TitleLabel` und `HintLabel` (hellorange), `CountLabel`; dazu Knöpfe aus `button_*.png` für spätere Fenster. Es ist der erste Teil von A5.
- `Equipment` gibt nach jeder Änderung alles weiter: die Waffe an `MeleeAttack.set_stats()`, die Summe der Fernkampf-Boni an `RangedAttack.damage_bonus`, die Summe der Rüstung an `Health.armor`, die Summe der Leben an `Health.set_bonus_maximum()`. So kann später auch ein Gegenstand mehreres zugleich können.
- Mehrspieler: Über Angelegtes entscheidet nur `Equipment`, über den Inhalt nur das Inventar; das Fenster fragt nur an. Jede Figur hat ihr eigenes Fenster über ihre `player_id`.

**HUD im Einzelnen (M12)**

- `ui/hud/hud.tscn` ist ein `CanvasLayer` auf Ebene 90, unter der Debug-Anzeige (100), dem Inventarfenster (105) und dem Fadenkreuz (110). Einstellbar: `player_id` (1).
- Die Figur findet das HUD in der Gruppe `players` an ihrer `player_id`. Erscheint sie erst später, merkt es das über `node_added` und wartet, bis sie bereit ist. Verschwindet sie, bekommen alle Teile `bind(null)` und blenden sich aus; eine neue Figur mit derselben Nummer übernimmt das HUD wieder.
- Jedes Teil hat ein eigenes Skript in `ui/hud/` mit der Methode `bind(figur)`, liest nur und entscheidet nichts. Fehlt sein Baustein an der Figur, bleibt es ausgeblendet.
- `EnergyOrb` (`TextureProgressBar`, 32 × 32 bei (4, 4)): Rahmen `BackgroundRed.png`, Füllung `ProgressMana.png` um (5, 5) versetzt und von unten nach oben, Glanzpunkt `Over.png`. Hört auf `changed` des Vorrats `supply_name` (Standard `Energy`). Die Füllung steigt in ganzen Pixeln, mindestens einem, solange Energie da ist.
- `Hearts` (`Control` bei (38, 6)): malt die Herzen aus `Heart.png` im Abstand `step` (16). Leben je Herz aus `stats`, also `data/ui/hud.tres`. Hört auf `changed` von `Health`; mit dem Höchstwert ändert sich die Zahl der Herzen.
- `StaminaBar` (`Control`, 64 × 4 bei (39, 25)) mit `Frame` (`NinePatchRect` aus `LifeBarMiniUnder.png`, Ränder 1) und `Fill` (`ColorRect`, innen 62 × 2). Farben `fill_color` (Grün des Pakets) und `exhausted_color` (Rot des Pakets). Hört auf `changed`, `exhausted` und `recovered` von `Stamina`.
- `BottomBar` (`HBoxContainer` unten links, 6 Pixel Abstand) mit `AbilityBar` (`HBoxContainer`, 4 Pixel Abstand) und `AmmoSlot`. Die Reihe passt sich an: Mehr Fähigkeiten schieben die Zelle weiter nach rechts.
- `AbilityBar` baut je Kind unter `Abilities` einen Platz aus `ability_slot.tscn`, die Tasten aus `key_icons` (`Key1.png` bis `Key3.png`). Ein Platz: `Icon` (`TextureProgressBar`, im Uhrzeigersinn; darunter das graue Symbol, darüber das farbige), `ActiveFrame` (Variante `InventoryFocus` des Holz-Themas) und `Key`. Er liest in jedem Bild `is_active`, `get_cooldown_left()` und die Kosten gegen den Vorrat der Fähigkeit ab.
- `AmmoSlot` (`Panel`, Variante `InventoryCell`, 24 × 24) mit `Icon` und `Count` (Variante `CountLabel`). Hört auf `selection_changed` des `AmmoSelector` und auf `changed` des `Inventory`. Die Anzahl steht auch bei 1.
- Alle Teile lassen die Maus durch (`mouse_filter` auf „Ignore“), damit Klicks und Mausrad bei der Figur ankommen.
- Im Editor zeigt `hud.tscn` die Kugel, die Leiste und die Zelle; Herzen und Fähigkeiten erscheinen erst im laufenden Spiel.
- Mehrspieler: Jedes HUD zeigt die Figur mit seiner `player_id`. Später zeigt jeder Rechner nur das HUD seiner eigenen Figur.

**Debug-Anzeige im Einzelnen**

- `CanvasLayer` auf Ebene 100, läuft auch bei pausiertem Spiel. Zeigt FPS, Mausposition im Bild, gedrückte Aktionen und alle gemeldeten Werte. Seit M12 steht sie oben rechts, damit sie das HUD nicht verdeckt.
- Einstellbar: `refresh_interval` (0,1 s), `font_size` (12), `visible_on_start`, `show_mouse`, `hidden_keys`, seit M12 `align_right` (an) und `edge_margin` (4).
- Im Editor zeigt die Testkammer nur die blauen Kollisionsflächen; Farben, Raster und Anzeige erscheinen erst im laufenden Spiel.

### Dateien je Modul

**M12 – HUD**

- Neu: `ui/hud/` mit `hud.tscn`, `hud.gd`, `hud_stats.gd`, `hearts.gd`, `energy_orb.gd`, `stamina_bar.gd`, `ability_bar.gd`, `ability_slot.tscn`, `ability_slot.gd`, `ammo_slot.gd`; `data/ui/hud.tres`
- Geändert: `abilities/ability_stats.gd` (`icon`, `icon_disabled`), `data/abilities/haste.tres`, `invisibility.tres`, `stun.tres` (Symbole), `ui/debug/debug_overlay.gd` (oben rechts)
- Geändert: `levels/test_chamber/test_chamber.tscn` (`Hud`), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `README.md` (Ordner), `docs/projekt_stand.md`, `docs/asset_katalog.md`

**M11 – Inventar & Ausrüstung**

- Neu: `items/equipment_data.gd`; `components/equipment/` mit `equipment.tscn`, `equipment.gd`, `equipment_stats.gd`; `ui/inventory/` mit `inventory_window.tscn`, `inventory_window.gd`; `ui/theme/wood_theme.tres`
- Neu: `data/player/equipment.tres`; `data/items/katana.tres`, `broadsword.tres`, `bow.tres`, `leather_armor.tres`, `ruby_charm.tres`
- Geändert: `components/melee_attack/melee_attack.gd` (`set_stats()`), `components/health/health.gd` (`armor`, `set_bonus_maximum()`), `components/ranged_attack/ranged_attack.gd` (`damage_bonus`), `entities/player/player_input.gd` (Sperre bei offenem Menü), `entities/pickup/pickup.gd` (Symbol mittig bei jeder Größe), `autoload/event_bus.gd` (Meldung `menu_changed`)
- Geändert: `entities/player/player.tscn` (Knoten `Equipment`), `entities/player/player.gd` (nur der Kommentar), `levels/test_chamber/test_chamber.tscn` (`StartItems`, `InventoryWindow`), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `README.md` (Ordner), `docs/projekt_stand.md`, `docs/asset_katalog.md`

**M10 – Truhen & Beute**

- Neu: `world/chest/` mit `chest.tscn`, `chest.gd`, `chest_small.tscn`, `chest_big.tscn`
- Neu: `data/skins/chest_small.tres`, `chest_big.tres`; `data/loot/chest_small.tres`, `chest_big.tres`; `data/items/gold_key.tres`; `data/effects/chest_sparkle.tres`
- Geändert: `levels/test_chamber/test_chamber.tscn` (zwei Truhen, Goldschlüssel), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `README.md` (Ordner), `docs/projekt_stand.md`, `docs/asset_katalog.md`

**M9 – Zerstörbares**

- Neu: `world/destructible/` mit `destructible.tscn`, `destructible.gd`, `pot.tscn`, `crate.tscn`, `rock.tscn`, `tree.tscn`
- Neu: `components/debris_cue/` mit `debris_cue.tscn`, `debris_cue.gd`; `components/loot_dropper/` mit `loot_dropper.tscn`, `loot_dropper.gd`; `components/collector/` mit `collector.tscn`, `collector.gd`
- Neu: `entities/debris/debris.gd`, `debris_data.gd`; `entities/pickup/` mit `pickup.tscn`, `pickup.gd`, `loot_spawner.tscn`, `loot_spawner.gd`; `items/loot_entry.gd`, `loot_table.gd`
- Neu: `data/destructibles/pot_health.tres`, `crate_health.tres`, `tree_health.tres`, `rock_health.tres`; `data/loot/pot.tres`, `crate.tres`, `tree.tres`, `rock.tres`; `data/items/branch.tres`, `stone.tres`; `data/skins/pot.tres`, `crate.tres`, `rock.tres`, `tree.tres`; `data/effects/spark.tres`, `debris_pot.tres`, `debris_crate.tres`, `debris_rock.tres`, `debris_tree.tres`, `debris_tree_hit.tres`, `debris_tree_wood.tres`
- Geändert: `components/hitbox/hitbox.gd` (Treffer-Arten, `hit_blocked`), `components/hurtbox/hurtbox.gd` (`accepted_kinds`, `feeds_attacker`, `hit_blocked`), `components/melee_attack/melee_attack.gd` (keine Energie an Hurtboxen mit `feeds_attacker` aus), `entities/projectile/projectile.gd` (endet beim Abprallen) und `projectile.tscn` (Arten der beiden Hitboxen)
- Geändert: `autoload/event_bus.gd` (Meldung `loot_requested`), `entities/player/player.tscn` (Knoten `Collector`), `entities/player/player.gd` (nur der Kommentar), `levels/test_chamber/test_chamber.tscn` (Feld und `LootSpawner`), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `README.md` (Ordner), `docs/projekt_stand.md`, `docs/asset_katalog.md`

**M8 – Interaktion**

- Neu: `components/interactable/` mit `interactable.tscn`, `interactable.gd`; `components/interactor/` mit `interactor.tscn`, `interactor.gd`, `interactor_stats.gd`; `components/prop_view/` mit `prop_view.tscn`, `prop_view.gd`, `prop_skin.gd`
- Neu: `world/door/` mit `door.tscn`, `door.gd`; `world/lever/` mit `lever.tscn`, `lever.gd`; `world/pressure_plate/` mit `pressure_plate.tscn`, `pressure_plate.gd`
- Neu: `data/player/interactor.tres`; `data/skins/door_wood.tres`, `gate_bars.tres`, `lever.tres`, `pressure_plate.tres`
- Geändert: `autoload/event_bus.gd` (Meldung `switch_changed`), `entities/intent_source.gd` (`wants_interact`), `entities/player/player_input.gd` (liest E), `entities/player/player.gd` (bedient über `Interactor`), `entities/player/player.tscn` (Knoten `Interactor`)
- Geändert: `levels/test_chamber/test_chamber.tscn` (Interaktions-Ecke), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `README.md` (Ordner), `docs/projekt_stand.md`, `docs/asset_katalog.md`

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
- `EffectCue` und `SoundCue` hängen neben einem Baustein und reagieren auf eines seiner Signale. Töne spielt der `AudioManager` nach einer Ton-Tabelle. Den Ton gibt es erst mit A3, fast am Ende des Projekts.
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
| Hebel, Druckplatte, Stacheln (M8) | `Backgrounds/Tilesets/TilesetDungeon.png`, Zellen als (Spalte, Zeile) à 16: Druckplatte oben (2,1) und gedrückt (3,1), Hebel rot (3,3) und blau (4,3), Stacheln oben (4,1) und unten (5,1) | geprüft am 17.11.2026; Hebel und Druckplatte eingebaut mit M8 |
| Türen (M8) | `Backgrounds/Tilesets/TilesetHouse.png` Zelle (2,3): Holztür; `TilesetElement.png` Zelle (1,11): Gittertor | geprüft am 17.11.2026: nur geschlossen – ein Bild der offenen Tür hat das Paket nicht; eingebaut mit M8 |
| Taste E (M8) | `Ui/Input/Keyboard/KeyE.png`, 13 × 13 | geprüft am 17.11.2026; eingebaut mit M8 |
| Kiste und Topf (M9) | `Backgrounds/Tilesets/TilesetElement.png`, Zellen als (Spalte, Zeile) à 16: Kiste (0,0), Topf (1,0), Fass (4,0) | geprüft am 17.11.2026; Kiste und Topf eingebaut mit M9 |
| Baum, Stumpf und Stein (M9) | `Backgrounds/Tilesets/TilesetNature.png`: Baum 32 × 32 aus (0,0) bis (1,1), Stumpf 32 × 32 aus (2,8) bis (3,9), Stein (17,17) graugrün | geprüft am 17.11.2026; eingebaut mit M9. Beim Bauen hat Claude den Stein (17,17) statt (11,13) gewählt: Er passt zum Symbol des Gegenstands Stein, (11,13) sieht eher nach Schneeball aus |
| Splitter und Funke (M9) | `FX/Particle/`: `Wood.png` 6 à 16, `Vase.png` 6 à 14, `Leaf.png` 6 à 12 × 7, `RockGray.png` 5 à 16, `Spark.png` 7 à 10 × 8 | geprüft am 17.11.2026: Bruchstücke nebeneinander; nur `Spark.png` ist eine Bildfolge, ein Funke, der wächst und vergeht; eingebaut mit M9 |
| Äste und Steine als Beute (M9) | `Items/Resource/Branch.png`, `Rock.png`, je 16 × 16 | geprüft am 17.11.2026; eingebaut mit M9. Die Beute am Boden zeigt die Symbole der Gegenstände, auch die der Geschosse aus `Items/Projectile/` |
| Truhen und Schlüssel (M10) | `Items/Treasure/LittleTreasureChest.png` 2 à 16 × 16, türkis; `BigTreasureChest.png` 2 à 16 × 14, rot; `GoldKey.png` und `SilverKey.png`, je 12 × 8 | geprüft: je zwei Bilder, zu und offen; eingebaut mit M10, vom Schlüssel der goldene |
| Funkeln beim Öffnen (M10) | `FX/Magic/Spark/SpriteSheet.png`, 10 Bilder à 27 × 35 | geprüft am 17.11.2026: goldenes Funkeln mit einem großen Stern im dritten Bild; eingebaut mit M10 |
| Fenster (M11) | `Ui/Theme/Theme Wood/`: `nine_path_panel.png`, `nine_path_panel_interior.png`, `inventory_cell.png`, `nine_path_focus.png`, `button_*.png` | geprüft am 17.11.2026; eingebaut mit M11 im Thema `ui/theme/wood_theme.tres` |
| Ausrüstung (M11) | `Items/Weapons/Katana/Sprite.png` 6 × 14, `BigSword/Sprite.png` 7 × 16, `Bow/Sprite.png` 15 × 7; `Items/Resource/GemRed.png` 15 × 15; `Ui/Skill Icon/Items & Weapon/Armor.png` 24 × 24 | geprüft am 17.11.2026; eingebaut mit M11. Die Rüstung hat als einziges ein Symbol mit farbigem Hintergrund – eine Rüstung ohne Hintergrund hat das Paket nicht |
| Leben im HUD | `Ui/Receptacle/Heart.png`, 5 Bilder à 16 | geprüft: leer bis voll in Viertelschritten; eingebaut mit M12, ein Herz sind 20 Leben |
| Energie und Ausdauer im HUD (M12) | `Ui/Receptacle/Receptacle Sphere/BackgroundRed.png` 32 × 32 mit der Füllung `ProgressMana.png` 22 × 22 bei (5, 5) und dem Glanzpunkt `Over.png`; `Ui/Receptacle/LifeBarMiniUnder.png` 18 × 4 als Rahmen der Ausdauer-Leiste | geprüft am 17.11.2026; eingebaut mit M12 |
| Fähigkeits-Symbole | `Ui/Skill Icon/Spell/`, 24 × 24, dazu `Ui/Input/Keyboard/Key1.png` bis `Key3.png` | eingebaut mit M12: `Items & Weapon/Boot.png` für Schnelligkeit, `Spell/Camouflage.png` für Unsichtbarkeit, `Spell/BookThunder.png` für Stun, je mit grauer Fassung `…Disabled.png`; darunter die Tasten |
| Schrift | `Ui/Font/NormalFont.ttf` | Probe gerendert: Ziffern, Großbuchstaben und Umlaute da, das ß fehlt; gebaut für 9 Pixel; mit A2 für die Schadenszahlen eingebaut |
| Geräusche | `Audio/Sounds/Whoosh & Slash/`, `Hit & Impact/`, `Magic & Skill/`, `Jump & Bounce/` | nur die Namen; anhören kann nur der Nutzer |
| Musik | `Audio/Musics/`, 41 Stücke, etwa „2 - The Cave“ für die Steinzeit | nur die Namen |

## Gate G1 und Ausblick

Gate G1 ist bestanden: Nach dem Test von A2 hat der Nutzer am 17.11.2026 geschrieben: „Alles getestet und alles funktioniert … lass uns weitermachen“. Claude wertet das als „die Spielfigur fühlt sich gut an“. Nachstellen lässt sich weiter alles ohne Code über die Werte-Dateien in `data/`. Der Ton fehlt noch; er kommt mit A3 fast am Ende des Projekts.

Phase 2 läuft: M8 – Interaktion, M9 – Zerstörbares, M10 – Truhen & Beute und M11 – Inventar & Ausrüstung sind fertig, M12 – HUD ist geliefert und im Test. A5 – Oberfläche ist damit zum zweiten Mal gewachsen: nach dem Holz-Thema für Fenster jetzt Herzen, Energie-Kugel, Ausdauer-Leiste und Symbole. Nach M12 ist Phase 2 fertig; dann beginnt Phase 3 mit M13 – Erster Gegner. Der Ton kommt erst mit A3.

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
- Godot speichert offene Szenen, sobald F5 das Spiel startet. Wer zum Testen etwas in einer Szene ändert, stellt es danach zurück, bevor er committet; nach Strg+Z also noch einmal Strg+S.
- Geerbte Szenen wie `pot.tscn` oder `chest_small.tscn` übernehmen ihre Kinder aus der Grundszene. Löschen lassen sich diese Kinder nur dort, in `destructible.tscn` oder `chest.tscn`; in der geerbten Szene ändert man nur ihre Werte.
- Mehrere getestete Module, die noch nicht im Repo liegen, lassen sich in einem Commit hochladen; wichtig ist nur, dass sie vor dem nächsten Modul im Repo sind.
- Zu jedem neuen Skript legt Godot beim ersten Öffnen eine `.uid`-Datei an. Sie gehört ins Repo und wird mit committet; Claude liefert sie nicht mit.
- Das Inventarfenster ist im Editor unsichtbar (`Root` ist ausgeblendet). Wer es im Editor ansehen will, schaltet bei `InventoryWindow/Root` das Auge an – und danach wieder aus.
- Ein neuer Skin ist eine Kopie einer Datei aus `data/skins/` mit anderem Blatt und anderen Zahlen. Die Lage stimmt ohne Änderung, wenn die Figur im Blatt unten steht wie im Paket üblich: bei 32er-Bildern mit den Füßen in Zeile 23, bei 16er-Bildern in Zeile 15, von 0 gezählt.
- `CharacterView` zeigt im Editor nichts, weil es das Bild erst beim Start baut – wie bisher der Platzhalter. Die Lage prüft man im laufenden Spiel.
- Ein neuer Effekt ist eine Kopie einer Datei aus `data/effects/` mit anderem Blatt und anderen Zahlen. Eingehängt wird er mit der Szene `components/effect_cue/effect_cue.tscn` neben dem Baustein, dessen Signal ihn auslösen soll; Signal und Lage stellt man im Inspektor ein.
- `NormalFont` ist für 9 Pixel gebaut. Scharf bleibt sie in Größe 9 und ihren Vielfachen, also 18, 27 und so weiter.
- Texte im Spiel ohne ß, Gedankenstrich – und unteres Anführungszeichen „: `NormalFont` hat diese Zeichen nicht. Statt ß steht „ss“ (E4), statt – ein Bindestrich.
- Ein neues bedienbares Ding: die Szene `components/interactable/interactable.tscn` als Kind anhängen, darunter eine `CollisionShape2D` legen und im Skript auf `interacted` hören.
- Eine neue Tür: `world/door/door.tscn` instanzieren. Ohne Kanal öffnet E sie; mit Kanal folgt sie allen Hebeln und Druckplatten mit demselben Kanal. Ein Gittertor bekommt beim Kind `PropView` den Skin `data/skins/gate_bars.tres`.
- Zerstörbares ins Level: `world/destructible/pot.tscn`, `crate.tscn`, `rock.tscn` oder `tree.tscn` instanzieren. Ein neues Ding: im Editor „Neue geerbte Szene“ aus `destructible.tscn`, dann Skin, Leben, Splitter, Beute-Liste und Formen wählen. Ohne `LootSpawner` im Level fällt keine Beute.
- Eine neue Beute-Liste ist eine Kopie einer Datei aus `data/loot/`; jede Zeile hat Gegenstand, Anzahl und Wahrscheinlichkeit von 0 bis 1.
- Eine Truhe ins Level: `world/chest/chest_small.tscn` oder `chest_big.tscn` instanzieren. Verschließen: bei `required_key` einen Gegenstand wählen, etwa `data/items/gold_key.tres`. Andere Beute: beim Kind `LootDropper` eine andere Liste aus `data/loot/` wählen. Ein Schlüssel zum Finden: `entities/pickup/pickup.tscn` instanzieren und als `item` den Schlüssel wählen.
- Neue Ausrüstung: eine Datei aus `data/items/` kopieren, etwa `broadsword.tres`, und `id`, Namen, Symbol, Platz und Werte ändern. Eine Waffe bekommt bei `melee` eigene Werte wie in `data/player/sword.tres`. Ins Spiel kommt sie als Beute, in einer Truhe oder als `Pickup` am Boden.
- Ein neues Fenster bekommt das Holz-Thema, indem man bei seinem obersten `Control` unter `Theme` die Datei `ui/theme/wood_theme.tres` wählt.
- Eine neue Fähigkeit zeigt das HUD von selbst, sobald sie unter `Abilities` der Figur hängt. Ihr Symbol steht in ihrer Werte-Datei (`icon`, `icon_disabled`), ihre Taste in `key_icons` am Knoten `Hud/BottomBar/AbilityBar`.
- Ein HUD für eine zweite Figur: `ui/hud/hud.tscn` ein zweites Mal ins Level hängen und `player_id` auf 2 stellen.
- Bildebenen der Oberfläche: HUD 90, Debug-Anzeige 100, Inventarfenster 105, Fadenkreuz 110. Ein neues Fenster gehört zwischen 100 und 110, eine neue Anzeige am Bildrand unter 100.
- Neue Splitter: eine Datei aus `data/effects/debris_*.tres` kopieren, Streifen und `piece_count` anpassen und sie einem `DebrisCue` geben. Die Streifen in `FX/Particle/` sind Bruchstücke nebeneinander, keine Animation; mit `tint` lässt sich ein Streifen einfärben.

## Offene Punkte

- M12 – HUD: geliefert am 17.11.2026 als `m12_hud.zip`, der Test des Nutzers steht aus. Danach schließt Claude M12 ab – damit ist Phase 2 fertig – und schlägt M13 – Erster Gegner vor.
- Beim Bauen von M12 ergänzt: Kugel und Leiste wachsen in ganzen Pixeln und zeigen mindestens einen, die Herzen mindestens ein Viertel, solange noch etwas da ist. Fähigkeiten und Geschoss-Zelle stehen in einer Reihe, die sich anpasst. Die Debug-Anzeige lässt sich mit `align_right` wieder nach links stellen.
- Lebensleisten über Gegnern – das Paket hat dafür `LifeBarMiniUnder.png` und `LifeBarMiniProgress.png` – kommen mit den Gegnern in Phase 3.
- Zwei Dinge hat Claude in M11 selbst ergänzt, der Nutzer hat sie mit dem Test bestätigt: Esc schließt das Inventarfenster ebenfalls, und das Fenster liegt über der Debug-Anzeige.
- Im Inventarfenster haben mehr als 20 Plätze noch keinen Raum; ein größeres Inventar braucht später Blättern oder einen größeren Rahmen.
- Eine Sache hat Claude in M10 selbst ergänzt, der Nutzer hat sie mit dem Test bestätigt: das goldene Funkeln beim Öffnen. Zurücknehmen ohne Code: in `world/chest/chest.tscn` den Knoten `OpenEffect` löschen.
- Schlüssel gibt es bisher nur für Truhen. Türen mit Schloss – das Paket hat dafür den Schlüsselloch-Block in `TilesetDungeon.png` – kommen, wenn ein Level sie braucht.
- Drei Dinge hat Claude in M9 selbst entschieden, der Nutzer hat sie mit dem Test bestätigt: keine Energie aus Zerstörbarem, Blätter je Hieb am Baum, der graugrüne Fels als Stein. Zurücknehmen ginge ohne Code: `feeds_attacker` an der Hurtbox anschalten, den Knoten `LeafHit` löschen, in `data/skins/rock.tres` eine andere Zelle wählen.
- Zerstörtes kommt nicht wieder, Beute bleibt liegen, bis der Raum neu lädt. Ob Dinge später wiederkehren und ob Beute verschwindet, gehört zu M16.
- Ein Kanal kennt nur ODER: Eine Tür ist offen, sobald einer ihrer Schalter an ist. Ein Tor, das zwei Hebel zugleich braucht, gibt es noch nicht.
- Ton (A3): auf Wunsch des Nutzers verschoben, fast ans Ende des Projekts, mit Phase 7 – Feinschliff. Bis dahin hat kein Modul Ton; `SoundCue` und die Ton-Tabelle entstehen erst dann.
- Der Hieb-Effekt richtet sich nicht von selbst nach der Trefferzone: Ändern sich `start_distance` oder `reach` in `data/player/sword.tres`, ist `distance` am Knoten `SlashEffect` der Spielfigur nachzuziehen. Heute ist es 8, also `start_distance` + 2.
- Grafik, noch ungeprüft – Claude klärt das, bevor ein Schritt es braucht: Lage des Katanas über der Figur (erst wenn das Schwert sichtbar wird); Effekte, die im Katalog „unklar“ heißen (wenn ein Schritt sie braucht); alle Töne, bisher nur die Namen (A3); Übergangsregeln der Kacheln (A4); `TilesetFloor.png` mit 417 Pixeln Höhe, nicht durch 16 teilbar (A4).
- Schießen zeigt kein eigenes Bild der Figur; das Paket hat für die `NinjaGreen` keins. Die Geschosse haben seit M11a ihr Flugbild.
- Wer vor wem gezeichnet wird, richtet sich noch nach der Reihenfolge der Knoten. Eine Sortierung nach Höhe im Bild folgt mit den Kacheln in A4. Seit M9 fällt das am Baum auf: Läuft die Figur hinter seine Krone, steht sie trotzdem davor.
- Zauber: „keine eigene Kategorie“ ist nur vorläufig gewählt. Die Entscheidung liegt beim Nutzer.
- Unsichtbarkeit: Dass Gegner die Figur verlieren und ein Angriff daraus Bonus-Schaden macht, folgt mit den Gegnern in Phase 3.
- Geschosse kommen seit M9 als Beute aus Töpfen, Kisten und Steinen nach, seit M10 auch aus Truhen. Energie aus Fläschchen und Speicherpunkten folgt später.
- Dynamit trifft die Spielfigur nicht. Ob es später auch eigenen Schaden geben soll, entscheidet der Nutzer.
- `data/player/ammo.tres` ist seit M11a nicht mehr eingehängt; `bow.tres` gilt nur noch ohne `AmmoSelector`. Beide bleiben vorerst liegen.
- Die Debug-Anzeige stößt an ihre Grenze, seit M9 mit bis zu zwölf Zeilen. Seit M12 zeigt das HUD Leben, Energie, Ausdauer, Fähigkeiten und Geschoss; die Debug-Anzeige bleibt zum Nachprüfen und steht oben rechts.
- Tod & Speichern: Der Neustart des Raums ist vorläufig. Was beim Tod verloren geht und wo gespeichert wird, ist vor M16 zu entscheiden.
- Stottert die Bewegung auf einem Monitor mit mehr als 60 Hz, gibt es dafür die Physik-Interpolation als Projekteinstellung. Sie ist bewusst noch aus.
- Der Sicherungsordner `E:\GitHub\TT_alt` kann gelöscht werden, falls er noch existiert.
- In `components/`, `levels/test_chamber/`, `entities/player/` und `data/` liegt noch je eine `.gitkeep`, die nicht mehr gebraucht wird.
