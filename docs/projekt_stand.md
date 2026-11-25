# TimeTraveller – Projektstand

Diese Datei führt Claude. Sie hält fest, wo das Projekt steht und was im Code existiert.
Nach jedem abgeschlossenen Schritt liefert Claude eine neue, vollständige Fassung.
Sie ersetzt die alte an zwei Orten: im Repo unter `docs/projekt_stand.md` und im Projektwissen des Claude-Projekts.

Der ausführliche Plan steht im Projektdokument: https://claude.ai/artifact/VsJhWxFHsnRPmCMFcH483R – der Grafik-Plan dort im Tab „Grafik & Assets“.
Er ist eine Richtlinie, kein Zwang. Was vorgezogen oder eingeschoben wird, steht unten unter „Außer der Reihe“.

## Stand

| | |
| --- | --- |
| Stand vom | 25.11.2026 |
| In Arbeit | Gate G2 – Alles zusammen: vorgeschlagen am 25.11.2026 nach dem Test von M20b, im Plan-Dokument unter Phase 4 und hier unter „Vorschlag für Gate G2 – Alles zusammen“; angegangen wird es nach „weiter“ oder mit den Änderungen des Nutzers |
| Als Nächstes | Der Nutzer entpackt `m20b_abschluss.zip` – nur die Stand-Datei, sie ersetzt die aus `m20b_karte_missionen.zip` – und lädt M20a und M20b hoch: alle Dateien aus `m20a_menues.zip` und `m20b_karte_missionen.zip`, die `.uid`-Dateien der neuen Skripte, `time_capsule_icon.png.import` und `project.godot` mit der Hauptszene `levels/boot/boot.tscn`. Dann sieht er sich den Vorschlag für Gate G2 an und sagt „weiter“ oder nennt Änderungen; angehen geht hier oder im neuen Chat, die erste Nachricht steht unter „Neuer Chat und Arbeitsweise“. Danach A4 – Kacheln & Räume vor Level 1 und Phase 5; der Fähigkeitsbaum als eigener Schritt, wann der Nutzer will; A3 – Ton erst fast am Ende des Projekts |
| Zuletzt abgeschlossen | M20b – Karte & Missionsfenster, am 25.11.2026: im selben Chat nach dem Vorschlag gebaut, Test bestanden („OKay alles passt soweit“); noch nicht hochgeladen. Damit ist M20 – Menüs fertig und mit ihm Phase 4 – Spielrahmen. Davor am 22.11.2026 M20a – Hauptmenü, Spielstände, Pause, Optionen und Kamera: im neuen Chat nach der Vorgabe des Nutzers gebaut, Test bestanden („Ja alles passt soweit“); noch nicht hochgeladen. Davor am selben Tag M19 – Freischaltungen: Test bestanden („Ja das mit den Freischaltungen passt und ich habe alles probiert und es klappt“), hochgeladen mit Commit `60679fd` „m19 abilities finished“, die Stand-Datei aus `m20_plan.zip` mit Commit `7c91b12` „m20 vorbereitung“ – `project.godot` fehlt in beiden. Davor am selben Tag M18 – Räume & Levelwechsel im neuen Chat: Test bestanden („Ja ich bin die Prüfliste durchgegangen und es funktioniert alles.“), die Abweichungen beim Bau vorher bestätigt („Ja das ganze passt“); hochgeladen mit Commit `4b15a16` „m18 level und missionen“ samt `m18_abschluss.zip`, ohne `project.godot`. Davor am selben Tag M17 – Missionen: Test bestanden („Alles klappt!“), hochgeladen mit Commit `23dca62` samt Stand-Datei, Grafik-Katalog und dem Bild der Zeitkapsel. Davor am 21.11.2026 M16 – Speichern & Laden: Test bestanden („Okay also ich habe jetzt alles getestet und es funktioniert“), hochgeladen mit Commit `76bd2bf`. Davor am selben Tag M15 – NPCs & Dialog: Test bestanden („der Rest klappt“), dazu eine Nachbesserung auf Wunsch des Nutzers – die Spielfigur dreht sich im Gespräch zum NPC –, mit dem Hochladen bestätigt; damit ist Phase 3 fertig. Davor am 18.11.2026 M14 – Gegnertypen, M13 – Erster Gegner nach einer Nachbesserung und M12 – HUD, damit war Phase 2 fertig; am 17.11.2026 M11 – Inventar & Ausrüstung, M10 – Truhen & Beute, M9 – Zerstörbares, M8 – Interaktion, A2 – Kampf-Bilder und damit Gate G1, M11a – Inventar-Logik, A1 – Figuren-Bild und A0 – Sichtung & Auswahl, am 16.11.2026 M7 – Fähigkeiten |
| Repo | https://github.com/LEJM4/TT – öffentlich, Zweig `main`. Am 25.11.2026 vor dem Bau von M20b nicht zu lesen: GitHub verweigerte von hier aus den Zugriff, über die Shell wie über den Abruf der Seite; M20b baut deshalb auf `7c91b12` und dem getesteten `m20a_menues.zip` auf. Zuletzt gelesen am 22.11.2026 vor dem Bau von M20a: Commit `7c91b12` „m20 vorbereitung“ mit der Stand-Datei aus `m20_plan.zip`, davor `60679fd` „m19 abilities finished“ mit M19 – alle 31 Dateien aus `m19_freischaltungen.zip` wie geliefert, Stand-Datei und Grafik-Katalog, dazu die `.uid`-Dateien der vier neuen Skripte. M19 liegt damit vollständig im Repo. `project.godot` fehlt weiter: Die Hauptszene steht im Repo noch auf der Testkammer. M20a baut auf `7c91b12` auf und liegt noch nicht im Repo. Davor `4b15a16` „m18 level und missionen“ mit M18 und der Stand-Datei aus `m18_abschluss.zip`; `23dca62` „m17 abschluss“ mit M17, Stand-Datei, Grafik-Katalog und dem Bild `assets/test_art/objects/zeitkapsel.jpg` – heute `time_capsule.jpg`; `8fd3b22` „vorbereitung fuer m17“; `76bd2bf` „spielstand speichern“ mit M16; `064a29e` mit der Übergabe nach M15, `985f098` mit M15, `d09ce9a` mit M14, `886f6f9` mit M13, `19e426c` mit M12, `1b7abfc` mit M9 bis M11, `e615355` mit M8, `e7909b2` mit A2, `369a648` mit A1 und M11a und `9b6d28a` mit M0 bis M7 und den Übergabe-Dateien unter `docs/`; alle Commits unter `LEJM4` |

## Neuer Chat und Arbeitsweise

Ein neuer Chat hat keine Kopie früherer Lieferungen. Er kennt nur diese Datei, den Grafik-Katalog, das Plan-Dokument und das Repo.

**Was ein neuer Chat zuerst tut**

1. Diese Datei lesen, dann im Plan-Dokument den Tab, um den es geht.
2. Das Repo einmal klonen und den Code lesen. Fehlt dort etwas, das hier als fertig steht, bittet Claude den Nutzer, es hochzuladen, statt es aus dieser Datei nachzubauen.

**Regeln für alle Gegner**

- Seit M13: Abstände in Kacheln (`ViewSettings.tiles()`), Bemerken nur in der fairen Grenze von `Perception`, Schlag sofort mit dem ersten Bild der Hieb-Animation, kein Blinken beim Angriff; die Welt erscheint mit Zoom 2 aus `data/world/view.tres`.
- Seit M14: Neue Gegner und Gegnertypen kommen als neue Dateien dazu – Aufbau unter „Gegnertypen im Einzelnen (M14)“. Der Nutzer will später viele weitere Typen.

**Regeln für alle Level (seit M18)**

- Ein neues Level ist eine Szene mit dem Skript `levels/level.gd` an der Wurzel und `levels/level_frame/level_frame.tscn` als letztem Kind; Räume, Wände, Zeitkapsel und `MissionTracker` bringt es selbst mit. Damit man hinreisen kann, kommt es in `data/world/travel.tres` und als Antwort an die Zeitsteuerung in `data/dialogs/time_console.tres`.
- Szenen wechselt nur der `SceneManager`; kein Modul ruft `change_scene_*` oder `reload_current_scene()` selbst auf, außer als Rückfall ohne SceneManager.

**Regeln für Menüs (seit M20)**

- Ein Menü ist eine eigene Szene unter `ui/menus/` mit einem Skript, das von `MenuScreen` (`ui/menus/menu_screen.gd`) erbt: ein `CanvasLayer` mit `Root` – Thema `ui/menus/menu_theme.tres` – und darin `Window`. Es läuft auch bei Pause, meldet `menu_changed`, ist mit Maus und Tastatur bedienbar; was nur die Maus erreichen soll, bekommt `focus_mode` „None“.
- Angehalten wird nur im Einzelspiel und nur vom Pausenmenü (`SceneTree.paused`). Kein Modul hängt seine Logik an die Pause; Zeiten, die mit der Welt stehen sollen, laufen über `create_timer(…, false)` oder über Knoten, die mit der Pause anhalten.
- Gespeichert wird nur, wenn ein Platz offen ist. Wer einen Spielstand braucht, fragt `SaveManager` und `GameState`; Einstellungen des Spielers stehen in `GameOptions`.
- Seit M20b: Ein Fenster, das im Spiel aufgeht und die Welt weiterlaufen lässt – Inventar, Karte –, öffnet nur, wenn sonst kein Fenster seiner Figur offen ist; dafür zählt es `menu_changed` mit, wie `PlayerInput`. Im offenen Fenster fängt es die Tasten ab, die sonst ein anderes Fenster öffnen würden, etwa Tab.

**Regeln für Freischaltungen (seit M19)**

- Was gesperrt sein kann, steht in `data/unlocks/unlocks.tres`. Frei schaltet nur `GameState`; Fundstücke, Missionen und Gespräche bitten darum mit `unlock_requested`. An der Spielfigur fragt der Baustein `Unlocks` (`UnlockGate`), eine Fähigkeit nennt ihre Freischaltung in `unlock_id`.
- Neue Mechaniken, die gesperrt sein sollen, bekommen eine Kennung in der Werte-Datei und fragen an der Figur über `UnlockGate`; das HUD zeigt nur, was frei ist.

**Übergabe nach M20b (25.11.2026)**

Geht der Nutzer Gate G2 in einem neuen Chat an, lädt er vorher M20a und M20b hoch – samt `project.godot` und der Stand-Datei aus `m20b_abschluss.zip`. Erste Nachricht:

> Neuer Chat für TimeTraveller, weiter nach M20b. M20a und M20b sind getestet und hochgeladen. Lies zuerst die Stand-Datei und das Repo, dann geh Gate G2 nach dem Vorschlag an.

Hat der Nutzer den Vorschlag geändert, schreibt er die Änderungen dazu. Der neue Chat prüft zuerst, ob M20a und M20b vollständig im Repo liegen – die 40 Dateien aus `m20a_menues.zip` und die 21 aus `m20b_karte_missionen.zip` ohne die Dokumente, dazu die `.uid`-Dateien der neuen Skripte – und ob `project.godot` die Startszene `levels/boot/boot.tscn` nennt; dann geht er nach „Vorschlag für Gate G2 – Alles zusammen“ vor.

Die Übergabe nach M20a ist entfallen: Der Nutzer hat am 25.11.2026 mit „weiter“ im selben Chat weitergemacht, dort ist M20b entstanden.

Die Übergabe nach M19 ist erledigt: Der neue Chat hat am 22.11.2026 M19 im Repo geprüft – vollständig mit Commit `60679fd`, die Stand-Datei mit `7c91b12`; `project.godot` nennt weiter die Testkammer als Hauptszene – und M20a nach dem Plan gebaut.

Die Übergabe nach M18 ist entfallen: Der Nutzer hat am 22.11.2026 mit „weiter“ im selben Chat weitergemacht, dort ist M19 entstanden.

Die Übergabe vom 22.11.2026 nach M17 ist erledigt: Der neue Chat hat M17 und das Bild der Zeitkapsel im Repo geprüft (Commit `23dca62`) und M18 nach dem Plan gebaut.

Die Übergabe vom 21.11.2026 nach M15 ist erledigt: Der neue Chat hat M15 und die Stand-Datei im Repo geprüft (Commit `064a29e`) und M16 nach dem Plan gebaut.

Die Übergabe vom 18.11.2026 nach M13 ist erledigt: M13 liegt im Repo (Commit `886f6f9`); der neue Chat hat das geprüft und auf Wunsch des Nutzers gleich M14 gebaut. Übrig war nur der Ordner `components/windup_flash`.

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
| So prüft Claude | am Text mit einem eigenen Prüfskript; seit M16 zusätzlich mit der Linux-Fassung von Godot 4.7.2 ohne Fenster, aus dem offiziellen Release auf GitHub: Import, Laden aller Szenen und Skripte und Abläufe mit einem eigenen Prüf-Autoload, der nur in Claudes Arbeitskopie liegt; seit M17 auch mit Bild: Godot zeichnet mit einem virtuellen Bildschirm (Xvfb, Renderer `gl_compatibility`), und Claude sieht sich die Bilder aus dem Spiel an; seit M20 drückt der Prüf-Autoload auch Knöpfe in Menüs mit Mausklicks. Das ersetzt nicht den Test des Nutzers – Gefühl und Bedienung mit Maus und Tastatur sieht nur er |

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
| | M12 HUD | fertig am 18.11.2026 – damit ist Phase 2 fertig |
| 3 – Gegner & NPCs | M13 Erster Gegner | fertig am 18.11.2026 – nach einer Nachbesserung am selben Tag |
| | M14 Gegnertypen | fertig am 18.11.2026 – Nahkämpfer und Fernkämpfer als Baukasten für viele weitere Typen |
| | M15 NPCs & Dialog | fertig am 21.11.2026 – mit drei Änderungen des Nutzers und einer Nachbesserung: Die Spielfigur dreht sich im Gespräch zum NPC. Damit ist Phase 3 fertig |
| 4 – Spielrahmen | M16 Speichern & Laden | fertig am 21.11.2026 – mit Zeitanker, Kapselstand und Levelstand; gebaut im neuen Chat |
| | M17 Missionen | fertig am 22.11.2026 – je Level eine Missionen-Datei, Liste zum Ein- und Ausklappen, Auftraggeber; Test bestanden („Alles klappt!“) |
| | M18 Räume & Levelwechsel | fertig am 22.11.2026 – gebaut im neuen Chat nach dem Plan, Test bestanden („es funktioniert alles“): Zeitkapsel im Level – Landepunkt, Landung, Rückreise nach den Pflichtmissionen, sonst Reise abbrechen –, innen die Lobby mit der Zeitsteuerung, SceneManager mit Überblendung und Startszene, Räume mit gleitender Kamera, Testfeld als zweites Level. Die einfache Karte rückt zu M20 |
| | M19 Freischaltungen | fertig am 22.11.2026 – gebaut im selben Chat nach dem Vorschlag, Test bestanden („es klappt“): Fernkampf, Dash, Schleichen, Stun, Unsichtbarkeit und Schnelligkeit gesperrt, bis ein Fundstück, eine Mission oder ein Gespräch sie freischaltet; für alle Spieler gemeinsam; Pos1 schaltet alles frei. Erfahrung, Stufen und Fähigkeitsbaum erst nach M20 |
| | M20 Menüs | fertig am 25.11.2026 – M20a fertig am 22.11.2026, im neuen Chat nach der Vorgabe des Nutzers gebaut, Test bestanden („Ja alles passt soweit“): Hauptmenü mit „Start“, „Optionen“, „Beenden“; Spielstand-Auswahl mit drei Plätzen, Löschen nur dort per Mausklick mit Nachfrage; Pausenmenü mit Esc – Weiter, Optionen, Reise abbrechen, Hauptmenü, Spiel beenden –; Optionen mit eigener Datei; die Kamera folgt immer. M20b – Karte & Missionsfenster am 23.11.2026 vorgeschlagen, am 25.11.2026 auf „weiter“ gebaut: ein Fenster auf M mit Karte der erkundeten Räume und allen Missionen; Test bestanden („OKay alles passt soweit“). Damit ist Phase 4 fertig |
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
| A5 Oberfläche | Schrift und Thema, Herzen, Leisten, Fähigkeits- und Tastensymbole, Dialogfeld | mit M11, M12, M15, M17 und M20 | in Arbeit – mit M11 das Holz-Thema für Fenster, mit M12 Herzen, Energie-Kugel, Ausdauer-Leiste, Fähigkeits- und Tastensymbole, mit M15 das Dialogfeld, mit M17 Missionsliste und Hinweise, mit M20a die Menüs – eigenes Holz-Thema mit Knöpfen, Schiebereglern, Häkchen und Lösch-Symbol, die Tastenbilder aus `Ui/Input/`; mit M20b die Reiter und die Bildlaufleiste aus dem Holz-Thema, die Karte und ein kleines Bild der Zeitkapsel |
| A6 Gegner, NPCs, Bosse | Skins für Monster, einfache Figuren und Bosse | mit M13 bis M15 | in Arbeit – mit M13 der Höhlenmensch `Caveman2` als erster Gegner, mit M14 die Steinwerferin `Cavegirl` und ihr Stein aus `FX/Particle/Rock.png`, mit M15 die NPCs `Shaman` und `CaveLion` mit Porträt, mit M17 die Sammlerin `Cavegirl2`; Bosse folgen mit den Leveln |

Eigene Grafik des Nutzers: Seit M18 steht die Zeitkapsel im Spiel – `assets/test_art/objects/time_capsule.png`, 66 × 64 Pixel, aus seinem Bild `zeitkapsel.jpg` gewonnen. Mehr dazu im Grafik-Katalog unter „Eigene Testgrafik“.

Ab A1 bringt jedes neue Modul sein Bild gleich mit: M8 aus `TilesetDungeon`, `TilesetHouse` und `TilesetElement`, M9 aus `TilesetElement`, M10 aus `Items/Treasure`, M11 aus `Ui/Theme/Theme Wood` und `Items/Weapons`, M12 aus `Ui/Receptacle`, `Ui/Skill Icon` und `Ui/Input/Keyboard`, M13 aus `Actor/Character/Caveman2`, `Ui/Emote` und `FX/Attack/Claw`, M14 aus `Actor/Character/Cavegirl` und `FX/Particle/Rock.png`, M15 aus `Actor/Character/Shaman`, `Actor/Character/CaveLion`, `Ui/Dialog`, `Ui/Arrow.png` und `Ui/Input/Keyboard`, M16 aus `TilesetDungeon`, M17 aus `Actor/Character/Cavegirl2`, `Ui/Theme/Theme Wood`, `Ui/Arrow.png`, `Ui/Input/Keyboard` und `TilesetElement`, M18 aus `TilesetDungeon` (der Kristall als Zeitsteuerung), `FX/Smoke/SmokeCircular` und `FX/Magic/Spark` – dazu das Bild der Zeitkapsel aus `assets/test_art/` –, M19 aus `Items/Scroll`, M20a aus `Ui/Theme/Theme Wood`, `Ui/Input/Keyboard`, `Ui/Input/Mouse` und `TilesetLogic` (das rote Kreuz zum Löschen), dazu wieder das Bild der Zeitkapsel auf dem Startbildschirm, M20b aus `Ui/Theme/Theme Wood` (Reiter, Bildlaufleiste) und ein kleines Bild der Zeitkapsel für die Karte, `assets/test_art/objects/time_capsule_icon.png`. Den Ton bekommen alle Module erst mit A3, fast am Ende des Projekts.

**Gates**

- G1 nach Phase 1: Die Spielfigur fühlt sich gut an – Bewegen, Zielen, Zuschlagen, Ausweichen. Bestanden am 17.11.2026, siehe „Gate G1 und Ausblick“.
- G2 nach Phase 4: Alle Mechaniken laufen in der Testkammer zusammen, auch nach Speichern und Laden. Vorgeschlagen am 25.11.2026, siehe „Vorschlag für Gate G2 – Alles zusammen“.
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
| 18.11.2026 | Wunsch des Nutzers: Nach M13 – Erster Gegner wechselt er in einen neuen Chat. Claude liefert nach dem Test von M13 alles dafür und sagt, was im neuen Chat einzufügen ist. | vorbereitet am 18.11.2026 nach dem bestandenen Test: Stand-Datei, Plan-Dokument und erste Nachricht für den neuen Chat stehen bereit |
| 18.11.2026 | Wunsch des Nutzers nach dem ersten Test von M13: Sprites global größer („4x“); Fokus- und Angriffsabstand der Nahkämpfer in logischen Einheiten statt fester Pixel, fair und nicht einfach mit dem Faktor multipliziert; Schlag sofort mit dem ersten Bild der Hieb-Animation, weil sie nur ein Bild ohne Ausholen hat; kein rotes Blinken beim Angriff des Höhlenmenschen. Claude hat das als Nachbesserung von M13 gebaut – Zoom 2 statt 4, Begründung unter „Weltskalierung“. | eingebaut am 18.11.2026 als `m13_nachbesserung.zip`; Test bestanden („Alles passt“) |
| 18.11.2026 | Neuer Chat. Wunsch des Nutzers: gleich mit M14 beginnen, als Gegnertypen erst Nahkampf und Fernkampf; später kommen viele weitere dazu, deshalb so modular und einfach erweiterbar wie möglich. Claude hat M14 ohne vorherigen Vorschlag gebaut; die Entscheidungen stehen unter „Festlegungen“ und im Plan-Dokument. Dafür ist die Grundszene der Gegner einmal umgebaut: Den Angriff bringt jetzt der Gegnertyp mit, nicht mehr die Grundszene. | gebaut am 18.11.2026 als `m14_gegnertypen.zip`; Test bestanden („Passt alles“) |
| 21.11.2026 | Der Nutzer bestätigt den Vorschlag zu M15 mit drei Änderungen: Antworten wählt man nur mit 1 bis 3 oder mit der Maus, nicht mit W/S und E; eine Belohnung gibt es nur bei ausgewählten NPCs, die Beute springt dann vor der Figur auf den Boden; manche NPCs geben nur Auskunft – der Spieler antwortet nicht, der NPC sagt etwas, dann ist das Gespräch zu Ende. Claude hat M15 so gebaut, mit dem Jäger als zweitem NPC, der nur Auskunft gibt. Belohnung und „erledigt“ hängen deshalb an einzelnen Zeilen eines Gesprächs: Der Schamane sagt seinen kurzen Satz erst, nachdem er die Pfeile gegeben hat, nicht schon nach dem Abschied. | gebaut am 21.11.2026 als `m15_npcs_dialog.zip`; Test bestanden („der Rest klappt“) |
| 21.11.2026 | Wunsch des Nutzers nach dem Test von M15: „wenn die beiden miteinander sprechen, dann dreht sich auch der Spieler selbst zu dem, zu dem er spricht“ – der Rest klappt. Claude hat das als Nachbesserung gebaut: Die Spielfigur hat ein Blickziel `look_target`; der neue Baustein `TalkFacing` an der Figur setzt es im Gespräch auf den Sprecher und nimmt es danach wieder weg. | gebaut am 21.11.2026 als `m15_nachbesserung.zip`; eingespielt und mit Commit `985f098` hochgeladen – gilt als bestanden |
| 21.11.2026 | Antwort des Nutzers auf den Vorschlag zu M16: Tod wie vorgeschlagen; im Spiel lässt sich kein Spielstand löschen, nur später im Startmenü mit der Maus – F4 nur zum Testen; man soll ein Level verlassen können, der Fortschritt im Level geht dann verloren, dafür braucht es einen weiteren Speicherstand im Portal; Idee: Portalinventar und Levelinventar – das Inventar wird vor dem Level gesichert, im Level gespeichert und mit dem Abschluss ins Portalinventar übernommen. „Rest passt so.“ Auf seinen Wunsch hat Claude die Idee geprüft und einen Umsetzungsplan geschrieben; der Code entsteht im neuen Chat. | Plan fertig am 21.11.2026; gebaut im neuen Chat, siehe nächste Zeile und „Spielstand im Einzelnen (M16)“ |
| 21.11.2026 | Neuer Chat. Claude hat M15 und die Stand-Datei im Repo geprüft (Commit `064a29e`) und M16 nach dem Plan gebaut. Abweichend vom Plan: Test-Tasten Bild auf („Level abschließen“) und Bild ab („Level verlassen“) statt F6 und F7 – Godot 4.7.2 leitet F5 bis F8 an den Editor weiter, solange das Spiel eingebettet läuft –, dazu Ende: beendet das Spiel wie das X am Fenster, weil das eingebettete Spiel kein X hat. Ein Rückkehrpunkt für das ganze Spiel statt eines Zeitankers je Level. Die Meldung `save_requested`, damit niemand den SaveManager direkt aufruft. Den Ablauf hat Claude zusätzlich mit Godot 4.7.2 ohne Fenster durchgespielt, siehe „Prüfungen“ | gebaut am 21.11.2026 als `m16_speichern_laden.zip`; Test bestanden („alles getestet und es funktioniert“), hochgeladen mit Commit `76bd2bf` |
| 21.11.2026 | Antwort des Nutzers auf den Vorschlag zu M17: Die Missionsliste links unter den Herzen soll sich ein- und ausklappen lassen; Idee: „pro Level eine Missionen-Datei“. Auf seinen Wunsch hat Claude die Idee geprüft und einen Umsetzungsplan geschrieben; ergänzt: J oder ein Klick auf die Überschrift klappt um, ohne dass die Figur zuschlägt | Plan fertig am 21.11.2026; gebaut am 22.11.2026, siehe nächste Zeile und „Missionen im Einzelnen (M17)“ |
| 22.11.2026 | Auf „weiter“ hat Claude M17 nach dem Plan gebaut. Abweichend oder ergänzt: Die Sammlerin heißt im Code `gatherer`, nicht `collector` – `Collector` ist schon der Baustein zum Aufsammeln. Die Anzeige bekommt ihre Liste über eine eigene Meldung `mission_list_changed`, damit sie nichts selbst nachschlägt; die Hinweise erkennt sie am Vergleich zweier Listen. Vor der Abgabe fragt die Sammlerin – „Hier, bitte.“ oder „Noch nicht.“ –, vor dem Annehmen ebenso. Ohne offene Mission steht „Keine offenen Missionen“ in der Liste. Die Anzeige hat ein eigenes Thema mit 3 Pixeln mehr Wortabstand wie der Dialog. Die Belohnung heißt `data/loot/mission_branches.tres`. Den Ablauf hat Claude ohne Fenster durchgespielt und die Anzeige zum ersten Mal mit Bild angesehen, siehe „Prüfungen“ | gebaut am 22.11.2026 als `m17_missionen.zip`; Test bestanden („Alles klappt!“) |
| 22.11.2026 | Wunsch des Nutzers nach dem Test von M17: „die Zeitkapsel für später soll kein Portal sein sondern eine Zeitkapsel“ – das Bild liegt vorerst unter `assets/test_art/objects/zeitkapsel.jpg`. Sie steht dauerhaft im Level: Die Figur erscheint dort; nach allen Missionen geht es mit ihr zurück; ist der Spieler noch nicht fertig, kann er dort die Mission vorzeitig abbrechen. M18 macht der Nutzer in einem neuen Chat. Claude hat den Wunsch in den Plan für M18 eingebaut: „alle Missionen“ als alle Pflichtmissionen gelesen, wie beim Tor aus M17; vor Rückreise und Abbruch fragt die Zeitkapsel nach, weil der Abbruch nicht rückgängig zu machen ist; „Portalstand“ heißt jetzt „Kapselstand“, im Code bleibt `portal`; die einfache Karte rückt zu M20 | geplant am 22.11.2026; gebaut im neuen Chat, siehe nächste Zeile |
| 22.11.2026 | Neuer Chat. Claude hat M17 und das Bild der Zeitkapsel im Repo geprüft (Commit `23dca62`) und M18 nach dem Plan gebaut. Abweichend oder ergänzt: Das JPG trägt das Schachbrett als Teil des Bildes, ist also nicht durchsichtig; Claude hat daraus `assets/test_art/objects/time_capsule.png` gewonnen – 66 × 64 Pixel mit durchsichtigem Rand, gespiegelt, damit die Tür links liegt – und zeigt es mit `PropView` und dem Skin `data/skins/time_capsule.tres` statt mit `display_size`. Die Zeitkapsel steht in der Testkammer bei (240, 152), wo die alten Startpunkte waren, statt bei (88, 120): An der linken Wand stößt die Kamera an den Rand, und Missionsliste und HUD verdecken die Kapsel. Dafür rückt der Zeitanker auf (112, 120), die Ausrüstung zum Aufsammeln auf y 176 ab x 120. Neuer Baustein `TalkAction` – der gemeinsame Teil von Zeitkapsel und Zeitsteuerung. Abschluss, Abbruch und neues Spiel geschehen erst, wenn das Bild schwarz ist. Die Debug-Zeile „Spielstand“ kommt aus `DebugKeys` und steht damit in jedem Level; „Missionen“ sagt „Weg frei“ und „Weg zu“ statt „Tor“. Die Debug-Anzeige blendet in Testkammer und LevelFrame die Zeilen aus, die das HUD zeigt, in der Testkammer auch die der NPCs – sonst läge „S1 Raum“ unter dem Bildrand. Die Zeitsteuerung spricht als „Zeitkapsel“, weil „Zeitsteuerung“ nicht in den Reiter passt; die Zeitkapsel innen ist 20 × 10 statt 20 × 12 Kacheln, damit die Zeitsteuerung beim Betreten im Bild ist; die Landung dauert 0,7 s aus 28 Pixeln Höhe statt 0,5 s. Geprüft mit Godot ohne Fenster und mit Bild, siehe „Prüfungen“ | gebaut am 22.11.2026 als `m18_raeume_levelwechsel.zip`; vom Nutzer am selben Tag bestätigt („Ja das ganze passt“) und getestet |
| 22.11.2026 | Nach dem Abschluss von M18 hat der Nutzer mit „weiter“ den Vorschlag für M19 angenommen und im selben Chat weitergemacht statt in einem neuen. Claude hat M19 nach dem Vorschlag gebaut. Beim Bau entschieden: Das Fundstück ist eine Schriftrolle (`Items/Scroll/Scroll.png`), aufgenommen mit E. Die Hinweise oben in der Mitte zeigt weiter die Missionsanzeige, jetzt für jedes Modul über die neue Meldung `notice_requested`. Der Jäger bringt Schleichen in einer dritten Zeile bei, die Mission im Testfeld hat Schnelligkeit als Belohnung. Pos1 ist die Taste für „alles freischalten“, dazu die Debug-Zeile „Frei“. Die Debug-Anzeige blendet „S1 Geschoss“ aus – das zeigt das HUD –, damit „Anzeige: F1“ wieder ins Bild passt. Ohne `GameState` ist alles frei. Geprüft mit Godot ohne Fenster und mit Bild, siehe „Prüfungen“ | gebaut am 22.11.2026 als `m19_freischaltungen.zip`; vom Nutzer am selben Tag getestet und bestätigt |
| 22.11.2026 | Wunsch des Nutzers nach dem Test von M19: „Zur Kamera möchte ich doch lieber eine Kamera, welche die ganze Zeit folgt“ – „Die Änderung der Kamera machst du dann mit den Menüs zusammen“. Claude liest es so: Die Kamera bleibt immer auf der Figur, ohne Halt an Raum- und Levelrändern und ohne Gleiten beim Raumwechsel; Vorausschau und weiches Nachgleiten aus der Festlegung vom 16.11.2026 bleiben, die Raumkamera aus M18 bleibt als Einstellung | geplant am 22.11.2026 im Plan für M20, Teil M20a |
| 22.11.2026 | Vorgabe des Nutzers für M20 nach dem Vorschlag: Hauptmenü als Startbildschirm mit „Start“, „Optionen“ und „Beenden“ – ohne Rückfrage –; „Start“ öffnet die Spielstand-Auswahl mit genau drei Plätzen, leer „Neues Spiel“, belegt mit Epoche und Spielzeit; Löschen nur dort, nur per Mausklick auf ein Lösch-Symbol, mit der Frage „Spielstand wirklich unwiderruflich löschen?“ – Ja oder Nein; Pausenmenü mit Esc, im Einzelspiel friert die Welt ein; „Reise abbrechen“ nur in einem Level, mit derselben Nachfrage wie an der Zeitkapsel; „Hauptmenü“ und „Spiel beenden“ speichern vorher; die Optionen wie vorgeschlagen. Abweichend vom Vorschlag: kein „Weiterspielen“ im Hauptmenü, dafür die Spielstand-Auswahl; Karte und Missionsfenster nennt die Vorgabe nicht. „nicht im Hub/Zeitanker“ liest Claude als: nicht in der Zeitkapsel. M20 baut der Nutzer in einem neuen Chat | geplant am 22.11.2026, siehe „Plan für M20 – Menüs“; Bau im neuen Chat |
| 22.11.2026 | Neuer Chat. Claude hat M19 im Repo geprüft – vollständig, `project.godot` fehlt weiter – und M20a nach dem Plan gebaut. Beim Bau entschieden oder ergänzt: „Reise abbrechen“ im Pausenmenü zeigt dieselbe Frage mit denselben Antworten wie die Zeitkapsel, gelesen aus `data/dialogs/time_capsule_abort.tres`, aber als Nachfrage im Pausenmenü statt im Dialogfenster – so bleibt die Welt eingefroren; die Zeile „Noch sind nicht alle Pflichtmissionen erfüllt.“ fällt dort weg, weil sie nach erfüllten Pflichtmissionen nicht stimmt. Beim Löschen ist „Nein“ gewählt, Enter und Esc heißen Nein, „Ja“ erreicht nur die Maus; liegt die Maus auf einem Knopf nur für die Maus, ist nichts anderes gewählt. Die Menüs haben ein eigenes Holz-Thema mit 3 Pixeln mehr Wortabstand; `ui/theme/wood_theme.tres` bleibt, wie es ist. Der Startbildschirm zeigt den Titel und das Bild der Zeitkapsel. Die Tastenbelegung zeigt Bilder der Tasten und Maustasten. Startet eine Szene direkt im Editor oder fehlt das Hauptmenü, gilt der Platz, der zuletzt gespeichert wurde. Neuladen nach dem Tod, Aufstehen der Übungspuppen und Verschwinden besiegter Gegner halten jetzt mit der Pause an. Die Audio-Busse `Music` und `Sounds` stehen in `default_bus_layout.tres`. Vollbild lässt Godot im eingebetteten Spiel nicht umschalten – die Optionen zeigen dann einen Hinweis. Die Debug-Zeile „Spielstand“ beginnt mit dem Platz. Geprüft mit Godot ohne Fenster und mit Bild, siehe „Prüfungen“ | gebaut am 22.11.2026 als `m20a_menues.zip`; mit dem Test am selben Tag bestätigt („Ja alles passt soweit“) |
| 25.11.2026 | Der Nutzer hat den Vorschlag für M20b mit „weiter“ angenommen und im selben Chat weitergemacht. Das Repo war von hier aus nicht zu lesen; gebaut wurde auf `7c91b12` mit dem getesteten M20a. Beim Bau entschieden oder ergänzt: Die Zeitkapsel innen hat einen Raum „Zeitkapsel“ – oben im Fenster steht dann nur einmal „Zeitkapsel“. Raumnamen stehen oben links im Raum, damit die Figur sie nicht verdeckt; die Figur ist ein Pfeil aus Pixeln, auf vier Richtungen gerundet. Erfüllte Missionen stehen blass am Ende ihrer Gruppe. Das Fenster merkt sich bis zum Ende des Spiels die zuletzt offene Seite; Tab und Umschalt+Tab wechseln darin die Seite, statt das Inventar zu öffnen. Ein eigenes kleines Bild der Zeitkapsel, 16 × 16, aus `time_capsule.png` verkleinert. In der Tastenbelegung steht jetzt „Karte“ mit M. Reiter und Bildlaufleiste kamen ins Menü-Thema. Neue Debug-Zeile „Erkundet“. Nebenbei: Die Kommentare an `Room` und `RoomWatcher` beschreiben die Raumkamera jetzt als Einstellung ROOM. Geprüft mit Godot ohne Fenster und mit Bild, siehe „Prüfungen“ | gebaut am 25.11.2026 als `m20b_karte_missionen.zip`; mit dem Test am selben Tag bestätigt („OKay alles passt soweit“) |

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
| Weltskalierung | Die Kamera zeichnet die Welt mit ganzzahligem Zoom, Standard 2: Sichtbar sind 15 × 8,4 Kacheln, eine Figur erscheint im Fenster 1440 × 810 96 Pixel groß, bei 1920 × 1080 128. HUD, Fenster und Debug-Anzeige zoomen nicht mit. Die Welt rechnet weiter in Pixeln der Grafik; Abstände von Gegnern stehen in Kacheln zu 16 Pixeln und werden nicht mit dem Zoom multipliziert. Fair: Gegner bemerken nur, wer sie auf dem Bild hat, mit 1 Kachel Rand. Werte in `data/world/view.tres`; F3 schaltet in der Testkammer 1 bis 4 durch | Wunsch des Nutzers am 18.11.2026: „globale Skalierung 4x“. Claude hat 2 eingestellt, weil das Fenster die Grafik schon 3- bis 4-fach zeigt – mit 4 wären es 12- bis 16-fach und nur 7,5 × 4,2 Kacheln. Vom Nutzer nach dem Test am 18.11.2026 mit „Alles passt“ bestätigt |
| Entwickler-Tasten | F1 Debug-Anzeige ein und aus, F2 Raum neu starten; seit M13 in der Testkammer F3 Zoom; seit M16, nur im Debug-Build: F4 Spielstand löschen – seit M20 den des offenen Platzes –, Bild auf Level abschließen, Bild ab Level verlassen, Ende Spiel beenden mit Speichern, seit M19 Pos1 alles freischalten – seit M20b deckt Pos1 auch alle Räume auf der Karte auf –, seit M18 in jedem Level und in der Zeitkapsel (`DebugKeys`); Bild auf und Bild ab gehen denselben Weg wie die Zeitkapsel, ohne Nachfrage. F5 bis F8 belegt der Godot-Editor | entschieden am 15.11.2026; F4 Wunsch des Nutzers am 21.11.2026; Bild auf, Bild ab und Ende von Claude mit M16 gewählt, weil der Editor F6 und F7 abfängt; Pos1 von Claude mit M19, wie im Konzept unter „Werkzeuge in der Kammer“; nach dem Test am 21.11.2026 bestätigt |
| Sprint und Schleichen | Solange die Taste gehalten wird, kein Umschalten | entschieden am 16.11.2026 |
| Kamera | Bildmitte folgt der Figur auf ganzen Pixeln; Vorausschau ein Stück zur Maus und in Laufrichtung, weich nachgleitend. Seit M20 folgt sie auf Wunsch des Nutzers die ganze Zeit: kein Halt an Raum- und Levelrändern, kein Gleiten beim Raumwechsel; außerhalb des Levels ist der dunkle Hintergrund (0,05; 0,06; 0,08) zu sehen. Die Kamera im Level oder im Raum aus M18 bleibt als Einstellung `mode` in `data/player/camera.tres` | entschieden am 16.11.2026; die Werte bleiben einstellbar; Wunsch des Nutzers am 22.11.2026 nach dem Test von M19, gebaut mit M20a am 22.11.2026; mit dem Test am 22.11.2026 bestätigt |
| Pixelraster | „Snap 2D Transforms to Pixel“ ist an: Alles wird auf ganzen Pixeln gezeichnet | entschieden am 16.11.2026 |
| Tod | Die Figur erwacht nach einer Sekunde am letzten Zeitanker mit vollem Leben, ohne einen am Landepunkt des Levels – seit M18 vor der Zeitkapsel, die dabei nicht landet; neu geladen wird über den SceneManager mit Überblendung. Was sie gefunden, geöffnet oder erledigt hat, bleibt, wie in Hollow Knight – auch was nach dem letzten Rasten kam; Gegner stehen wieder auf, Beute, die noch am Boden liegt, ist weg. Dabei wird gespeichert | vorgeschlagen am 21.11.2026; vom Nutzer am selben Tag bestätigt („dein Vorschlag passt“); gebaut mit M16; nach dem Test am 21.11.2026 bestätigt |
| Kapselstand und Levelstand | Vor einem Level wird der ganze Fortschritt in der Zeitkapsel gesichert: der Kapselstand mit dem Kapselinventar. Im Level ändert sich eine Kopie davon, der Levelstand mit dem Levelinventar; Zeitanker speichern ihn, Tod und Beenden des Spiels behalten ihn. Mit dem Abschluss des Levels wird er zum neuen Kapselstand. „Level verlassen“ verwirft ihn: zurück zum Kapselstand. Getrennt wird nicht nur das Inventar, sondern alles, was sich im Level ändern kann – Ausrüstung, Truhen, Zerstörtes, aufgesammelte Gegenstände, NPCs, später Missionen und Freischaltungen. Level 1 hat noch keine Zeitkapsel: Dort ist der Kapselstand der Neubeginn, „Level verlassen“ beginnt Level 1 von vorn. Bei einem schon abgeschlossenen Level übernimmt jede Rückkehr in die Zeitkapsel den Levelstand. Bis 22.11.2026 hießen sie Portalstand und Portalinventar; im Code heißt der Kapselstand weiter `portal` | Idee des Nutzers am 21.11.2026 („Portalinventar und Levelinventar“); geprüft und ergänzt von Claude – alles statt nur des Inventars, Level 1, Rückkehr in abgeschlossene Level; gebaut mit M16 – in der Testkammer mit Bild auf und Bild ab –, der Weg über die Zeitkapsel mit M18; nach dem Test am 21.11.2026 bestätigt; „Kapselstand“ seit dem Wunsch des Nutzers vom 22.11.2026 – kein Portal, sondern eine Zeitkapsel |
| Spielstand löschen | Im Spiel lässt sich kein Spielstand löschen. Das geht seit M20 nur in der Spielstand-Auswahl im Hauptmenü, nur per Mausklick auf das rote Kreuz neben einem belegten Platz, danach „Spielstand wirklich unwiderruflich löschen?“: „Nein“ ist gewählt, Enter und Esc heißen Nein, „Ja“ erreicht nur die Maus. Zum Testen löscht F4 den offenen Platz – nur im Debug-Build, also nicht im fertigen Spiel | Wunsch des Nutzers am 21.11.2026; gebaut mit M16; nach dem Test am 21.11.2026 bestätigt; das Menü nach der Vorgabe des Nutzers vom 22.11.2026 gebaut mit M20a, „Ja“ nur per Maus von Claude ergänzt; mit dem Test am 22.11.2026 bestätigt |
| Level verlassen | Aus einem laufenden Level kommt man jederzeit zurück in die Zeitkapsel; der Fortschritt im Level geht dabei verloren. Weil das nicht rückgängig zu machen ist, fragt das Spiel vorher nach. Seit M18 geht das an der Zeitkapsel im Level: Sind die Pflichtmissionen noch offen, fragt sie, ob man die Reise abbricht. Ist noch kein Level abgeschlossen, gibt es die Zeitkapsel innen nicht: Dann beginnt das Level von vorn. Seit M20 bietet es auch das Pausenmenü an – „Reise abbrechen“, nur in einem Level, mit derselben Frage und denselben Antworten wie an der Zeitkapsel; zum Testen Bild ab, ohne Nachfrage | Wunsch des Nutzers am 21.11.2026; die Nachfrage hat Claude ergänzt; gebaut mit M16 – die Taste Bild ab statt F7, weil der Editor F7 abfängt; nach dem Test am 21.11.2026 bestätigt; über die Zeitkapsel Wunsch des Nutzers am 22.11.2026, gebaut mit M18 |
| Zeitanker | Ein Sockel mit Kugel aus `TilesetDungeon.png` – grau, bis die Figur dort rastet, blau, solange er Rückkehrpunkt ist; es leuchtet nur einer. E rastet: Leben und Energie voll, er wird Rückkehrpunkt, das Spiel speichert, es funkelt, und kurz steht „Gespeichert“ über ihm. Die Figur erwacht 16 Pixel vor ihm. In der Testkammer steht er seit M18 bei (112, 120) links von der Zeitkapsel, vorher bei (240, 88) | vorgeschlagen am 21.11.2026 mit M16, vom Nutzer bestätigt („Rest passt so“); gebaut mit M16; nach dem Test am 21.11.2026 bestätigt |
| Spielstand-Datei | Seit M20 drei Plätze – Vorgabe des Nutzers vom 22.11.2026: `user://saves/slot_1.json` bis `slot_3.json`, unter Windows `%APPDATA%\Godot\app_userdata\TimeTraveller\saves\`; der Spielstand von vorher ist Platz 1; lesbares JSON. Geschrieben wird auf den offenen Platz: beim Rasten, beim Tod, bei F2, beim Abschluss und Verlassen eines Levels, seit M18 vor jeder Reise in ein Level, seit M20 mit „Hauptmenü“ und „Spiel beenden“ im Pausenmenü, und beim Schließen des Fensters; im Hauptmenü ist kein Platz offen, dort wird nichts geschrieben. Der Stopp-Knopf des Editors beendet ohne Speichern. Gemerkt werden Inventar und Ausrüstung je Spielfigur, je Ding der Welt sein Zustand, die abgeschlossenen Level und der Rückkehrpunkt – nicht Gegner, Beute am Boden, Leben und Energie | vorgeschlagen am 21.11.2026 mit M16, vom Nutzer bestätigt; gebaut mit M16; nach dem Test am 21.11.2026 bestätigt |
| Missionen | Jede Mission hat einen Namen, Titel, Pflicht oder Neben, ein bis drei Ziele – „Ereignis“ oder „Gegenstand“ – und eine Belohnung als Beute-Liste. Je Level eine Datei mit allen seinen Missionen. Pflichtmissionen beginnen mit dem Level und sind erfüllt, sobald ihre Ziele erfüllt sind; Nebenmissionen gibt ein Auftraggeber im Gespräch, abgegeben werden sie bei ihm. Sind alle Pflichtmissionen erfüllt, meldet der `MissionTracker` den Kanal `missions_done` als an: In M17 öffnete das in der Testkammer ein Gittertor oben rechts, dahinter eine Luke als Ausgang; seit M18 macht es die Zeitkapsel bereit zur Rückreise. Gemerkt im Levelstand: Tod, F2 und Beenden behalten die Missionen, „Level verlassen“ verwirft sie, der Abschluss bringt sie in die Zeitkapsel | vorgeschlagen am 21.11.2026; die Datei je Level ist die Idee des Nutzers; gebaut mit M17 am 22.11.2026; nach dem Test am 22.11.2026 bestätigt („Alles klappt!“) |
| Missions-Anzeige | Links unter den Herzen: je Mission Titel und Ziele mit Stand, Pflicht zuerst, höchstens drei; mit J oder einem Klick auf die Überschrift ein- und ausklappbar; eingeklappt steht nur die Überschrift mit der Zahl, etwa „Missionen 2“. Der Klick auf die Überschrift löst keinen Schlag aus. Neue und erfüllte Missionen stehen 2,5 Sekunden oben in der Mitte, mehrere nacheinander; was aus dem Spielstand kommt, bringt keinen Hinweis | vorgeschlagen am 21.11.2026; Ein- und Ausklappen Wunsch des Nutzers am selben Tag; gebaut mit M17 am 22.11.2026; nach dem Test am 22.11.2026 bestätigt |
| Auftraggeber | Ein NPC, der eine Mission vergibt und abnimmt: Er bietet sie an, solange sie nicht angenommen ist, erinnert daran, solange sie läuft, nimmt sie ab, sobald sie bereit ist, und bedankt sich danach. Seine Sprechblase zeigt er, solange er anbietet oder abnehmen kann. Abgegebene Gegenstände gehen aus dem Inventar, die Belohnung springt vor die Figur. In der Testkammer: die Sammlerin (`Cavegirl2`, violettes Haar) rechts vom Baum unten links – zwei Äste gegen 5 Kunai | vorgeschlagen am 21.11.2026 mit M17; die Fragen vor Annehmen und Abgabe hat Claude beim Bauen ergänzt; nach dem Test am 22.11.2026 bestätigt |
| Zeitkapsel | Kein Portal, sondern eine Zeitkapsel. Sie steht dauerhaft im Level am Landepunkt: Vor ihr – links vor der Tür – erscheint die Figur bei der Ankunft und nach dem Tod ohne Zeitanker. Kommt die Figur gerade an, landet die Zeitkapsel: Sie sinkt in 0,7 s aus 28 Pixeln Höhe herab und wird sichtbar, dann wirbelt Staub auf. E an der Tür: Sind alle Pflichtmissionen erfüllt, fragt sie „Zurück in die Zeitkapsel?“ – „Einsteigen“ schließt das Level ab und übernimmt den Levelstand, „Noch nicht“ ändert nichts. Sonst sagt sie, dass noch Pflichtmissionen offen sind, und fragt „Reise abbrechen?“ – „Abbrechen“ verwirft den Fortschritt im Level, „Weitermachen“ ändert nichts. Ausgeführt wird erst nach dem Gespräch; Esc bricht ohne Folgen ab. Bereit ist sie, solange der Kanal `missions_done` an ist, den der `MissionTracker` meldet; dann funkelt es alle 1,6 s an ihrer Tür. Innen ist sie die Lobby, 20 × 10 Kacheln: ausrüsten mit Tab, am Kristall – der Zeitsteuerung – das Ziel wählen: Testkammer, Testfeld oder Hierbleiben. Es gibt sie, sobald ein Level abgeschlossen ist – vorher beginnt ein Abbruch das Level von vorn. Bild `assets/test_art/objects/time_capsule.png`, 66 × 64 Pixel, aus dem Bild des Nutzers | Wunsch des Nutzers am 22.11.2026; „alle Missionen“ hat Claude als alle Pflichtmissionen gelesen, die Nachfragen ergänzt; gebaut mit M18 am 22.11.2026, mit dem Test bestätigt |
| Szenenwechsel | Nur der `SceneManager` wechselt Szenen: Er blendet in 0,25 s aus, wechselt und blendet wieder ein, auf Bildebene 120 über allem; das hängt nicht an der Pause und gilt für alle Spielfiguren. Abschluss, Abbruch und neues Spiel geschehen erst, wenn das Bild schwarz ist. Gespeichert wird vor jeder Reise und vor jedem Neuladen. Die Ziele – Level, Startlevel, Zeitkapsel, Überblendung – stehen in `data/world/travel.tres` | geplant am 22.11.2026; gebaut mit M18, mit dem Test bestätigt |
| Startszene | Seit M18 startet das Spiel mit `levels/boot/boot.tscn`. Seit M20 zeigt sie das Hauptmenü; erst nach der Wahl eines Platzes geht es weiter – im laufenden Level, in der Zeitkapsel, sonst mit einem neuen Lauf im Startlevel, bis Level 1 der Testkammer. Ohne Hauptmenü geht es wie in M18 gleich weiter, mit dem zuletzt gespeicherten Platz. Die Hauptszene stellt der Nutzer per Klick um | geplant am 22.11.2026; gebaut mit M18, mit dem Test bestätigt; das Hauptmenü mit M20a; mit dem Test am 22.11.2026 bestätigt |
| Räume | Ein Level besteht aus Räumen in seiner eigenen Szene. Bis M19 blieb die Kamera in den Grenzen des Raums, in dem die Mitte ihrer Figur liegt, und glitt beim Wechsel in 0,35 s hinüber; seit M20 folgt sie frei, die Raumkamera bleibt als Einstellung. Jede Figur kann in einem anderen Raum sein. In der Testkammer: die Halle und der Ostraum hinter einem Durchgang in der rechten Wand | geplant am 22.11.2026; gebaut mit M18, mit dem Test bestätigt |
| Freischaltungen | Fernkampf, Dash, Schleichen, Stun, Unsichtbarkeit und Schnelligkeit sind zu Beginn gesperrt – nach dem Freischaltplan im Konzept; Laufen, Sprinten, Nahkampf, Zerstören, E und Inventar sind immer frei. Frei werden sie durch ein Fundstück in der Welt, die Belohnung einer Mission oder eine Zeile im Gespräch; oben in der Mitte steht dann „Neu freigeschaltet“. Sie gelten für alle Spieler gemeinsam und stehen im Kapsel- und Levelstand wie alles andere: Tod und Beenden behalten sie, ein Abbruch verwirft, was im Level dazukam. Gesperrt bewirkt die Taste nichts, und das HUD zeigt nur Freigeschaltetes. Erfahrung, Stufen und der Fähigkeitsbaum kommen erst nach M20 | Vorschlag von Claude am 22.11.2026, vom Nutzer mit „weiter“ angenommen; gebaut mit M19, nach dem Test bestätigt |
| Menüs (ab M20) | Hauptmenü als erster Bildschirm mit „Start“, „Optionen“ und „Beenden“ – sofort, ohne Rückfrage; darüber der Titel und das Bild der Zeitkapsel. „Start“ öffnet die Spielstand-Auswahl: genau drei Plätze, leer „Neues Spiel“, belegt mit dem Ort, an dem es weitergeht – Level des Laufs, Zeitkapsel oder Startlevel –, der Spielzeit und dem Zeitpunkt der letzten Speicherung; ein Klick beginnt oder setzt fort. Löschen nur dort, nur per Mausklick auf das rote Kreuz, mit „Spielstand wirklich unwiderruflich löschen?“ – Ja oder Nein. Pausenmenü mit Esc, im Einzelspiel friert die Welt ein: Weiter, Optionen, Reise abbrechen – nur in einem Level, mit derselben Frage und denselben Antworten wie an der Zeitkapsel –, Hauptmenü und Spiel beenden, beide mit Speichern. Optionen: Lautstärke für alles, Musik und Geräusche in Schritten von 10 %, Vollbild; eigene Datei `user://options.cfg`, dazu, ob die Missionsliste eingeklappt ist; die Tastenbelegung nur zum Ansehen. Bedienung mit Maus, Pfeiltasten oder W A S D, Enter oder Leertaste, Esc zurück; Aussehen: Holz-Thema | Vorgabe des Nutzers am 22.11.2026 nach Claudes Vorschlag; gebaut mit M20a am 22.11.2026 im neuen Chat – Einzelheiten unter „Menüs im Einzelnen (M20)“; mit dem Test am 22.11.2026 bestätigt |
| Karte und Missionen (ab M20b) | Ein Fenster auf M mit den Reitern „Karte“ und „Missionen“, in jedem Level und in der Zeitkapsel; M oder Esc schließt, A und D, die Pfeiltasten links und rechts oder Tab wechseln die Seite. Es geht nur auf, wenn sonst kein Fenster der Figur offen ist – kein Gespräch, kein Inventar, keine Pause. Die Welt läuft weiter, nur die Figur bleibt stehen. Karte: die erkundeten Räume des Levels, der Raum der Figur hell, die Figuren als Pfeil, die Zeitkapsel als kleines Bild, oben Level und Raum. Missionen: alle angenommenen, Pflicht zuerst, je Stand, Beschreibung und Ziele. Wände und Türen kommen erst mit den Kacheln (A4) auf die Karte | Vorschlag von Claude vom 23.11.2026, vom Nutzer am 25.11.2026 mit „weiter“ angenommen; gebaut mit M20b; mit dem Test am 25.11.2026 bestätigt |
| Erkundete Räume | Welche Räume eines Levels schon betreten wurden, steht im Kapsel- und Levelstand (`rooms`) und gilt für alle Spielfiguren: Tod und Beenden behalten es, ein Abbruch verwirft, was im Lauf dazukam, der Abschluss übernimmt es für die nächste Reise in das Level. Abgelegt wird nur über `GameState` | Vorschlag vom 23.11.2026; gebaut mit M20b; mit dem Test am 25.11.2026 bestätigt |
| Pause | Nur das Pausenmenü hält an, nur im Einzelspiel (`SceneTree.paused`): Gegner, Geschosse, Effekte, die Zeiten nach dem Tod und die Spielzeit stehen. Esc öffnet es, wenn weder Gespräch noch Inventar offen ist – dort schließt Esc wie bisher –, und nicht während eines Szenenwechsels. Im Mehrspieler hält nichts an, dann bleibt nur die eigene Figur stehen | Plan vom 22.11.2026; gebaut mit M20a; mit dem Test am 22.11.2026 bestätigt |
| Spielzeit | `GameState` zählt die Sekunden, solange ein Level oder die Zeitkapsel läuft – nicht im Hauptmenü, nicht in der Pause. Sie steht im Spielstand (`play_time`), nicht im Kapsel- oder Levelstand: Ein Abbruch nimmt keine Zeit zurück, F4 und ein neues Spiel setzen sie auf 0. Ältere Spielstände beginnen bei 0. Angezeigt als „Spielzeit unter 1 Min.“, „Spielzeit 12 Min.“ oder „Spielzeit 1 Std. 5 Min.“ | Plan vom 22.11.2026; die Anzeige hat Claude beim Bauen gewählt; mit dem Test am 22.11.2026 bestätigt |
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
| Zerstörbares | Topf 10 Leben (ein Hieb), Kiste 20, Baum 40, Stein 20. Topf, Kiste und Stein verschwinden, der Baum wird zum Stumpf, der weiter aufhält und an dem Pfeile enden. Der Stein nimmt nur Explosionen: Schwert und Geschosse prallen mit einem Funken ab, das Geschoss endet dort. Hiebe auf Zerstörbares füllen keine Energie. Splitter fliegen beim Zerbrechen, beim Baum fallen bei jedem Hieb Blätter. Es kommt nichts wieder – seit M16 auch nicht nach F2, Tod oder Laden; nur „Level verlassen“ und F4 stellen es her | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt; „keine Energie“ und die Blätter je Hieb hat Claude beim Bauen ergänzt. Nach dem Test vom Nutzer mit „Okay das programmierte passt“ bestätigt |
| Beute und Aufsammeln | Topf: mit 50 % 3 Shuriken. Kiste: 5 Pfeile, mit 30 % dazu 2 Kunai. Baum: 2 Äste. Stein: 1 Stein, mit 25 % dazu 1 Dynamit. Äste und Steine sind neue Gegenstände der Art Material, Stapel 99. Die Beute springt zur Seite oder nach vorn auf einen freien Platz, mit Zahl, wenn es mehr als eins ist. Drüberlaufen sammelt ins Inventar; was nicht passt, bleibt liegen | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „Okay das programmierte passt“ |
| Treffer-Arten | Jeder Treffer ist Klinge, Geschoss oder Explosion. Eine Hurtbox nimmt alle drei, außer sie ist anders eingestellt; die übrigen prallen ab | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „Okay das programmierte passt“ |
| Truhen | Kleine Truhe (türkis): E öffnet sie genau einmal, der Deckel geht auf, es funkelt, die Beute springt heraus – 10 Pfeile, mit 50 % dazu 5 Shuriken. Große Truhe (rot): verschlossen; mit einem Goldschlüssel im Inventar öffnet E sie und verbraucht ihn – 15 Pfeile, 5 Kunai, 3 Dynamit. Ohne Schlüssel wackelt sie kurz, und über ihr steht eine Sekunde lang das Symbol des Schlüssels. Offen bleibt eine Truhe – seit M16 auch nach F2, Tod und Laden. Der Goldschlüssel ist ein Gegenstand der Art Schlüssel, Stapel 9 | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt; das Funkeln beim Öffnen hat Claude beim Bauen ergänzt. Nach dem Test vom Nutzer mit „ja das passt alles“ bestätigt |
| Inventarfenster | Tab öffnet und schließt es, Esc schließt es. Links die vier Ausrüstungsplätze Waffe, Fernkampf, Rüstung, Anhänger, rechts die 20 Plätze als Raster mit Symbol und Anzahl, unten Name, Art und Werte des Gewählten. Ein Klick wählt, ein Doppelklick legt an oder ab. Solange es offen ist, bleibt die Figur stehen und greift nicht an; die Welt läuft weiter. Aussehen: das Holz-Thema des Pakets, Schrift `NormalFont` | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt; Esc zum Schließen hat Claude beim Bauen ergänzt. Nach dem Test vom Nutzer mit „alles klappt“ bestätigt |
| Ausrüstung | Angelegtes liegt nicht im Inventar; beim Anlegen wandert das Vorige zurück, Ablegen geht nur mit Platz im Inventar. Waffe: bringt die Werte des Schwerthiebs mit; ohne Waffe gelten die aus `sword.tres`. Fernkampf: mehr Aufprall-Schaden für jedes Geschoss. Rüstung: zieht von jedem Treffer etwas ab, mindestens 1 bleibt. Anhänger: mehr Leben, das aktuelle Leben bleibt. Zum Testen: Katana (beim Start angelegt, 10 Schaden, 0,35 s), Breitschwert (15, 0,5 s), Bogen (+3), Lederrüstung (−3), Rubin-Anhänger (+20 Leben) | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test mit „alles klappt“ |
| HUD | Oben links die Energie als Kugel, die sich von unten blau füllt; rechts daneben das Leben als Herzen – ein Herz sind 20 Leben, in Vierteln, solange Leben übrig ist mindestens ein Viertel –; darunter die Ausdauer als schmale Leiste, grün, rot während der Erschöpfung. Unten links die Fähigkeiten 1 bis 3 mit der Taste darunter – Stiefel, Tarnung, Blitz-Buch –: orange umrahmt, solange sie wirken, grau mit Füllung im Uhrzeigersinn in der Abklingzeit, grau ohne genug Energie; daneben das gewählte Geschoss mit seiner Anzahl. Die Debug-Anzeige steht oben rechts. Keine Zahlen an Kugel und Leiste | von Claude vorgeschlagen; vom Nutzer am 17.11.2026 mit „weiter“ bestätigt, nach dem Test am 18.11.2026 mit „okay du kannst weitermachen“ |
| Erster Gegner | Ein Höhlenmensch (`Caveman2`) mit 30 Leben patrouilliert mit 30 Pixeln pro Sekunde zwischen zwei Punkten und wartet an jedem Ende 1 s. Er sieht 6 Kacheln nach vorn in einem Kegel von 100°, nicht durch Wände; läuft eine Figur, hört er sie im Umkreis von 2,5 Kacheln auch von hinten. Schleicht sie (Strg gehalten, auch im Stehen), sieht er sie nur halb so weit und hört sie nicht; unsichtbar oder tot bemerkt er sie gar nicht. Bemerken kann er sie nur, wenn er auf ihrem Bild steht, mindestens 1 Kachel vom Rand. Bemerkt er sie, bleibt er 0,4 s stehen – über ihm ein rotes „!“ –, dann verfolgt er sie mit 60 Pixeln pro Sekunde; als Verfolger sieht er rundum bis 10 Kacheln. Steht sie in der Reichweite seiner Faust (18 Pixel), schlägt er sofort zu – Faust-Bild, Krallen und Treffer im selben Moment, ohne Ausholen und ohne Blinken –: 10 Schaden; danach 0,6 s Pause, frühestens nach 0,8 s der nächste Schlag. Verliert er die Figur 1,5 s lang oder wird sie unsichtbar, geht er zur letzten Stelle – über ihm ein „?“ –, schaut sich 3 s um und kehrt zurück. Stun hält ihn an. Treffer, bevor er die Figur bemerkt hat, zählen doppelt; danach dreht er sich zum Angreifer. Lebensleiste ab dem ersten Treffer; beim Tod Rauch, Beute (3 Pfeile, mit 50 % 2 Shuriken), nach 1 s verschwindet er | von Claude vorgeschlagen; vom Nutzer am 18.11.2026 mit „weiter“ bestätigt; nach dem ersten Test am 18.11.2026 auf seinen Wunsch geändert: Abstände in Kacheln mit fairer Grenze, Schlag ohne Ausholen, kein rotes Blinken. Nach dem Test am 18.11.2026 mit „Alles passt“ bestätigt; seit M14 der erste Nahkämpfer, Verhalten unverändert |
| Gegnertypen | Baukasten in drei Stufen geerbter Szenen: Die Grundszene `enemy.tscn` hat alles außer dem Angriff. Ein Gegnertyp bringt Waffe und Angriffs-Modul mit – `melee_enemy.tscn` (Nahkämpfer), `ranged_enemy.tscn` (Fernkämpfer). Ein fertiger Gegner erbt von seinem Typ und bringt Skin, Werte und Beute mit. Angriffs-Module (`EnemyAttack`) hängen unter `Attacks`: Der erste bestimmt, auf welchen Abstand der Gegner geht; eingesetzt wird der erste, der gerade passt. Ein Gegner kann mehrere haben. Neue Typen kommen als neue Dateien dazu, ohne bestehenden Code zu ändern | Wunsch des Nutzers am 18.11.2026: erst Nahkampf und Fernkampf, später viele mehr, so modular wie möglich; den Aufbau hat Claude gewählt; nach dem Test am 18.11.2026 mit „Passt alles“ bestätigt |
| Fernkämpfer | Eine Steinwerferin (`Cavegirl`, grünes Haar) mit 20 Leben patrouilliert mit 30 Pixeln pro Sekunde. Sie sieht 7 Kacheln weit in einem Kegel von 90°; Hören, Schleichen, Unsichtbarkeit und faire Grenze wie beim Höhlenmenschen. Bemerkt sie die Figur – „!“, 0,4 s –, geht sie mit 50 Pixeln pro Sekunde bis auf 5 Kacheln heran und wirft, sobald nichts dazwischen ist: ein Stein, 10 Schaden, Tempo 120, höchstens 7 Kacheln Flug; er trifft nur Spielfiguren und endet an Wänden und Blöcken. Danach steht sie 0,3 s, frühestens nach 1,8 s kommt der nächste Wurf. Ist die Figur näher als 2,5 Kacheln, weicht sie mit 45 Pixeln pro Sekunde zurück und blickt sie dabei an; ist sie bereit, wirft sie auch aus der Nähe. Dazwischen wartet sie. Suchen, Rückweg, Überraschung, Stun, Lebensleiste und Tod wie beim Höhlenmenschen; Beute: 2 Steine, mit 50 % 3 Pfeile | von Claude gewählt am 18.11.2026 mit M14; nach dem Test am 18.11.2026 mit „Passt alles“ bestätigt |
| NPCs | Feste Figuren, die nicht kämpfen: ein Körper wie ein Block – man läuft nicht hindurch, Geschosse enden an ihnen, verletzen lassen sie sich nicht. Kommt die Figur nah, erscheint wie bei Türen die Taste E über ihrem Kopf; E beginnt das Gespräch, der NPC dreht sich zur Figur. Solange er etwas Neues zu sagen hat, wippt über ihm eine Sprechblase mit ein, zwei, drei Punkten. In der Testkammer: der Schamane (`Shaman`) rechts neben den Startpunkten mit Frage, drei Antworten und einmal 5 Pfeilen; der Jäger (`CaveLion`) links daneben gibt nur Auskunft. Gemerkt wird seit M16 im Spielstand | vorgeschlagen am 18.11.2026; vom Nutzer am 21.11.2026 bestätigt mit den Änderungen: Belohnung nur bei ausgewählten NPCs, manche NPCs geben nur Auskunft. Den Jäger hat Claude dafür ergänzt. Nach dem Test am 21.11.2026 bestätigt („der Rest klappt“) |
| Dialog | Fenster unten in der Mitte, 300 × 58 Pixel aus `Ui/Dialog/`: im Reiter der Name, links das Porträt, rechts bis zu drei Zeilen Text in `NormalFont` mit 3 Pixeln mehr Wortabstand. Der Text erscheint mit 40 Buchstaben je Sekunde; E, Leertaste oder Linksklick zeigt ihn ganz, noch einmal geht es weiter – darauf wartet unten rechts ein wippender Pfeil. Bei einer Frage stehen bis zu drei Antworten in Kästchen über dem Fenster, rechts bündig, mit der Taste 1, 2 oder 3 davor; gewählt wird mit 1 bis 3 oder mit der Maus, die Maus über einem Kästchen zeigt einen Rahmen. Jede Antwort führt an eine eigene Stelle. Ohne Antworten spricht nur der NPC; nach der letzten Zeile ist das Gespräch zu Ende. Esc bricht ab. Solange das Fenster offen ist, steht die Figur still und greift nicht an, Tab öffnet kein Inventar; die Welt läuft weiter. NPC und Spielfigur sehen sich an, solange sie sprechen; danach blickt die Figur wieder zur Maus. Nach dem Schließen greift die Figur erst nach dem Loslassen der Maustaste an | vorgeschlagen am 18.11.2026; vom Nutzer am 21.11.2026 bestätigt mit der Änderung: Antworten nur mit 1 bis 3 oder der Maus. Pfeil und Rahmen hat Claude beim Bauen ergänzt. Nach dem Test am 21.11.2026 bestätigt („der Rest klappt“), mit dem Wunsch, dass sich auch die Spielfigur zum NPC dreht – nachgebessert und mit dem Hochladen am 21.11.2026 bestätigt |
| Belohnung | Nur ausgewählte NPCs geben etwas: In ihrem Gespräch hat eine Zeile eine Beute-Liste. Erscheint die Zeile, würfelt der NPC die Liste, und die Beute springt vor der Figur auf den Boden – wie aus einer Truhe; aufgesammelt wird sie wie jede Beute. Jede solche Zeile gibt einmal je NPC; seit M16 merkt sich das der Spielstand. Eine Zeile kann den NPC auch als erledigt markieren: Dann verschwindet seine Sprechblase, und er spricht beim nächsten Mal sein kurzes Gespräch. Beim Schamanen sitzt beides an der Zeile mit den Pfeilen | Wunsch des Nutzers am 21.11.2026: „Nur bei ausgewählten NPC führt ein Dialog zu einer Belohnung. Die Beute springt dann vor mir auf den Boden.“ Die Umsetzung hat Claude gewählt; nach dem Test am 21.11.2026 bestätigt |
| Gespräche als Daten | Ein Gespräch ist eine Werte-Datei in `data/dialogs/`: Zeilen nacheinander, jede mit Text, auf Wunsch eigenem Sprecher, bis zu drei Antworten, Sprungziel, Beute und dem Haken „erledigt“. Sprünge gehen über den Namen einer Zeile; `end` beendet das Gespräch. Sprecher – Name und Porträt – stehen in eigenen Dateien in `data/dialogs/speakers/`. Neue Gespräche entstehen im Inspektor, ohne Code; Fehler wie ein Sprung ins Leere stehen beim Start des Gesprächs im Ausgabefenster | vorgeschlagen am 18.11.2026; vom Nutzer am 21.11.2026 bestätigt; nach dem Test am selben Tag bestätigt |

Noch offen, jeweils fällig vor dem genannten Schritt: Zauber (vorläufig gewählt, siehe oben), Story (Phase 5), Anzahl Level (Phase 6).

## Prüfungen

**M20b – Karte & Missionsfenster**

- Getestet hat der Nutzer am 25.11.2026 in Godot. Rückmeldung: „OKay alles passt soweit“ – die 13 Punkte der Prüfliste gelten als bestanden. Noch nicht hochgeladen.
- Gebaut am 25.11.2026 im selben Chat nach dem Vorschlag vom 23.11.2026, geliefert als `m20b_karte_missionen.zip` – 23 neue und geänderte Dateien samt README, Stand-Datei und Grafik-Katalog. Grundlage: Commit `7c91b12` mit dem getesteten M20a; das Repo selbst war an dem Tag nicht zu lesen.
- Godot 4.7.2 ohne Fenster, auf einer frischen Kopie mit M20a und dem ZIP: Import und Start ohne Fehler und Warnungen, alle Skripte, Szenen und Werte-Dateien laden; mit allen Warnungen als Fehler meldet keine neue oder geänderte Datei etwas, nur die bekannten sechs aus der Zeit vor M16.
- Abläufe mit dem Prüf-Autoload, der nicht zur Lieferung gehört – 101 Prüfpunkte in drei Läufen, alle bestanden. Karte: Start mit der Halle erkundet, M öffnet mit gewähltem Reiter „Karte“, oben „Testkammer - Halle“, Halle hell, Ostraum fehlt, Zeitkapsel und Figur auf der Karte; W bewegt die Figur nicht. Seiten: D, A, Tab, Umschalt+Tab, Pfeil links und rechts im Kreis, Klick auf die Reiter, ein zweiter Klick lässt die Seite; Tab öffnet dabei kein Inventar. Esc schließt ohne Pause, M öffnet die zuletzt offene Seite, M schließt. Über Inventar, Pause und Gespräch geht das Fenster nicht auf; danach läuft die Figur wieder. Ostraum: erkundet, Debug-Zeile „2 von 2 Räumen“, auf der Karte hell, die Anzeige folgt der Figur bei offener Karte. F2 behält, Bild ab verwirft, Pos1 deckt auf; der Abschluss übernimmt die Räume in den Kapselstand, die nächste Reise kennt sie, im Spielstand stehen sie unter `rooms`. Zeitkapsel innen: ein Raum, oben nur „Zeitkapsel“, keine Zeitkapsel auf der Karte, „Hier gibt es keine Missionen.“ Testfeld: „Testfeld - Feld“, die Mission mit Beschreibung und „Zerschlage die Töpfe 0/3“; ein Abbruch verwirft das Feld. Missionen: offene Pflicht, erfüllte Pflicht blass, Neben zuletzt; passen ohne Blättern. Zwei Figuren auf der Karte. Alter Spielstand ohne `rooms` lädt; `visit_room` und `visit_rooms` zählen nur Neues.
- Abschaltbar, geprüft: ohne `RoomExplorer` kommt nichts dazu – die Karte zeigt den Raum, solange die Figur darin ist; ohne `MapWindow` tut M nichts, Esc öffnet weiter die Pause; ohne Räume zeigt die Karte die ganze Fläche des Levels; ohne Werte geht das Fenster ohne Absturz auf.
- M20a noch einmal: 169 Prüfpunkte in fünf Läufen, alle bestanden – die Tastenbelegung hat jetzt 13 Zeilen.
- Mit Bild angesehen – Godot mit virtuellem Bildschirm, 8 Bilder: Karte mit Halle, Karte mit Ostraum, Reiter unter der Maus, Missionen am Anfang und mit drei Missionen, Karte in der Zeitkapsel und im Testfeld, Tastenbelegung. Dabei gefunden und geändert: Die Figur war als gedrehtes Dreieck unsauber – jetzt ein Pfeil aus Pixeln in vier Richtungen; der Name in der Mitte des Raums lag unter der Figur – jetzt oben links; in der Zeitkapsel stand „Zeitkapsel - Zeitkapsel“ – jetzt nur einmal.
- Nicht geprüft: Gefühl und Bedienung mit echter Maus und Tastatur, das Spiel im Fenster unter Windows, Mehrspieler mit echten zweiten Figuren.

Prüfliste M20b – zum Abhaken in Godot:

1. Godot schließen, `m20b_karte_missionen.zip` nach `E:\GitHub\TT` entpacken und vorhandene Dateien ersetzen. Godot öffnen, F5, „Start“, einen freien Platz wählen: neues Spiel in der Testkammer, keine roten Fehler. Debug-Zeile „Erkundet: 1 von 2 Räumen“.
2. M: das Fenster mit den Reitern „Karte“ und „Missionen“, „Karte“ ist gewählt, oben rechts „Testkammer - Halle“. Die Karte zeigt nur die Halle – hell mit orangem Rand, der Name oben links –, die Zeitkapsel als kleines Bild und deine Figur als gelben Pfeil in ihrer Blickrichtung; der Ostraum fehlt. Hinter dem Fenster läuft die Welt weiter, W A S D bewegen die Figur nicht.
3. D, Pfeil rechts, Tab oder ein Klick auf „Missionen“: „Der Höhlenmensch“ und „Die grosse Truhe“ in Orange, je „Pflicht - läuft“, mit Beschreibung und dem Ziel „0/1“; „Holz für das Feuer“ fehlt noch. A, Pfeil links oder Umschalt+Tab zurück zur Karte. Unter der Maus wird der andere Reiter hell.
4. Esc schließt das Fenster, die Pause geht dabei nicht auf. M öffnet die Seite, die zuletzt offen war; M schließt wieder.
5. Tab öffnet das Inventar – M tut dann nichts. Ebenso in der Pause und im Gespräch mit dem Jäger. Danach läuft die Figur normal.
6. Durch den Durchgang in den Ostraum: Debug-Zeile „Erkundet: 2 von 2 Räumen“. M: Der Ostraum ist hell, die Halle dunkler, oben „Testkammer - Ostraum“.
7. Mit der Sammlerin reden und ihre Mission annehmen, dann den Höhlenmenschen besiegen. Auf der Seite „Missionen“: oben „Die grosse Truhe“, darunter blass „Der Höhlenmensch“ mit „Pflicht - erfüllt“, zuletzt „Holz für das Feuer“ mit „Neben - läuft“ und „Äste 0/2“.
8. F2: Beide Räume bleiben auf der Karte. Bild ab: Die Kammer beginnt von vorn, die Karte zeigt nur noch die Halle. Pos1: Der Ostraum ist sofort auf der Karte.
9. Bild auf: in der Zeitkapsel. M: ein Raum „Zeitkapsel“, oben nur „Zeitkapsel“; Seite „Missionen“: „Hier gibt es keine Missionen.“ Am Kristall in die Testkammer reisen: Halle und Ostraum sind schon auf der Karte.
10. Über die Zeitkapsel zurück, am Kristall ins Testfeld: M zeigt „Testfeld - Feld“ mit der Zeitkapsel; auf der Seite „Missionen“ „Die drei Töpfe“ mit Beschreibung und „Zerschlage die Töpfe 0/3“.
11. Esc → „Optionen“ → „Tastenbelegung“: Die neue Zeile „Karte“ zeigt M.
12. „Spiel beenden“, F5, denselben Platz laden: Die erkundeten Räume sind noch auf der Karte.
13. Abschaltbar: in der Testkammer `RoomExplorer` löschen und F5 – im Ostraum zeigt die Karte ihn, solange du dort bist, zurück in der Halle fehlt er; `MapWindow` löschen – M tut nichts, die Kammer läuft. Beides mit Strg+Z zurückholen und speichern.

**M20a – Hauptmenü, Spielstände, Pause, Optionen und Kamera**

- Getestet hat der Nutzer am 22.11.2026 in Godot. Rückmeldung: „Ja alles passt soweit“ – die 13 Punkte der Prüfliste gelten als bestanden. Noch nicht hochgeladen.
- Gebaut am 22.11.2026 im neuen Chat nach dem Plan, geliefert als `m20a_menues.zip` – 42 neue und geänderte Dateien samt README, Stand-Datei und Grafik-Katalog. Grundlage war das Repo, Commit `7c91b12`.
- Godot 4.7.2 ohne Fenster, auf einer frischen Kopie des Repos mit dem ZIP: Import und Start ohne Fehler und Warnungen, mit der Testkammer und mit `boot.tscn` als Hauptszene. 381 Skripte, Szenen und Werte-Dateien laden; mit allen Warnungen als Fehler – 161 Skripte – meldet keine neue oder geänderte Datei etwas, nur die bekannten in Dateien vor M16. `enemy.gd` war darunter schon vorher, geändert ist dort nur der Zeitgeber.
- Abläufe mit einem eigenen Prüf-Autoload, der nicht zur Lieferung gehört – 184 Prüfpunkte in sechs Läufen, alle bestanden; Tasten liefen als Tastendrücke durch die Eingabe, Klicks als Mausklicks auf die Knöpfe. Hauptmenü: kein Platz offen, Start gewählt, S und Pfeiltasten wandern im Kreis, Esc tut nichts, Spielzeit steht. Auswahl: drei leere Plätze, Esc zurück, Titel aus und wieder an. Neues Spiel auf Platz 1: Ankunft, Spielzeit läuft. Pause: Welt und Spielzeit stehen, die Figur bewegt sich nicht; Optionen: zweimal leiser – 80 %, Bus Master auf 80 %, `options.cfg` geschrieben –, Vollbild an, Tastenbelegung mit 12 Zeilen, Esc zurück mit dem richtigen Knopf gewählt. Reise abbrechen: Frage und Antworten wie an der Zeitkapsel, Weitermachen gewählt, Nein ändert nichts, Abbrechen verwirft den Fortschritt und beginnt die Kammer neu, die Welt bleibt bis zum Wechsel angehalten. Hauptmenü: gespeichert mit „Hauptmenü“ und Spielzeit, danach wird nichts mehr geschrieben. Platz 1 zeigt Testkammer, Spielzeit und Datum. Löschen: Tastatur erreicht das Kreuz und „Ja“ nicht, Maus auf dem Kreuz nimmt die Wahl weg, Enter und Esc heißen Nein, „Ja“ per Maus löscht. Platz 2 per Maus; Esc mit offenem Inventar oder Gespräch schließt nur dieses, Tab in der Pause öffnet kein Inventar. Kamera frei bis an den linken Rand und über den Ostraum hinaus, ohne Gleiten; mit `mode` ROOM und LEVEL hält sie am Rand. J wird in `options.cfg` gemerkt. Tod, dann Pause: kein Neuladen, solange angehalten, danach schon. Zeitkapsel: kein „Reise abbrechen“, Spielzeit steht in der Pause und läuft innen. Alter Spielstand ohne Spielzeit, unlesbarer Spielstand – „Unlesbar - beginnt neu“, gesichert als `slot_2.bad.json` –, Platz 3 mit „Zeitkapsel“ und „Spielzeit 1 Std. 2 Min.“; der zuletzt gespeicherte Platz gilt beim Start. F2, F4, Bild auf, Bild ab, Reise ins Testfeld und Abbruch aus der Pause mit Plätzen; „Spiel beenden“ speichert mit „Beenden“ und schließt.
- Abschaltbar, geprüft: Startszene ohne `MainMenu` geht mit dem zuletzt gespeicherten Platz gleich weiter; ohne `PauseMenu` tut Esc nichts; ohne `options.cfg` gelten die Grundwerte.
- Mit Bild angesehen – Godot mit virtuellem Bildschirm, 17 Bilder: Hauptmenü, Auswahl leer und belegt, Kreuz unter der Maus, Nachfrage zum Löschen, Pausenmenü, Optionen mit gewähltem Regler und Häkchen, Tastenbelegung, Nachfrage zum Abbruch, Kamera am linken Rand und in der Ecke des Ostraums. Dabei gefunden und geändert: `button_pressed.png` liegt 1 Pixel tiefer als die anderen Knöpfe – mit gleichen Rändern zog Godot ihren orangen Rand als Streifen über den gewählten Platz; die Ränder sind jetzt 3 oben und 1 unten. Unter der Maus auf „Ja“ leuchteten zwei Knöpfe – jetzt nimmt ein Knopf nur für die Maus die Wahl weg.
- Nicht geprüft: Gefühl und Bedienung mit echter Maus und Tastatur, das Spiel im Fenster unter Windows, Vollbild – im eingebetteten Spiel schaltet Godot das Fenster nicht um –, Lautstärke zum Hören – Ton gibt es erst mit A3.

Prüfliste M20a – zum Abhaken in Godot:

1. Godot schließen, `m20a_menues.zip` nach `E:\GitHub\TT` entpacken und vorhandene Dateien ersetzen. Godot öffnen und die Hauptszene setzen, auch wenn sie schon stimmt: im Dateisystem Rechtsklick auf `levels/boot/boot.tscn` → „Als Hauptszene festlegen“. F5: das Hauptmenü mit dem Titel „TimeTraveller“, der Zeitkapsel und „Start“, „Optionen“, „Beenden“; „Start“ ist gewählt. Keine roten Fehler.
2. Pfeiltasten und W/S wandern durch die Knöpfe, die Maus darüber wählt ebenso. „Start“: die Spielstand-Auswahl. Platz 1 zeigt deinen Spielstand von M19 – Ort, Datum und „Spielzeit unter 1 Min.“, weil ältere Stände keine Spielzeit haben –, Platz 2 und 3 „Neues Spiel“. Esc führt zurück.
3. Platz 2 anklicken: Überblendung, neues Spiel in der Testkammer, die Zeitkapsel landet. Debug-Zeile „Spielstand: Platz 2 · Lauf test_chamber …“.
4. Esc: das Pausenmenü, dahinter steht alles still – Gegner, Funkeln, Hinweise –, die Figur läuft nicht. „Weiter“ mit der Maus: Es geht weiter, die Figur schlägt dabei nicht zu. Tab öffnet das Inventar, Esc schließt nur das Inventar, das nächste Esc öffnet die Pause; ebenso mitten im Gespräch mit dem Jäger.
5. In der Pause „Optionen“: Die drei Regler gehen mit der Maus und mit Pfeil links und rechts in Schritten von 10 %, daneben die Zahl. Unter „Vollbild“ steht im eingebetteten Spiel „Gilt nicht im eingebetteten Spiel“. „Tastenbelegung“ zeigt die Tasten als Bilder, „Maustaste 4“ als Text. Esc führt Schritt für Schritt zurück, gewählt ist jeweils der Knopf, mit dem es hineinging.
6. „Reise abbrechen“: „Reise abbrechen? Was du hier erreicht hast, geht verloren.“ mit „Abbrechen“ und „Weitermachen“ – „Weitermachen“ ist gewählt. Enter: zurück in die Pause. Noch einmal, „Abbrechen“: Überblendung, die Testkammer beginnt von vorn, die Zeitkapsel landet – noch ist kein Level abgeschlossen.
7. Esc → „Hauptmenü“: Überblendung zum Hauptmenü. „Start“: Platz 2 zeigt „Testkammer“, die Spielzeit und das Datum von eben. Platz 2 anklicken: Es geht in der Testkammer weiter, ohne Landung.
8. Kamera: An die linke Wand laufen und durch den Durchgang in den Ostraum. Die Kamera bleibt immer auf der Figur, auch über die Ränder hinaus – dort ist es dunkel –, und am Durchgang gleitet nichts.
9. Bild auf: in der Zeitkapsel innen. Esc: Das Pausenmenü hat kein „Reise abbrechen“. Am Kristall ins Testfeld reisen und dort J drücken: Die Missionsliste klappt ein. Esc: „Reise abbrechen“ ist wieder da und bringt dich nach der Nachfrage in die Zeitkapsel.
10. Esc → „Spiel beenden“: Das Spiel speichert und schließt. F5, „Start“: Platz 2 zeigt „Zeitkapsel“ und die Zeit von eben. Platz 2 anklicken und am Kristall ins Testfeld: Die Missionsliste ist weiter eingeklappt. Esc → „Hauptmenü“, dort „Beenden“: Das Spiel schließt sofort.
11. Löschen: „Start“, mit der Maus auf das rote Kreuz neben Platz 2 – es wird weiß, der Platz ist nicht mehr gewählt. Klick: „Spielstand wirklich unwiderruflich löschen?“, „Nein“ ist gewählt; Enter oder Esc lassen den Spielstand stehen. Noch einmal, dann „Ja“ anklicken: Platz 2 zeigt „Neues Spiel“. Mit der Tastatur erreichst du weder das Kreuz noch „Ja“.
12. Vollbild, wenn du magst: im Bereich „Spiel“ oben rechts das Menü öffnen und das Einbetten ausschalten („Embed Game on Next Play“), F5, Optionen → „Vollbild“: Das Fenster füllt den Bildschirm, ausgeschaltet wird es wieder ein Fenster; nach einem Neustart bleibt es, wie eingestellt. Danach das Einbetten wieder einschalten.
13. Abschaltbar: in `levels/boot/boot.tscn` den Knoten `MainMenu` löschen und F5 – das Spiel geht ohne Hauptmenü gleich weiter, mit dem zuletzt gespeicherten Platz; in der Testkammer `PauseMenu` löschen – Esc tut nichts, die Kammer läuft. Beides mit Strg+Z zurückholen und speichern.

**M19 – Freischaltungen**

- Getestet hat der Nutzer am 22.11.2026 in Godot. Rückmeldung: „Ja das mit den Freischaltungen passt und ich habe alles probiert und es klappt“ – die zehn Punkte der Prüfliste gelten als bestanden. Noch nicht hochgeladen. Dazu sein Wunsch zur Kamera, siehe „Außer der Reihe“.
- Gebaut am 22.11.2026 im selben Chat nach dem Vorschlag vom selben Tag, geliefert als `m19_freischaltungen.zip` – 33 neue und geänderte Dateien samt README, Stand-Datei und Grafik-Katalog. Grundlage war das Repo, Commit `4b15a16`.
- Godot 4.7.2 ohne Fenster, auf einer frischen Kopie des Repos mit dem ZIP: Import und Start ohne Fehler und Warnungen. Mit allen Warnungen als Fehler – 152 Skripte – meldet keine neue oder geänderte Datei etwas, nur die bekannten in Dateien vor M16.
- Abläufe mit dem eigenen Prüf-Autoload: 48 neue Prüfpunkte für M19, alle bestanden. Nach F4 ist nichts frei, das HUD zeigt keine Fähigkeit und kein Geschoss-Feld; Leertaste, Strg und Taste 1 bewirken nichts. Fundstück Dash im Ostraum: frei, Hinweis „Neu freigeschaltet“ mit „Dash (Leertaste)“, Debug-Zeile „Frei: Dash“, der Dash geht. Fernkampf: Geschoss-Feld da; Stun: im HUD nur Platz 3; Unsichtbarkeit: dazu Platz 2; Taste 3 wirkt; E an der leeren Stelle bringt keinen zweiten Hinweis. F2 und Tod behalten alles, die Fundstücke bleiben weg. Der Jäger bringt Schleichen bei, Strg wirkt danach. Bild ab ohne abgeschlossenes Level: alles wieder gesperrt, die Fundstücke liegen wieder da. Pos1: alles frei, Hinweis „Alles“, Debug-Zeile „alles“. Testfeld: Die erfüllte Mission schaltet Schnelligkeit frei; nach dem Einsteigen steht sie im Kapselstand und in der Datei.
- Abschaltbar, geprüft: Ohne `GameState` und `SaveManager` ist alles frei, das HUD zeigt alles, ein Fundstück verschwindet ohne Hinweis und ohne Absturz. Die Läufe von M18 laufen unverändert durch: 120 Prüfpunkte, dazu 6 ohne `SceneManager`.
- Mit Bild angesehen: die vier Rollen im Ostraum mit Schatten und Funkeln, die Hinweise oben in der Mitte, das HUD mit nur einem Teil der Fähigkeiten, die neue Zeile des Jägers – sie passt in drei Zeilen. Dabei geändert: Mit der neuen Zeile „Frei“ rutschte „Anzeige: F1“ unter den Bildrand; „S1 Geschoss“ ist jetzt ausgeblendet.
- Nicht geprüft: Gefühl und Bedienung mit echter Maus und Tastatur, das Spiel im Fenster unter Windows.

Prüfliste M19 – zum Abhaken in Godot:

1. Godot schließen, `m19_freischaltungen.zip` nach `E:\GitHub\TT` entpacken und vorhandene Dateien ersetzen. Godot öffnen, F5, dann F4: keine roten Fehler. Unten links im HUD keine Fähigkeit und kein Geschoss-Feld; Debug-Zeile „Frei: nichts“.
2. Leertaste, Strg, Rechtsklick und die Tasten 1 bis 3 bewirken nichts: kein Dash, kein Schleichen, kein Wurf, keine Fähigkeit.
3. Durch den Durchgang in der rechten Wand in den Ostraum: Unten liegen vier Schriftrollen nebeneinander und funkeln ab und zu. An der zweiten von links E: Die Rolle ist weg, oben in der Mitte – nach den Hinweisen der Missionen – „Neu freigeschaltet“ und „Dash (Leertaste)“, Debug-Zeile „Frei: Dash“. Die Leertaste dasht jetzt.
4. Die übrigen drei Rollen aufnehmen, von links Fernkampf, Stun, Unsichtbarkeit: Unten links erscheinen das Geschoss-Feld, das Symbol für Stun mit der 3 und das für Unsichtbarkeit mit der 2; Schnelligkeit fehlt noch. Rechtsklick wirft, 3 betäubt, 2 macht unsichtbar.
5. F2, dann sterben, etwa im Schadensfeld: Alles bleibt frei, die Rollen bleiben weg.
6. Zum Jäger links neben der Zeitkapsel, E: In seiner dritten Zeile bringt er dir das Schleichen bei, oben „Schleichen (Strg)“. Strg schleicht jetzt.
7. Bild ab – noch ist kein Level abgeschlossen: Das Level beginnt von vorn, alles ist wieder gesperrt, die Rollen liegen wieder im Ostraum.
8. Pos1: oben „Neu freigeschaltet“ und „Alles“, Debug-Zeile „Frei: alles“, unten links alle drei Fähigkeiten und das Geschoss-Feld.
9. F4, dann Bild auf, in der Zeitkapsel an der Zeitsteuerung „Testfeld“. Die drei Töpfe zerschlagen: „Mission erfüllt“, dann „Neu freigeschaltet“ mit „Schnelligkeit (Taste 1)“, unten links das Symbol mit der 1. Einsteigen: In der Zeitkapsel bleibt Schnelligkeit frei.
10. Abschaltbar: in `entities/player/player.tscn` den Knoten `Unlocks` löschen und F5 – alles ist frei wie vor M19; in der Testkammer die Rolle `Rooms/EastRoom/UnlockDash` löschen – die Kammer läuft, Dash gibt es dann nur über Pos1. Beides mit Strg+Z zurückholen und speichern.

**M18 – Räume & Levelwechsel**

- Getestet hat der Nutzer am 22.11.2026 in Godot. Rückmeldung: „Ja ich bin die Prüfliste durchgegangen und es funktioniert alles.“ – die elf Punkte der Prüfliste gelten als bestanden. Die Abweichungen beim Bau, darunter die gespiegelte Zeitkapsel in der Mitte der Startfläche, hatte er vorher mit „Ja das ganze passt“ bestätigt. Noch nicht hochgeladen.
- Gebaut am 22.11.2026 im neuen Chat nach dem Plan vom selben Tag, geliefert als `m18_raeume_levelwechsel.zip` – 46 neue und geänderte Dateien samt README, Stand-Datei und Grafik-Katalog. Grundlage war das Repo, Commit `23dca62`.
- Godot 4.7.2 ohne Fenster: Import und Start ohne Fehler und Warnungen. Mit allen Warnungen als Fehler – 148 Skripte – meldet keine neue oder geänderte Datei etwas; nur die bekannten in Dateien vor M16: Ganzzahl-Teilungen in `character_view.gd`, `prop_view.gd`, `one_shot_effect.gd` und `projectile_view.gd`, ein verdeckter Name in `energy_orb.gd`, zwei Signale in `enemy.gd`.
- Abläufe mit einem eigenen Prüf-Autoload, der nicht zur Lieferung gehört – 120 Prüfpunkte in sieben Läufen, alle bestanden; Tasten liefen als Tastendrücke durch die Eingabe, Gespräche Zeile für Zeile mit E und 1 bis 3. Erster Start: Ankunft in der Testkammer, die Zeitkapsel landet, die Figur steht bei (216, 161) vor ihr. E: Abbruch-Frage, „Weitermachen“ ändert nichts, „Abbrechen“ beginnt das Level von vorn – Truhe wieder zu, wieder Ankunft. F2 ohne Landung. Pflichtmissionen erfüllt: Zeitkapsel bereit, funkelt; „Einsteigen“: Zeitkapsel innen, kein Lauf, Testkammer abgeschlossen, gespeichert. Innen Tab, Inventar im Kapselstand; Zeitsteuerung → Testkammer: Ankunft, gleich bereit, gespeichert mit „Reise“. Ostraum: Raum-Wechsel, Kamera gleitet von (144, 151) über (702, 218) nach (1080, 262); Topf und Truhe dort bleiben nach F2. Tod ohne Anker: Erwachen vor der Zeitkapsel, ohne Landung. Testfeld: Ankunft, Mission „Die drei Töpfe“ läuft, ein Topf, Abbruch – zurück in der Zeitkapsel –, wieder hin: Topf heil, Mission von vorn; alle drei, Einsteigen: beide Level abgeschlossen; Rückkehr: gleich bereit. Ende im Testfeld, neuer Start: fortgesetzt im Testfeld, ohne Landung; Bild ab: Zeitkapsel; Bild auf dort: nichts. Ende in der Zeitkapsel, neuer Start: in der Zeitkapsel; F4: neues Spiel in der Testkammer; Bild auf, Reise, Bild ab, „Hierbleiben“. Rasten am Anker, Tod: Erwachen am Anker; Bild auf setzt den Rückkehrpunkt zurück. Sammlerin und Missionsliste wie in M17. Was während des Ausblendens nach „Abbrechen“ dazukommt, ist mit dem Abbruch weg.
- Abschaltbar, geprüft: ohne `TimeCapsule` erscheint die Figur bei (240, 136), ohne `RoomWatcher` folgt die Kamera in den Ostraum. Ohne `SceneManager` lädt die Startszene die Testkammer, F2 und Tod laden direkt neu, Abbrechen bewirkt nichts – mit Warnung –, Bild ab lädt neu.
- Mit Bild – Godot mit virtuellem Bildschirm – angesehen: Landung Bild für Bild, Abbruch-Frage, Funkeln, „Einsteigen“, Ausblenden, Zeitkapsel innen, Zeitsteuerung, Testfeld, Durchgang, Ostraum, die Debug-Anzeige. Dabei gefunden und geändert: An der linken Wand verdeckten Missionsliste und HUD die Kapsel, und die Kamera stieß an den Rand – die Kapsel steht jetzt in der Mitte der Startfläche, gespiegelt mit der Tür links. „Zeitsteuerung“ passte nicht in den Reiter – sie spricht als „Zeitkapsel“. Innen lag die Zeitsteuerung über dem Bildrand – der Raum ist jetzt 10 statt 12 Kacheln hoch. Die Debug-Anzeige reichte unter den Bildrand – Zeilen, die das HUD zeigt, sind ausgeblendet. Die Landung ging in der Überblendung unter – sie dauert jetzt 0,7 s aus 28 Pixeln.
- Nicht geprüft: Gefühl und Bedienung mit echter Maus und Tastatur, das Spiel im Fenster unter Windows.

Prüfliste M18 – zum Abhaken in Godot:

1. Godot schließen, `m18_raeume_levelwechsel.zip` nach `E:\GitHub\TT` entpacken und vorhandene Dateien ersetzen. Godot öffnen und die Hauptszene umstellen: im Dateisystem-Dock Rechtsklick auf `levels/boot/boot.tscn` → „Als Hauptszene festlegen“ – oder Projekt → Projekteinstellungen → Anwendung → Ausführen → Hauptszene. F5, dann F4: Überblendung, die Zeitkapsel landet in der Testkammer – sie sinkt herab, Staub wirbelt auf –, die Figur steht links vor ihrer Tür. Keine roten Fehler; Debug-Zeilen „Ort: Testkammer · Ankunft“ und „Zeitkapsel: Pflicht offen“.
2. Die kleine Truhe unter dem langen Balken öffnen, zurück zur Zeitkapsel, E: „Noch sind nicht alle Pflichtmissionen erfüllt.“, dann „Reise abbrechen?“. „Weitermachen“ (2) ändert nichts. Noch einmal E, „Abbrechen“ (1), E: Überblendung, das Level beginnt von vorn, die Zeitkapsel landet wieder, die Truhe ist zu – noch ist kein Level abgeschlossen.
3. Beide Pflichtmissionen erfüllen – Höhlenmensch, grosse Truhe: An der Tür der Zeitkapsel funkelt es, Debug-Zeile „Zeitkapsel: bereit“. E: „Alle Pflichtmissionen sind erfüllt. Zurück in die Zeitkapsel?“ – „Einsteigen“, E: Überblendung in die Zeitkapsel innen; Debug-Zeilen „Ort: Zeitkapsel“ und „Spielstand: kein Lauf …“.
4. Innen öffnet Tab das Inventar, die Ausrüstung lässt sich wechseln. E am Kristall – der Zeitsteuerung –: „Wohin soll die Reise gehen?“ – „Testkammer“, E: Ankunft vor der Zeitkapsel, sie landet, die Missionen sind erfüllt, sie funkelt gleich; die Ausrüstung von innen ist dabei.
5. Ostraum: am rechten Pfeiler vorbei zum Durchgang in der rechten Wand, auf halber Höhe der Kammer. Die Kamera gleitet in den Ostraum, Debug-Zeile „S1 Raum: Ostraum“. Den Topf zerschlagen, die Truhe öffnen; F2 – beides bleibt, wie es ist; zurück in die Halle gleitet die Kamera wieder, „S1 Raum: Halle“.
6. Sterben, ohne vorher am Zeitanker gerastet zu haben, etwa im Schadensfeld unter der Zeitkapsel: Die Figur erwacht vor der Zeitkapsel; diesmal landet sie nicht, Debug-Zeile „Ort: Testkammer · Tod“.
7. Einsteigen, dann „Testfeld“: Ankunft vor dessen Zeitkapsel, oben „Neue Mission – Die drei Töpfe“. Einen Topf zerschlagen, an der Zeitkapsel abbrechen: zurück in der Zeitkapsel. Wieder ins Testfeld: Der Topf ist heil, „Zerschlage die Töpfe 0/3“. Alle drei zerschlagen, einsteigen: Das Testfeld ist abgeschlossen, die Testkammer bleibt es auch – zu sehen an „(abgeschlossen)“ in der Debug-Zeile „Spielstand“ nach der nächsten Reise.
8. Im Testfeld mit Ende beenden, F5: Die Figur ist wieder im Testfeld, Debug-Zeile „Ort: Testfeld · fortgesetzt“. In der Zeitkapsel mit Ende beenden, F5: wieder in der Zeitkapsel.
9. Bild auf und Bild ab gehen in einem Level denselben Weg wie die Zeitkapsel, ohne Nachfrage, auch im Testfeld; in der Zeitkapsel bewirken sie nichts, nur eine Warnung im Ausgabefenster. F4 beginnt ein neues Spiel in der Testkammer.
10. Der Zeitanker steht jetzt links bei (112, 120). Dort rasten, dann sterben: Die Figur erwacht vor dem Anker. Nach Einsteigen und Rückkehr erscheint sie wieder vor der Zeitkapsel.
11. Abschaltbar: in der Testkammer `TimeCapsule` löschen – die Figur erscheint bei (240, 136) am Ort des `PlayerSpawner`, die Kammer läuft; `RoomWatcher` löschen – die Kamera folgt in den Ostraum mit den Grenzen der ganzen Kammer. Beides mit Strg+Z zurückholen und speichern.

**M17 – Missionen**

- Getestet hat der Nutzer am 22.11.2026 in Godot. Rückmeldung: „Alles klappt!“ – die elf Punkte der Prüfliste gelten als bestanden. Hochgeladen mit Commit `23dca62` „m17 abschluss“, alle Dateien wie geliefert, zusammen mit `m17_abschluss.zip` und dem Bild der Zeitkapsel.
- Gebaut am 22.11.2026 nach dem Umsetzungsplan vom 21.11.2026 – er steht im Plan-Dokument unter Phase 4 –, geliefert als `m17_missionen.zip`. Grundlage war das Repo, Commit `8fd3b22`.
- Godot 4.7.2 ohne Fenster: Import und Start der Testkammer ohne Fehler und Warnungen. Mit allen Warnungen als Fehler meldet keine neue oder geänderte Datei etwas – nur die bekannten in Dateien vor M17: Ganzzahl-Teilungen, ein verdeckter Name in `energy_orb.gd`, zwei Signale in `enemy.gd`, die nur über ihren Namen gesendet werden.
- Abläufe mit einem eigenen Prüf-Autoload, der nicht zur Lieferung gehört – 91 Prüfpunkte in drei Läufen, alle bestanden. Neues Spiel: zwei Pflichtmissionen laufen, zwei Hinweise nacheinander, Tor zu, Debug-Zeile; J und ein Klick auf die Überschrift klappen um, beim Klick kein Schlag, daneben schon. Sammlerin: Angebot, „Mach ich.“, „Äste 0/2“, dann 1/2, 2/2 bereit, zurück auf 1/2, wieder bereit; die Abgabe nimmt genau 2 von 4 Ästen, 5 Kunai springen heraus, danach Dank und keine zweite Abgabe. Höhlenmensch, grosse Truhe, Tor offen, „Keine offenen Missionen“, Abschnitt `missions` in der Datei. Laden aus der Datei ohne Hinweise und ohne Wechsel, F2, Ausgang – abgeschlossen, Tor bleibt offen –, F4, Bild ab, Bild auf, ein Spielstand ohne Abschnitt `missions` und kaputte Einträge. Ohne `MissionPanel`, ohne `MissionTracker`, „+1 weitere“ bei mehr Missionen, als die Liste zeigt.
- Ohne `GameState` und `SaveManager`: 8 Prüfpunkte, alle bestanden – die Sammlerin folgt dann den Meldungen. Die Prüfläufe von M16 laufen unverändert durch: 77 Prüfpunkte.
- Neu: Claude hat die Testkammer mit Bild laufen lassen – Godot mit virtuellem Bildschirm – und sich die Bilder angesehen: Liste aus- und eingeklappt, Hinweise, Sammlerin mit Sprechblase und Porträt im Gespräch, Nische mit Tor zu und offen, Figur auf der Luke. Dabei gefunden und behoben: Das Leerzeichen von `NormalFont` ist nur 1 Pixel breit – die Anzeige nutzt deshalb wie der Dialog 3 Pixel mehr Wortabstand. Der Pfeil drehte sich beim Einklappen nicht, weil Container die Drehung ihrer Kinder zurücksetzen – er sitzt jetzt in einem eigenen Knoten.
- Nicht geprüft: Gefühl und Bedienung mit echter Maus und Tastatur, die Anzeige im Fenster unter Windows.

Prüfliste M17 – zum Abhaken in Godot:

1. Godot schließen, `m17_missionen.zip` nach `E:\GitHub\TT` entpacken und vorhandene Dateien ersetzen. Godot öffnen, F5: keine roten Fehler. Dann F4 – ein alter Spielstand kann die grosse Truhe schon offen und den Baum schon gefällt haben.
2. Nach F4: Links unter den Herzen „Missionen“ mit Pfeil und Taste J, darunter in Orange „Der Höhlenmensch“ und „Die grosse Truhe“, je ein leeres Kästchen mit „0/1“. Oben in der Mitte nacheinander „Neue Mission – Der Höhlenmensch“ und „Neue Mission – Die grosse Truhe“. Oben rechts in einer Nische ein geschlossenes Gittertor, dahinter eine Luke mit Treppe. Debug-Zeile „Missionen: Pflicht 0/2 · Neben 0/1 · Tor zu“.
3. J klappt die Liste ein – nur „Missionen 2“, der Pfeil zeigt nach rechts – und wieder aus. Ein Klick auf die Überschrift ebenso, ohne dass die Figur zuschlägt; ein Klick daneben in die Welt schlägt wie immer. Eingeklappt F2: Die Liste bleibt eingeklappt.
4. Die Sammlerin mit violettem Haar steht rechts vom Baum unten links und trägt eine Sprechblase. E: Sie friert und bittet um zwei Äste; „Mach ich.“ (Taste 1 oder Maus). Oben „Neue Mission – Holz für das Feuer“, in der Liste unter den Pflichtmissionen in Weiß „Holz für das Feuer“ mit „Äste 0/2“. Ihre Sprechblase ist weg; noch einmal E: Sie erinnert nur.
5. Den Baum fällen und die Äste aufsammeln: „Äste 2/2“ mit Kreuz im Kästchen, die Sammlerin trägt wieder ihre Sprechblase. E, „Hier, bitte.“: Die Äste sind aus dem Inventar weg, 5 Kunai springen vor die Figur, oben „Mission erfüllt – Holz für das Feuer“, die Mission verschwindet aus der Liste. Danach bedankt sie sich nur noch.
6. Den Höhlenmenschen besiegen: „Mission erfüllt – Der Höhlenmensch“.
7. Den Goldschlüssel hinter der Holztür holen und die grosse Truhe öffnen: „Mission erfüllt – Die grosse Truhe“, das Gittertor oben rechts geht auf. In der Liste „Keine offenen Missionen“, Debug-Zeile „Pflicht 2/2 · Neben 1/1 · Tor offen“.
8. Sterben, etwa im Schadensfeld, dann F2, dann mit Ende beenden und mit F5 neu starten: Missionen und Tor bleiben, wie sie waren, und es erscheinen keine neuen Hinweise.
9. Durch das Tor zur Luke, E: Das Level ist abgeschlossen – die Figur steht an den Startpunkten, die Debug-Zeile „Spielstand“ zeigt „(abgeschlossen)“. Die Missionen bleiben erfüllt, das Tor bleibt offen.
10. F4, dann bei der Sammlerin die Mission annehmen und Bild ab: Alles beginnt von vorn – zwei Hinweise „Neue Mission“, die Sammlerin bietet wieder an.
11. Abschaltbar: in der Testkammer `MissionPanel` löschen – die Missionen zählen weiter, zu sehen in der Debug-Zeile; `MissionTracker` löschen – keine Liste, das Tor bleibt zu, die Sammlerin bietet an, aber nichts beginnt; die Kammer läuft ohne Fehler. Beides mit Strg+Z zurückholen und speichern.

**M16 – Speichern & Laden**

- Getestet hat der Nutzer am 21.11.2026 in Godot. Rückmeldung: „Okay also ich habe jetzt alles getestet und es funktioniert“ – die elf Punkte der Prüfliste gelten als bestanden. Hochgeladen hat er M16 mit Commit `76bd2bf`; alle Dateien wie geliefert. Geliefert war M16 am selben Tag als `m16_speichern_laden.zip`.
- Claude hat die Dateien am Text geprüft: Verweise in Szenen und Werte-Dateien, Kennungen von `ExtResource`, Knotenpfade, Signale und Methoden, Klassennamen, Einrückung nur mit Tabs. Grundlage war das Repo, Commit `064a29e`.
- Neu in diesem Chat: Claude hat die Linux-Fassung von Godot 4.7.2 ohne Fenster laufen lassen, in einer Arbeitskopie des Repos mit den neuen Dateien. Import und Start der Testkammer liefen ohne Fehler und ohne Warnungen; mit Warnungen als Fehler meldete keine neue oder geänderte Datei etwas – nur die Ganzzahl-Teilungen in Dateien vor M16.
- Abläufe mit einem eigenen Prüf-Autoload durchgespielt, der nicht zur Lieferung gehört – 76 Prüfpunkte in drei Läufen, alle bestanden: erster Start ohne Datei; Truhe, Topf, Schlüssel, Hebel, Holztür, Schamane, Breitschwert, dann Rasten – Leben und Energie voll, Anker blau, Datei geschrieben, „Gespeichert“ sichtbar; danach Kiste und Tod – Erwachen vor dem Anker bei (240, 104), alles gemerkt, auch die Kiste nach dem Rasten, das Gittertor folgt dem Hebel, Gegner neu, Beute am Boden weg; Beenden wie mit dem X und neuer Start – alles wieder da; Level verlassen – alles auf Anfang; Abschluss, dann Verlassen – das Geholte bleibt; Löschen – Neubeginn. F2, F4, Bild auf, Bild ab und Ende liefen dabei als Tastendrücke durch die Eingabe.
- Dabei gefunden und behoben: Lädt der SaveManager erst in `_ready()`, kommt das zu spät – die Testkammer meldet sich vorher in `_enter_tree()` an, und das Laden hätte ihren Lauf überschrieben. Er lädt deshalb in `_enter_tree()`.
- Außerdem: Start ohne SaveManager und ohne GameState – keine Fehler; kaputte Datei – Warnung, Sicherung als `slot_1.bad.json`, neues Spiel; Datei mit unbekanntem Gegenstand und fehlendem Anker – Warnungen, Start an den Startpunkten.
- Nicht geprüft, weil ohne Bild: wie Anker, Funkeln und „Gespeichert“ aussehen; das X am Fenster unter Windows.

Prüfliste M16 – zum Abhaken in Godot:

1. Godot schließen, `m16_speichern_laden.zip` nach `E:\GitHub\TT` entpacken und vorhandene Dateien ersetzen. Godot öffnen, F5: keine roten Fehler. Über den Startpunkten steht ein Sockel mit grauer Kugel – der Zeitanker. Debug-Zeile „Spielstand: Lauf test_chamber · Startpunkt · nicht gespeichert“.
2. Kleine Truhe öffnen, einen Topf zerschlagen, den Goldschlüssel hinter der Holztür holen, den Hebel umlegen, beim Schamanen mit 2 die Pfeile holen, das Breitschwert aufheben und anlegen (Tab, Doppelklick). Etwas Schaden nehmen, etwa im Schadensfeld, und eine Fähigkeit einsetzen.
3. Am Zeitanker E: Leben und Energie voll, es funkelt, kurz steht „Gespeichert“ über ihm, die Kugel wird blau. Debug-Zeile: „Anker TimeAnchor“ und die Uhrzeit mit „Rasten“.
4. Danach eine Kiste zerschlagen und sterben, etwa im Schadensfeld. Nach einer Sekunde erwacht die Figur vor dem Anker mit vollem Leben. Truhe offen, Topf und Kiste weg, Schlüssel im Inventar und nicht mehr am Boden, Hebel blau, Gittertor offen, Holztür offen, Schamane ohne Blase, Breitschwert angelegt. Die Gegner stehen wieder; Beute, die noch am Boden lag, ist weg.
5. Spiel mit dem X am Spielfenster beenden – läuft es im Editor eingebettet, mit der Taste Ende –, nicht mit dem Stopp-Knopf des Editors: Der beendet ohne Speichern. F5: Die Figur steht vor dem Anker, alles wie vorher; Debug-Zeile mit „Beenden“.
6. Die Datei `%APPDATA%\Godot\app_userdata\TimeTraveller\saves\slot_1.json` mit dem Editor öffnen: lesbar, darin etwa `"ChestSmall": {"open": true}`.
7. Bild ab – Level verlassen: alles auf Anfang. Truhe zu, Topf und Kiste heil, Schlüssel wieder hinter der Holztür, Inventar wie beim Start mit dem Katana, Schamane mit Blase, Figur an den Startpunkten, Anker grau.
8. Kleine Truhe öffnen und ihre Pfeile aufsammeln, dann Bild auf – Level abschließen: Die Figur steht an den Startpunkten, die Truhe bleibt offen, Debug-Zeile mit „(abgeschlossen)“. Dann Bild ab: Truhe offen und Pfeile im Inventar bleiben – der Abschluss hat sie in den Kapselstand übernommen.
9. F4: Spielstand gelöscht, Neubeginn wie beim ersten Start – Truhe zu, Startinhalt, ohne „(abgeschlossen)“, Debug-Zeile „nicht gespeichert“.
10. F2 lädt den Raum neu wie ein Tod ohne Tod: Was offen oder zerstört war, bleibt; die Figur erscheint am Rückkehrpunkt.
11. Abschaltbar: in der Testkammer den Knoten `TimeAnchor` zum Test löschen – die Kammer startet ohne Fehler, die Figur erwacht an den Startpunkten; war er Rückkehrpunkt, steht dazu eine Warnung im Ausgabefenster. In `entities/player/player.tscn` den Knoten `PlayerProgress` löschen – die Figur beginnt jedes Mal mit dem Startinhalt. Beides mit Strg+Z zurückholen und speichern.

**M15 – NPCs & Dialog**

- Geliefert am 21.11.2026 als `m15_npcs_dialog.zip`. Getestet hat der Nutzer am selben Tag in Godot. Rückmeldung: „der Rest klappt“ – die 13 Punkte der Prüfliste gelten als bestanden. Dazu ein Wunsch: Im Gespräch dreht sich auch die Spielfigur zu dem, mit dem sie spricht. Nachgebessert als `m15_nachbesserung.zip`. Die Nachbesserung hat der Nutzer eingespielt und M15 am 21.11.2026 hochgeladen (Commit `985f098`, „Alles hochgeladen“), ohne weitere Rückmeldung; Claude wertet das als bestandene Prüfliste zur Nachbesserung.
- Die Nachbesserung hat Claude am Text geprüft wie M15, Grundlage war die eigene Lieferung `m15_npcs_dialog.zip` über Commit `d09ce9a`. Nachgerechnet: Die Figur rechnet ihren Blick in jedem Physik-Schritt einmal – aus der Zielrichtung oder, mit Blickziel, zum Sprecher –; ihr `CharacterView` liest ihn danach und zeigt die nächstliegende der vier Richtungen. Der NPC dreht sich zur Figur, die Figur zum NPC: Sie sehen sich an, aus jeder Richtung.
- Claude hat die Dateien am Text geprüft – mit dem eigenen Prüfskript, weil Godot hier nicht läuft: Pfade aller Verweise in Szenen, Werte-Dateien und Themen, Kennungen von `ExtResource` und `SubResource`, Knotenpfade der geerbten Szenen `npc.tscn` → `shaman.tscn` und `hunter.tscn`, Namen der Werte in Skripten und `.tres`, Klassennamen, Einrückung nur mit Tabs. Grundlage war das Repo, Commit `d09ce9a`.
- Nachgerechnet, nicht ausprobiert: Das Fenster hat Claude mit den Bildern des Pakets und der Schrift als Bild nachgestellt. Es liegt bei (90, 208) bis (390, 266) der Fläche 480 × 270; der Text mit Porträt reicht von x 54 bis 278 im Fenster, drei Zeilen à 12 Pixel ab Zeile 14, der Name sitzt mit den Großbuchstaben in den Zeilen 2 bis 7 des braunen Reiters. Der Wortabstand von `NormalFont` ist 1 Pixel (227 von 2048 Einheiten bei Größe 9), im Dialog 4. Alle Sätze der Testgespräche passen in zwei oder drei Zeilen, die längste Antwort „Hast du etwas für mich?“ braucht ein Kästchen von 156 Pixeln. Die Kästchen sind 20 Pixel hoch, 2 Pixel auseinander, rechts bündig bei x 388, das unterste 4 Pixel über dem Fenster. Der längste Satz erscheint in gut 2,5 Sekunden.
- Nachgerechnet: Der Schamane steht 50 Pixel von `Spawn2`, der Jäger 48 von `Spawn1`; E wirkt, sobald die Mitten weniger als 26 Pixel auseinander sind (16 + 10). Beute landet 10 bis 18 Pixel von der Figur; ihr `Collector` greift 6 Pixel weit, also läuft die Figur nach dem Gespräch hin.

Prüfliste M15 – zum Abhaken in Godot:

1. F5: Links neben den Startpunkten steht der Jäger (Löwenfell), rechts der Schamane (Totenkopf-Maske); über beiden wippt die Sprechblase mit ein, zwei, drei Punkten. Keine Fehler im Ausgabefenster.
2. Nah an den Schamanen: Über dem Kopf der Figur erscheint die Taste E. E öffnet unten in der Mitte das Fenster – Reiter „Schamane“, links sein Porträt, rechts der Text Buchstabe für Buchstabe. Er dreht sich zur Figur, seine Blase verschwindet.
3. Während der Text läuft, zeigt E, Leertaste oder Linksklick ihn ganz; dann wippt unten rechts ein Pfeil, und der nächste Druck geht weiter. Die Figur steht still, schlägt, schießt und dasht nicht, 1 bis 3 setzen keine Fähigkeit ein, Tab öffnet kein Inventar; die Gegner bewegen sich weiter.
4. Bei „Was führt dich her?“ stehen drei Antworten rechts über dem Fenster, mit den Tasten 1, 2, 3 davor. Die Maus über einem Kästchen zeigt einen Rahmen. E und Leertaste tun jetzt nichts.
5. Taste 1 – „Aus einer anderen Zeit.“: zwei Sätze, danach wieder die Frage.
6. Mausklick auf die dritte Antwort – „Ich muss weiter.“: ein Abschiedssatz, der nächste Druck schließt das Fenster. Die Figur schlägt dabei nicht zu, auch wenn der letzte Druck ein Linksklick war, und läuft gleich wieder. Die Blase steht wieder über dem Schamanen.
7. Noch einmal E: Das Gespräch beginnt von vorn. Jetzt 2 – „Hast du etwas für mich?“: 5 Pfeile springen vor der Figur auf den Boden. Nach dem Gespräch hinlaufen und einsammeln; die Debug-Anzeige meldet „S1 Beute“ mit +5 Pfeilen.
8. Danach ist seine Blase weg, und E bringt nur noch „Die Geister sind mit dir, Reisender.“ – ohne Pfeile. Debug-Zeile „Shaman: wartet · erledigt“.
9. Esc mitten im Gespräch schließt es sofort, die Figur läuft wieder. Kam die Antwort 2 noch nicht, beginnt beim nächsten E alles von vorn.
10. Jäger: E zeigt „Jäger“ mit Porträt und zwei Sätze ohne Antworten; nach dem zweiten ist das Gespräch zu Ende. Seine Blase ist danach weg; beim nächsten E sagt er dasselbe noch einmal.
11. Pfeile enden an den NPCs wie an einem Block, Schwert und Geschosse machen keinen Schaden, die Figur läuft nicht durch sie hindurch.
12. F2 lädt den Raum neu: Beide haben wieder ihre Blase, der Schamane gibt wieder Pfeile.
13. Abschaltbar: `DialogWindow` zum Test aus der Testkammer löschen – die Kammer startet ohne Fehler, E an einem NPC schreibt nur eine Warnung ins Ausgabefenster. Danach mit Strg+Z zurückholen und speichern.

Prüfliste zur Nachbesserung von M15:

1. Godot schließen, `m15_nachbesserung.zip` nach `E:\GitHub\TT` entpacken und vorhandene Dateien ersetzen. Godot öffnen, F5: keine roten Fehler.
2. Von rechts an den Schamanen herangehen, die Maus nach rechts zeigen lassen und E drücken: Die Figur dreht sich zu ihm nach links, er sich zu ihr – sie sehen sich an.
3. Dasselbe von oben, von unten und von links: Die Figur blickt immer zum NPC, egal wo die Maus steht.
4. Während des Gesprächs die Maus bewegen: Die Figur bleibt dem NPC zugewandt.
5. Nach dem Gespräch – zu Ende oder mit Esc – blickt die Figur gleich wieder zur Maus; Hieb und Wurf gehen wieder in Mausrichtung.
6. Beim Jäger genauso.
7. Abschaltbar: in `entities/player/player.tscn` den Knoten `TalkFacing` zum Test löschen – die Figur behält im Gespräch ihre Blickrichtung, sonst läuft alles. Danach mit Strg+Z zurückholen und speichern.

**M14 – Gegnertypen**

- Getestet hat der Nutzer am 18.11.2026 in Godot. Rückmeldung: „Passt alles“ – die zwölf Punkte der Prüfliste gelten als bestanden: Höhlenmensch wie bisher, Steinwerferin mit Wurf, Abstand, Zurückweichen und Deckung, eine Debug-Zeile je Gegner.
- Claude hat die Dateien am Text geprüft – mit einem eigenen Prüfskript, weil Godot hier nicht läuft: Pfade aller Verweise in Szenen und Werte-Dateien, Kennungen von `ExtResource` und `SubResource`, Knotenpfade der geerbten Szenen über drei Stufen – `enemy.tscn` → `melee_enemy.tscn` → `caveman.tscn` und `enemy.tscn` → `ranged_enemy.tscn` → `stone_thrower.tscn` –, Namen der Werte in Skripten und `.tres`, Klassennamen, Einrückung nur mit Tabs. Grundlage war das Repo, Commit `886f6f9`.
- Nachgerechnet, nicht ausprobiert: Bei Zoom 2 bemerkt sie die Figur zur Seite bis 6,5 Kacheln, nach oben und unten bis gut 3. Sie wirft bis 5 Kacheln – nach oben und unten also bis gut 3 – und weicht unter 2,5 Kacheln zurück; beides liegt in der fairen Grenze. Der Stein fliegt aus 5 Kacheln 0,6 s, aus 2,5 Kacheln gut 0,25 s; aus seiner Bahn kommt die Figur mit etwa 7 Pixeln zur Seite, beim Gehen in keiner 0,1 s. Sie weicht mit 45 Pixeln pro Sekunde zurück, die Figur geht 80: Sie holt sie ein. Ihre Patrouille von (464, 320) bis (592, 320) hat mindestens 5 Kacheln Platz zu jedem Block und liegt 11 Kacheln links vom Weg des Höhlenmenschen.

**M13 – Erster Gegner**

- Getestet hat der Nutzer am 18.11.2026 in Godot, nach der Nachbesserung. Rückmeldung: „Alles passt“ – die zwölf Punkte der Prüfliste gelten als bestanden, ebenso die übrigen der ersten Prüfliste. Zoom 2 hat er damit bestätigt.
- Geliefert zuerst als `m13_gegner.zip`. Nach dem ersten Test wünschte der Nutzer vier Änderungen: Sprites global größer („4x“), Abstände der Nahkämpfer in logischen Einheiten und fair statt fester Pixel, Schlag sofort mit dem ersten Bild der Hieb-Animation, kein rotes Blinken beim Angriff. Nachgebessert am selben Tag als `m13_nachbesserung.zip`, ganz M13 in 45 Dateien.
- Claude hat die Dateien am Text geprüft: Verweise in Szenen und Werte-Dateien, Knotenpfade der geerbten Szene `caveman.tscn`, Namen der Werte in Skripten und `.tres`, Klassennamen. Keine Stelle nutzt mehr Ausholen, `WindupFlash` oder die alten Abstände in Pixeln. Grundlage war das Repo, Commit `19e426c`, mit `m13_gegner.zip` darüber.
- Nachgerechnet, nicht ausprobiert: Bei Zoom 2 zeigt das Bild 240 × 135 Pixel der Welt, also 15 × 8,4 Kacheln. Die faire Grenze liegt dann 104 Pixel zur Seite und 51,5 Pixel nach oben und unten, gut 6,5 und 3 Kacheln: Zur Seite zählt die volle Sicht von 6 Kacheln, nach oben und unten nur gut 3. Bei Zoom 1 zählen überall die vollen Werte, bei Zoom 4 nur 2,75 Kacheln zur Seite und gut 1 nach oben und unten. Die Faust reicht 18 Pixel weit (4 + 14), das Schwert der Figur 24 (6 + 18): Wer zuschlägt und zurückgeht, trifft ihn, ohne selbst getroffen zu werden. Eine Figur erscheint bei Zoom 2 im Fenster 1440 × 810 96 Pixel groß, bei 1920 × 1080 128.

**M12 – HUD**

- Getestet hat der Nutzer am 17./18.11.2026 in Godot. Rückmeldung: „okay du kannst weitermachen“ – die zwölf Punkte der Prüfliste gelten als bestanden. Hochgeladen hat er M12 mit Commit `19e426c`.
- Claude hat die Dateien am Text geprüft: Verweise in Szenen und Werte-Dateien, Knotenpfade, Signale und ihre Werte, exportierte Werte, Klassennamen und die Eigenschaften von `TextureProgressBar`, `NinePatchRect` und `HBoxContainer`. Grundlage war das Repo, Commit `1b7abfc`.
- Nachgerechnet, nicht ausprobiert: Das HUD hat Claude mit den Bildern des Pakets als Bild nachgestellt, auch Zwischenstände – 70 von 120 Leben sind drei volle und ein halbes von sechs Herzen, 30 Energie füllen 7 der 22 Pixel der Kugel, 20 Ausdauer 12 der 62 Pixel der Leiste. Alles liegt auf ganzen Pixeln: die Kugel bei (4, 4), die Herzen ab (38, 6), die Leiste bei (39, 25), unten die Symbole ab (4, 228), 24 Pixel groß mit 4 Pixeln Abstand, die Tasten 1 Pixel darunter, die Geschoss-Zelle bei (90, 228).

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

Claude startet Godot nur ohne Fenster oder mit virtuellem Bildschirm, nie mit echter Maus und Tastatur; der Test des Nutzers ist die einzige echte Prüfung.

## Plan für M18 – Räume & Levelwechsel

Der Plan vom 22.11.2026 ist am selben Tag umgesetzt. Was abweicht oder dazukam, steht unter „Außer der Reihe“; wie es gebaut ist, unter „Räume, Levelwechsel und Zeitkapsel im Einzelnen (M18)“. Der Vorschlag steht im Plan-Dokument unter Phase 4.

Aus dem Plan, für später:

- Ein Porträt für das Gespräch der Zeitkapsel; ein eigener Ton für die Zeitreise (A3).
- Gegner in Räumen ohne Spielfigur anhalten; Musik je Raum (A3).
- Die Karte auf M mit den Räumen eines Levels (M20b, noch offen); die Zeitkarte mit allen Epochen statt des Gesprächs an der Zeitsteuerung (Phase 6); Lagerkiste, Werkbank und Händler in der Zeitkapsel.
- Offen für Phase 5: Steht die Zeitkapsel auch in Level 1? Laut Konzept hat Level 1 noch keine; bis dahin gilt dort die Regel „Abbruch beginnt das Level von vorn“, als Ausgang ginge `world/level_exit/`.
- Seit M20 bietet auch das Pausenmenü „Reise abbrechen“ an, mit derselben Frage wie an der Zeitkapsel.
- Mehrspieler: Eine Reise gilt für alle; jede Kamera folgt dem Raum ihrer Figur. Über Abschluss und Abbruch entscheidet später der Gastgeber.

## Vorschlag für M19 – Freischaltungen

Vorgelegt am 22.11.2026 nach dem Abschluss von M18, im Plan-Dokument unter Phase 4. Der Nutzer hat ihn mit „weiter“ angenommen; gebaut am selben Tag – wie, steht unter „Freischaltungen im Einzelnen (M19)“ –, getestet und fertig. Grundlage: der Freischaltplan im Konzept – Level 1 Schwert und Zerstören, Level 2 Fernkampf, Level 3 Dash und Schleichen, Level 4 Stun, Level 5 Unsichtbarkeit und Schnelligkeit – und der Fahrplan: „Eine Fähigkeit bleibt gesperrt, bis ihr Auslöser erreicht ist“.

- Was gesperrt sein kann: die Mechaniken aus dem Freischaltplan – Fernkampf, Dash, Schleichen, Stun, Unsichtbarkeit und Schnelligkeit. Laufen, Sprinten, Nahkampf, Zerstören, E und Inventar sind immer frei. Welche es gibt und was zu Beginn gesperrt ist, steht in einer Werte-Datei, mit Name und Symbol je Freischaltung.
- Gemerkt an einer Stelle: im Spielstand über `GameState`, wie alles andere im Kapsel- und Levelstand – Tod und Beenden behalten eine Freischaltung, ein Abbruch verwirft, was im Level dazukam, der Abschluss übernimmt es in die Zeitkapsel. Freischaltungen gelten für alle Spieler gemeinsam, sonst käme im Mehrspieler einer an einer Stelle nicht weiter.
- An der Figur: Ein neuer Baustein sperrt, was noch nicht frei ist – die Taste bewirkt dann nichts. Das HUD zeigt nur Freigeschaltetes: Gesperrte Fähigkeiten und das Geschoss-Feld erscheinen erst mit der Freischaltung.
- Drei Auslöser: ein Fundstück in der Welt – laut Konzept liegen Fähigkeits-Upgrades in der Welt, nicht im Laden –, die Belohnung einer Mission und eine Zeile im Gespräch. Jeder meldet nur, entschieden wird an der einen Stelle. Oben in der Mitte erscheint dann etwa „Neu: Dash“ mit der Taste.
- In der Testkammer: Nach F4 ist alles gesperrt außer dem Grundlegenden. Fernkampf, Dash, Stun und Unsichtbarkeit liegen als Fundstücke im Ostraum; Schleichen bringt der Jäger im Gespräch bei; Schnelligkeit ist die Belohnung der Mission im Testfeld. Pos1 schaltet im Debug-Build alles frei, wie im Konzept unter „Werkzeuge in der Kammer“ vorgesehen.
- Nicht in M19: Erfahrung, Stufen und der Fähigkeitsbaum mit seinen drei Zweigen – der Baum braucht ein Menü, das kommt mit M20; danach als eigener Schritt, zusammen mit den Ausbaustufen „länger, stärker, billiger“ und kleinen Verbesserungen wie mehr Leben oder Ausdauer.
- Abschaltbar: Ohne den neuen Baustein an der Figur ist alles frei wie bisher; ohne `GameState` gilt die Werte-Datei.
- Umsetzung, so gebaut: Freischaltungen als eigener Abschnitt `unlocks` in jedem Stand, neben `completed`; `GameState` mit `is_unlocked()` und `unlock()`; Meldungen im EventBus für „bitte freischalten“ und „freigeschaltet“; ein Fundstück unter `world/`, ein Feld für Freischaltungen an der Belohnung einer Mission und an `DialogLine`; `DebugKeys` bekommt Pos1. Die Kennungen der Freischaltungen sind englisch, etwa `ranged`, `dash`, `sneak`, `stun`, `invisibility`, `haste`.

## Plan für M20 – Menüs

Vorgeschlagen am 22.11.2026 nach dem Abschluss von M19; am selben Tag hat der Nutzer die Menüs genau vorgegeben – seine Vorgabe gilt, sie steht hier unter M20a. M20a ist am 22.11.2026 im neuen Chat danach gebaut, vom Nutzer getestet und fertig; wie es gebaut ist, steht unter „Menüs im Einzelnen (M20)“, was dabei entschieden wurde, unter „Außer der Reihe“. Grundlage außerdem: der Fahrplan – fertig, wenn „vom Hauptmenü ins Spiel, pausieren, Optionen ändern und zurück – ohne Fehler“ – und der Wunsch zur Kamera.

**M20a – Hauptmenü, Spielstände, Pause, Optionen und Kamera** (Vorgabe des Nutzers vom 22.11.2026)

- Hauptmenü, der erste Bildschirm nach dem Start, mit drei Punkten: „Start“ öffnet die Spielstand-Auswahl, „Optionen“ das Einstellungsmenü, „Beenden“ schließt das Spiel sofort, ohne Rückfrage.
- Spielstand-Auswahl über „Start“: genau drei Plätze. Ein leerer Platz zeigt „Neues Spiel“ – ein Klick beginnt dort ein neues Spiel. Ein belegter Platz zeigt den Fortschritt, etwa die aktuelle Epoche – das Level des Laufs oder die Zeitkapsel – und die Spielzeit; ein Klick lädt ihn und setzt das Spiel fort. Löschen nur hier, nicht im laufenden Spiel, und nur per Mausklick auf ein Lösch-Symbol am Platz – damit nichts versehentlich per Tastatur gelöscht wird; danach fragt ein Fenster „Spielstand wirklich unwiderruflich löschen?“ mit „Ja“ und „Nein“.
- Pausenmenü mit Esc im laufenden Spiel; im Einzelspiel friert die Welt ganz ein. Punkte: „Weiter“ schließt das Menü; „Optionen“ öffnet dasselbe Einstellungsmenü wie im Hauptmenü; „Reise abbrechen“ nur in einem Level, nicht in der Zeitkapsel – mit genau derselben Nachfrage wie an der Zeitkapsel; „Hauptmenü“ speichert und kehrt zum Startbildschirm zurück; „Spiel beenden“ speichert und schließt das Spiel.
- Optionen: Lautstärke für alles, Musik und Geräusche – hörbar erst ab A3 – und Vollbild; gespeichert in einer eigenen Datei, dazu ob die Missionsliste eingeklappt ist. Die Tastenbelegung wird nur angezeigt; ändern kommt später.
- Kamera nach dem Wunsch des Nutzers: Sie folgt immer der Figur – ohne Halt an Raum- und Levelrändern, ohne Gleiten beim Raumwechsel; Vorausschau zur Maus und weiches Nachgleiten bleiben. Außerhalb des Levels ist dann der dunkle Hintergrund zu sehen. Die Raumkamera aus M18 bleibt als Einstellung.

**Hinweise für den Bau, von Claude**

- Startszene: `levels/boot/boot.tscn` zeigt das Hauptmenü (`ui/menus/main_menu/`), statt gleich ins Spiel zu gehen. „Start“ führt zur Spielstand-Auswahl (`ui/menus/save_slots/`); ein Klick auf einen Platz macht ihn zum aktiven und ruft wie bisher `SceneManager.start_game()` auf, bei einem leeren `new_game()`.
- `SaveManager`: Plätze 1 bis 3 – `slot_1.json` bis `slot_3.json`, der bisherige Spielstand ist Platz 1 –; dazu der aktive Platz, eine Übersicht je Platz – Level des Laufs oder Zeitkapsel, Spielzeit, letzte Speicherung – und Löschen eines Platzes. Die Spielzeit zählt `GameState` mit und schreibt sie in den Spielstand; sie läuft nur im Spiel, nicht in Menüs und nicht bei Pause. Ältere Spielstände haben noch keine.
- F4 bleibt die Test-Taste im Debug-Build: Sie setzt den aktiven Platz zurück. Im fertigen Spiel löscht nur das Menü, wie seit M16 festgelegt.
- Pause: `get_tree().paused` nur im Einzelspiel; Menüs laufen mit `process_mode` „Always“. Esc öffnet das Pausenmenü nur, wenn kein Gespräch und kein Inventar offen ist – dort schließt Esc wie bisher. Sonst hängt nichts an der Pause; im Mehrspieler öffnet Esc später nur das Menü.
- „Reise abbrechen“ im Pausenmenü: dieselbe Nachfrage wie an der Zeitkapsel (`data/dialogs/time_capsule_abort.tres`), danach `level_leave_requested` wie bisher.
- Optionen: `user://options.cfg`; eine Klasse mit statischen Funktionen lädt und wendet an – kein neuer Autoload, also keine Änderung an `project.godot`. Die Missionsanzeige liest von dort, ob ihre Liste eingeklappt ist.
- Kamera: ein Wert für die Art in `CameraStats` und `data/player/camera.tres` – frei, Level, Raum –, Standard frei; der `RoomWatcher` bleibt.
- Alle Menüs: eine eigene Szene je Menü unter `ui/menus/`, Holz-Thema aus M11, mit Maus und Tastatur bedienbar – außer dem Löschen –; Texte ohne ß, unteres Anführungszeichen, Gedankenstrich und drei Punkte; sie melden `menu_changed`, damit die Figur stehen bleibt.

**M20b – Karte und Missionsfenster** – aus Claudes Vorschlag, in der Vorgabe des Nutzers nicht genannt; als eigener Schritt am 23.11.2026 nach dem Test von M20a vorgeschlagen, am 25.11.2026 gebaut und fertig, siehe „Vorschlag für M20b – Karte & Missionsfenster“: Karte auf M mit den besuchten Räumen des Levels, der Figur und der Zeitkapsel; ein Missionsfenster mit allen Missionen und ihren Beschreibungen.

Nicht in M20: Tastenbelegung ändern, Textgröße, Gamepad, der Fähigkeitsbaum mit Erfahrung und Stufen – ein eigener Schritt danach –, Ton (A3).

Mehrspieler: Jeder Spieler hat seine Menüs; angehalten wird nur im Einzelspiel.

## Vorschlag für M20b – Karte & Missionsfenster

Vorgelegt am 23.11.2026 nach dem Test von M20a, im Plan-Dokument unter Phase 4. Der Nutzer hat ihn am 25.11.2026 mit „weiter“ angenommen; gebaut am selben Tag im selben Chat – wie, steht unter „Karte und Missionen im Einzelnen (M20b)“, was dabei entschieden wurde, unter „Außer der Reihe“ –, vom Nutzer getestet und fertig. Grundlage: das Konzept – im Spiel „Inventar, Karte, Fähigkeiten, Missionen“ – und Claudes Vorschlag zu M20; die Vorgabe des Nutzers für M20a nannte Karte und Missionsfenster nicht.

- Ein Fenster auf M mit zwei Seiten, „Karte“ und „Missionen“: oben zwei Reiter, umschalten mit der Maus, mit A und D oder mit Pfeil links und rechts; M oder Esc schließt. Wie beim Inventar läuft die Welt weiter, nur die eigene Figur bleibt stehen. Holz-Thema der Menüs.
- Karte: die Räume des Levels von oben, so verkleinert, dass das ganze Level ins Fenster passt – jeder Raum eine Fläche mit Rand und Namen, der Raum der Figur hell. Zu sehen sind nur Räume, die schon betreten wurden. Darauf jede Spielfigur als Punkt mit ihrer Blickrichtung und die Zeitkapsel als kleines Bild; oben der Name des Levels. Ein Level ohne Räume, etwa die Zeitkapsel innen, zeigt seine ganze Fläche als einen Raum.
- Erkundet: Welche Räume betreten wurden, legt `GameState` im Levelstand ab, wie offene Truhen – Tod und Beenden behalten es, ein Abbruch verwirft, was im Lauf dazukam, der Abschluss übernimmt es für die nächste Reise in dieses Level. Es gilt für alle Spieler gemeinsam. Zum Testen deckt Pos1 im Debug-Build auch alle Räume auf.
- Missionen: alle angenommenen Missionen des Levels, Pflicht zuerst, dann Neben – je Titel, Beschreibung aus der Missionen-Datei, Ziele mit Fortschritt wie „Äste 1/2“ und Stand: läuft, bereit zur Abgabe, erfüllt. Nicht angenommene bleiben verborgen; viele Missionen blättert man mit Mausrad und Pfeiltasten. J klappt weiter nur die Liste unter den Herzen ein.
- Umsetzung: ein neues Menü `ui/menus/map_window/` als `MenuScreen`, eingehängt im `LevelFrame` und in der Testkammer. Die Karte zeichnet aus den Räumen der Gruppe „rooms“, den Figuren der Gruppe „players“ und der Zeitkapsel. Ein kleiner Baustein meldet jeden Raumwechsel aus `room_changed` an `GameState`, der ihn ablegt; der `MissionTracker` gibt in seiner Liste zusätzlich die Beschreibung mit.
- Abschaltbar: ohne das Fenster tut M nichts; ohne den Baustein zeigt die Karte nur den Raum, in dem die Figur gerade ist; ohne `MissionTracker` steht auf der Seite „Missionen“ „Hier gibt es keine Missionen.“
- Mehrspieler: Jeder Spieler hat sein Fenster und sieht alle Figuren; was erkundet ist, entscheidet `GameState` an einer Stelle.
- Nicht in M20b: Wände und Türen auf der Karte – das kommt mit den Kacheln (A4) –, Karten finden oder kaufen wie in Hollow Knight, eigene Markierungen, Schnellreise, die Zeitkarte mit allen Epochen (Phase 6), der Fähigkeitsbaum mit Erfahrung und Stufen (eigener Schritt danach).
- Danach: Gate G2 – alle Mechaniken laufen in der Testkammer zusammen, auch nach Speichern und Laden –, dann der Fähigkeitsbaum oder A4 – Kacheln & Räume vor Level 1.

## Vorschlag für Gate G2 – Alles zusammen

Vorgelegt am 25.11.2026 nach dem Test von M20b, im Plan-Dokument unter Phase 4; angegangen wird es nach „weiter“ oder mit den Änderungen des Nutzers. Grundlage: der Fahrplan – Gate G2 nach Phase 4: „Alle Mechaniken laufen in der Testkammer zusammen und überstehen Speichern und Laden“ – und die Testkammer im Konzept mit ihren Abschnitten und Werkzeugen.

- Eine Prüfung mit Aufräumen, keine neuen Mechaniken. Was dabei an Fehlern auffällt, behebt Claude im selben Schritt.
- Zuerst das Repo: Liegen M20a und M20b vollständig darin, nennt `project.godot` die Startszene? Am 25.11.2026 war es von hier aus nicht zu lesen.
- Rundgang ohne Fenster, von Claude: Ein Prüflauf spielt die Testkammer am Stück durch – Laufen, Sprinten, Schleichen, Dash, Nahkampf an der Puppe, alle vier Geschosse, die drei Fähigkeiten, Zerstören, beide Truhen mit Schlüssel, Tür, Hebel, Druckplatte, Inventar und Ausrüstung, Höhlenmensch und Steinwerferin, die Gespräche und alle drei Missionen, Freischaltungen, Zeitanker und Tod, Zeitkapsel, Testfeld und Karte. Nach jedem Abschnitt beendet er das Spiel und lädt neu und prüft, dass alles noch so ist wie vorher.
- Aufräumen: Die sechs Skripte aus der Zeit vor M16, die Godot mit strengen Warnungen bemängelt – `character_view.gd`, `prop_view.gd`, `one_shot_effect.gd`, `enemy.gd`, `projectile_view.gd`, `energy_orb.gd` –, werden sauber, ohne dass sich etwas im Spiel ändert. Dazu, was beim Rundgang auffällt.
- Zwei Test-Tasten aus dem Konzept, die noch fehlen, nur im Debug-Build: Freiflug – durch Wände – und Unverwundbarkeit. Sie helfen später beim Bauen der Level. „Werte während des Spielens ändern“ geht schon über den Remote-Baum des Editors.
- Rundgang für den Nutzer: eine Prüfliste G2 mit rund 15 Punkten, die alles einmal im Zusammenhang durchgeht, mit Beenden und Laden an drei Stellen. Bestanden ist G2, wenn er sie ohne Fehler schafft.
- Nicht in G2: ein Fass zum Zerstören und eigene Übungsstationen für die Fähigkeiten aus dem Konzept – sie kommen mit den Kacheln (A4) oder Level 1 –, der Fähigkeitsbaum, Ton.
- Danach: A4 – Kacheln & Räume, dann Phase 5 – Level 1, Steinzeit; der Fähigkeitsbaum als eigener Schritt, wann der Nutzer will.

## Code-Übersicht

### Projekteinstellungen – `project.godot`

- Spielfläche 480 × 270, Fenster beim Start 1440 × 810
- Streckmodus `viewport` mit ganzzahliger Vergrößerung
- Seit M13 zeichnet die Kamera die Welt zusätzlich mit dem Zoom aus `data/world/view.tres` (Standard 2); `project.godot` bleibt dafür unverändert. HUD, Fenster und Debug-Anzeige zoomen nicht mit.
- Texturfilter „Nearest“ für scharfe Pixel
- Renderer `gl_compatibility`
- Startszene: seit M18 `res://levels/boot/boot.tscn`, seit M20 mit dem Hauptmenü – der Nutzer stellt sie per Klick um, `project.godot` liefert Claude nicht; im Repo steht bis zum nächsten Commit von `project.godot` die Testkammer `res://levels/test_chamber/test_chamber.tscn`
- Audio-Busse (M20): `Master`, `Music` und `Sounds` aus `default_bus_layout.tres` im Projektordner – Godot liest die Datei von selbst, `project.godot` bleibt dafür unverändert
- Von Godot ergänzt: `config/features=PackedStringArray("4.7")`
- Mit M3 vom Nutzer gesetzt: „Snap 2D Transforms to Pixel“ – alle 2D-Objekte werden auf ganze Pixel gerundet gezeichnet. Im Repo war das am 16.11.2026 noch nicht zu sehen, weil M3 dort fehlte.
- Bewusst aus: Physik-Interpolation. Bewegung läuft im Takt von 60 Schritten pro Sekunde.

### Globale Dienste (Autoloads)

| Name | Datei | Stand |
| --- | --- | --- |
| `EventBus` | `autoload/event_bus.gd` | aktiv, 25 Meldungen |
| `InputSetup` | `autoload/input_setup.gd` | aktiv; legt die Aktionen an, `all_actions()` liefert ihre Namen |
| `GameState` | `autoload/game_state.gd` | aktiv seit M16: der Fortschritt – Kapselstand (im Code `portal`), Levelstand, Lauf, Rückkehrpunkt; seit M17 die Missionen (`get_mission_state`, `set_mission_state`); seit M19 die Freischaltungen (`is_unlocked`, `unlock`, `unlock_all`, `get_unlock_titles`); seit M20 die Spielzeit (`play_time`, `get_play_time()`); seit M20b die erkundeten Räume (`visit_room`, `visit_rooms`, `get_visited_rooms`, `is_room_visited`) |
| `SaveManager` | `autoload/save_manager.gd` | aktiv seit M16: schreibt und liest den Spielstand; seit M20 drei Plätze `user://saves/slot_1.json` bis `slot_3.json` – `active_slot`, `open_slot()`, `close_slot()`, `delete_slot()`, `get_slot_info()`, `get_last_slot()`, `get_slot_count()` |
| `SceneManager` | `autoload/scene_manager.gd` | aktiv seit M18: Szenenwechsel mit Überblendung – Reisen, Zeitkapsel, Neustart nach Tod und F2, Start des Spiels; seit M20 `go_to_menu()`, `start_game()` liefert, ob der Wechsel beginnt; liest `data/world/travel.tres` |
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
| `menu_changed` | `player_id: int`, `is_open: bool` | Ein Menü einer Spielfigur ist auf- oder zugegangen: das Inventarfenster, seit M15 das Dialogfenster, seit M20 jedes Menü. Seit M20b zählt auch das Fenster mit Karte und Missionen mit und geht nur auf, wenn sonst keins offen ist. Solange eins offen ist, meldet ihr `PlayerInput` keine Absichten; es zählt die offenen Menüs (M15). Die Welt läuft weiter (M11) |
| `dialog_requested` | `player_id: int`, `dialog: Resource`, `source_id: int` | Ein NPC möchte mit einer Spielfigur sprechen; ihr Dialogfenster zeigt das Gespräch, wenn es frei ist. `dialog` ist ein `DialogData`, `source_id` die Instanz-Kennung des NPC (M15) |
| `dialog_started` | `player_id: int`, `source_id: int` | Das Dialogfenster zeigt jetzt das Gespräch; erst dann sperrt der NPC sein E, und `TalkFacing` dreht die Figur zum Sprecher (M15) |
| `dialog_line_shown` | `player_id: int`, `source_id: int`, `line: Resource` | Das Fenster zeigt eine neue Zeile (`DialogLine`); der NPC entscheidet daran über Beute und „erledigt“ (M15) |
| `dialog_finished` | `player_id: int`, `source_id: int`, `completed: bool` | Das Gespräch ist vorbei; `completed` heißt bis zum Ende, falsch heißt abgebrochen (M15) |
| `save_requested` | `reason: String` | Jemand bittet ums Speichern: der Zeitanker beim Rasten („Rasten“), die Testkammer beim Tod („Tod“) und bei F2 („Neustart“), `GameState` bei Abschluss und Verlassen. Der `SaveManager` schreibt; ohne ihn geschieht nichts (M16) |
| `game_saved` | `reason: String` | Der Spielstand steht in der Datei; der Zeitanker, an dem gerade gerastet wurde, zeigt dann „Gespeichert“ (M16) |
| `respawn_changed` | `level_id: String`, `anchor_id: String` | Der Rückkehrpunkt hat sich geändert; leer heißt Landepunkt. Zeitanker leuchten danach (M16) |
| `level_run_changed` | `level_id: String`, `event: String` | Ein Lauf hat begonnen („begin“), ist abgeschlossen („complete“) oder verlassen („leave“), wurde geladen („load“), oder ein neues Spiel beginnt („new_game“) (M16) |
| `mission_event` | `event: StringName`, `amount: int` | Etwas ist geschehen, das Missionen zählen, etwa „caveman_defeated“; gemeldet von `MissionCue`, gezählt vom `MissionTracker` (M17) |
| `mission_start_requested` | `player_id: int`, `mission_id: StringName` | Eine Gesprächszeile möchte eine Mission starten; ob sie beginnt, entscheidet der `MissionTracker` (M17) |
| `mission_hand_in_requested` | `player_id: int`, `mission_id: StringName` | Eine Gesprächszeile möchte eine Mission abgeben; ist sie bereit, nimmt der Tracker die Gegenstände dieser Figur und gibt die Belohnung (M17) |
| `mission_changed` | `level_id: String`, `mission_id: StringName`, `state: String` | Eine Mission hat ihren Stand gewechselt: „active“, „ready“ oder „done“; gemeldet, nachdem der Stand in `GameState` liegt. Der Auftraggeber frischt daran seine Sprechblase auf (M17) |
| `mission_list_changed` | `level_id: String`, `entries: Array` | Alle Missionen des Levels für die Anzeige, je Mission `id`, `title`, `required`, `hand_in`, `state` und `objectives`; die erste Meldung nach dem Betreten ist der Stand aus dem Spielstand (M17) |
| `level_exit_requested` | `player_id: int` | Eine Figur möchte das Level abschließen: am Ausgang (M17), seit M18 mit „Einsteigen“ an der Zeitkapsel oder Bild auf. Der `SceneManager` schließt das Level ab und bringt alle in die Zeitkapsel |
| `level_leave_requested` | `player_id: int` | Eine Figur möchte die Reise abbrechen: „Abbrechen“ an der Zeitkapsel oder Bild ab. Der `SceneManager` verwirft den Levelstand und bringt alle in die Zeitkapsel; ohne abgeschlossenes Level beginnt das Level von vorn (M18) |
| `travel_requested` | `player_id: int`, `level_id: String` | Eine Figur möchte in ein Level reisen, etwa von der Zeitsteuerung; `level_id` steht in `data/world/travel.tres`. Reisen tut der `SceneManager`, für alle Figuren (M18) |
| `room_changed` | `player_id: int`, `room_id: String`, `bounds: Rect2` | Eine Figur ist in einen anderen Raum gegangen; gemeldet vom `RoomWatcher`. Mit der Kamera-Einstellung ROOM gleitet die Kamera dieser Figur in die Grenzen des Raums (M18); seit M20b legt der `RoomExplorer` ihn als erkundet ab |
| `room_visited` | `level_id: String`, `room_id: String` | Ein Raum ist zum ersten Mal betreten worden; gemeldet von `GameState`, nachdem er ihn abgelegt hat. Die Karte zeigt ihn dann (M20b) |
| `unlock_requested` | `player_id: int`, `unlock_id: StringName` | Etwas möchte eine Mechanik freischalten: ein Fundstück, die Belohnung einer Mission, eine Gesprächszeile. Frei schaltet `GameState` (M19) |
| `unlocks_changed` | `unlock_id: StringName`, `reason: String` | Die Freischaltungen haben sich geändert: `unlock_id` ist frei (`"unlock"`) oder alles (`unlock_id` leer, `"all"`); gemeldet von `GameState` (M19) |
| `notice_requested` | `kind: String`, `title: String` | Ein Hinweis soll kurz oben in der Mitte stehen, etwa „Neu freigeschaltet“ und „Dash (Leertaste)“; gezeigt von der Missionsanzeige (M19) |

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
| `Zoom` | Testkammer (M13) | Zoom der Welt und sichtbare Kacheln, etwa „2 - 15.0 x 8.4 Kacheln (F3)“ |
| `Caveman`, `StoneThrower` | Gegner (M13; seit M14 eine Zeile je Gegner) | Zustand und Leben, etwa „Verfolgen · Leben 30/30“. Zustände: Patrouille, Entdeckt, Verfolgen, Abwarten, Zurückweichen, Angriff, Suchen, Zurück, Betäubt, Tot. Der Schlüssel ist der Name des Knotens; nach dem Tod verschwindet die Zeile |
| `Shaman`, `Hunter`, `Gatherer` | NPCs (M15; seit M17 auch die Sammlerin), eine Zeile je NPC | „wartet · hat Neues“, „spricht mit S1“ oder „wartet · erledigt“; der Schlüssel ist der Name des Knotens |
| `Spielstand` | seit M18 `DebugKeys` in jedem Level und in der Zeitkapsel, vorher die Testkammer (M16) | seit M20 der offene Platz, dann Lauf, Rückkehrpunkt und letzte Speicherung, etwa „Platz 1 · Lauf test_chamber · Anker TimeAnchor · 19:03:12 Rasten“; „Landepunkt“ ohne Anker, „kein Lauf“ in der Zeitkapsel, „(abgeschlossen)“ nach dem Abschluss, „nicht gespeichert“ ohne Datei, „ohne Datei“ ohne SaveManager |
| `Missionen` | `MissionTracker` (M17) | erfüllte und alle Pflicht- und Nebenmissionen und der Weg aus dem Level, etwa „Pflicht 1/2 · Neben 0/1 · Weg zu“; bis M18 hieß es „Tor zu“ und „Tor offen“ |
| `Ort` | `SceneManager` (M18) | wo die Figuren nach dem letzten Wechsel sind: „Zeitkapsel“ oder der Name des Levels mit „Ankunft“, „fortgesetzt“, „Tod“ oder „Neustart“, etwa „Testfeld · Ankunft“; seit M20 „Hauptmenü“ |
| `Zeitkapsel` | `TimeCapsule` (M18) | „bereit“ oder „Pflicht offen“ |
| `S1 Raum` | `RoomWatcher` (M18) | Name des Raums, in dem die Figur ist, etwa „Ostraum“ |
| `Frei` | `DebugKeys` (M19) | Was freigeschaltet ist, etwa „Dash, Stun“, sonst „nichts“ oder „alles“; ohne `GameState` „alles“ |
| `Erkundet` | `RoomExplorer` (M20b) | wie viele Räume des Levels erkundet sind, etwa „1 von 2 Räumen“ oder „1 von 1 Raum“; ohne Räume „keine Räume“ |

Der Hinweis „Neustart: F2“ ist mit M4 entfallen; F2 gilt weiter. In der Testkammer sind seit M7 die Zeilen „Maus“, „Kamera“ und „Raumzeit“ ausgeblendet; seit M9 kommt „S1 Beute“ dazu, sobald etwas aufgesammelt wurde. Seit M18 sind in der Testkammer und im LevelFrame auch die Zeilen ausgeblendet, die das HUD zeigt – „S1 Tempo“, „S1 Ausdauer“, „S1 Leben“, „S1 Dash“, „S1 Energie“, „S1 Fähigkeiten“ –, in der Testkammer dazu die der NPCs „Shaman“, „Hunter“ und „Gatherer“; so passt die Anzeige mit „Ort“, „Zeitkapsel“ und „S1 Raum“ auf das Bild. Einschalten lassen sie sich im Inspektor des Knotens `DebugOverlay` über `show_mouse` und `hidden_keys`. Seit M19 ist dort auch „S1 Geschoss“ ausgeblendet – das HUD zeigt das Geschoss –, damit „Anzeige: F1“ mit der neuen Zeile „Frei“ im Bild bleibt.

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
| `map` | M – seit M20b das Fenster mit Karte und Missionen; M oder Esc schließt es |
| `mission_toggle` | J – Missionsliste ein- und ausklappen (M17) |
| `pause` | Esc – seit M20 das Pausenmenü; Inventar und Gespräch schließt es zuerst |
| `debug_toggle_overlay` | F1 |
| `debug_restart_room` | F2 – seit M18 in jedem Level und in der Zeitkapsel (`DebugKeys`): neu laden wie ein Tod ohne Tod |
| `debug_cycle_zoom` | F3 – nur in der Testkammer: Zoom 1 bis 4 durchschalten (M13) |
| `dialog_next` | E, Leertaste, Linksklick – nur im Gespräch: Text ganz zeigen, weiter (M15) |
| `dialog_choice_1`, `dialog_choice_2`, `dialog_choice_3` | 1, 2, 3 – nur im Gespräch: Antwort wählen (M15) |
| `debug_delete_save` | F4 – nur im Debug-Build, seit M18 in jedem Level und in der Zeitkapsel: Spielstand löschen, neues Spiel in der Testkammer (M16) |
| `debug_complete_level` | Bild auf – ebenso: Level abschließen ohne Nachfrage, wie „Einsteigen“ (M16) |
| `debug_leave_level` | Bild ab – ebenso: Reise abbrechen ohne Nachfrage, wie „Abbrechen“ (M16) |
| `debug_quit_game` | Ende – ebenso: Spiel beenden wie mit dem X am Fenster, mit Speichern (M16) |
| `debug_unlock_all` | Pos1 – ebenso: alles freischalten (M19) |

Die Menüs (M20) nutzen dazu die eingebauten Aktionen `ui_up`, `ui_down`, `ui_left`, `ui_right`, `ui_accept`, `ui_cancel`, `ui_focus_next` und `ui_focus_prev` von Godot – Pfeiltasten, Enter, Leertaste, Esc, Tab – und `move_up` bis `move_right` (W A S D) sowie `pause`.

Genutzt werden bisher: die vier Laufrichtungen, `sprint`, `sneak`, `attack_primary`, `attack_secondary`, `dash`, `ability_1` bis `ability_3`, `ammo_next`, `ammo_previous`, `interact` (M8), `inventory` (Tab, M11), `pause` (Esc schließt das Inventarfenster, M11, und bricht seit M15 ein Gespräch ab), `dialog_next` und `dialog_choice_1` bis `dialog_choice_3` (M15), `mission_toggle` (M17) und die Entwickler-Tasten. Die Aktionen des Gesprächs liegen auf denselben Tasten wie andere; das stört nicht, weil die Figur im Gespräch keine Eingaben annimmt und das Dialogfenster die Tasten zuerst hört.

### Kollisions-Ebenen

| Ebene | Name | Wer liegt darauf |
| --- | --- | --- |
| 1 | `world` | Wände und Blöcke der Testkammer, seit M8 auch geschlossene Türen und Hebel, seit M9 Baumstümpfe, seit M10 Truhen, seit M15 NPCs, seit M16 Zeitanker; Geschosse enden an ihnen |
| 2 | `player` | Spielfigur; ihre Maske ist `world` und `enemy`. Druckplatten und Türdurchgänge bemerken sie hier (M8) |
| 3 | `enemy` | Übungspuppen als feste Körper, seit M13 die Gegner – ihre Maske ist `world`, `player` und `enemy` –, seit M9 auch Zerstörbares, solange es heil ist – Geschosse treffen es über die Hurtbox, statt daran zu enden; das bewegliche Ziel liegt auf keiner Ebene und lässt sich durchlaufen. Druckplatten und Türdurchgänge bemerken auch diese Ebene (M8) |
| 4 | `player_hurtbox` | `Hurtbox` der Spielfigur; Schadensfeld, Schadensstreifen, seit M13 der Schlag der Gegner und seit M14 ihre Geschosse suchen hier |
| 5 | `enemy_hurtbox` | `Hurtbox` der Übungspuppen, seit M9 von Zerstörbarem, seit M13 der Gegner; Schwert und Geschosse suchen hier |
| 6 | `interactable` | `Interactable` von Holztür und Hebel, seit M10 von Truhen, seit M15 von NPCs, seit M16 des Zeitankers; der `Interactor` der Spielfigur sucht hier (M8) |
| 7 | `pickup` | Beute am Boden (`Pickup`); der `Collector` der Spielfigur sucht hier (M9) |

Trefferzonen sind `Area2D`: Eine `Hurtbox` liegt auf ihrer Ebene und sucht selbst nichts. Eine `Hitbox` liegt auf keiner Ebene und sucht über ihre Maske.

### Gruppen

| Gruppe | Mitglieder | Wer sie nutzt |
| --- | --- | --- |
| `player_spawn` | Startpunkte im Level (`Marker2D`); seit M18 die Kinder `Spawn1` und `Spawn2` der Zeitkapsel und der Startpunkt in der Zeitkapsel innen | `PlayerSpawner`; die Testkammer malt dort ein Kreuz auf den Boden |
| `rooms` | jeder Raum (`Room`, M18) | `RoomWatcher`; `Room.merge_bounds()` für die Grenzen eines Levels; seit M20b die Karte, der `RoomExplorer` für die Debug-Zeile und Pos1 in `DebugKeys` |
| `players` | jede Spielfigur | `PlayerCamera`, `InventoryWindow` (M11), `Hud` (M12), `Perception` der Gegner (M13), `Npc` als Rückfall, wenn er die Figur sonst nicht kennt (M15), `MissionTracker` – er zählt Gegenstände in ihren Inventaren (M17); seit M20b die Karte – je Figur ein Pfeil |
| `invisible` | Figuren, solange ihre Unsichtbarkeit wirkt | `Perception` der Gegner: Unsichtbare bemerken sie nicht (M13) |
| `stunnable` | jeder Baustein `Stunnable`; ein toter Gegner tritt aus | die Fähigkeit Stun |
| `time_anchors` | jeder Zeitanker (M16) | `PlayerSpawner`: Er sucht dort den Rückkehrpunkt |

### Globale Klassen (`class_name`)

| Klasse | Datei | Art |
| --- | --- | --- |
| `IntentSource` | `entities/intent_source.gd` | Knoten: die Absichten einer Figur – `move_direction`, `wants_sprint`, `wants_sneak`, `aim_direction`, `wants_attack`, `wants_dash`, `wants_shoot`, `wants_ability`, `wants_ammo_cycle` (M11a), `wants_interact` (M8) |
| `MovementStats` | `entities/movement_stats.gd` | Bauplan einer Werte-Datei für Bewegung |
| `Stamina` | `components/stamina/stamina.gd` | Baustein Ausdauer |
| `StaminaStats` | `components/stamina/stamina_stats.gd` | Bauplan einer Werte-Datei für Ausdauer |
| `CameraStats` | `entities/player/camera_stats.gd` | Bauplan einer Werte-Datei für die Kamera; seit M18 mit `room_glide_time`, seit M20 mit `mode` (`Mode.FREE`, `LEVEL`, `ROOM`) und `outside_color` |
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
| `ProjectileSkin` | `entities/projectile/projectile_skin.gd` | Bauplan: Flugbild, Einzelbilder, Drehung, Explosions-Effekt eines Geschosses (M11a); seit M14 `first_frame`, das erste Bild im Streifen |
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
| `CharacterSkin` | `components/character_view/character_skin.gd` | Bauplan einer Werte-Datei für einen Skin: Bildgröße, Lage, Schatten, Animationen; seit M14 auch der Wurf `shoot` |
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
| `StateMachine` | `components/state_machine/state_machine.gd` | Baustein Zustandsautomat (M13) |
| `State` | `components/state_machine/state.gd` | ein Zustand für den Zustandsautomaten (M13) |
| `Perception` | `components/perception/perception.gd` | Baustein Sehen und Hören (M13) |
| `PerceptionStats` | `components/perception/perception_stats.gd` | Bauplan einer Werte-Datei für Perception (M13) |
| `Enemy` | `entities/enemies/enemy.gd` | ein Gegner (M13) |
| `EnemyStats` | `entities/enemies/enemy_stats.gd` | Bauplan der Werte-Datei eines Gegners: Tempo, Zeiten, Überraschung (M13; seit M14 mit `retreat_speed`, ohne `attack_recover`) |
| `EnemyState` | `entities/enemies/states/enemy_state.gd` | Grundlage der Zustände eines Gegners (M13) |
| `EnemyAttack` | `entities/enemies/attacks/enemy_attack.gd` | Angriffs-Modul eines Gegners: wann ein Angriff passt und welche Waffe er auslöst (M14) |
| `EnemyAttackStats` | `entities/enemies/attacks/enemy_attack_stats.gd` | Bauplan der Werte-Datei eines Angriffs-Moduls: Mindest- und Höchstabstand, freie Sicht, Pause danach (M14) |
| `EnemyMeleeAttack` | `entities/enemies/attacks/enemy_melee_attack.gd` | Angriffs-Modul Nahkampf: löst `MeleeAttack` aus (M14) |
| `EnemyRangedAttack` | `entities/enemies/attacks/enemy_ranged_attack.gd` | Angriffs-Modul Fernkampf: löst `RangedAttack` aus (M14) |
| `ViewSettings` | `world/view/view_settings.gd` | Bauplan der Ansicht: Zoom der Welt, faire Grenze für Gegner und die Kachel als Maß – `TILE_SIZE`, `tiles(anzahl)` (M13) |
| `DialogData` | `dialogs/dialog_data.gd` | Bauplan eines Gesprächs: Sprecher und Zeilen; `find_line(name)`, `speaker_of(zeile)`, `check()` liefert Fehler als Sätze (M15) |
| `DialogLine` | `dialogs/dialog_line.gd` | eine Zeile: `id`, `speaker`, `text`, `choices`, `next`, `reward`, `marks_done`, seit M17 `start_mission` und `hand_in_mission`, seit M18 `action`; `get_choices()`, `has_choices()`; `END` ist das Sprungziel „end“ (M15) |
| `DialogChoice` | `dialogs/dialog_choice.gd` | eine Antwort: `text`, `next` (M15) |
| `DialogSpeaker` | `dialogs/dialog_speaker.gd` | wer spricht: `display_name`, `portrait` (M15) |
| `DialogRunner` | `dialogs/dialog_runner.gd` | geht ein Gespräch durch: `start()`, `current()`, `advance()`, `choose(nummer)`, `stop()`; kein Knoten, sondern ein `RefCounted` (M15) |
| `DialogSettings` | `ui/dialog/dialog_settings.gd` | Bauplan der Werte-Datei des Dialogfensters: Buchstaben je Sekunde, Wippen des Pfeils (M15) |
| `Npc` | `entities/npcs/npc.gd` | ein NPC: Gespräch, kurzes Gespräch, Blickrichtung; entscheidet über Beute und „erledigt“ (M15); seit M17 meldet er Missionen und hat `get_dialogs()` |
| `TalkBubble` | `components/talk_bubble/talk_bubble.gd` | Baustein Sprechblase (M15) |
| `TalkFacing` | `components/talk_facing/talk_facing.gd` | Baustein: die Figur blickt im Gespräch zum Sprecher (M15, Nachbesserung) |
| `Persistent` | `components/persistent/persistent.gd` | Baustein: merkt sich den Zustand seines Elternknotens im Spielstand (M16) |
| `PlayerProgress` | `components/player_progress/player_progress.gd` | Baustein: Inventar und Ausrüstung der Spielfigur aus dem Spielstand und zurück (M16) |
| `TimeAnchor` | `world/time_anchor/time_anchor.gd` | Zeitanker: Rasten, Rückkehrpunkt, Speichern (M16) |
| `MissionList` | `missions/mission_list.gd` | Bauplan der Missionen-Datei eines Levels: `missions`, `find(name)`, `check()` (M17) |
| `MissionData` | `missions/mission_data.gd` | Bauplan einer Mission: `id`, `title`, `description`, `required`, `starts_with_level`, `hand_in`, `objectives`, `reward`; `has_item_objectives()`, `check()` (M17) |
| `MissionObjective` | `missions/mission_objective.gd` | Bauplan eines Ziels: `text`, `count`; `counts_event()`, `get_item()`, `takes_items()`, `check()` (M17) |
| `EventObjective` | `missions/event_objective.gd` | erweitert `MissionObjective`: ein Ereignis, `event` (M17) |
| `ItemObjective` | `missions/item_objective.gd` | erweitert `MissionObjective`: Gegenstände im Inventar, `item`, `take_on_hand_in` (M17) |
| `MissionTracker` | `missions/mission_tracker.gd` | die eine Stelle für die Missionen eines Levels: `start(name)`, `hand_in(name, player_id)`, `get_state(name)`, `are_required_done()`, `get_level_id()`; Stände `ACTIVE`, `READY`, `DONE` (M17) |
| `MissionCue` | `components/mission_cue/mission_cue.gd` | Baustein: meldet auf ein Signal ein Ereignis für Missionen (M17) |
| `QuestGiver` | `entities/npcs/quest_giver.gd` | erweitert `Npc`: Auftraggeber mit `mission_id` und vier Gesprächen; `mission_state()` (M17) |
| `LevelExit` | `world/level_exit/level_exit.gd` | Ausgang eines Levels: E meldet `level_exit_requested` (M17); seit M18 nicht mehr in der Testkammer, bleibt als Baustein |
| `LevelInfo` | `levels/level_info.gd` | Bauplan eines Reiseziels: `id`, `title`, `scene` (M18) |
| `TravelSettings` | `levels/travel_settings.gd` | Bauplan der Reisedaten: `levels`, `start_level`, `capsule_scene`, `capsule_title`, `fade_time`; `find(kennung)`, `find_by_scene(pfad)`, `is_capsule_scene(pfad)` (M18); seit M20 `menu_scene`, `is_menu_scene(pfad)` und `place_title(lauf, abgeschlossen)` – wo ein Spielstand weitergeht |
| `Level` | `levels/level.gd` | Grundlage neuer Level: `level_id`, `starts_run`, `level_size`, `death_restart_delay`; meldet sich bei `GameState`, meldet die Grenzen, lädt nach dem Tod neu; `get_bounds()`, `restart(anlass)` (M18) |
| `Room` | `world/room/room.gd` | ein Raum: `room_id`, `title`, `size`, auf Wunsch Boden und Raster; `get_bounds()`, `contains(punkt)`, `get_display_name()`, statisch `merge_bounds(baum, fläche)` (M18) |
| `RoomWatcher` | `world/room/room_watcher.gd` | merkt je Spielfigur ihren Raum und meldet Wechsel; `get_room_of(nummer)` (M18) |
| `RoomExplorer` | `world/room/room_explorer.gd` | bittet `GameState`, betretene Räume für die Karte abzulegen; `get_level_id()` (M20b) |
| `DebugKeys` | `ui/debug/debug_keys.gd` | die Test-Tasten F2, F4, Bild auf, Bild ab, Ende und die Debug-Zeile „Spielstand“ (M18) |
| `TalkAction` | `components/talk_action/talk_action.gd` | Baustein: führt für ein Ding ein Gespräch und meldet danach die Aktion der letzten Zeile; `talk(figur, gespräch)`, `is_talking()` (M18) |
| `TimeCapsule` | `world/time_capsule/time_capsule.gd` | die Zeitkapsel im Level: Landepunkt, Landung, Rückreise, Abbruch; `is_on` heißt bereit, `is_landing()` (M18) |
| `TimeConsole` | `world/time_console/time_console.gd` | die Zeitsteuerung in der Zeitkapsel: E wählt das Ziel der Reise (M18) |
| `UnlockInfo` | `unlocks/unlock_info.gd` | eine Freischaltung: `id`, `title`, `key_hint`, `icon`, `unlocked_at_start`; `get_notice_title()` (M19) |
| `UnlockSettings` | `unlocks/unlock_settings.gd` | alle Freischaltungen: `unlocks`, `notice_kind`, `notice_all`; `find(kennung)`, `check()` (M19) |
| `UnlockGate` | `components/unlock_gate/unlock_gate.gd` | Baustein an der Spielfigur: `is_unlocked()`, `can_dash()`, `can_shoot()`, `can_sneak()`, `can_use(fähigkeit)`; Signal `changed` (M19) |
| `UnlockPickup` | `world/unlock_pickup/unlock_pickup.gd` | Fundstück: E bittet um `unlock_id` und nimmt es auf (M19) |
| `MissionPanelSettings` | `ui/missions/mission_panel_settings.gd` | Bauplan der Werte-Datei der Missionsanzeige: `max_missions`, `notice_time`, `notice_fade` (M17) |
| `GameOptions` | `options/game_options.gd` | die Einstellungen des Spielers, statisch, ohne Knoten (M20): `get_value()`, `get_volume()`, `is_fullscreen()`, `is_missions_collapsed()`, `set_value()` – wendet an und schreibt `user://options.cfg` –, `apply_all()`, `ensure_applied()`, `save()`, `reload()`; Namen `MASTER_VOLUME`, `MUSIC_VOLUME`, `SOUND_VOLUME`, `FULLSCREEN`, `MISSIONS_COLLAPSED` |
| `OptionsDefaults` | `options/options_defaults.gd` | Bauplan der Grundwerte der Optionen (M20) |
| `MenuScreen` | `ui/menus/menu_screen.gd` | Grundlage jedes Menüs (M20): `open()`, `close()`, `back()`, `open_child(menü, fenster_lassen)`, `is_open()`, `has_open_child()`, `focusable_controls()`; Signale `opened`, `closed`; zum Füllen `_before_open()`, `_accepts_input()`, `_hook_controls()` |
| `ConfirmWindow` | `ui/menus/confirm_window/confirm_window.gd` | eine Nachfrage mit zwei Antworten (M20): `setup(frage, ja, nein, ja_per_tastatur)`; Signal `answered(ja)` |
| `MapView` | `ui/menus/map_window/map_view.gd` | zeichnet die Karte (M20b): `show_map(fläche, räume, figuren, zeitkapseln)`, `to_map(punkt)`, `get_factor()`; die Form der Figur in `MARKER` |
| `MapSettings` | `ui/menus/map_window/map_settings.gd` | Bauplan der Werte des Fensters auf M (M20b) |

### Werte-Dateien – `data/`

| Datei | Bauplan | Werte |
| --- | --- | --- |
| `data/player/movement.tres` | `MovementStats` | `walk_speed` 80, `sprint_speed` 130, `sneak_speed` 40, `acceleration` 600, `friction` 800, `sprint_cost_per_second` 25 |
| `data/player/stamina.tres` | `StaminaStats` | `max_stamina` 100, `regen_per_second` 30, `regen_delay` 0,8, `recover_threshold` 25 |
| `data/player/camera.tres` | `CameraStats` | `mouse_look_factor` 0,15, `mouse_look_max` 40, `move_look_seconds` 0,12, `move_look_max` 24, `smooth_time` 0,2, `min_speed` 24, seit M20 `mode` 0 (FREE) und `outside_color` (0,05; 0,06; 0,08), seit M18 `room_glide_time` 0,35 – nur mit `mode` ROOM |
| `data/world/travel.tres` | `TravelSettings` | Reisedaten (M18): Level `test_chamber` „Testkammer“ und `test_field` „Testfeld“ mit ihren Szenen, `start_level` `test_chamber`, `capsule_scene` `levels/time_capsule/time_capsule.tscn`, `capsule_title` „Zeitkapsel“, seit M20 `menu_scene` `levels/boot/boot.tscn`, `fade_time` 0,25 |
| `data/ui/options.tres` | `OptionsDefaults` | Grundwerte der Optionen (M20): `master_volume`, `music_volume`, `sound_volume` je 1, `fullscreen` aus, `missions_collapsed` aus |
| `data/ui/map.tres` | `MapSettings` | Werte des Fensters auf M (M20b): `padding` 6, Farben der Räume – erkundet (0,25; 0,22; 0,18) mit Rand (0,62; 0,55; 0,45), der Raum der Figur (0,42; 0,31; 0,22) mit orangem Rand –, `room_label_color`, `player_colors` – gelb, hellblau, grün, rosa –, `marker_outline_color`, `capsule_icon` `assets/test_art/objects/time_capsule_icon.png`, `scroll_step` 24, `done_alpha` 0,6 |
| `data/unlocks/unlocks.tres` | `UnlockSettings` | Freischaltungen (M19): `ranged` Fernkampf (Rechtsklick), `dash` Dash (Leertaste), `sneak` Schleichen (Strg), `stun` Stun (Taste 3), `invisibility` Unsichtbarkeit (Taste 2), `haste` Schnelligkeit (Taste 1) – keine von Anfang an frei; `notice_kind` „Neu freigeschaltet“, `notice_all` „Alles“ |
| `data/effects/unlock_twinkle.tres` | `EffectData` | Funkeln an Fundstücken (M19): `FX/Particle/Spark.png`, 7 à 10 × 8, 12 Bilder je Sekunde |
| `data/skins/time_capsule.tres` | `PropSkin` | Zeitkapsel (M18): `assets/test_art/objects/time_capsule.png`, eine Zelle 66 × 64 für aus und an, `offset` (0, −24) – so steht der Ort der Zeitkapsel unter ihrer Mitte am Boden |
| `data/skins/time_console.tres` | `PropSkin` | Zeitsteuerung (M18): `TilesetDungeon.png`, aus und an (7,3) – der Kristall |
| `data/effects/capsule_dust.tres` | `EffectData` | Staub bei der Landung (M18): `FX/Smoke/SmokeCircular/SpriteSheet.png`, 8 Bilder à 30 × 14, 16 je Sekunde |
| `data/effects/capsule_ready.tres` | `EffectData` | Funkeln an der Tür, solange die Zeitkapsel bereit ist (M18): `FX/Magic/Spark/SpriteSheet.png`, 10 Bilder à 27 × 35, 12 je Sekunde |
| `data/dialogs/time_capsule_ready.tres`, `time_capsule_abort.tres` | `DialogData` | Gespräche der Zeitkapsel (M18): bereit – Frage „Zurück in die Zeitkapsel?“, „Einsteigen“ führt zur Zeile mit `action` `board`, „Noch nicht“ endet; nicht bereit – Hinweis auf offene Pflichtmissionen, Frage „Reise abbrechen?“, „Abbrechen“ führt zur Zeile mit `action` `abort`, „Weitermachen“ endet |
| `data/dialogs/time_console.tres` | `DialogData` | Gespräch der Zeitsteuerung (M18): „Wohin soll die Reise gehen?“ – „Testkammer“ und „Testfeld“ führen zu Zeilen mit der Kennung des Ziels als `action`, „Hierbleiben“ endet |
| `data/dialogs/speakers/time_capsule.tres` | `DialogSpeaker` | „Zeitkapsel“, ohne Porträt; spricht auch für die Zeitsteuerung (M18) |
| `data/missions/test_field.tres` | `MissionList` | Missionen des Testfelds (M18): `pots` „Die drei Töpfe“ – Pflicht, beginnt mit dem Level, „Zerschlage die Töpfe“, Ereignis `test_field_pot`, 3; ohne Belohnung |
| `data/world/view.tres` | `ViewSettings` | `world_scale` 2, `fair_margin_tiles` 1 (M13) |
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
| `data/enemies/caveman.tres` | `EnemyStats` | `patrol_speed` 30, `chase_speed` 60, `retreat_speed` 45 (M14, bei ihm ohne Wirkung), `search_speed` 45, `patrol_wait` 1, `alert_time` 0,4, `lose_time` 1,5, `search_time` 3, `look_interval` 0,75, `search_walk_limit` 4, `give_up_time` 1,5, `remove_delay` 1, `surprise_factor` 2, `hit_search_tiles` 2 (M13) |
| `data/enemies/caveman_health.tres` | `HealthStats` | `max_health` 30, `invulnerable_time` 0 (M13) |
| `data/enemies/caveman_punch.tres` | `MeleeStats` | `damage` 10, `gain_per_hit` 0, `start_distance` 4, `reach` 14, `width` 14, `active_time` 0,12, `cooldown` 0,8 (M13) |
| `data/enemies/caveman_perception.tres` | `PerceptionStats` | `sight_tiles` 6, `sight_angle` 100, `track_tiles` 10, `occluder_mask` world, `hearing_tiles` 2,5, `silent_speed` 10, `sneak_factor` 0,5 (M13) |
| `data/enemies/caveman_attack.tres` | `EnemyAttackStats` | Angriffs-Modul des Höhlenmenschen: `min_tiles` 0, `max_tiles` 0 – so weit die Faust reicht –, `needs_line_of_sight` aus, `recover_time` 0,6; vorher `attack_recover` in `caveman.tres` (M14) |
| `data/enemies/stone_thrower.tres` | `EnemyStats` | Steinwerferin: `patrol_speed` 30, `chase_speed` 50, `retreat_speed` 45, `search_speed` 40, sonst wie `caveman.tres` (M14) |
| `data/enemies/stone_thrower_health.tres` | `HealthStats` | `max_health` 20, `invulnerable_time` 0 (M14) |
| `data/enemies/stone_thrower_perception.tres` | `PerceptionStats` | `sight_tiles` 7, `sight_angle` 90, sonst wie beim Höhlenmenschen (M14) |
| `data/enemies/stone_thrower_attack.tres` | `EnemyAttackStats` | `min_tiles` 2,5, `max_tiles` 5, `needs_line_of_sight` an, `recover_time` 0,3 (M14) |
| `data/enemies/stone_thrower_throw.tres` | `RangedStats` | der Stein: `damage` 10, `pierce` 1, `projectile_speed` 120, `max_distance` 112, `spawn_distance` 8, `cooldown` 1,8, `cost` 0; Bild `FX/Particle/Rock.png`, Zellen 16 × 16, `first_frame` 4, `spin` 540 (M14) |
| `data/loot/stone_thrower.tres` | `LootTable` | 2 Steine; mit 50 % 3 Pfeile (M14) |
| `data/skins/cavegirl.tres` | `CharacterSkin` | Steinwerferin: wie `caveman_brown.tres`, mit den Blättern von `Cavegirl`, `walk_reference_speed` 50 und `shoot` – das Bild aus `Attack.png` (M14) |
| `data/loot/caveman.tres` | `LootTable` | 3 Pfeile; mit 50 % 2 Shuriken (M13) |
| `data/dialogs/shaman_intro.tres` | `DialogData` | Gespräch des Schamanen, sieben Zeilen: Begrüßung; `question` mit drei Antworten nach `time`, `gift`, `bye`; `time` und ein zweiter Satz, der nach `question` zurückspringt; `gift` mit `reward` `shaman_gift.tres` und `marks_done`, danach ein Segen und `end`; `bye` als letzte Zeile (M15) |
| `data/dialogs/shaman_repeat.tres` | `DialogData` | kurzes Gespräch des Schamanen: „Die Geister sind mit dir, Reisender.“ (M15) |
| `data/dialogs/hunter_info.tres` | `DialogData` | Gespräch des Jägers, zwei Zeilen ohne Antworten; die zweite mit `marks_done` (M15) |
| `data/dialogs/speakers/shaman.tres`, `hunter.tres` | `DialogSpeaker` | „Schamane“ mit `Actor/Character/Shaman/Faceset.png`, „Jäger“ mit `Actor/Character/CaveLion/Faceset.png` (M15) |
| `data/loot/shaman_gift.tres` | `LootTable` | 5 Pfeile immer – das Geschenk des Schamanen (M15) |
| `data/skins/shaman.tres`, `cave_lion.tres` | `CharacterSkin` | NPCs (M15): Blätter von `Shaman` und `CaveLion`, Bild 16 × 16, `offset` (0, −2), Schatten bei (0, 5), `walk_reference_speed` 50; Stehen 1 Bild, Laufen 4 à 8/s |
| `data/ui/dialog.tres` | `DialogSettings` | `characters_per_second` 40, `arrow_bob_rate` 2 (M15) |
| `data/missions/test_chamber.tres` | `MissionList` | Missionen der Testkammer (M17): `caveman` „Der Höhlenmensch“ – Pflicht, beginnt mit dem Level, „Besiege den Höhlenmenschen“, Ereignis `caveman_defeated`, 1 –; `big_chest` „Die grosse Truhe“ – Pflicht, beginnt mit dem Level, „Öffne die grosse Truhe“, `chest_big_opened`, 1 –; `branches` „Holz für das Feuer“ – Neben, Abgabe, „Äste“: 2 Äste, werden abgegeben, Belohnung `mission_branches.tres` |
| `data/loot/mission_branches.tres` | `LootTable` | 5 Kunai immer – Belohnung der Mission „Holz für das Feuer“ (M17) |
| `data/dialogs/gatherer_offer.tres`, `gatherer_waiting.tres`, `gatherer_ready.tres`, `gatherer_done.tres` | `DialogData` | Gespräche der Sammlerin (M17): Angebot mit Frage – „Mach ich.“ startet `branches`, „Jetzt nicht.“ –, Erinnerung, Abgabe mit Frage – „Hier, bitte.“ gibt ab, „Noch nicht.“ –, Dank |
| `data/dialogs/speakers/gatherer.tres` | `DialogSpeaker` | „Sammlerin“ mit `Actor/Character/Cavegirl2/Faceset.png` (M17) |
| `data/skins/cavegirl2.tres` | `CharacterSkin` | die Sammlerin (M17): Blätter von `Cavegirl2`, sonst wie `cave_lion.tres` |
| `data/skins/level_exit.tres` | `PropSkin` | Ausgang (M17): `TilesetElement.png`, aus und an (6,11) – die offene Luke mit Treppe |
| `data/ui/missions.tres` | `MissionPanelSettings` | `max_missions` 3, `notice_time` 2,5, `notice_fade` 0,2 (M17) |
| `data/skins/caveman_brown.tres` | `CharacterSkin` | wie `caveman.tres`, mit den Blättern von `Caveman2` und `walk_reference_speed` 60 (M13) |
| `data/effects/claw.tres` | `EffectData` | `FX/Attack/Claw/SpriteSheet.png`, 4 à 32, 16 Bilder je Sekunde (M13) |
| `data/effects/emote_alert.tres`, `emote_search.tres` | `EffectData` | `Ui/Emote/emote22.png` („!“) 0,8 s und `emote23.png` („?“) 1 s, je 14 × 13, 24 Pixel über der Mitte (M13) |
| `data/dummy/health.tres` | `HealthStats` | `max_health` 50, `invulnerable_time` 0 |
| `data/skins/ninja_green.tres` | `CharacterSkin` | Spielfigur `NinjaGreen`: Bild 32 × 32, `offset` (0, −2), Schatten bei (0, 5), `walk_reference_speed` 80; Stehen 4 Bilder à 5/s, Laufen 4 à 8/s, Hieb 4 à 11/s, Rolle 3 à 15/s, Treffer 2 à 8/s, Tod 2 à 5/s |
| `data/skins/bamboo_yellow.tres` | `CharacterSkin` | feste Übungspuppen, `BambooYellow`: Bild 16 × 16, `offset` (0, −2), Schatten bei (0, 5), `walk_reference_speed` 40; Stehen 1 Bild, Laufen 4 à 6/s; im Tod grau |
| `data/skins/bamboo.tres` | `CharacterSkin` | bewegliches Ziel, `Bamboo`; Werte wie `bamboo_yellow.tres` |
| `data/skins/caveman.tres` | `CharacterSkin` | Probe-Skin `Caveman` für einen Skin-Tausch: Bild 16 × 16; Stehen 1 Bild, Laufen 4 à 8/s, Hieb 1 Bild, Tod 1 Bild; keine Rolle, kein Treffer-Bild |
| `data/skins/door_wood.tres` | `PropSkin` | Holztür (M8): `TilesetHouse.png`, zu (2,3), offen kein Bild |
| `data/skins/gate_bars.tres` | `PropSkin` | Gittertor (M8): `TilesetElement.png`, zu (1,11), offen kein Bild |
| `data/skins/lever.tres` | `PropSkin` | Hebel (M8): `TilesetDungeon.png`, aus (3,3) rot, an (4,3) blau |
| `data/skins/pressure_plate.tres` | `PropSkin` | Druckplatte (M8): `TilesetDungeon.png`, oben (2,1), gedrückt (3,1) |
| `data/skins/time_anchor.tres` | `PropSkin` | Zeitanker (M16): `TilesetDungeon.png`, grau (3,2), blau (4,2) |
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
| `CharacterView` | `components/character_view/` | Zeigt die Figur mit der Grafik aus einem Skin, in der nächstliegenden von vier Blickrichtungen. Liest den Wert `facing` der Figur, sonst die Laufrichtung, und misst das Tempo am Ort. Hört auf `Health` (Treffer, Tod, Wiederaufstehen), `Dash`, `MeleeAttack` und seit M14 `RangedAttack` – beim Wurf zeigt er `shoot`, wenn der Skin es hat. Blendet das Geschwister `PlaceholderView` aus. Fragt: `has_skin_animation(name)`; liest: `direction`, `current_animation`. | `skin`, `walk_threshold`, `direction_hysteresis`, `min_walk_rate`, `max_walk_rate` |
| `Stamina` | `components/stamina/` | Ausdauer-Vorrat: `spend(amount)` verbraucht und liefert, ob es ging; nach `regen_delay` füllt er sich. Bei 0 gilt `is_exhausted`, bis `recover_threshold` erreicht ist. Meldet `changed`, `exhausted`, `recovered`. | `stats` |
| `Health` | `components/health/` | Leben. `apply_damage(amount)` ist die einzige Stelle, an der über Schaden entschieden wird: Tote und gerade Unverwundbare nehmen keinen. `make_invulnerable(seconds)` schützt für eine Dauer, etwa beim Dash. `reset()` füllt auf, auch nach dem Tod. Seit M11: `armor` zieht von jedem Treffer ab, mindestens 1 bleibt; `set_bonus_maximum(wert)` gibt mehr Leben, `get_maximum()` zählt es mit. Beides setzt `Equipment`. Seit M13 vervielfacht `damage_factor` jeden Treffer vor der Rüstung; ein Gegner setzt ihn auf 2, solange er die Figur nicht bemerkt hat. Meldet `changed`, `damaged`, `died`, `revived`. | `stats` |
| `Hurtbox` | `components/hurtbox/` | `Area2D`, die Treffer annimmt und an das Geschwister `Health` weiterreicht: `receive_hit(damage, direction)`. Meldet `hit_received`. Seit M9: `accepted_kinds` nennt die Arten von Treffern, die Schaden machen – Klinge, Geschoss, Explosion; die übrigen prallen ab, `accepts(art)` fragt das, `block_hit(richtung)` meldet `hit_blocked`. Mit `feeds_attacker` aus füllt ein Treffer beim Angreifer nichts auf, etwa keine Energie. Braucht eine eigene `CollisionShape2D`. | Ebene, `accepted_kinds`, `feeds_attacker` |
| `Hitbox` | `components/hitbox/` | `Area2D`, die jede berührte `Hurtbox` trifft, solange sie scharf ist: `activate()`, `deactivate()`. Meldet `hit_landed`; entschärft ein Zuhörer sie dabei, trifft sie in diesem Schritt nichts weiter. Seit M9 hat jeder Treffer eine Art (`kind`: Klinge, Geschoss, Explosion); nimmt die Hurtbox sie nicht an, meldet sie `hit_blocked` – einmal je Ziel und Aktivierung, wie ein Treffer. Braucht eine eigene `CollisionShape2D`. | `damage`, `kind`, `hit_interval`, `active_on_start`, Maske |
| `MeleeAttack` | `components/melee_attack/` | Nahkampf-Angriff: `try_attack(richtung)` dreht die Trefferzone in die Richtung und macht sie kurz scharf. Zone und Zeiten kommen aus der Werte-Datei. Jeder Treffer füllt das Geschwister `gain_supply_name` um `gain_per_hit` auf, außer an einer Hurtbox mit `feeds_attacker` aus, etwa an Zerstörbarem (M9). `rate_factor` über 1 verkürzt die Pause. Meldet `attack_started`, `attack_finished`. Das Feld in `swing_color` ist an der Spielfigur seit A2 durchsichtig; dort zeigt `SlashEffect` den Hieb. Seit M11 wechselt `set_stats(werte)` die Werte, etwa für eine andere Waffe; `set_stats(null)` kehrt zu denen aus dem Inspektor zurück. Seit M13 liefert `reach_distance()`, wie weit der Schlag von der Mitte der Figur reicht: `start_distance` + `reach`. Der Schlag kommt immer sofort, ohne Ausholen. | `stats`, `target_mask`, `swing_color`, `gain_supply_name` |
| `HitFlash` | `components/hit_flash/` | Lässt den Elternknoten bei Schaden hell aufblitzen; solange er unverwundbar ist, blinkt er. Hört auf das Geschwister `Health`. | `flash_time`, `flash_strength`, `blink_while_invulnerable`, `blink_interval`, `blink_alpha` |
| `DamageNumbers` | `components/damage_numbers/` | Zeigt bei Schaden die Zahl über dem Elternknoten; sie steigt auf und verblasst. Hört auf das Geschwister `Health`. Seit A2 in der Pixel-Schrift `NormalFont`, Größe 9; ohne `font` die Standardschrift. | `color`, `font`, `font_size`, `outline_size`, `rise_distance`, `duration`, `start_offset` |
| `Dash` | `components/dash/` | Kurzer, schneller Satz: `request()` merkt den Tastendruck vor, `try_start(richtung)` startet, sobald es möglich ist; solange `is_dashing` gilt, liefert `get_velocity()` das Tempo. Macht das Geschwister `Health` beim Start kurz unverwundbar. Meldet `dash_started`, `dash_finished`. | `stats` |
| `Supply` | `components/supply/` | Zählbarer Vorrat: `spend(menge)` verbraucht und liefert, ob genug da war; `add(menge)` füllt auf. Mit `regen_per_second` über 0 füllt er sich nach `regen_delay` von selbst. Meldet `changed`. | `stats` |
| `RangedAttack` | `components/ranged_attack/` | Fernkampf-Angriff: `try_shoot(richtung)` bezahlt aus dem Geschwister `supply_name` und bestellt das Geschoss über `projectile_requested`. Liegt ein `AmmoSelector` daneben (M11a), kommen Werte und Kosten von dort, und `stats` und `supply_name` gelten nicht. Ohne `ProjectileSpawner` im Level fällt kein Schuss und nichts wird bezahlt. `rate_factor` über 1 verkürzt die Pause. Seit M11 legt `damage_bonus` auf jedes Geschoss mit Aufprall-Schaden etwas drauf – in einer Kopie der Werte, die Werte-Datei bleibt. Meldet `shot_fired`. | `stats`, `projectile_scene`, `target_mask`, `supply_name`, `ammo_name` |
| `Inventory` | `components/inventory/` | Inventar mit begrenzten Plätzen; Gleiches stapelt sich bis zur Stapelgröße. `add(gegenstand, anzahl)` liefert, was keinen Platz fand; `remove(gegenstand, anzahl)` nimmt nur, wenn genug da ist. Die einzige Stelle, die über den Inhalt entscheidet. Lesen: `count()`, `has()`, `get_items()`, `get_slots()`, `get_used_slots()`, `get_slot_count()`. Meldet `changed`, `item_added`, `item_removed`. Seit M16 liefert `get_saved_state()` je belegtem Platz Platz, Pfad der Werte-Datei und Anzahl; `apply_saved_state(daten)` stellt das her. | `stats` |
| `AmmoSelector` | `components/ammo_selector/` | Wählt das Geschoss: jedes `AmmoData` im Inventar, in der Reihenfolge der Plätze. `cycle(schritt)` wechselt, `get_shot()` liefert die Werte des Wurfs, `consume(anzahl)` nimmt aus dem Inventar. Ist das gewählte aufgebraucht, rückt das nächste nach. Meldet `selection_changed`. | `inventory_name` |
| `PatrolMover` | `components/patrol_mover/` | Lässt seinen Elternknoten zwischen Startpunkt und Startpunkt + `travel` pendeln. Für Dinge, die nichts wegschieben müssen. | `travel`, `speed` |
| `Stunnable` | `components/stunnable/` | Macht seinen Elternknoten betäubbar: `apply_stun(sekunden)`, `is_stunned()`. Solange die Betäubung anhält, ruht der Knoten aus `paused_node`, und um das Ziel pulsiert der weiße Kreis aus seinem Kind `StunEffect` (A2). Der gelbe Ring aus M7 ist durchsichtig gestellt. Steht in der Gruppe `stunnable`. Meldet `stunned`, `recovered`. | `paused_node`, `ring_radius`, `ring_color` |
| `Interactable` | `components/interactable/` | `Area2D` auf der Ebene `interactable`: macht seinen Elternknoten mit E bedienbar. `interact(actor)` meldet `interacted`; was dann geschieht, entscheidet der Elternknoten. Nur mit `enabled` zeigt sich die Taste und E wirkt. Braucht eine eigene `CollisionShape2D` (M8). | `enabled`, `prompt_offset` |
| `Interactor` | `components/interactor/` | `Area2D` an der Figur: Ein Kreis mit `reach` sucht auf `interactable`; das nächste bedienbare Ding ist `focus` (Signal `focus_changed`). `try_interact()` bedient es. Das Kind `Prompt` zeigt die Taste E über dem Kopf der Figur oder mit `prompt_above_target` über dem Ding (M8). | `stats`, `prompt_above_target`, `prompt_offset` |
| `PropView` | `components/prop_view/` | `Sprite2D`: zeigt ein Ding der Welt mit dem Bild für aus oder an aus einem `PropSkin`; ohne Bild für einen Zustand ist dann nichts zu sehen. Liest `is_on` und hört auf `state_changed` des Elternknotens. Blendet das Geschwister `PlaceholderView` aus (M8). | `skin` |
| `EffectCue` | `components/effect_cue/` | Spielt einen Effekt aus einer Werte-Datei, wenn ein Baustein daneben ein Signal sendet (A2). Liefert das Signal eine Richtung, rückt der Effekt um `distance` dorthin und dreht sich auf Wunsch mit. Mit `stop_signal_name` wiederholt er sich, bis dieses Signal kommt. Er entscheidet nichts. | `effect`, `source_name`, `signal_name`, `stop_signal_name`, `follow`, `use_direction`, `distance` |
| `DebrisCue` | `components/debris_cue/` | Lässt Splitter aus einer `DebrisData` fliegen, wenn ein Baustein daneben ein Signal sendet, an seinem eigenen Ort; sie fliegen in der Szene zu Ende. Entscheidet nichts (M9). | `debris`, `source_name` (Standard `Health`), `signal_name` (Standard `died`) |
| `LootDropper` | `components/loot_dropper/` | Würfelt auf ein Signal seine Beute-Liste und bestellt jeden Treffer über `loot_requested`, mit seinem Ort als Absprung. `drop()` geht auch direkt. Meldet `dropped(anzahl)`. Die eine Stelle, an der gewürfelt wird (M9). | `table`, `source_name` (Standard `Health`), `signal_name` (Standard `died`) |
| `Equipment` | `components/equipment/` | Die Ausrüstung einer Figur: vier Plätze. `equip(gegenstand)` nimmt ihn aus dem Inventar und legt ihn an, das Vorige kommt zurück; `unequip(platz)` legt ab, wenn im Inventar Platz ist; `get_item(platz)` liest. Die einzige Stelle, die über Angelegtes entscheidet. Gibt die Werte an `MeleeAttack`, `RangedAttack` und `Health` weiter. Meldet `changed(platz, gegenstand)` (M11). Seit M16 liefert `get_saved_state()` je Platz den Pfad der Werte-Datei; `apply_saved_state(daten)` legt das an. | `stats` |
| `StateMachine` | `components/state_machine/` | Zustandsautomat: Jedes Kind mit einem Skript, das von `State` erbt, ist ein Zustand – mit `enter()`, `exit()` und `physics_update()`. Genau einer ist aktiv; `transition_to(name)` wechselt. Beginnt mit `initial_state`, sobald die ganze Szene bereit ist, und läuft vor seiner Figur (`process_physics_priority` −1). Meldet `state_changed(vorher, jetzt)`; `get_display_name()` liefert den Anzeigenamen (M13). | `initial_state`; je Zustand `display_name` |
| `Perception` | `components/perception/` | Sehen und Hören: `find_target(blickrichtung, aware)` liefert den nächsten Spieler aus der Gruppe `players`, den die Figur bemerkt; `can_perceive(ziel, blickrichtung, aware)` und `has_line_of_sight(punkt)` fragen einzeln. Ohne `aware` nur im Kegel, mit `aware` rundum bis `track_tiles`; Wände verdecken. Hören im Umkreis, wenn sich ein Ziel bewegt und nicht schleicht (`is_sneaking()` der Figur). Unsichtbare und Tote bemerkt sie nicht. Abstände in Kacheln. Faire Grenze: Bemerkt wird nur, wer sie auf dem eigenen Bild hat, mit `fair_margin_tiles` Rand – `is_in_fair_view(abstand)`, `fair_half_extent()`; die Größe folgt dem Zoom aus `view`. Entscheidet nichts. Mit `debug_draw` zeigt sie Kegel, Hörkreis und Grenze als Rahmen, F1 blendet sie aus (M13). | `stats`, `view`, `debug_draw`, zwei Farben |
| `LifeBar` | `components/life_bar/` | Kleine Lebensleiste über einer Figur aus zwei gleich großen Bildern: leere Leiste und Füllung von links, der Rand bleibt. Erscheint ab dem ersten Schaden, verschwindet beim Tod. Hört auf `Health` (M13). | `texture_under`, `texture_progress`, `border`, `hide_when_full`, `health_name` |
| `TalkBubble` | `components/talk_bubble/` | `Sprite2D` mit `Ui/Dialog/DialogInfo.png` in 4 Bildern: spielt eine Sprechblase mit ein, zwei, drei Punkten ab, Ebene 40. Ob sie zu sehen ist, entscheidet der Elternknoten (M15). | `fps` (3), `cycle` (1, 2, 3) |
| `TalkFacing` | `components/talk_facing/` | Hört auf `dialog_started` und `dialog_finished` mit der `player_id` seiner Figur: setzt ihren Wert `look_target` auf den Sprecher – den Knoten mit `source_id` – und nimmt ihn am Ende wieder weg. Die Figur blickt dann zum Sprecher statt zur Maus (M15, Nachbesserung). | – |
| `MissionCue` | `components/mission_cue/` | Meldet auf ein Signal eines Geschwisters ein Ereignis für Missionen: `mission_event(event, amount)`; welche Mission es zählt, entscheidet der `MissionTracker`. Meldet `cued(event)`. Aufbau wie `LootDropper` (M17). | `event`, `amount` (1), `source_name` (Standard `Health`), `signal_name` (Standard `died`) |
| `TalkAction` | `components/talk_action/` | Führt für ein Ding ein Gespräch: `talk(figur, gespräch)` bittet das Dialogfenster der Figur darum, als Sprecher gilt der Elternknoten – die Figur blickt zu ihm. Merkt sich die Aktion (`DialogLine.action`) jeder gezeigten Zeile, eine Zeile ohne löscht sie. Endet das Gespräch regulär, meldet er `action_chosen(aktion, player_id)`; nach Esc nichts. Meldet `talk_started`, `talk_finished`. Ohne Dialogfenster eine Warnung. Entscheidet nichts (M18) | – |
| `UnlockGate` | `components/unlock_gate/` | Sperrt an der Spielfigur, was noch nicht frei ist: Die Figur fragt vor Dash, Schuss, Schleichen und jeder Fähigkeit, das HUD vor dem Anzeigen. Fragt `GameState`; ohne ihn ist alles frei. Meldet `changed` bei `unlocks_changed` und `level_run_changed`. Entscheidet nichts (M19) | `dash_unlock`, `ranged_unlock`, `sneak_unlock` |
| `Persistent` | `components/persistent/` | Merkt sich den Zustand seines Elternknotens in `GameState`: Sobald das Ding bereit ist, holt er den gemerkten Zustand und gibt ihn an `apply_saved_state(daten)`; sendet das Ding danach sein Signal `save_signal`, legt er `get_saved_state()` ab. Kennung: Level und Pfad des Dings in der Level-Szene. Dinge, die erst im Spiel entstehen, etwa Beute, merkt er sich nicht. Entscheidet nichts (M16) | `save_signal` (Standard `state_changed`) |
| `PlayerProgress` | `components/player_progress/` | Letztes Kind der Spielfigur: füllt beim Erscheinen `Inventory` und `Equipment` aus `GameState` unter ihrer `player_id`, danach ist das Leben voll; ohne gemerkte Daten merkt er den Startinhalt. Jede Änderung legt er zurück (M16) | `inventory_name`, `equipment_name`, `health_name` |
| `Collector` | `components/collector/` | `Area2D` an der Figur, Kreis 6 Pixel, Maske `pickup`. Nimmt aus jedem bereiten `Pickup` im Kreis so viel, wie das Geschwister `Inventory` annimmt; der Rest bleibt liegen. Meldet `collected`, `rejected` und schreibt „S1 Beute“ in die Debug-Anzeige (M9). | – |

Die Bausteine finden das Leben über den Namen: Der Knoten muss genau `Health` heißen und neben ihnen liegen.

### Fähigkeiten – `abilities/`

| Fähigkeit | Ordner | Was sie tut | Einstellbar |
| --- | --- | --- | --- |
| `Ability` | `abilities/` | Grundgerüst: `try_activate()` prüft Bereitschaft und Vorrat, bezahlt und startet die Wirkung; nach `duration` endet sie, dann läuft `cooldown`. Erbende Skripte füllen nur `_begin_effect()` und `_end_effect()`. Meldet `activated`, `finished`. | `stats`, `supply_name` |
| Schnelligkeit | `abilities/haste/` | Setzt bei der Figur `speed_factor` und bei ihren Kindern `rate_factor`: schneller laufen, schlagen und schießen. | `stats` |
| Unsichtbarkeit | `abilities/invisibility/` | Macht das Bild der Figur durchscheinend – jedes Kind aus `view_names`, die es gibt – und stellt sie in die Gruppe `invisible`. Gegner und Bonus-Schaden folgen in Phase 3. | `stats`, `view_names` (Standard: `CharacterView`, `PlaceholderView`) |
| Stun | `abilities/stun/` | Betäubt jeden `Stunnable` im Umkreis für die Dauer der Fähigkeit und zeigt einen Ring. | `stats`, `pulse_time`, `pulse_color` |

Eine neue Fähigkeit ist ein Ordner mit Szene, Skript und Werte-Datei; das Skript erbt von `Ability`. Seit M12 steht in der Werte-Datei auch ihr Symbol fürs HUD: `icon` und die graue Fassung `icon_disabled`. Seit M19 nennt jede Fähigkeit in `unlock_id` ihre Freischaltung – `haste`, `invisibility`, `stun`, gesetzt in ihrer Szene; gesperrt setzt die Figur sie nicht ein.

### Szenen

| Szene | Skript | Zweck |
| --- | --- | --- |
| `levels/boot/boot.tscn` | `boot.gd` | Startszene seit M18; seit M20 mit dem Kind `MainMenu`: wendet die Optionen an, schließt den Platz und zeigt das Hauptmenü. Ohne `MainMenu` öffnet sie den zuletzt gespeicherten Platz und gibt an `SceneManager.start_game()` ab; ohne SceneManager lädt sie `fallback_scene`, die Testkammer |
| `ui/menus/main_menu/main_menu.tscn` | `main_menu.gd` | Hauptmenü (M20): `CanvasLayer` auf Ebene 107, `Root` mit `Background`, `Decor` – `Title` „TimeTraveller“ und `Capsule` –, `Window` mit `Start`, `Options`, `Quit` und `Hint`; Kinder `SaveSlots` und `OptionsMenu` |
| `ui/menus/save_slots/save_slots.tscn` | `save_slots.gd` | Spielstand-Auswahl (M20): Ebene 108, `Window` mit `Title`, `Slots` – die Zeilen `Row1` bis `Row3` mit `Slot1` … und `Delete1` … baut das Skript – und `Back`; Kind `Confirm` |
| `ui/menus/options_menu/options_menu.tscn` | `options_menu.gd` | Optionen (M20): Ebene 108, `Window` mit `Volumes` – `Master`, `Music`, `Sound` je mit Name und Zahl –, `Fullscreen`, `EmbeddedHint`, `Keys`, `Back`; Kind `KeyList` |
| `ui/menus/key_list/key_list.tscn` | `key_list.gd` | Tastenbelegung zum Ansehen (M20): Ebene 109, `Window` mit `Grid` – vier Spalten, baut das Skript –, `Note`, `Back` |
| `ui/menus/pause_menu/pause_menu.tscn` | `pause_menu.gd` | Pausenmenü (M20): Ebene 107, `Root` mit `Dim` und `Window` – `Resume`, `Options`, `Abort`, `MainMenu`, `Quit`; Kinder `OptionsMenu` und `Confirm`; `abort_dialog` ist `data/dialogs/time_capsule_abort.tres` |
| `ui/menus/confirm_window/confirm_window.tscn` | `confirm_window.gd` | Nachfrage (M20): Ebene 109, `Root` mit `Dim` und `Window` – `Question`, `Buttons` mit `Yes` und `No` |
| `ui/menus/map_window/map_window.tscn` | `map_window.gd` | Fenster mit Karte und Missionen (M20b): Ebene 107, `Root` mit `Dim` (35 %) und `Window` – `Top` mit `Tabs` (`MapTab`, `MissionsTab`) und `Place`, `Pages` 388 × 172 mit `MapPage` (darin `MapView`) und `MissionsPage` (darin `Missions`), `Hint` |
| `levels/test_chamber/test_chamber.tscn` | `test_chamber.gd` | Testkammer; bis M18 Startszene |
| `levels/level_frame/level_frame.tscn` | – | was jedes Level braucht (M18), in dieser Reihenfolge: `LootSpawner`, `PlayerSpawner`, `ProjectileSpawner`, `PlayerCamera`, `RoomWatcher`, seit M20b `RoomExplorer`, `DebugKeys`, `Crosshair`, `DebugOverlay`, `InventoryWindow`, `Hud`, `MissionPanel`, `DialogWindow`, seit M20b `MapWindow`, seit M20 `PauseMenu`; ein `Node2D`, als letztes Kind ins Level |
| `levels/test_field/test_field.tscn` | `level.gd` | das Testfeld (M18): `Level` `test_field`, 384 × 256; Raum `Field` mit Wänden, `TimeCapsule` bei (160, 128), drei Töpfen mit `MissionCue` (`test_field_pot`) bei (248, 72), (304, 128), (248, 184), kleiner Truhe bei (336, 200); `MissionTracker` mit `data/missions/test_field.tres`; `LevelFrame` |
| `levels/time_capsule/time_capsule.tscn` | `level.gd` | die Zeitkapsel innen (M18): `Level` `time_capsule` ohne Lauf, 320 × 160; Raum `Inside` mit Wänden, `TimeConsole` bei (160, 72), Startpunkt `Spawn` bei (160, 120); `LevelFrame` |
| `world/time_capsule/time_capsule.tscn` | `time_capsule.gd` | die Zeitkapsel im Level (M18): `StaticBody2D` auf `world`; Kinder `CollisionShape2D` (48 × 24, 10 Pixel über dem Ort), `UpperShape` (30 × 22, 33 darüber), `PlaceholderView`, `View` (`PropView`), `Interactable` (32 × 12 bei (−12, 8), vor der Tür), `TalkAction`, `Spawn1` (−24, 9) und `Spawn2` (−8, 17), `ArriveEffect` (Staub, bleibt am Ort), `ReadyEffect` (Funkeln an der Tür, (−12, −17)) |
| `world/time_console/time_console.tscn` | `time_console.gd` | die Zeitsteuerung (M18): `StaticBody2D` auf `world`; Kinder `CollisionShape2D` (14 × 10), `PlaceholderView`, `PropView`, `Interactable` (16 × 16), `TalkAction` |
| `world/room/room.tscn`, `room_watcher.tscn` | `room.gd`, `room_watcher.gd` | ein Raum und der Wächter der Räume (M18); der `RoomWatcher` läuft nach den Figuren, vor der Kamera (`process_physics_priority` 5) |
| `world/room/room_explorer.tscn` | `room_explorer.gd` | merkt erkundete Räume für die Karte (M20b); ein `Node` ohne Kinder |
| `ui/debug/debug_keys.tscn` | `debug_keys.gd` | die Test-Tasten (M18) |
| `components/talk_action/talk_action.tscn` | `talk_action.gd` | Baustein, siehe oben (M18) |
| `components/unlock_gate/unlock_gate.tscn` | `unlock_gate.gd` | Baustein, siehe oben; als Kind `Unlocks` der Spielfigur (M19) |
| `world/unlock_pickup/unlock_pickup.tscn` | `unlock_pickup.gd` | Fundstück (M19): `Node2D`; Kinder `Icon` (`Scroll.png`, wippt), `Interactable` (16 × 16), `Sparkle` (`EffectCue` mit `unlock_twinkle.tres`), `Persistent` (`taken`) |
| `entities/player/player.tscn` | `player.gd` | Spielfigur |
| `entities/player/player_spawner.tscn` | `player_spawner.gd` | erzeugt die Spielfiguren eines Levels |
| `entities/player/player_camera.tscn` | `player_camera.gd` | Kamera, die der Spielfigur folgt |
| `entities/dummy/training_dummy.tscn` | `training_dummy.gd` | Übungspuppe |
| `entities/enemies/enemy.tscn` | `enemy.gd` | Grundszene eines Gegners mit allen Bausteinen außer dem Angriff, dem leeren Knoten `Attacks` und dem Zustandsautomaten `Brain` (M13; seit M14 ohne Angriff) |
| `entities/enemies/melee_enemy.tscn` | – (erbt von `enemy.tscn`) | Gegnertyp Nahkämpfer: Waffe `MeleeAttack`, Effekt `ClawEffect`, Angriffs-Modul `Attacks/Melee` (M14) |
| `entities/enemies/ranged_enemy.tscn` | – (erbt von `enemy.tscn`) | Gegnertyp Fernkämpfer: Waffe `RangedAttack` mit `projectile.tscn`, Angriffs-Modul `Attacks/Ranged` (M14) |
| `entities/enemies/caveman.tscn` | – (erbt seit M14 von `melee_enemy.tscn`) | der Höhlenmensch: Skin, Werte, Faust, Beute (M13); seit M17 ein `MissionCue` mit `caveman_defeated` |
| `entities/enemies/stone_thrower.tscn` | – (erbt von `ranged_enemy.tscn`) | die Steinwerferin: Skin, Werte, Wurf, Beute (M14) |
| `components/state_machine/state_machine.tscn`, `components/perception/perception.tscn`, `components/life_bar/life_bar.tscn` | je ein Skript daneben | Bausteine, siehe oben (M13) |
| `entities/npcs/npc.tscn` | `npc.gd` | Grundszene eines NPC: `StaticBody2D` auf `world`, Körper 12 × 12, Kinder `CollisionShape2D`, `PlaceholderView`, `CharacterView`, `Interactable` (Kreis 10), `TalkBubble` 19 Pixel über der Mitte (M15) |
| `entities/npcs/shaman.tscn`, `hunter.tscn` | – (erben von `npc.tscn`) | der Schamane und der Jäger: Skin und Gespräche (M15) |
| `ui/dialog/dialog_window.tscn` | `dialog_window.gd` | Dialogfenster; `CanvasLayer` auf Ebene 106, Kind `Root` mit dem Thema `ui/dialog/dialog_theme.tres`, darin `Box` (`TextureRect`) mit `Portrait`, `Name`, `Text` und `Arrow`, daneben `Choices` (`VBoxContainer`) mit `Choice1` bis `Choice3` (M15) |
| `ui/dialog/choice_button.tscn` | `choice_button.gd` | ein Antwort-Kästchen: `Button` mit `Key` und `Focus` (M15) |
| `components/talk_bubble/talk_bubble.tscn` | `talk_bubble.gd` | Baustein, siehe oben (M15) |
| `components/talk_facing/talk_facing.tscn` | `talk_facing.gd` | Baustein, siehe oben (M15, Nachbesserung) |
| `components/persistent/persistent.tscn` | `persistent.gd` | Baustein, siehe oben (M16); hängt in `chest.tscn`, `destructible.tscn`, `pickup.tscn` (Signal `taken`), `lever.tscn`, `door.tscn` und `npc.tscn` (Signal `progress_changed`) |
| `components/player_progress/player_progress.tscn` | `player_progress.gd` | Baustein, siehe oben (M16) |
| `world/time_anchor/time_anchor.tscn` | `time_anchor.gd` | Zeitanker (M16): `StaticBody2D` auf `world` in der Gruppe `time_anchors`; Kinder `CollisionShape2D` (14 × 10, 2 Pixel tiefer), `PlaceholderView`, `PropView`, `Interactable` (16 × 16), `RestEffect` (ein `EffectCue`, Funkeln), `SavedLabel` (`Label` „Gespeichert“, `NormalFont` 9, 14 bis 26 Pixel über der Mitte) |
| `missions/mission_tracker.tscn` | `mission_tracker.gd` | die eine Stelle für die Missionen eines Levels; ein `Node` (M17) |
| `ui/missions/mission_panel.tscn` | `mission_panel.gd` | Missionsliste und Hinweise; `CanvasLayer` auf Ebene 90 mit `List` (`PanelContainer`, darin `Rows` mit `Header` – `Arrow` mit `Icon`, `Title`, `Key` –, `Missions` und `More`) und `Notice` (`PanelContainer` mit `Interior` und `Rows`: `Kind`, `Title`); Thema `ui/missions/mission_theme.tres` (M17) |
| `entities/npcs/gatherer.tscn` | `quest_giver.gd` – erbt von `npc.tscn` | die Sammlerin, Auftraggeberin der Mission `branches` (M17) |
| `world/level_exit/level_exit.tscn` | `level_exit.gd` | Ausgang; Kinder `PropView` und `Interactable` (16 × 16) (M17); seit M18 ohne Platz in der Testkammer |
| `components/mission_cue/mission_cue.tscn` | `mission_cue.gd` | Baustein, siehe oben (M17) |
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
- Kinder: `CollisionShape2D`, `PlaceholderView`, `CharacterView`, `PlayerInput` (ein `IntentSource`, läuft vor der Figur), `Stamina`, `Health`, `Hurtbox` (10 × 10 Pixel, Ebene `player_hurtbox`), `HitFlash`, `MeleeAttack` (sucht auf `enemy_hurtbox`), `Dash`, `Inventory`, `AmmoSelector`, `RangedAttack` (Ziele auf `enemy_hurtbox`), `Energy` (ein `Supply`), `Abilities` mit den Kindern `Haste`, `Invisibility` und `Stun`, dazu seit A2 `SlashEffect` und `HitEffect` (je ein `EffectCue`), seit M8 `Interactor`, seit M9 `Collector`, seit M15 `TalkFacing`, seit M19 `Unlocks`, seit M11 `Equipment` und seit M16 `PlayerProgress` – als letzte Kinder: `Equipment` gibt den anderen Bausteinen die Werte, wenn sie bereit sind, `PlayerProgress` füllt danach Inventar und Ausrüstung aus dem Spielstand.
- Die Figur liest nur Absichten. `PlayerInput` füllt sie aus den Aktionen und aus der Mausposition; später kann eine andere Quelle dasselbe tun.
- Blick und Hieb: Die Figur blickt stufenlos in die Zielrichtung, also zur Maus. Solange `attack_primary` gehalten wird, schlägt sie dorthin. Laufen, Sprinten und Schleichen gehen dabei weiter.
- Zustände: Stehen, Laufen, Sprinten, Schleichen, Dash. Schleichen geht vor Sprinten. Sprinten kostet Ausdauer; ohne Vorrat läuft die Figur normal.
- Dash: Ein Druck auf `dash` schnellt die Figur 64 Pixel weit – in Laufrichtung, im Stehen in Blickrichtung. Solange er läuft, lenkt sie nicht, verbraucht keine Ausdauer und beginnt keinen Hieb; ein laufender Hieb geht weiter. Danach läuft sie höchstens mit Lauftempo weiter. Halten der Taste löst keinen zweiten Dash aus.
- Fernkampf: Solange `attack_secondary` gehalten wird, wirft die Figur das gewählte Geschoss in Zielrichtung; jeder Wurf nimmt eins aus dem Inventar, die Pause hängt am Geschoss. Das Mausrad wechselt das Geschoss. Laufen geht dabei weiter; während des Dashs fällt kein Schuss.
- Fähigkeiten: Ein Druck auf `ability_1`, `ability_2` oder `ability_3` setzt das erste, zweite oder dritte Kind von `Abilities` ein. Das geht jederzeit, auch im Dash. Die Figur selbst kennt keine einzelne Fähigkeit; sie bietet nur `speed_factor` an, den die Schnelligkeit setzt.
- Freischaltungen (M19): Vor Dash, Schuss, Schleichen und jeder Fähigkeit fragt die Figur ihr Kind `Unlocks`; ist es gesperrt, bleibt die Absicht ohne Wirkung. `is_sneaking()` gilt nur, wenn Schleichen frei ist.
- Energie: Fähigkeiten bezahlen aus `Energy`. Der Vorrat füllt sich nur durch Schwerttreffer, über `MeleeAttack`.
- Interaktion (M8): Ein Druck auf `interact` (E) bedient das nächste bedienbare Ding im Suchkreis des `Interactor`, 16 Pixel um die Mitte. Solange es eins gibt, steht die Taste E über dem Kopf der Figur. Das geht jederzeit, auch im Dash.
- Aufsammeln (M9): Läuft die Figur über Beute, nimmt ihr `Collector` so viel ins Inventar, wie hineinpasst; dafür gibt es keine Taste.
- Ausrüstung (M11): Was sie angelegt hat, verwaltet `Equipment`; beim Start ist es das Katana. Ist ein Menü der Figur offen, meldet `PlayerInput` keine Absichten: Sie bleibt stehen. Seit M15 zählt `PlayerInput` die offenen Menüs, und nach dem Schließen zählen gehaltene Maustasten erst nach dem Loslassen wieder.
- Blick im Gespräch (M15, Nachbesserung): Hat die Figur ein Blickziel `look_target`, blickt sie dorthin statt in die Zielrichtung. Im Gespräch setzt es ihr Kind `TalkFacing` auf den NPC; danach ist es wieder leer.
- Schleichen für Gegner (M13): `is_sneaking()` ist wahr, solange die Taste Strg gehalten wird – im Laufen und im Stehen, nicht beim Dash. Gegner hören die Figur dann nicht und sehen sie nur halb so weit.
- Tod: Fällt das Leben auf 0, bleibt die Figur stehen, zeigt das Tod-Bild (der Platzhalter wird grau) und sendet `player_died`. Was dann geschieht, entscheidet das Level; sie erwacht seit M16 nach einer Sekunde am Rückkehrpunkt, seit M18 lädt dafür der `SceneManager` das Level mit Überblendung neu.
- Spielstand (M16): Inventar und Ausrüstung holt `PlayerProgress` beim Erscheinen aus `GameState` – nach dem Tod, nach F2 und beim nächsten Start –, danach ist das Leben voll; die Energie ist ohnehin voll. Jede Änderung legt er zurück.
- Einstellbar: `stats` (Werte-Datei), `player_id`, `defeated_color`. Ohne `PlayerInput` bleibt sie stehen, ohne `Stamina` sprintet sie unbegrenzt, ohne `Health` nimmt sie keinen Schaden, ohne `Hurtbox` ist sie nicht zu treffen, ohne `MeleeAttack` schlägt sie nicht zu, ohne `Dash` dasht sie nicht, ohne `RangedAttack` schießt sie nicht, ohne `Inventory` hat sie nichts zu werfen, ohne `AmmoSelector` schießt sie wie vor M11a mit `bow.tres` kostenlos, ohne `Abilities` hat sie keine Fähigkeiten, ohne `Energy` kosten Fähigkeiten nichts, ohne `CharacterView` zeigt sie den Platzhalter, ohne `SlashEffect` oder `HitEffect` fehlt nur dieser Effekt, ohne `Interactor` bedient sie nichts mit E, ohne `Collector` läuft sie über Beute hinweg, ohne `TalkFacing` behält sie im Gespräch ihre Blickrichtung, ohne `Equipment` kämpft sie mit ihren Grundwerten, ohne `PlayerProgress` beginnt sie jedes Mal mit dem Startinhalt, ohne `Unlocks` ist alles frei.
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
- Rückkehrpunkt (M16): Ist in `GameState` ein Zeitanker dieses Levels Rückkehrpunkt, setzt er die Figuren vor ihn – `get_spawn_position(nummer, anzahl)` des Ankers: 16 Pixel unter seiner Mitte, mehrere je 16 Pixel nebeneinander. Fehlt der Anker, gilt der Startpunkt, mit Warnung im Ausgabefenster.
- Seit M18 sind die Startpunkte eines Levels die Kinder `Spawn1` und `Spawn2` seiner Zeitkapsel, links vor ihrer Tür. Ohne Zeitkapsel und ohne Startpunkte erscheinen die Figuren am Ort des Spawners – in der Testkammer bei (240, 136); im `LevelFrame` steht er am Ursprung des Levels, ein Level mit Frame braucht also eine Zeitkapsel oder einen eigenen Startpunkt.

**Kamera im Einzelnen**

- `PlayerCamera` ist eine `Camera2D`, die nach allen Figuren rechnet. Sie sucht in der Gruppe `players` die Figur mit `follow_player_id`.
- Bildmitte = Ort der Figur + Versatz, beide auf das Pixelraster des Bildes gerundet – bei Zoom 2 auf halbe Pixel der Grafik (M13). Der Versatz zeigt ein Stück zur Maus und in Laufrichtung und gleitet seinem Ziel nach; der Weg zur Maus zählt in Pixeln der Welt.
- Zoom (M13): aus `view`, also `data/world/view.tres`, in jedem Physik-Schritt neu gelesen; F3 in der Testkammer wirkt sofort. Die Raumgrenzen rechnet sie mit dem Zoom.
- Die Grenzen kommen über `camera_bounds_changed`; ist der Raum kleiner als das Bild, steht er mittig.
- Räume (M18): Meldet der `RoomWatcher` mit `room_changed` einen Raum ihrer Figur, gelten seine Grenzen statt der des Levels. Den ersten Raum nach dem Laden nimmt sie sofort; bei jedem Wechsel gleitet sie in `room_glide_time` (0,35 s) weich von ihrem Ort in die neuen Grenzen.
- Seit M20, Wunsch des Nutzers vom 22.11.2026: `mode` in der Werte-Datei sagt, wie sie an Rändern folgt. FREE, der Standard: immer auf der Figur, ohne Halt an Raum- und Levelrändern, ohne Gleiten beim Raumwechsel. LEVEL: in den Grenzen des Levels wie bis M17. ROOM: im Raum der Figur mit Gleiten wie in M18. Grenzen und Räume merkt sie sich immer, `mode` lässt sich also auch im Spiel umstellen.
- Hintergrund (M20): Beim Start stellt sie `outside_color` als Farbe hinter allem ein (`RenderingServer.set_default_clear_color`); sie ist außerhalb des Levels zu sehen, wenn sie frei folgt.
- Einstellbar: `stats` (Werte-Datei), `view` (Ansicht, M13), `follow_player_id`.

**Testkammer im Einzelnen**

- Größe seit M3: 960 × 544 Pixel, also 60 × 34 Kacheln. Freie Fläche innen: x 16 bis 944, y 16 bis 528. Seit M18 dazu der Ostraum, 320 × 192 ab (960, 176).
- Wurzel `TestChamber` malt Boden, Raster und Kreuze an den Startpunkten und meldet Grenzen und Raumzeit – seit M18 umfassen die Grenzen alle Räume, also 1280 × 544. Auf `player_died` lädt sie nach `death_restart_delay` neu, seit M18 über den `SceneManager`; ohne ihn direkt. Einstellbar: `room_size`, `cell_size`, `show_grid`, `death_restart_delay` (1 s), drei Farben, seit M13 `view` (Ansicht): F3 schaltet ihren Zoom zum Ausprobieren durch und meldet „Zoom“; gespeichert wird dabei nichts. Seit M16 meldet sie sich in `_enter_tree()` als Level `level_id` („test_chamber“) bei `GameState`. F2 und die Test-Tasten liegen seit M18 in `DebugKeys`.
- Räume (M18): Unter `Rooms`, dem ersten Kind, liegen `MainRoom` („Halle“, `main`, 960 × 544 ab (0, 0), ohne eigenen Boden – den malt die Wurzel) und `EastRoom` („Ostraum“, `east`, 320 × 192 ab (960, 176), mit Boden und Raster). Im Ostraum liegen seine Wände `EastWalls` – oben, unten und rechts –, ein Topf `Pot` bei (120, 48) und eine kleine Truhe `ChestSmall` bei (232, 128), beides vom Ursprung des Raums aus; ihre Kennungen im Spielstand sind `Rooms/EastRoom/Pot` und `Rooms/EastRoom/ChestSmall`.
- Freischaltungen (M19): Im Ostraum liegen unten vier Fundstücke, je eine Schriftrolle: `UnlockRanged` (56, 144) Fernkampf, `UnlockDash` (104, 144) Dash, `UnlockStun` (152, 144) Stun und `UnlockInvisibility` (200, 144) Unsichtbarkeit – vom Ursprung des Raums aus; ihre Kennungen im Spielstand sind etwa `Rooms/EastRoom/UnlockDash`. Schleichen bringt der Jäger bei, Schnelligkeit gibt die Mission im Testfeld.
- `Walls` und `Blocks` sind je ein `StaticBody2D` auf Ebene `world`; jede Wand und jeder Block ist eine `CollisionShape2D` mit eigenem Rechteck. Die rechte Wand ist seit M18 zwei Formen, `Right` (y 16 bis 256) und `RightLower` (y 288 bis 528): Dazwischen liegt der Durchgang zum Ostraum, 32 Pixel hoch.
- Blöcke, linke obere Ecke und Größe: `Square` (160, 64) 32 × 32; `Pillar` (352, 64) 16 × 64; `Bar` (96, 192) 64 × 16; `GateTop` (336, 176) und `GateBottom` (336, 224) je 48 × 16 mit 32 Pixeln Durchgang; `BigSquare` (640, 128) 64 × 64; `LongBar` (560, 400) 160 × 16; `PillarB` (848, 240) 16 × 96; `SquareB` (288, 368) 32 × 32; `SquareC` (784, 80) 32 × 32.
- Zeitkapsel (M18): `TimeCapsule`, eine `world/time_capsule/time_capsule.tscn`, bei (240, 152) – wo bis M17 die Startpunkte `SpawnPoints` waren; ihr Bild reicht von (207, 96) bis (273, 160). Die Figur erscheint bei (216, 161), eine zweite bei (232, 169); E wirkt vor der Tür von (212, 154) bis (244, 166).
- Übungspuppen, jeweils die Mitte: `DummyA` bei (440, 72) steht allein; `DummyB` bei (430, 144) und `DummyC` bei (450, 144) bilden ein Paar mit 8 Pixeln Lücke.
- Bewegliches Ziel `DummyD`: eine Übungspuppe ohne Kollisions-Ebene, Start bei (592, 72). Ihr `CharacterView` trägt den Skin `bamboo.tres` (grüner Bambus); der Platzhalter wäre türkis. Ihr Kind `PatrolMover` lässt sie mit Tempo 40 um 96 Pixel nach unten und zurück pendeln; ihr Kind `Stunnable` hält den `PatrolMover` bei einer Betäubung an.
- Schadensfeld `DamageZone`: Mitte bei (240, 240).
- Schadensstreifen `DamageStrip`: 16 × 96 Pixel, Mitte bei (528, 120), rechts neben den Puppen; 10 Schaden, gebaut direkt aus `hitbox.tscn`. Er dient dem Test des Dashs. Sein Kind `Stunnable` schaltet ihn bei einer Betäubung ab.
- Interaktions-Ecke `InteractionCorner` (M8), Ursprung (752, 448): drei Räume nebeneinander, je 48 × 64 Pixel, zusammen x 768 bis 944 und y 464 bis 528; die Wände sind `RoomWalls`, ein `StaticBody2D` auf `world`. In der oberen Wand liegen drei Durchgänge, je 16 Pixel breit. `WoodDoor` bei (792, 456) ist eine Holztür für E. `LeverGate` bei (856, 456) ist ein Gittertor auf dem Kanal `lever_gate`, sein `Lever` steht bei (824, 424). `PlateGate` bei (920, 456) ist ein Gittertor auf `plate_gate`; die `PressurePlate` liegt davor bei (920, 376), die `PressurePlateInside` im Raum bei (920, 504), damit niemand eingesperrt bleibt.
- Feld mit Zerstörbarem `DestructibleField` (M9), Ursprung (72, 328), jeweils die Mitte: `PotA` (72, 328) und `PotB` (120, 328); `CrateA` (168, 328) und `CrateB` (184, 328) Kante an Kante; `RockA` (72, 408) und `RockB` (120, 408); `Tree` mit dem Fuß des Stamms bei (176, 428), das Bild reicht von (160, 400) bis (192, 432).
- Truhen (M10): `ChestSmall` bei (616, 488) und `ChestBig` bei (680, 488), unter dem langen Balken links vor der Interaktions-Ecke. Der Goldschlüssel ist ein von Hand gelegter `Pickup` namens `GoldKey` im linken Raum der Interaktions-Ecke, bei (792, 504).
- Ausrüstung zum Aufsammeln (M11): Unter `StartItems` liegen vier von Hand gelegte `Pickup` – seit M18 `Broadsword` (120, 176), `Bow` (144, 176), `LeatherArmor` (168, 176), `RubyCharm` (192, 176); vorher je 72 Pixel weiter rechts, wo jetzt die Zeitkapsel steht.
- Gegner (M13): `Caveman`, ein `caveman.tscn`, steht bei (776, 224) und patrouilliert mit `patrol_tiles` (0, 8,5), also 136 Pixel, bis (776, 360) – links der große Block, rechts der Pfeiler `PillarB`. Seine `Perception` hat hier `debug_draw` an. Er liegt vor dem `LootSpawner`.
- Fernkämpferin (M14): `StoneThrower`, ein `stone_thrower.tscn`, steht bei (464, 320) und patrouilliert mit `patrol_tiles` (8, 0), also 128 Pixel, bis (592, 320) – in der freien Fläche unten in der Mitte, mit mindestens 5 Kacheln Platz zu jedem Block. Ihre `Perception` hat hier `debug_draw` an. Sie liegt hinter dem Höhlenmenschen und vor dem `LootSpawner`.
- NPCs (M15): `Shaman`, ein `shaman.tscn`, steht bei (312, 120) rechts von der Zeitkapsel; `Hunter`, ein `hunter.tscn`, bei (168, 136) links von ihr. Beide blicken zu Beginn nach unten und liegen hinter der Steinwerferin, vor dem `LootSpawner`.
- Zeitanker (M16): `TimeAnchor` seit M18 bei (112, 120), links vom Jäger – vorher bei (240, 88), wo jetzt die Spitze der Zeitkapsel ist; die Figur erwacht bei (112, 136). Er liegt hinter dem Jäger, vor dem `LootSpawner`; seine Kennung `TimeAnchor` ist gleich geblieben.
- Missionen (M17): `MissionTracker` mit `data/missions/test_chamber.tres`, vor dem `LootSpawner`; an `ChestBig` hängt ein `MissionCue` (Signal `opened`, Ereignis `chest_big_opened`). Die Sammlerin `Gatherer`, eine `gatherer.tscn`, steht bei (232, 420), 56 Pixel rechts vom Fuß des Baums. Die Nische `ExitNiche` mit Gittertor und Luke oben rechts ist seit M18 weg; die Zeitkapsel hört auf den Kanal `missions_done`.
- `RoomWatcher` und `DebugKeys` (M18) liegen hinter der `PlayerCamera`. `DebugKeys`: F2 lädt neu; nur im Debug-Build F4 – Datei löschen, neues Spiel –, Bild auf und Bild ab – derselbe Weg wie an der Zeitkapsel –, Ende – Beenden mit Speichern; dazu die Debug-Zeile „Spielstand“.
- `InventoryWindow` (M11), `Hud` (M12), `MissionPanel` (M17), `DialogWindow` (M15), seit M20b `MapWindow` und seit M20 `PauseMenu` hängen als letzte Kinder in der Kammer; `RoomExplorer` (M20b) steht hinter dem `RoomWatcher`. `DialogWindow` hört Tasten vor dem Inventarfenster und fängt Tab ab, solange ein Gespräch läuft; das `PauseMenu` öffnet erst, wenn Esc sonst niemand gebraucht hat.
- `LootSpawner` (M9) liegt vor dem `PlayerSpawner`; so liegt Beute über dem Zerstörbaren und den Truhen, aber unter der Figur.
- `Rooms`, `TimeCapsule`, die Puppen, `DamageZone`, `DamageStrip`, `InteractionCorner`, `DestructibleField`, `ChestSmall`, `ChestBig`, `StartItems`, `Caveman`, `StoneThrower`, `Shaman`, `Hunter`, `TimeAnchor`, `Gatherer`, `MissionTracker`, `LootSpawner`, `PlayerSpawner`, `ProjectileSpawner`, `PlayerCamera`, `RoomWatcher`, `RoomExplorer`, `DebugKeys`, `Crosshair`, `DebugOverlay`, `InventoryWindow`, `Hud`, `MissionPanel`, `DialogWindow`, `MapWindow` und `PauseMenu` sind eingehängt und lassen sich einzeln löschen.
- `DebugOverlay` blendet hier „Maus“, „Kamera“ und „Raumzeit“ aus, seit M18 auch die Zeilen, die das HUD zeigt, und die der NPCs, seit M19 auch „S1 Geschoss“ – siehe „Debug-Werte, die Module melden“.
- F2 und der Tod einer Figur laden die Szene neu, seit M16 nach einer Bitte ums Speichern; der Fortschritt bleibt. Seit M18 über den `SceneManager`, mit Überblendung.

**Inventar im Einzelnen (M11a)**

- Gegenstände sind Werte-Dateien in `data/items/` mit `id`, Name, Art (Waffen, Rüstung, Verbrauchbares, Schlüssel, Materialien – die Geschosse zählen zu Verbrauchbares), Symbol und Stapelgröße. Zwei Einträge mit derselben `id` gelten als derselbe Gegenstand.
- Neues füllt erst angefangene Stapel derselben Sorte, dann freie Plätze. Entnommen wird vom hintersten Stapel; ein leerer Platz wird frei.
- Die Reihenfolge der Geschosse beim Wechseln ist die der Plätze; der Startinhalt legt sie fest: Pfeil, Kunai, Shuriken, Dynamit.
- Seit M9 gibt es die ersten Materialien: Ast und Stein. Aufgesammelt wird seit M9 über den `Collector`.
- Seit M10 gibt es den ersten Schlüssel: den Goldschlüssel. Eine Truhe nimmt ihn mit `remove()` aus dem Inventar der Figur, die E drückt.
- Seit M11 gibt es das Inventarfenster (Tab) und die Ausrüstung. Angelegtes liegt nicht im Inventar.
- Seit M16 merkt `PlayerProgress` Inhalt und Angelegtes im Spielstand: je Gegenstand der Pfad seiner Werte-Datei – ein Gegenstand braucht deshalb eine eigene Datei in `data/items/`.

**Figuren-Bild im Einzelnen (A1)**

- `CharacterView` baut beim Start aus dem Skin die Animationen für alle vier Richtungen, etwa `walk_left`. Die Richtungen folgen der Reihenfolge des Pakets: unten, oben, links, rechts.
- Eine Animation im Skin nennt ihr Blatt, die Zelle des ersten Bildes für „unten“, den Schritt zum nächsten Bild, den Schritt zur nächsten Richtung, die Zahl der Bilder, Bilder je Sekunde und ob sie sich wiederholt. Die Zellgröße gilt für den ganzen Skin.
- Was gezeigt wird, in dieser Rangfolge: Tod, Dash, das letzte einmalige Bild (Hieb, seit M14 Wurf, oder Treffer), Laufen ab 10 Pixeln pro Sekunde, Stehen.
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
- Spielstand (M16): Hebel und Holztür merken ihre Stellung über ihr Kind `Persistent`; Tore mit Kanal folgen nach dem Laden wieder ihren Schaltern, Druckplatten merken sich nichts.

**Zerstörbares und Beute im Einzelnen (M9)**

- `Destructible` ist ein `StaticBody2D` auf `enemy`. Leben und Treffer kommen von den Bausteinen `Health` und `Hurtbox`; die Hurtbox liegt auf `enemy_hurtbox` und füllt keine Energie. Bei 0 Leben schaltet es die Hurtbox ab, meldet `state_changed(true)` und zeigt über `PropView` das Bild für „an“: Topf, Kiste und Stein nichts, der Baum seinen Stumpf. Ohne Rest wird auch die Körperform abgeschaltet; mit `leaves_remains` bleibt sie und wechselt auf `remains_layer` (Standard `world`).
- Formen, jeweils Körper und Hurtbox: Topf 12 × 10 (2 Pixel tiefer) und 14 × 14; Kiste 14 × 12 und 14 × 14; Stein 14 × 12 und 14 × 14, nimmt nur Explosionen (`accepted_kinds` 4); Baum 22 × 8 am Fuß des Stamms und 24 × 24 über Stamm und Krone.
- Der Baum hat drei `DebrisCue`: `Debris` mit Blättern beim Fällen, in der Krone; `WoodDebris` mit Holzsplittern am Stamm; `LeafHit` mit drei Blättern bei jedem Treffer.
- Splitter sind `CPUParticles2D`: Ein Streifen aus `FX/Particle/` zählt als Bilder nebeneinander, jeder Splitter zeigt eins davon fest. Sie springen hoch, fallen, drehen sich, verblassen ab 60 % ihrer Zeit und zeichnen auf Ebene 40 – über den Figuren, unter den Effekten.
- Beute: `LootDropper` würfelt bei `died` die Liste aus `data/loot/` und bestellt jeden Treffer über `loot_requested`. Der `LootSpawner` erledigt Bestellungen im nächsten Physik-Schritt: je Gegenstand ein `Pickup`, der in 0,35 s von der Mitte des Dings auf einen Platz 10 bis 18 Pixel entfernt springt, 10 Pixel hoch. Der Platz liegt zwischen −20° und 200°, also zur Seite oder nach vorn; er ist frei von Körpern auf `world` und `enemy` und ohne solche dazwischen. Mehrere Gegenstände vom selben Ort verteilen sich im goldenen Schnitt. Findet sich in 12 Versuchen nichts, landet die Beute in der Mitte.
- `Pickup`: `Area2D` auf `pickup`, Kreis 6 Pixel. Zeigt das Symbol des Gegenstands, darunter einen Schatten, bei mehr als einem Stück die Zahl; am Boden wippt es um 1 Pixel. Erst nach dem Sprung lässt es sich aufsammeln. `take(anzahl)` nimmt weg; leer verschwindet es. Von Hand ins Level gelegt, liegt es gleich bereit; seit M16 merkt es sich über `Persistent`, wie viel noch daliegt. Beute aus dem `LootSpawner` merkt sich nichts und ist nach F2, Tod und Laden weg. Zerstörbares merkt sich über `Persistent`, dass es zerstört ist, und steht danach ohne Beute und Splitter als Rest da.
- Mehrspieler: Gewürfelt wird nur im `LootDropper`, erzeugt nur im `LootSpawner`, über den Inhalt entscheidet nur das Inventar – später jeweils der Gastgeber. Splitter und Funken zeigt jeder Rechner selbst.

**Truhen im Einzelnen (M10)**

- `Chest` ist ein `StaticBody2D` auf `world`. E kommt über ihr `Interactable`; `open(actor)` ist die einzige Stelle, die entscheidet, ob sie aufgeht. Mit `required_key` braucht sie diesen Gegenstand: Sie sucht beim `actor` das Kind `Inventory` und nimmt mit `remove()` einen heraus. Fehlt er, meldet sie `locked`, wackelt `shake_time` lang um `shake_distance` Pixel (0,3 s, 2 Pixel) und zeigt `hint_time` lang (1 s) das Symbol des Schlüssels über sich – das Kind `LockHint`, Ebene 100.
- Geht sie auf, wird `is_on` wahr, `PropView` zeigt das offene Bild, ihr `Interactable` schaltet ab, und sie meldet `state_changed(true)` und `opened(actor)`. Auf `opened` hören `LootDropper` (Beute-Liste) und `OpenEffect` (Funkeln aus `data/effects/chest_sparkle.tres`, bleibt am Ort).
- `start_open` stellt sie offen hin, ohne Beute. Seit M16 merkt ihr Kind `Persistent`, dass sie offen ist; nach F2, Tod und Laden steht sie offen da wie mit `start_open`.
- Mehrspieler: Ob eine Truhe aufgeht, entscheidet nur `open()`, über das Inventar nur `remove()` – später jeweils beim Gastgeber.

**Inventarfenster und Ausrüstung im Einzelnen (M11)**

- Das Fenster sucht beim Öffnen in der Gruppe `players` die Figur mit seiner `player_id` und hört dann auf ihr `Inventory` und ihr `Equipment`. Es baut so viele Zellen, wie das Inventar Plätze hat, fünf je Zeile; mehr als 20 Plätze passen noch nicht in den Rahmen.
- Zelle: `Panel` mit der Variante `InventoryCell` (Bild `inventory_cell.png`), darin `Icon` (`TextureRect`, Bild in Originalgröße, mittig), `Count` (`Label`, Variante `CountLabel`, weiß mit dunklem Rand, ab 2 Stück) und `Focus` (Variante `InventoryFocus`, der Rahmen `nine_path_focus.png`, nur wenn gewählt).
- Bedienung: Linksklick wählt, Doppelklick legt an (Raster) oder ab (Ausrüstungsplatz). Geht das nicht, steht unten „Kein Platz im Inventar“. Tab und Esc fängt das Fenster in `_input` ab, vor der übrigen Oberfläche.
- Unten drei Zeilen: Name; Art und Werte – bei Ausrüstung der Platz und `describe()`, bei Geschossen der Schaden, sonst die Art; dazu ein Hinweis oder die Anzahl.
- Holz-Thema `ui/theme/wood_theme.tres`: Schrift `NormalFont` 9; `PanelContainer` mit dem orangen Rahmen `nine_path_panel.png` (Ränder 6, 6, 5, 5), `Panel` mit dem braunen Inneren `nine_path_panel_interior.png`; Varianten `InventoryCell`, `InventoryFocus`, `TitleLabel` und `HintLabel` (hellorange), `CountLabel`; dazu Knöpfe aus `button_*.png` für spätere Fenster. Es ist der erste Teil von A5.
- `Equipment` gibt nach jeder Änderung alles weiter: die Waffe an `MeleeAttack.set_stats()`, die Summe der Fernkampf-Boni an `RangedAttack.damage_bonus`, die Summe der Rüstung an `Health.armor`, die Summe der Leben an `Health.set_bonus_maximum()`. So kann später auch ein Gegenstand mehreres zugleich können.
- Mehrspieler: Über Angelegtes entscheidet nur `Equipment`, über den Inhalt nur das Inventar; das Fenster fragt nur an. Jede Figur hat ihr eigenes Fenster über ihre `player_id`.

**Gegner im Einzelnen (M13)**

- `entities/enemies/enemy.tscn` ist die Grundszene: `CharacterBody2D` im schwebenden Modus, Ebene `enemy`, Maske `world`, `player` und `enemy`, Körper 12 × 12. Kinder in dieser Reihenfolge: `CollisionShape2D`, `Perception`, `PlaceholderView` (rot), `CharacterView`, `Health`, `Hurtbox` (12 × 14, Ebene `enemy_hurtbox`), `HitFlash`, `DamageNumbers`, `Stunnable`, `LootDropper`, `LifeBar` (14 Pixel über der Mitte), die Effekte `HitEffect`, `DeathEffect` (Rauch), `AlertEmote` („!“) und `SearchEmote` („?“), seit M14 `Attacks` – in der Grundszene leer – und zuletzt `Brain`. Die Waffe hängt seit M14 der Gegnertyp hinten an: beim Nahkämpfer `MeleeAttack` (sucht auf `player_hurtbox`, ohne Energie) und `ClawEffect` (Kralle beim Schlag, 6 Pixel vor), beim Fernkämpfer `RangedAttack`.
- `Brain` ist ein `StateMachine` mit acht Zuständen in `entities/enemies/states/`, je ein Knoten: `Patrol` (Patrouille), `Alert` (Entdeckt), `Chase` (Verfolgen), `Attack` (Angriff), `Search` (Suchen), `Return` (Zurück), `Stunned` (Betäubt), `Dead` (Tot). Alle erben von `EnemyState` und steuern den Gegner nur über `move_to()`, `move_away_from()`, `stop()`, `face()`, `look_for_target()` und `choose_attack()`.
- Ablauf: Patrol → bemerkt → Alert (0,4 s, „!“) → Chase → ein Angriff ist bereit und trifft von hier: Attack, sofort → nach der Pause wieder Chase. Verloren (1,5 s oder unsichtbar) → Search („?“, zur letzten Stelle, viermal umschauen) → Return → Patrol. Unterwegs bemerkt er die Figur wieder → Alert. Ist in Chase eine andere Figur näher, nimmt er die.
- Bemerken (`Perception`): ahnungslos nur im Kegel von 100° bis 6 Kacheln, als Verfolger rundum bis 10 Kacheln, immer mit freier Sicht; Hören 2,5 Kacheln, wenn sich die Figur bewegt und nicht schleicht; Schleichen halbiert die Sicht. Alles nur innerhalb der fairen Grenze: auf dem Bild der Figur, 1 Kachel vom Rand – bei Zoom 2 höchstens 6,5 Kacheln zur Seite und gut 3 nach oben und unten.
- Angriff, seit M14 über das Angriffs-Modul `Attacks/Melee`: Er schlägt zu, sobald die Figur so nah ist, wie seine Faust reicht – das Modul fragt `reach_distance()` von `MeleeAttack`, beim Höhlenmenschen 18 Pixel –, sofort und ohne Ausholen: Faust-Bild, Krallen und Treffer kommen im selben Physik-Schritt. Dann `recover_time` 0,6 s Pause aus `caveman_attack.tres`; der nächste Schlag frühestens nach `cooldown` 0,8 s – bis dahin wartet er („Abwarten“). Rot färbt ihn nichts; bei Schaden blitzt er hell auf (`HitFlash`).
- Überraschung: In Patrol, Search und Return gilt er als ahnungslos; dann setzt er `damage_factor` seines `Health` auf `surprise_factor` (2). Wird er so getroffen, dreht er sich zum Angreifer: Bemerkt er ihn jetzt, folgt Alert, sonst Search 2 Kacheln in Richtung Angreifer. Bemerkt er die Figur, gilt wieder Faktor 1.
- Stun: `Stunnable` meldet `stunned` → Stunned. Bei `recovered` folgt Chase, wenn er die Figur kannte, sonst Search an seinem Ort.
- Tod: Dead; Körper und Trefferzone werden abgeschaltet, er tritt aus der Gruppe `stunnable` aus, `CharacterView` zeigt das Tod-Bild, Rauch steigt auf, `LootDropper` bestellt die Beute; nach `remove_delay` verschwindet er.
- Debug: Zustand und Leben gehen seit M14 in einer Zeile an die Debug-Anzeige, mit dem Namen des Knotens vorn, etwa „Caveman: Verfolgen · Leben 30/30“; nach dem Tod verschwindet die Zeile.
- Kommt er auf dem Rückweg 1,5 s nicht voran, weil etwas im Weg steht, patrouilliert er von dort aus. Wege um Hindernisse herum kommen mit den Kacheln (A4).
- Ein neuer Gegner gleicher Art: im Editor „Neue geerbte Szene“ aus seinem Gegnertyp – `melee_enemy.tscn` oder `ranged_enemy.tscn` –, dann Skin, Werte-Dateien, Waffe, Angriffs-Modul und Beute wählen – so sind `caveman.tscn` und `stone_thrower.tscn` gebaut. Ins Level: die Szene instanzieren und `patrol_tiles` setzen, in Kacheln; (0, 0), der Standard, heißt: Er steht und wacht.
- Mehrspieler: Der Gegner sucht immer den nächsten Spieler, den er bemerken kann. Über Schaden entscheidet `Health`, über Beute der `LootDropper`, hingelegt vom `LootSpawner`; später entscheidet das der Gastgeber, und der Zustandsautomat läuft nur dort.

**Gegnertypen im Einzelnen (M14)**

- Drei Stufen geerbter Szenen: `enemy.tscn` – alles außer dem Angriff – → Gegnertyp – `melee_enemy.tscn`, `ranged_enemy.tscn`: Waffe und Angriffs-Modul – → fertiger Gegner – `caveman.tscn`, `stone_thrower.tscn`: Skin, Werte, Beute. Ins Level kommen nur fertige Gegner; die Gegnertypen haben weder Werte noch Bild.
- Angriffs-Module: jedes Kind von `Attacks` mit einem Skript, das von `EnemyAttack` erbt. Es löst eine Waffe neben dem Gegner aus – `weapon_name`, beim Nahkämpfer `MeleeAttack`, beim Fernkämpfer `RangedAttack` – und sagt, wann der Angriff passt: `is_ready()` (die Waffe ist nicht in ihrer Pause), `can_hit(ziel)` (Abstand bis `max_distance()`, auf Wunsch mit freier Sicht), `min_distance()`. Werte in einer `EnemyAttackStats`: `min_tiles`, `max_tiles` (0: so weit die Waffe reicht; mehr geht nicht), `needs_line_of_sight`, `recover_time`. Mit `enabled` aus zählt ein Modul nicht. Beginnt ein Angriff, meldet das Modul `started(richtung)`.
- Rangfolge: die Reihenfolge unter `Attacks`. Der erste Angriff bestimmt in Chase den Abstand: zu weit weg oder ohne freie Sicht – Verfolgen; näher als `min_distance()` – Zurückweichen mit `retreat_speed`, den Blick auf der Figur; dazwischen – Abwarten. In jedem Physik-Schritt prüft Chase alle Angriffe der Reihe nach; der erste, der bereit ist und trifft, führt nach Attack.
- Attack: Der Gegner dreht sich zur Figur und startet den Angriff sofort. Solange er läuft, steuert ihn das Modul über `update()` – Standard: Er steht still. Danach `recover_time` Pause, dann Chase.
- Fernkampf: `EnemyRangedAttack` wirft nur mit `ProjectileSpawner` im Level, höchstens so weit wie `spawn_distance` + `max_distance` des Geschosses. Das Geschoss sucht auf `player_hurtbox` (Maske 8) – Gegner und Puppen trifft es nicht. Bezahlt wird nichts: `supply_name` und `ammo_name` der Waffe sind leer.
- Bild: `CharacterView` zeigt beim Wurf die Animation `shoot`, wenn der Skin eine hat; die Steinwerferin nimmt dafür ihr Bild aus `Attack.png`. Die Spielfigur hat keine und sieht beim Werfen aus wie bisher.
- Ein neuer Gegnertyp, jeweils ohne bestehenden Code zu ändern:
    1. Gleicher Angriff, anderer Gegner: „Neue geerbte Szene“ aus `melee_enemy.tscn` oder `ranged_enemy.tscn`; Skin, Werte, Beute.
    2. Neue Mischung: „Neue geerbte Szene“ aus `enemy.tscn`, Waffen anhängen (`melee_attack.tscn`, `ranged_attack.tscn`) und unter `Attacks` je Waffe ein Modul. Beispiel: erst `Ranged`, dann `Melee` – der Gegner hält Abstand, wirft, und schlägt zu, wenn die Figur nah ist und der Wurf noch Pause hat.
    3. Neuer Angriff: ein Skript, das von `EnemyAttack` erbt und `_weapon_ready()`, `_weapon_reach()` und `_trigger()` füllt, bei längeren Angriffen auch `is_busy()` und `update()` – dazu die Waffe als Baustein, etwa für einen Ansturm oder einen Flächenschlag.
    4. Anderes Verhalten: in der Szene des Gegnertyps einen Zustand unter `Brain` ergänzen oder einem vorhandenen ein anderes Skript geben, das von `EnemyState` erbt.
- Mehrspieler: Angriffe zielen auf den nächsten Spieler, den der Gegner bemerkt; Geschosse entstehen nur im `ProjectileSpawner`, über Schaden entscheidet `Health`.

**NPCs und Dialog im Einzelnen (M15)**

- Ablauf: E an einem NPC → `Interactable.interacted` → `Npc` bittet über `dialog_requested` das Dialogfenster der Figur mit ihrer `player_id`. Ist es frei, öffnet es sich, meldet `menu_changed` und `dialog_started` und zeigt die erste Zeile. Erst auf `dialog_started` sperrt der NPC sein E, dreht sich zur Figur und blendet die Blase aus. Ohne Dialogfenster im Level schreibt der NPC eine Warnung und bleibt bedienbar.
- Blick: Der NPC dreht sich zur Figur; ihr Baustein `TalkFacing` dreht die Figur zum NPC, solange das Gespräch läuft – sie sehen sich an. Danach blickt die Figur wieder zur Maus (Nachbesserung nach dem Test, 21.11.2026).
- Das Fenster (`ui/dialog/dialog_window.gd`) kennt den Weg durch das Gespräch über einen `DialogRunner` und entscheidet sonst nichts. Jede gezeigte Zeile meldet es über `dialog_line_shown`, am Ende `dialog_finished` und dann `menu_changed`.
- Weg: Ohne Antworten folgt die nächste Zeile der Liste oder das Sprungziel `next`; mit Antworten das Ziel der gewählten Antwort, leer die Zeile nach der Frage. `end` beendet, ein unbekanntes Ziel beendet mit Warnung, leere Einträge werden übersprungen. Nach der letzten Zeile ist das Gespräch zu Ende.
- Tasten, alle in `_input` und vor dem Inventarfenster: `dialog_next` zeigt den Text ganz, sonst geht es weiter – bei einer Frage tut die Taste nichts, ein Klick gehört dann den Kästchen. `dialog_choice_1` bis `3` wählen; läuft der Text noch, zeigen sie ihn erst ganz. `pause` bricht ab. `inventory` fängt es ab. Die Kästchen sind `Button` ohne Fokus; gewählt wird beim Loslassen der Maus.
- Text: `Label` mit Umbruch an Wörtern und höchstens drei Zeilen; die Buchstaben erscheinen über `visible_ratio`, der Umbruch steht von Anfang an fest. Braucht ein Text mehr als drei Zeilen, steht eine Warnung im Ausgabefenster. Ohne Porträt zeigt das Fenster `DialogBox.png`, und der Text beginnt bei x 10 statt 54.
- Thema `ui/dialog/dialog_theme.tres`: Schrift `ui/dialog/dialog_font.tres` – eine `FontVariation` von `NormalFont` mit `spacing_space` 3 –, Größe 9, Zeilenabstand 0; Text dunkel (20, 27, 27), Name weiß; Variante `DialogChoice` mit `ChoiceBox.png` (Ränder 5, Text ab 22 Pixeln) und `DialogFocus` mit `nine_path_focus.png` aus dem Holz-Thema.
- `Npc`: `dialog` und `repeat_dialog`; `current_dialog()`, `has_news()`, `is_talking()`; Signale `talk_started`, `talk_finished`, `reward_given`, seit M16 `progress_changed`. Zeilen mit `reward` gibt er je NPC einmal; seit M16 merkt sein Kind `Persistent`, welche Zeilen schon gegeben haben und ob er erledigt ist: Er würfelt die Liste und bestellt über `loot_requested` mit dem Ort der Figur als Absprung. Mit `marks_done` gilt er als erledigt. Seine Blase zeigt er, solange er nicht erledigt ist und nicht spricht.
- Ein neuer NPC: im Editor „Neue geerbte Szene“ aus `entities/npcs/npc.tscn`, als `entities/npcs/<name>.tscn` speichern, beim Kind `CharacterView` einen Skin wählen und bei der Wurzel `dialog`, auf Wunsch `repeat_dialog` und `start_facing`. Ein Gespräch: eine Datei aus `data/dialogs/` kopieren und im Inspektor die Zeilen bearbeiten; einen Sprecher ebenso aus `data/dialogs/speakers/`.
- Mehrspieler: Ein NPC spricht mit einer Figur zugleich; jede Figur hat ihr Fenster über ihre `player_id`. Über Beute und „erledigt“ entscheidet nur der NPC – später der Gastgeber. „Erledigt“ gilt für den NPC, noch nicht je Spieler.
- Freischaltung (M19): `DialogLine.unlock` – erscheint die Zeile, bittet der NPC `GameState` darum. Der Jäger bringt so in seiner dritten Zeile das Schleichen bei; sie trägt jetzt `marks_done`.

**Spielstand im Einzelnen (M16)**

- `GameState` hält den Fortschritt an genau einer Stelle: `portal` (Kapselstand, bis 22.11.2026 „Portalstand“), `level` (Levelstand, leer ohne Lauf), `current_level` (Level des Laufs, leer ohne) und `respawn` (Rückkehrpunkt: Level und Zeitanker, leer heißt Landepunkt). `active()` liefert im Lauf den Levelstand, sonst den Kapselstand. Ein Stand ist ein Dictionary mit `players` (je `player_id` als Text: `inventory`, `equipment`), `objects` (je Level und Pfad ein kleiner Eintrag) und `completed` (abgeschlossene Level).
- Ein Level meldet sich in `_enter_tree()` mit `enter_level(level_id)`: Läuft dort schon ein Lauf, geht er weiter, sonst beginnt einer – `begin_level()`: Levelstand = Kopie des Kapselstands, Rückkehrpunkt = Landepunkt. `_enter_tree()`, weil die Dinge der Welt den Stand in ihrem `_ready()` brauchen, und das der Kinder kommt vor dem des Levels.
- Der `SaveManager` lädt die Datei deshalb schon in seinem `_enter_tree()`: Globale Dienste betreten den Baum vor dem ersten Level, ihr `_ready()` kommt aber erst nach dessen `_enter_tree()`. Mit `_ready()` hätte er den Lauf überschrieben – der Prüflauf ohne Fenster hat das gezeigt.
- `complete_level()`: Levelstand → Kapselstand, das Level kommt in `completed`, der Lauf endet, Bitte ums Speichern. `leave_level()`: Levelstand verwerfen, der Lauf endet, Bitte ums Speichern. Bis M17 begann danach in der Testkammer ein neuer Lauf; seit M18 bringt der `SceneManager` alle in die Zeitkapsel – ohne abgeschlossenes Level beginnt nach einem Abbruch das Level von vorn.
- Ohne gemerkte Daten einer Spielfigur gilt der Startinhalt aus `data/player/inventory.tres` und `equipment.tres`; `PlayerProgress` merkt ihn beim ersten Erscheinen im Levelstand. Der Kapselstand eines neuen Spiels ist deshalb leer – das ist derselbe Neubeginn.
- Ein Rückkehrpunkt für das ganze Spiel (`respawn`) statt eines Zeitankers je Level wie im Plan: Es läuft immer nur ein Lauf, und Beginn, Abschluss und Verlassen setzen ihn auf den Landepunkt zurück.
- Datei: `user://saves/slot_1.json`, mit Tabs eingerückt, Schlüssel sortiert: `version` (1), `saved_at`, `reason`, `current_level`, `respawn`, `portal`, `level`. Geschrieben wird erst `slot_1.json.tmp`, dann umbenannt – bricht das Schreiben ab, bleibt der alte Stand. Eine unlesbare Datei wird als `slot_1.bad.json` gesichert, dann beginnt ein neues Spiel.
- Gespeichert wird auf `EventBus.save_requested`: Zeitanker („Rasten“), Testkammer beim Tod („Tod“) und bei F2 („Neustart“), `GameState` bei Abschluss und Verlassen; beim Schließen des Fensters der `SaveManager` selbst („Beenden“) – `set_auto_accept_quit(false)`, auf `NOTIFICATION_WM_CLOSE_REQUEST` erst speichern, dann beenden. `get_tree().quit()` allein speichert nicht.
- Dinge der Welt: je Ding ein Kind `Persistent`; das Ding hat `get_saved_state()` und `apply_saved_state(daten)`. Gemerkt wird: Truhe `{"open": true}`, Zerstörbares `{"destroyed": true}`, von Hand gelegter Pickup `{"amount": rest}`, Hebel `{"on": …}`, Holztür `{"open": …}` – Tore mit Kanal nicht –, NPC `{"done": …, "given": ["shaman_intro#gift"]}`; eine Zeile ohne Namen zählt mit ihrer Nummer. Wiederhergestellt wird ohne Beute, Splitter und Funkeln.
- Kennung eines Dings: `level_id` der Level-Szene – ihres obersten Besitzers –, sonst ihr Dateiname, dazu der Pfad des Dings darin, etwa `InteractionCorner/WoodDoor`. Umbenennen oder Verschieben im Level lässt den gemerkten Zustand verfallen.
- Inventar: je belegtem Platz `{"slot", "item", "count"}`, der Gegenstand als Pfad seiner Werte-Datei; Ausrüstung: je Platz – `weapon`, `ranged`, `armor`, `charm` – der Pfad. Fehlt eine Datei, steht eine Warnung im Ausgabefenster, der Rest lädt.
- Zeitanker: `rest(figur)` füllt `Health` und `Energy` der Figur, setzt `GameState.set_respawn()`, sendet `rested` (Funkeln) und bittet ums Speichern; kommt dabei `game_saved`, steigt „Gespeichert“ 1,2 Sekunden lang 4 Pixel auf und verblasst. Er leuchtet über `respawn_changed`. Seine Kennung ist sein Pfad im Level.
- Abschalten: ohne `SaveManager` alles wie bisher, nur ohne Datei und ohne „Gespeichert“; ohne `GameState` wie vor M16; ohne `Persistent` an einem Ding vergisst es seinen Zustand; ohne `PlayerProgress` Startinhalt; ohne Zeitanker der Startpunkt.
- Mehrspieler: Den Fortschritt führt später der Gastgeber; ein Lauf gilt für alle, jede Figur hat ihr Inventar unter ihrer `player_id`.
- Freischaltungen (M19): Abschnitt `unlocks` in jedem Stand – die Kennungen, die im Spiel frei wurden; was von Anfang an frei ist, steht nicht darin. Ältere Spielstände ohne den Abschnitt beginnen ohne Freischaltungen; das Format bleibt Version 1.
- Erkundete Räume (M20b): Abschnitt `rooms` in jedem Stand, je Level die Kennungen der betretenen Räume in der Reihenfolge, in der sie dazukamen, etwa `{"test_chamber": ["main", "east"]}`. Ältere Spielstände ohne den Abschnitt beginnen ohne erkundete Räume; das Format bleibt Version 1. Die Zeitkapsel innen hat den Raum `capsule` – er steht im Kapselstand unter `time_capsule`.
- Plätze (M20): drei Dateien `slot_1.json` bis `slot_3.json`, Format unverändert Version 1, dazu oben `play_time` – Sekunden, ganz. Der offene Platz ist `active_slot`; 0 heißt keiner. Beim Start öffnet der `SaveManager` in `_enter_tree()` den Platz mit der jüngsten Datei – ohne Dateien Platz 1 –, damit eine direkt gestartete Szene weiterläuft; die Startszene mit dem Hauptmenü schließt ihn wieder. `open_slot()` lädt einen Platz oder beginnt dort ein neues Spiel, `save()` schreibt nur bei offenem Platz – auch das X am Fenster im Hauptmenü schreibt nichts. Eine unlesbare Datei wird beim Öffnen als `slot_<n>.bad.json` gesichert. `get_slot_info()` liest eine Datei, ohne sie zu laden: ob es sie gibt, ob sie lesbar ist, Lauf, abgeschlossene Level – im Lauf aus dem Levelstand –, Spielzeit, letzte Speicherung.

**Missionen im Einzelnen (M17)**

- Idee des Nutzers, geprüft: je Level eine Missionen-Datei (`MissionList`), etwa `data/missions/test_chamber.tres`; jede Mission ist darin ein Eintrag mit Namen (`id`). Gespräche und Spielstand nennen sie über diesen Namen, nicht über einen Dateipfad – ein Spielstand bleibt gültig, wenn die Datei umgebaut wird, solange die Namen bleiben. Missionen ohne Level, etwa in der Zeitkapsel (M18), bekommen eine eigene Datei im selben Format.
- Baupläne in `missions/`: `MissionList`, `MissionData`, `MissionObjective` mit den Arten `EventObjective` und `ItemObjective`. Eine neue Art von Ziel – etwa „Ort erreichen“ – erbt von `MissionObjective` und beantwortet `counts_event()` oder `get_item()`. `check()` findet doppelte oder leere Namen, Missionen ohne Titel oder Ziele, Ziele ohne Text, Ereignis oder Gegenstand und Zeichen, die `NormalFont` nicht kennt; der `MissionTracker` schreibt das beim Start ins Ausgabefenster.
- `MissionTracker` (`missions/mission_tracker.tscn`) ist die eine Stelle für Missionen im Level, wie der `LootSpawner` für Beute. Er beginnt einen Augenblick nach dem Start, wenn Anzeige, Auftraggeber und Tore zuhören: Zuerst meldet er den Stand aus dem Spielstand, dann zählt er die Gegenstände neu, dann beginnen die Missionen mit `starts_with_level`, die noch nicht angenommen sind.
- Stände: nicht angenommen – kein Eintrag –, `active` (läuft), `ready` (alle Ziele erfüllt, wartet auf die Abgabe), `done` (erfüllt). Ohne Abgabe ist eine Mission erfüllt, sobald alle Ziele erfüllt sind; mit `hand_in` wird sie bereit und fällt zurück auf „läuft“, wenn Gegenstände wieder fehlen.
- Ereignis-Ziele zählen `mission_event` – nur bei laufenden Missionen, höchstens bis `count`. Gegenstand-Ziele zählen bei jeder Änderung eines Inventars neu, was die Figur mit den meisten davon trägt; abgeben kann nur, wer alles trägt. Der Tracker hört auf `changed` am `Inventory` jeder Figur der Gruppe `players`, auch wenn sie erst später erscheint.
- Starten und Abgeben: Erscheint eine Gesprächszeile mit `start_mission` oder `hand_in_mission`, meldet der NPC `mission_start_requested` oder `mission_hand_in_requested`; der Tracker entscheidet. Bei der Abgabe ist die Mission zuerst erfüllt, dann nimmt er die Gegenstände aus dem Inventar der Figur – so fällt sie dabei nicht auf „läuft“ zurück –, dann bestellt er die Belohnung über `loot_requested` am Ort der Figur. Ohne Abgabe springt sie vor die Figur mit der kleinsten Nummer.
- Jeder Wechsel geht zuerst in `GameState` (`set_mission_state`), dann kommt `mission_changed`, dann die ganze Liste für die Anzeige (`mission_list_changed`) – seit M20b je Mission auch mit `description` für das Missionsfenster –, je Ziel mit `text`, `current`, `count` und `done`. Die Liste geht nur hinaus, wenn sie sich geändert hat.
- Weg aus dem Level: Sind alle Pflichtmissionen erfüllt, meldet der Tracker `switch_changed` auf seinem Kanal `unlock_channel` (`missions_done`) als an – wie ein Hebel. Beim Start meldet er den Stand einmal, damit ein Tor ihn auch nach dem Laden kennt. Ohne Pflichtmissionen ist der Weg von Anfang an frei. Seit M18 hört die Zeitkapsel im Level auf diesen Kanal und ist dann bereit zur Rückreise.
- Spielstand: im Abschnitt `missions` je Level und Mission `{"state": …, "progress": [Zahl je Ziel]}`; bei Gegenstand-Zielen steht dort der zuletzt gezählte Stand, gerechnet wird mit dem Inventar. Beim Laden fallen unbekannte Stände weg, Zahlen werden auf 0 bis `count` begrenzt. Ein Spielstand aus M16 ohne den Abschnitt lädt; die Missionen beginnen dann neu. Tod, F2 und Beenden behalten die Missionen, „Level verlassen“ verwirft sie, der Abschluss bringt sie in die Zeitkapsel – bei einer Rückkehr ins Level sind sie erfüllt und das Tor ist offen.
- `MissionCue` hängt im Höhlenmenschen (`caveman_defeated`) und in der Testkammer an `ChestBig` (Signal `opened`, `chest_big_opened`). Eine Truhe, die aus dem Spielstand offen dasteht, meldet nichts – deshalb im Test zuerst F4.
- Auftraggeber `QuestGiver`: `mission_id` und vier Gespräche – `offer_dialog`, `waiting_dialog`, `ready_dialog`, `done_dialog`. Er liest den Stand seiner Mission in `GameState` und wählt danach; ohne `GameState` folgt er den Meldungen. Fehlt ein Gespräch, spricht er wie ein gewöhnlicher NPC. `Npc` hat dafür `get_dialogs()` – alle Gespräche für den Spielstand, der Auftraggeber ergänzt seine –, und die Warnung „kein Gespräch gesetzt“ fragt jetzt `current_dialog()`.
- Die Sammlerin heißt im Code `gatherer`, weil `Collector` schon der Baustein zum Aufsammeln ist: `entities/npcs/gatherer.tscn` erbt von `npc.tscn` und trägt das Skript `quest_giver.gd`.
- Anzeige `ui/missions/mission_panel.tscn`, ein `CanvasLayer` auf Ebene 90 wie das HUD. Liste bei (4, 40) unter den Herzen: nur laufende und bereite Missionen, Pflicht zuerst – orange, Neben weiß –, je Mission der Titel und darunter die Ziele mit Kästchen und „Stand/Zahl“; mehr als `max_missions` – „+1 weitere“; keine – „Keine offenen Missionen“. Ohne Meldung eines Trackers bleibt sie unsichtbar. Thema `ui/missions/mission_theme.tres`: `NormalFont` 9 mit 3 Pixeln mehr Wortabstand (`mission_font.tres`), Grund `nine_path_bg_2.png` zu 75 % deckend, Kästchen `checked.png` und `unchecked.png` auf 14 × 14 beschnitten.
- Ein- und Ausklappen: J (`mission_toggle`) oder ein Linksklick auf die Überschrift. Der Zustand ist eine statische Variable (`collapsed`) und überlebt das Neuladen des Raums; seit M20 steht er auch in den Optionen (`user://options.cfg`) und gilt so nach einem Neustart weiter. Ausgeklappt reicht die Überschrift über die ganze Breite der Liste.
- Hinweise: Die Anzeige vergleicht jede Liste mit der vorigen – „Neue Mission“, wenn eine angenommen wurde, „Mission erfüllt“, wenn eine erfüllt ist; die erste Liste nach dem Betreten ist nur der Ausgang. Je Hinweis 2,5 Sekunden mit Ein- und Ausblenden, mehrere nacheinander, oben in der Mitte im Holz-Rahmen.
- Klick ohne Schlag: Nur die Überschrift nimmt Klicks an (`mouse_filter` „Stop“). `PlayerInput` fragt `get_viewport().gui_get_hovered_control()`: Liegt die Maus auf einem Bedienelement mit „Stop“, greift die Figur nicht an und schießt nicht, bis die Taste wieder los ist. Der Rest der Anzeige lässt die Maus durch.
- Belohnung mit Freischaltung (M19): `reward_unlocks` an der Mission, etwa `haste`; beim Erfüllen bittet der Tracker `GameState` darum (`unlock_requested`). Die Mission „Die drei Töpfe“ im Testfeld schaltet so Schnelligkeit frei.
- Hinweise oben in der Mitte für alle Module (M19): Die Anzeige zeigt auch, was andere mit `notice_requested` melden, etwa „Neu freigeschaltet“; diese Hinweise reihen sich hinter die der Missionen.
- Ausgang `LevelExit`: ein `Node2D` mit `PropView` und `Interactable`; E meldet `level_exit_requested` mit der Nummer der Figur, seit M18 schließt dann der `SceneManager` das Level ab. Die Figur läuft über die Luke hinweg. Seit M18 steht er nicht mehr in der Testkammer und bleibt als Baustein für Level ohne Zeitkapsel.
- Mehrspieler: Die Missionen gelten für alle Figuren eines Laufs; entscheiden tut der Tracker, später der Gastgeber. Missionen je Spieler sind offen.
- Abschalten: ohne `MissionPanel` zählen die Missionen weiter, zu sehen in der Debug-Zeile; ohne `MissionTracker` gibt es keine Missionen, keine Liste, das Tor bleibt zu, die Sammlerin bietet an, aber nichts beginnt; ohne `MissionCue` zählt das Ding nicht; ohne `GameState` gelten die Missionen bis zum Neustart des Raums.
- Eine neue Mission: in der Missionen-Datei des Levels im Inspektor einen Eintrag anlegen – Name, Titel, Pflicht oder nicht, Ziele, Belohnung. Ein neues Ereignis: `components/mission_cue/mission_cue.tscn` an das Ding hängen und `event` wählen. Ein neuer Auftraggeber: „Neue geerbte Szene“ aus `entities/npcs/npc.tscn`, als Skript `quest_giver.gd`, dazu `mission_id` und die vier Gespräche.

**Räume, Levelwechsel und Zeitkapsel im Einzelnen (M18)**

- Startszene `levels/boot/boot.tscn`: ruft `SceneManager.start_game()` auf. Läuft ein Level, geht es dorthin zurück („fortgesetzt“, ohne Landung); ist eins abgeschlossen, in die Zeitkapsel; sonst ins Startlevel mit neuem Lauf. Steht das laufende Level nicht in den Reisedaten, wird der Lauf mit Warnung abgebrochen.
- `SceneManager` (`autoload/scene_manager.gd`): `start_game()`, `new_game()`, `travel_to_level(kennung)`, `travel_to_capsule()`, `reload_level(anlass)`, `is_arrival()`, `is_changing()`, `has_capsule()`. Jeder Wechsel: in `fade_time` (0,25 s) ausblenden, Szene wechseln, einblenden – ein schwarzes `ColorRect` auf einem eigenen `CanvasLayer` (Ebene 120), der Dienst läuft auch bei Pause. Während eines Wechsels nimmt er keinen zweiten an. Er hört auf `level_exit_requested`, `level_leave_requested` und `travel_requested`.
- Abschluss: Ist das Bild schwarz, ruft er `GameState.complete_level()` – Levelstand → Kapselstand, Speichern –, dann geht es in die Zeitkapsel. Abbruch: `GameState.leave_level()`, dann in die Zeitkapsel, wenn ein Level abgeschlossen ist, sonst dasselbe Level mit neuem Lauf. Neues Spiel: `GameState.new_game()`, dann das Startlevel. Weil das erst im Schwarzen geschieht, landet nichts aus den letzten 0,25 s im falschen Stand.
- Reisen gehen aus der Zeitkapsel: Läuft ein Lauf, lehnt `travel_to_level()` mit Warnung ab. Vor der Reise wird gespeichert („Reise“). Neu laden – Tod, F2 – speichert vorher mit dem Anlass.
- Ankunft: Beginnt mit einer Szene ein neuer Lauf – `level_run_changed` mit „begin“, während das Level den Baum betritt –, gilt `is_arrival()`; dann landet die Zeitkapsel. Nach Tod, F2 und Fortsetzen nicht. Debug-Zeile „Ort“ nach jedem Wechsel.
- Reisedaten `data/world/travel.tres` (`TravelSettings` mit `LevelInfo` je Level): der feste Pfad steht im SceneManager. Die Szenen stehen als Pfad, damit nicht alle Level beim Start geladen werden.
- `Level` (`levels/level.gd`): die Wurzel neuer Level. `_enter_tree()` meldet sich bei `GameState` – in der Zeitkapsel nicht (`starts_run` aus; läuft dort doch ein Lauf, etwa weil die Szene direkt gestartet wurde, steht eine Warnung im Ausgabefenster). Meldet in `_ready()` die Grenzen: `level_size` ab seinem Ort und alle Räume. Nach dem Tod `restart("Tod")` über den SceneManager, ohne ihn direkt.
- `LevelFrame` (`levels/level_frame/level_frame.tscn`): alle Knoten, die ein Level braucht, in der Reihenfolge der Testkammer; als letztes Kind ins Level. Den `MissionTracker` bringt jedes Level selbst mit, ebenso die Zeitkapsel. Die Testkammer behält ihre einzelnen Knoten.
- `DebugKeys` (`ui/debug/debug_keys.tscn`): F2 immer; F4, Bild auf, Bild ab und Ende nur im Debug-Build; während eines Wechsels nichts. Bild auf und Bild ab senden `level_exit_requested` und `level_leave_requested` mit der Nummer aus `player_id` (1). Ohne SceneManager machen sie, was die Testkammer bis M17 tat: abschließen oder verlassen und neu laden.
- Räume: `Room` (`world/room/room.tscn`) ist ein `Node2D` in der Gruppe `rooms` mit `size` ab seinem Ort, auf Wunsch mit Boden und Raster. Inhalt des Raums liegt am besten als seine Kinder. `RoomWatcher` (`world/room/room_watcher.tscn`) prüft in jedem Physik-Schritt nach den Figuren und vor der Kamera, in welchem Raum die Mitte jeder Figur liegt – der alte Raum gilt, solange sie darin ist; außerhalb aller Räume bleibt er. Bei einem Wechsel `room_changed` und „S1 Raum“.
- Zeitkapsel im Level (`world/time_capsule/`): Bild aus `data/skins/time_capsule.tres` über `PropView` (Kind `View`); der Ort der Zeitkapsel ist die Mitte ihres Fußes am Boden, das Bild reicht 56 Pixel darüber und 8 darunter, 33 zu jeder Seite. Körper: unten 48 × 24, darüber 30 × 22 – so kommt die Figur nicht hinter sie, solange es keine Sortierung nach Höhe gibt (A4). Bei der Ankunft sinkt `View` in `land_time` (0,7 s) aus `land_height` (28 Pixel) herab und wird dabei sichtbar; danach `landed` – Staub aus `ArriveEffect`. Bereit über `unlock_channel` (`missions_done`), Schalter gemerkt wie bei einer Tür; solange bereit, alle `sparkle_interval` (1,6 s) `sparkled` – Funkeln aus `ReadyEffect`. E über `TalkAction`: `ready_dialog` oder `abort_dialog`; Aktion `board` → `level_exit_requested`, nur wenn sie noch bereit ist; `abort` → `level_leave_requested`. Während des Gesprächs ist ihr E aus. Ohne SceneManager eine Warnung.
- Zeitkapsel innen (`levels/time_capsule/time_capsule.tscn`): `Level` `time_capsule`, kein Lauf – Inventar und Ausrüstung gelten im Kapselstand, `PlayerProgress` schreibt dorthin. Raum `Inside` 320 × 160 mit Wänden, die Zeitsteuerung `TimeConsole` bei (160, 72), der Startpunkt bei (160, 120). Keine Missionen, keine Gegner.
- Zeitsteuerung (`world/time_console/`): der Kristall aus `TilesetDungeon.png`; E über `TalkAction` mit `data/dialogs/time_console.tres`; die Aktion der letzten Zeile ist die Kennung des Ziels → `travel_requested`.
- `DialogLine.action` (Gruppe „Wirkung“): Name einer Aktion, die ein Ding wie die Zeitkapsel ausführt, wenn das Gespräch nach dieser Zeile regulär endet. NPCs übergehen sie.
- Testfeld (`levels/test_field/test_field.tscn`): das zweite Level, um Abschluss, Abbruch und Rückkehr zwischen zwei Leveln zu prüfen.
- Spielstand: unverändert im Format. Die Zeitkapsel merkt sich nichts; in welchem Level ein Lauf ist, steht wie bisher in `current_level`. Dinge in der Zeitkapsel innen würden unter dem Level `time_capsule` im Kapselstand gemerkt.
- Abschalten: ohne `SceneManager` lädt die Startszene die Testkammer, Level laden nach Tod und F2 ohne Überblendung neu, Zeitkapsel und Zeitsteuerung bewirken nichts – mit Warnung; ohne `TimeCapsule` erscheint die Figur am Ort des `PlayerSpawner`; ohne `RoomWatcher` gelten die Grenzen des Levels samt aller Räume; ohne `DebugKeys` gibt es keine Test-Tasten und keine Zeile „Spielstand“; ohne `TalkAction` bewirkt E an Zeitkapsel und Zeitsteuerung nichts, mit Warnung.
- Mehrspieler: Ein Wechsel gilt für alle Figuren; jede Kamera folgt dem Raum ihrer Figur. Über Abschluss und Abbruch entscheidet später der Gastgeber.

**Freischaltungen im Einzelnen (M19)**

- Werte-Datei `data/unlocks/unlocks.tres` (`UnlockSettings` mit `UnlockInfo` je Freischaltung): sechs Freischaltungen, keine von Anfang an frei. Der feste Pfad steht in `GameState` (`UNLOCKS_PATH`); fehlt die Datei, ist nichts gesperrt, mit Warnung. `check()` meldet doppelte Kennungen, fehlende Namen und Zeichen, die die Schrift nicht kennt.
- `GameState` ist die eine Stelle: `is_unlocked(kennung)` – leer, unbekannt oder von Anfang an frei heißt ja –, `unlock(kennung)` – trägt sie im geltenden Stand ein, meldet `unlocks_changed` und einen Hinweis `notice_requested` mit `notice_kind` und „Name (Taste)“ –, `unlock_all()` für Pos1 mit einem einzigen Hinweis „Alles“, `get_unlock_titles(frei)` für die Debug-Zeile. Auf `unlock_requested` hört `GameState` selbst.
- Gemerkt im Abschnitt `unlocks` des Stands: im Lauf im Levelstand, sonst im Kapselstand. Freischaltungen gelten für alle Spielfiguren, nicht je Spieler.
- An der Figur: Kind `Unlocks` (`UnlockGate`) mit `dash_unlock` (`dash`), `ranged_unlock` (`ranged`), `sneak_unlock` (`sneak`); Fähigkeiten nennen ihre Freischaltung in `Ability.unlock_id`. Der Baustein fragt `GameState` bei jeder Frage neu und meldet `changed`, wenn sich etwas ändert – auch bei neuem Spiel, neuem Lauf, Abbruch und Laden.
- HUD: `AbilityBar` zeigt nur Plätze freier Fähigkeiten, die Taste unter jedem bleibt ihre eigene – ist nur Stun frei, steht dort die 3. `AmmoSlot` fehlt, solange der Fernkampf gesperrt ist.
- Fundstück `world/unlock_pickup/unlock_pickup.tscn` (`UnlockPickup`): eine Schriftrolle mit Schatten, wippt um 1 Pixel, funkelt alle 1,5 s (`sparkled` → `Sparkle`). E bittet um `unlock_id`, dann ist es weg; `Persistent` merkt sich `{"taken": true}`. Einstellbar: `unlock_id`, `bob_height`, `sparkle_interval`, `shadow_color`. Ohne `unlock_id` eine Warnung.
- Hinweise oben in der Mitte zeigt die Missionsanzeige (`MissionPanel`), für jedes Modul über `notice_requested`.
- Debug: Pos1 (`debug_unlock_all`, nur im Debug-Build) ruft `GameState.unlock_all()`; Debug-Zeile „Frei“ aus `DebugKeys`.
- Testkammer und Testfeld: siehe „Testkammer im Einzelnen“; der Jäger bringt Schleichen bei, die Mission im Testfeld gibt Schnelligkeit.
- Abschalten: ohne `Unlocks` an der Figur ist alles frei; ohne `GameState` ebenso, Fundstücke verschwinden dann ohne Wirkung; ohne Fundstücke kommen Freischaltungen nur über Missionen, Gespräche und Pos1; ohne die Werte-Datei ist nichts gesperrt.
- Mehrspieler: Eine Freischaltung gilt für alle; entschieden wird an einer Stelle, später beim Gastgeber.

**Menüs im Einzelnen (M20)**

- Aufbau: Jedes Menü ist eine eigene Szene unter `ui/menus/` mit einem Skript, das von `MenuScreen` erbt – ein `CanvasLayer` mit `Root` über das ganze Bild und darin `Window`, der Holzrahmen. `Window` steht immer auf ganzen Pixeln in der Mitte, beim Hauptmenü 52 Pixel tiefer (`window_offset`). Menüs, die ein Menü öffnet, hängen neben `Root`: das Hauptmenü mit `SaveSlots` und `OptionsMenu`, die Optionen mit `KeyList`, das Pausenmenü mit `OptionsMenu` und `Confirm`, die Spielstand-Auswahl mit `Confirm`.
- Bildebenen: Hauptmenü, Pausenmenü und seit M20b das Fenster mit Karte und Missionen 107, Spielstand-Auswahl und Optionen 108, Tastenbelegung und Nachfrage 109 – zwischen Dialogfenster (106) und Fadenkreuz (110); die Überblendung des SceneManagers liegt mit 120 darüber. Alle Menüs laufen mit `process_mode` „Always“.
- Bedienen: Pfeiltasten, W A S D, Tab und Umschalt+Tab wandern durch die Bedienelemente des obersten Menüs, im Kreis; an einem Schieberegler verstellen links und rechts den Wert. Enter und Leertaste drücken, Esc ruft `back()` – sonst Schließen, im Hauptmenü nichts, in der Nachfrage „Nein“. Die Maus über einem Bedienelement wählt es aus; über einem Knopf nur für die Maus – `focus_mode` „None“, etwa dem roten Kreuz – ist nichts gewählt, danach wieder das Vorige. Ein Menü über einem anderen blendet dessen Fenster aus, die Nachfrage lässt es stehen und dunkelt ab; danach ist das Bedienelement gewählt, das es geöffnet hat.
- Thema `ui/menus/menu_theme.tres`: Bilder des Holz-Themas aus `Ui/Theme/Theme Wood/`, Schrift `ui/menus/menu_font.tres` – `NormalFont` mit 3 Pixeln mehr Wortabstand. Fenster `nine_path_panel.png` mit `nine_path_panel_interior.png` (Variante `MenuInterior`); Knöpfe `button_normal.png`, gewählt und unter der Maus `button_hover.png`, gedrückt `button_pressed.png` – Ränder 3 oben und 1 unten, weil das Bild 1 Pixel tiefer liegt –, gesperrt `button_disabled.png`; Plätze (Variante `SlotButton`) `nine_path_bg.png`, gewählt wie gedrückt; Schieberegler mit `nine_path_bg.png`, Füllung `slider_progress.png`, Griff `h_slidder_grabber.png`, gewählt die hellen Fassungen; Häkchen `checked.png` und `unchecked.png`, gewählt mit dem Rahmen `nine_path_focus.png`. Varianten für Text: `MenuGameTitle` (27, orange mit Schatten), `MenuTitle` (18, orange), `MenuHeading` (orange), `MenuInfo` (beige). `ui/theme/wood_theme.tres` bleibt, wie es war.
- Hauptmenü (`main_menu.gd`): öffnet sich mit der Startszene. „Start“ → Spielstand-Auswahl, „Optionen“ → Optionen, „Beenden“ → `get_tree().quit()`. Meldet die Auswahl `slot_chosen(platz, gab_es_einen)`, startet es mit Spielstand `SceneManager.start_game()`, sonst `new_game()`; ohne SceneManager `fallback_scene`. Titel und Zeitkapsel (`Root/Decor`) sind nur über dem Hauptmenü selbst zu sehen.
- Spielstand-Auswahl (`save_slots.gd`): baut beim Öffnen je Platz eine Zeile aus `SaveManager.get_slot_info()` – leer „Neues Spiel“, unlesbar „Unlesbar - beginnt neu“, sonst Datum rechts oben, Ort links unten aus `TravelSettings.place_title()` und Spielzeit rechts unten. Ein Klick öffnet den Platz beim SaveManager und meldet `slot_chosen`; danach nimmt die Auswahl nichts mehr an. Das Kreuz aus `TilesetLogic.png` – rot (4,5), unter der Maus weiß (7,5) – steht nur neben belegten Plätzen und öffnet die Nachfrage; nach „Ja“ löscht `SaveManager.delete_slot()`, der Platz ist wieder gewählt.
- Optionen (`options_menu.gd`): liest beim Öffnen `GameOptions`, jede Änderung geht sofort an `GameOptions.set_value()`. Regler 0 bis 100 in Zehnern. Läuft das Spiel im Editor eingebettet (`Engine.is_embedded_in_editor()`), steht unter „Vollbild“ „Gilt nicht im eingebetteten Spiel“.
- Tastenbelegung (`key_list.gd`): je Zeile aus `ROWS` Name und Tasten aus der `InputMap`, in zwei Spalten; Tasten als Bild aus `Ui/Input/Keyboard/Key<Name>.png`, Maustasten aus `Ui/Input/Mouse/`, ohne Bild als Text. Unter Windows zeigt sie die Tasten im Tastaturlayout des Spielers. Entwickler-Tasten, `use_potion` und `map` fehlen, bis es sie im Spiel gibt.
- Pausenmenü (`pause_menu.gd`): öffnet in `_unhandled_input` auf `pause`, also erst, wenn Inventar und Gespräch Esc nicht gebraucht haben, und nicht während eines Szenenwechsels. Im Einzelspiel – ohne Netz oder mit `OfflineMultiplayerPeer` – setzt es `SceneTree.paused` und löst die Pause beim Schließen und in `_exit_tree()`. „Reise abbrechen“ ist nur zu sehen, solange `GameState` einen Lauf hat: Die Nachfrage zeigt die erste Zeile mit Antworten aus `abort_dialog`; welche Antwort abbricht, rechnet es mit dem `DialogRunner` nach – wie an der Zeitkapsel zählt die Aktion `abort` der letzten Zeile. Abbruch und Hauptmenü lassen die Welt bis zum Wechsel angehalten; nimmt der SceneManager nicht an, geht es im Menü weiter. „Hauptmenü“ bittet ums Speichern („Hauptmenü“) und ruft `SceneManager.go_to_menu()`, „Spiel beenden“ schickt wie die Taste Ende das Schließen des Fensters an alle – der SaveManager speichert („Beenden“).
- Optionen-Datei (`GameOptions`): `user://options.cfg` mit den Abschnitten `audio` (`master_volume`, `music_volume`, `sound_volume`, je 0 bis 1), `display` (`fullscreen`) und `interface` (`missions_collapsed`); Grundwerte aus `data/ui/options.tres`. Lautstärke geht auf die Busse `Master`, `Music`, `Sounds` – 0 schaltet stumm –, Vollbild auf das Fenster, nicht im eingebetteten Spiel und nicht ohne Fenster. Die Missionsanzeige liest beim ersten Mal, ob ihre Liste eingeklappt ist, und schreibt jede Änderung zurück.
- Mehrspieler: Jeder Spieler hat seine Menüs; angehalten wird nur im Einzelspiel. Plätze und Optionen sind lokal; den Spielstand führt später der Gastgeber.
- Abschalten: ohne `MainMenu` in der Startszene geht es gleich weiter wie in M18; ohne `PauseMenu` im Level tut Esc nichts; ohne `SaveManager` zeigt die Auswahl drei leere Plätze; ohne `options.cfg` gelten die Grundwerte.

**Karte und Missionen im Einzelnen (M20b)**

- Fenster (`ui/menus/map_window/map_window.gd`): erbt von `MenuScreen`, Ebene 107, mit `Dim` (35 % schwarz). M (`map`) öffnet es in `_unhandled_input` – nur, wenn sonst kein Fenster der Figur offen ist (es zählt `menu_changed` mit), das Spiel nicht angehalten ist und kein Szenenwechsel läuft. Offen fängt es in `_input` ab: M, Esc schließen; A, D, Pfeil links und rechts, Tab und Umschalt+Tab wechseln die Seite im Kreis; W, S, Pfeil hoch und runter blättern auf der Seite „Missionen“ um `scroll_step` Pixel. Das Mausrad blättert über der Liste. Gewählt ist immer der Reiter der offenen Seite; die Seite merkt sich `last_page` (statisch) bis zum Ende des Spiels. Die Figur bleibt stehen, die Welt läuft weiter.
- Reiter: Variante `MenuTab` im Menü-Thema – `tab_unselected.png` mit den Rändern 4, 5, 6, 0, unter der Maus `tab_hover.png`, gewählt `tab_selected.png` mit 4, 4, 6, 0; Schrift beige, auf hellem Reiter dunkelbraun; gewählt sein zeichnet keinen Rahmen. Die Kartenfläche hat die Variante `MenuMapPanel` (`nine_path_bg.png`), die Liste eine Bildlaufleiste aus `nine_path_bg.png` und `slider_progress.png` (`VScrollBar` im Thema).
- Karte (`MapView`): Die Fläche aller Räume der Gruppe „rooms“ – auch der unerkundeten – passt verkleinert in die Kartenfläche, 6 Pixel vom Rand; in der Testkammer etwa 0,29. Erkundete Räume dunkel mit hellem Rand, der Raum der eigenen Figur heller mit orangem Rand; der Name (`title`) steht oben links, wenn er hineinpasst. Die Figuren der Gruppe „players“ sind ein Pfeil aus 7 × 7 Pixeln (`MARKER`), auf vier Richtungen gerundet, je Spieler in seiner Farbe; die Zeitkapsel – jeder Knoten mit dem Skript `TimeCapsule` – ist `time_capsule_icon.png`, ihr Fuß auf ihrem Ort. Ein Level ohne Räume zeigt seine ganze Fläche aus `camera_bounds_changed`. Solange die Karte offen ist, zeichnet sie jedes Bild neu: Figuren können sich bewegen.
- Oben rechts: der Name des Levels aus `data/world/travel.tres`, in der Zeitkapsel `capsule_title`, dazu der Raum der eigenen Figur, etwa „Testkammer - Halle“; heißt der Raum wie das Level, steht der Name nur einmal.
- Missionen: aus `mission_list_changed`; nur angenommene, Pflicht vor Neben, Offenes vor Erfülltem, sonst die Reihenfolge der Missionen-Datei. Je Mission der Titel – Pflicht orange, Neben weiß –, rechts „Pflicht“ oder „Neben“ und der Stand – „läuft“, „bereit zur Abgabe“, „erfüllt“ –, darunter die Beschreibung, umgebrochen, und die Ziele mit Kästchen und Fortschritt wie in der Missionsliste. Erfüllte sind blass (`done_alpha`). Ohne `MissionTracker` „Hier gibt es keine Missionen.“, ohne angenommene „Noch keine Mission angenommen.“
- Erkundet (`RoomExplorer`, `world/room/`): hört auf `room_changed` und bittet `GameState.visit_room(level, raum)`; `GameState` legt die Kennung unter `rooms` im aktiven Stand ab und meldet `room_visited`. Den ersten Raum meldet der `RoomWatcher` gleich nach dem Start. Pos1 (`DebugKeys`) ruft `visit_rooms()` mit allen Räumen des Levels.
- Mehrspieler: Jeder Spieler hat sein Fenster (`player_id`); was erkundet ist, gilt für alle; auf der Karte sind alle Figuren.
- Abschalten: ohne `MapWindow` tut M nichts; ohne `RoomExplorer` kommt nichts dazu; ohne Werte bleibt die Karte leer; ohne `MissionTracker` steht der Hinweis da.

**HUD im Einzelnen (M12)**

- `ui/hud/hud.tscn` ist ein `CanvasLayer` auf Ebene 90, unter der Debug-Anzeige (100), dem Inventarfenster (105) und dem Fadenkreuz (110). Einstellbar: `player_id` (1).
- Die Figur findet das HUD in der Gruppe `players` an ihrer `player_id`. Erscheint sie erst später, merkt es das über `node_added` und wartet, bis sie bereit ist. Verschwindet sie, bekommen alle Teile `bind(null)` und blenden sich aus; eine neue Figur mit derselben Nummer übernimmt das HUD wieder.
- Jedes Teil hat ein eigenes Skript in `ui/hud/` mit der Methode `bind(figur)`, liest nur und entscheidet nichts. Fehlt sein Baustein an der Figur, bleibt es ausgeblendet.
- `EnergyOrb` (`TextureProgressBar`, 32 × 32 bei (4, 4)): Rahmen `BackgroundRed.png`, Füllung `ProgressMana.png` um (5, 5) versetzt und von unten nach oben, Glanzpunkt `Over.png`. Hört auf `changed` des Vorrats `supply_name` (Standard `Energy`). Die Füllung steigt in ganzen Pixeln, mindestens einem, solange Energie da ist.
- `Hearts` (`Control` bei (38, 6)): malt die Herzen aus `Heart.png` im Abstand `step` (16). Leben je Herz aus `stats`, also `data/ui/hud.tres`. Hört auf `changed` von `Health`; mit dem Höchstwert ändert sich die Zahl der Herzen.
- `StaminaBar` (`Control`, 64 × 4 bei (39, 25)) mit `Frame` (`NinePatchRect` aus `LifeBarMiniUnder.png`, Ränder 1) und `Fill` (`ColorRect`, innen 62 × 2). Farben `fill_color` (Grün des Pakets) und `exhausted_color` (Rot des Pakets). Hört auf `changed`, `exhausted` und `recovered` von `Stamina`.
- `BottomBar` (`HBoxContainer` unten links, 6 Pixel Abstand) mit `AbilityBar` (`HBoxContainer`, 4 Pixel Abstand) und `AmmoSlot`. Die Reihe passt sich an: Mehr Fähigkeiten schieben die Zelle weiter nach rechts.
- `AbilityBar` baut je Kind unter `Abilities` einen Platz aus `ability_slot.tscn`, die Tasten aus `key_icons` (`Key1.png` bis `Key3.png`). Ein Platz: `Icon` (`TextureProgressBar`, im Uhrzeigersinn; darunter das graue Symbol, darüber das farbige), `ActiveFrame` (Variante `InventoryFocus` des Holz-Themas) und `Key`. Er liest in jedem Bild `is_active`, `get_cooldown_left()` und die Kosten gegen den Vorrat der Fähigkeit ab. Seit M19 fehlen Plätze, deren Fähigkeit gesperrt ist; die Reihe fragt das Kind `Unlocks` der Figur und hört auf `changed`.
- `AmmoSlot` (`Panel`, Variante `InventoryCell`, 24 × 24) mit `Icon` und `Count` (Variante `CountLabel`). Hört auf `selection_changed` des `AmmoSelector` und auf `changed` des `Inventory`. Die Anzahl steht auch bei 1. Seit M19 fehlt die Zelle, solange der Fernkampf gesperrt ist.
- Alle Teile lassen die Maus durch (`mouse_filter` auf „Ignore“), damit Klicks und Mausrad bei der Figur ankommen.
- Im Editor zeigt `hud.tscn` die Kugel, die Leiste und die Zelle; Herzen und Fähigkeiten erscheinen erst im laufenden Spiel.
- Mehrspieler: Jedes HUD zeigt die Figur mit seiner `player_id`. Später zeigt jeder Rechner nur das HUD seiner eigenen Figur.

**Debug-Anzeige im Einzelnen**

- `CanvasLayer` auf Ebene 100, läuft auch bei pausiertem Spiel. Zeigt FPS, Mausposition im Bild, gedrückte Aktionen und alle gemeldeten Werte. Seit M12 steht sie oben rechts, damit sie das HUD nicht verdeckt.
- Einstellbar: `refresh_interval` (0,1 s), `font_size` (12), `visible_on_start`, `show_mouse`, `hidden_keys`, seit M12 `align_right` (an) und `edge_margin` (4).
- Im Editor zeigt die Testkammer nur die blauen Kollisionsflächen; Farben, Raster und Anzeige erscheinen erst im laufenden Spiel.

### Dateien je Modul

**M20b – Karte & Missionsfenster**

- Neu: `ui/menus/map_window/` mit `map_window.tscn`, `map_window.gd`, `map_view.gd`, `map_settings.gd`; `world/room/room_explorer.tscn`, `room_explorer.gd`; `data/ui/map.tres`; `assets/test_art/objects/time_capsule_icon.png`
- Geändert: `autoload/game_state.gd` (erkundete Räume), `autoload/event_bus.gd` (`room_visited`), `missions/mission_tracker.gd` (`description` in der Liste), `ui/debug/debug_keys.gd` (Pos1 deckt Räume auf), `ui/menus/key_list/key_list.gd` (Zeile „Karte“), `ui/menus/menu_theme.tres` (`MenuTab`, `MenuMapPanel`, `VScrollBar`), `levels/level_frame/level_frame.tscn` und `levels/test_chamber/test_chamber.tscn` (`RoomExplorer`, `MapWindow`), `levels/test_chamber/test_chamber.gd`, `world/room/room.gd` und `room_watcher.gd` (nur Kommentare); `README.md`, `assets/README.md`, `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Von Hand: nichts; die `.uid`-Dateien und `time_capsule_icon.png.import` legt Godot beim Öffnen an – bitte mit committen
- Abschluss: `m20b_abschluss.zip` mit `docs/projekt_stand.md`

**M20a – Hauptmenü, Spielstände, Pause, Optionen und Kamera**

- Neu: `options/` mit `game_options.gd`, `options_defaults.gd`; `data/ui/options.tres`; `default_bus_layout.tres`
- Neu: `ui/menus/` mit `menu_screen.gd`, `menu_theme.tres`, `menu_font.tres` und je Szene und Skript in `main_menu/`, `save_slots/`, `options_menu/`, `key_list/`, `pause_menu/`, `confirm_window/`
- Geändert: `autoload/save_manager.gd` (drei Plätze), `autoload/game_state.gd` (Spielzeit), `autoload/scene_manager.gd` (`go_to_menu()`, `start_game()` mit Überblendung und Rückgabe), `autoload/input_setup.gd` (nur der Kommentar), `levels/travel_settings.gd` und `data/world/travel.tres` (`menu_scene`, `place_title()`), `levels/boot/boot.gd` und `boot.tscn` (Hauptmenü), `entities/player/camera_stats.gd`, `player_camera.gd` und `data/player/camera.tres` (`mode`, `outside_color`), `ui/missions/mission_panel.gd` (eingeklappt aus den Optionen), `ui/debug/debug_keys.gd` (Platz in der Zeile „Spielstand“)
- Geändert: `levels/level_frame/level_frame.tscn` und `levels/test_chamber/test_chamber.tscn` (`PauseMenu`); `levels/level.gd`, `levels/test_chamber/test_chamber.gd`, `entities/dummy/training_dummy.gd`, `entities/enemies/enemy.gd` (Zeitgeber halten mit der Pause an); `README.md`, `assets/README.md`, `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Von Hand: die Hauptszene auf `levels/boot/boot.tscn` setzen und `project.godot` mit committen – Punkt 1 der Prüfliste
- Abschluss: `m20a_abschluss.zip` mit `docs/projekt_stand.md`

**M19 – Freischaltungen**

- Neu: `unlocks/` mit `unlock_info.gd`, `unlock_settings.gd`; `components/unlock_gate/` mit `unlock_gate.tscn`, `unlock_gate.gd`; `world/unlock_pickup/` mit `unlock_pickup.tscn`, `unlock_pickup.gd`; `data/unlocks/unlocks.tres`; `data/effects/unlock_twinkle.tres`
- Geändert: `autoload/event_bus.gd` (drei Meldungen), `autoload/game_state.gd` (Freischaltungen), `autoload/input_setup.gd` (`debug_unlock_all`), `abilities/ability.gd` (`unlock_id`), `abilities/haste/haste.tscn`, `abilities/invisibility/invisibility.tscn`, `abilities/stun/stun.tscn` (je ihre Kennung), `entities/player/player.gd` (fragt `Unlocks`), `entities/player/player.tscn` (Kind `Unlocks`), `ui/hud/ability_bar.gd`, `ui/hud/ammo_slot.gd` (zeigen nur Freies), `ui/missions/mission_panel.gd` (`notice_requested`), `missions/mission_data.gd` (`reward_unlocks`), `missions/mission_tracker.gd` (bittet darum), `dialogs/dialog_line.gd` (`unlock`), `entities/npcs/npc.gd` (bittet darum), `ui/debug/debug_keys.gd` (Pos1, Zeile „Frei“)
- Geändert: `levels/test_chamber/test_chamber.tscn` (vier Fundstücke im Ostraum, „S1 Geschoss“ ausgeblendet), `levels/level_frame/level_frame.tscn` („S1 Geschoss“ ausgeblendet), `data/dialogs/hunter_info.tres` (dritte Zeile: Schleichen), `data/missions/test_field.tres` (Belohnung Schnelligkeit), `README.md` (Ordner, Pos1, Freischaltungen), `assets/README.md` (`time_capsule.jpg`), `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Abschluss: `m19_abschluss.zip`, danach `m20_plan.zip` mit dem Plan für M20 – je nur `docs/projekt_stand.md`

**M18 – Räume & Levelwechsel**

- Gefüllt: `autoload/scene_manager.gd`
- Neu: `levels/boot/` mit `boot.tscn`, `boot.gd`; `levels/level.gd`, `levels/level_info.gd`, `levels/travel_settings.gd`; `levels/level_frame/level_frame.tscn`; `levels/test_field/test_field.tscn`; `levels/time_capsule/time_capsule.tscn`
- Neu: `world/room/` mit `room.tscn`, `room.gd`, `room_watcher.tscn`, `room_watcher.gd`; `world/time_capsule/` mit `time_capsule.tscn`, `time_capsule.gd`; `world/time_console/` mit `time_console.tscn`, `time_console.gd`; `components/talk_action/` mit `talk_action.tscn`, `talk_action.gd`; `ui/debug/debug_keys.tscn`, `debug_keys.gd`
- Neu: `data/world/travel.tres`; `data/skins/time_capsule.tres`, `time_console.tres`; `data/effects/capsule_dust.tres`, `capsule_ready.tres`; `data/dialogs/time_capsule_ready.tres`, `time_capsule_abort.tres`, `time_console.tres`, `speakers/time_capsule.tres`; `data/missions/test_field.tres`; `assets/test_art/objects/time_capsule.png`
- Geändert: `autoload/event_bus.gd` (drei Meldungen, Text von `level_exit_requested`), `autoload/input_setup.gd` (nur der Kommentar), `dialogs/dialog_line.gd` (`action`), `entities/player/camera_stats.gd` und `data/player/camera.tres` (`room_glide_time`), `entities/player/player_camera.gd` (Räume), `missions/mission_tracker.gd` („Weg“ statt „Tor“ in der Debug-Zeile, Kommentar), `world/level_exit/level_exit.gd` (nur der Kommentar)
- Geändert: `levels/test_chamber/test_chamber.tscn` (`Rooms` mit Ostraum, Durchgang in der rechten Wand, `TimeCapsule` statt `SpawnPoints`, ohne `ExitNiche`, `TimeAnchor` und `StartItems` versetzt, `PlayerSpawner` bei (240, 136), `RoomWatcher`, `DebugKeys`, ausgeblendete Debug-Zeilen), `levels/test_chamber/test_chamber.gd` (Tod über den SceneManager, ohne Test-Tasten, Ausgang und Zeile „Spielstand“; Grenzen samt Räumen), `README.md`, `assets/README.md` (eigene Testgrafik), `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Von Hand: die Hauptszene auf `levels/boot/boot.tscn` umstellen – Punkt 1 der Prüfliste. Das Original `assets/test_art/objects/zeitkapsel.jpg` bleibt liegen; das Spiel benutzt es nicht
- Abschluss: `m18_abschluss.zip` mit `docs/projekt_stand.md`

**M17 – Missionen**

- Neu: `missions/` mit `mission_list.gd`, `mission_data.gd`, `mission_objective.gd`, `event_objective.gd`, `item_objective.gd`, `mission_tracker.gd`, `mission_tracker.tscn`
- Neu: `components/mission_cue/` mit `mission_cue.tscn`, `mission_cue.gd`; `entities/npcs/quest_giver.gd`, `entities/npcs/gatherer.tscn`; `world/level_exit/` mit `level_exit.tscn`, `level_exit.gd`
- Neu: `ui/missions/` mit `mission_panel.tscn`, `mission_panel.gd`, `mission_panel_settings.gd`, `mission_theme.tres`, `mission_font.tres`
- Neu: `data/missions/test_chamber.tres`; `data/loot/mission_branches.tres`; `data/dialogs/gatherer_offer.tres`, `gatherer_waiting.tres`, `gatherer_ready.tres`, `gatherer_done.tres`, `speakers/gatherer.tres`; `data/skins/cavegirl2.tres`, `level_exit.tres`; `data/ui/missions.tres`
- Geändert: `autoload/event_bus.gd` (sechs Meldungen), `autoload/game_state.gd` (Missionen), `autoload/input_setup.gd` (`mission_toggle`), `dialogs/dialog_line.gd` (`start_mission`, `hand_in_mission`), `entities/npcs/npc.gd` (meldet Missionen, `get_dialogs()`), `entities/player/player_input.gd` (kein Schlag über Bedienelementen), `entities/enemies/caveman.tscn` (`MissionCue`)
- Geändert: `levels/test_chamber/test_chamber.tscn` (`Gatherer`, `ExitNiche`, `MissionTracker`, `MissionPanel`, `MissionCue` an `ChestBig`), `levels/test_chamber/test_chamber.gd` (Ausgang), `README.md` (Ordner, Taste J, Missionen), `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Abschluss: `m17_abschluss.zip` mit `docs/projekt_stand.md` und `docs/asset_katalog.md`

**M16 – Speichern & Laden**

- Gefüllt: `autoload/game_state.gd`, `autoload/save_manager.gd`
- Neu: `components/persistent/` mit `persistent.tscn`, `persistent.gd`; `components/player_progress/` mit `player_progress.tscn`, `player_progress.gd`; `world/time_anchor/` mit `time_anchor.tscn`, `time_anchor.gd`; `data/skins/time_anchor.tres`
- Geändert: `autoload/event_bus.gd` (vier Meldungen), `autoload/input_setup.gd` (vier Test-Tasten), `items/item_data.gd` (`load_from_path()`), `components/inventory/inventory.gd` und `components/equipment/equipment.gd` (Sichern und Wiederherstellen)
- Geändert: `world/chest/chest.gd` und `chest.tscn`, `world/destructible/destructible.gd` und `destructible.tscn`, `world/lever/lever.gd` und `lever.tscn`, `world/door/door.gd` und `door.tscn`, `entities/pickup/pickup.gd` (Signal `taken`) und `pickup.tscn`, `entities/npcs/npc.gd` (Signal `progress_changed`) und `npc.tscn` – je `get_saved_state()`, `apply_saved_state()` und ein Kind `Persistent`
- Geändert: `entities/player/player.tscn` (Knoten `PlayerProgress`), `entities/player/player.gd` (nur der Kommentar), `entities/player/player_spawner.gd` (Rückkehrpunkt)
- Geändert: `levels/test_chamber/test_chamber.tscn` (`TimeAnchor`), `levels/test_chamber/test_chamber.gd` (`level_id`, Lauf, Speichern vor dem Neuladen, Test-Tasten, Debug-Zeile), `README.md` (Ordner, Tasten, Spielstand), `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Abschluss: `m16_abschluss.zip` mit `docs/projekt_stand.md`

**M15 – NPCs & Dialog**

- Neu: `dialogs/` mit `dialog_data.gd`, `dialog_line.gd`, `dialog_choice.gd`, `dialog_speaker.gd`, `dialog_runner.gd`
- Neu: `ui/dialog/` mit `dialog_window.tscn`, `dialog_window.gd`, `choice_button.tscn`, `choice_button.gd`, `dialog_settings.gd`, `dialog_theme.tres`, `dialog_font.tres`
- Neu: `components/talk_bubble/` mit `talk_bubble.tscn`, `talk_bubble.gd`; `entities/npcs/` mit `npc.tscn`, `npc.gd`, `shaman.tscn`, `hunter.tscn`
- Neu: `data/dialogs/shaman_intro.tres`, `shaman_repeat.tres`, `hunter_info.tres`, `speakers/shaman.tres`, `speakers/hunter.tres`; `data/skins/shaman.tres`, `cave_lion.tres`; `data/loot/shaman_gift.tres`; `data/ui/dialog.tres`
- Geändert: `autoload/event_bus.gd` (vier Meldungen), `autoload/input_setup.gd` (`dialog_next`, `dialog_choice_1` bis `3`), `entities/player/player_input.gd` (zählt offene Menüs, wartet nach dem Schließen auf das Loslassen der Maustasten)
- Geändert: `levels/test_chamber/test_chamber.tscn` (`Shaman`, `Hunter`, `DialogWindow`), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `README.md` (Ordner, Tasten), `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Nachbesserung am 21.11.2026 (`m15_nachbesserung.zip`): neu `components/talk_facing/` mit `talk_facing.tscn`, `talk_facing.gd`; geändert `entities/player/player.gd` (Blickziel `look_target`), `entities/player/player.tscn` (Knoten `TalkFacing`), `README.md` (Bausteine), `docs/projekt_stand.md`
- Gelöscht vom Nutzer mit dem Hochladen: `components/windup_flash/`, ein Rest aus M13. `entities/npcs/.gitkeep` wird nicht mehr gebraucht
- Abschluss: `m15_abschluss.zip` mit `docs/projekt_stand.md`

**M14 – Gegnertypen**

- Neu: `entities/enemies/attacks/` mit `enemy_attack.gd`, `enemy_attack_stats.gd`, `enemy_melee_attack.gd`, `enemy_ranged_attack.gd`
- Neu: `entities/enemies/melee_enemy.tscn`, `ranged_enemy.tscn`, `stone_thrower.tscn`
- Neu: `data/enemies/caveman_attack.tres`, `stone_thrower.tres`, `stone_thrower_health.tres`, `stone_thrower_perception.tres`, `stone_thrower_attack.tres`, `stone_thrower_throw.tres`; `data/skins/cavegirl.tres`; `data/loot/stone_thrower.tres`
- Geändert: `entities/enemies/enemy.gd` (Angriffs-Module, Zurückweichen, eine Debug-Zeile), `enemy.tscn` (ohne `MeleeAttack` und `ClawEffect`, dazu `Attacks`), `enemy_stats.gd` (`retreat_speed`, ohne `attack_recover`), `caveman.tscn` (erbt von `melee_enemy.tscn`), `states/chase_state.gd`, `states/attack_state.gd`, `states/enemy_state.gd` (nur der Kommentar); `data/enemies/caveman.tres`
- Geändert: `components/character_view/character_view.gd` und `character_skin.gd` (Wurf `shoot`), `entities/projectile/projectile_skin.gd` und `projectile_view.gd` (`first_frame`)
- Geändert: `levels/test_chamber/test_chamber.tscn` (`StoneThrower`), `levels/test_chamber/test_chamber.gd` (nur der Kommentar), `README.md` (Ordner), `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Von Hand zu löschen: `components/windup_flash/` – ein Rest aus M13; gelöscht mit M15
- Abschluss: `m14_abschluss.zip` mit `docs/projekt_stand.md` und `docs/asset_katalog.md`

**M13 – Erster Gegner**

- Neu: `components/state_machine/` mit `state_machine.tscn`, `state_machine.gd`, `state.gd`; `components/perception/` mit `perception.tscn`, `perception.gd`, `perception_stats.gd`; `components/life_bar/` mit `life_bar.tscn`, `life_bar.gd`
- Neu mit der Nachbesserung: `world/view/view_settings.gd`, `data/world/view.tres`
- Neu: `entities/enemies/` mit `enemy.tscn`, `enemy.gd`, `enemy_stats.gd`, `caveman.tscn` und `states/` mit `enemy_state.gd`, `patrol_state.gd`, `alert_state.gd`, `chase_state.gd`, `attack_state.gd`, `search_state.gd`, `return_state.gd`, `stunned_state.gd`, `dead_state.gd`
- Neu: `data/enemies/caveman.tres`, `caveman_health.tres`, `caveman_punch.tres`, `caveman_perception.tres`; `data/loot/caveman.tres`; `data/skins/caveman_brown.tres`; `data/effects/claw.tres`, `emote_alert.tres`, `emote_search.tres`
- Geändert: `components/melee_attack/melee_attack.gd` (`reach_distance()`), `components/health/health.gd` (`damage_factor`), `entities/player/player.gd` (`is_sneaking()`), `entities/player/player_camera.gd` und `player_camera.tscn` (Zoom), `autoload/input_setup.gd` (F3)
- Geändert: `levels/test_chamber/test_chamber.tscn` (`Caveman`), `levels/test_chamber/test_chamber.gd` (F3, Anzeige „Zoom“), `README.md` (Ordner, F3), `docs/projekt_stand.md`, `docs/asset_katalog.md`
- Entfernt mit der Nachbesserung: `components/windup_flash/` – von Hand zu löschen. `melee_stats.gd` und `character_view.gd` sind wieder wie in M12.
- Abschluss: `m13_abschluss.zip` mit `docs/projekt_stand.md`

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
| Erster Gegner (M13) | `Actor/Character/Caveman2/SeparateAnim/` – Idle, Walk, Attack, Dead; `Ui/Emote/emote22.png` („!“) und `emote23.png` („?“); `FX/Attack/Claw/SpriteSheet.png`, 4 à 32; `Ui/Receptacle/LifeBarMiniUnder.png` und `LifeBarMiniProgress.png`, je 18 × 4 | geprüft am 18.11.2026; eingebaut mit M13 |
| NPCs | `Actor/Character/<Name>/SpriteSheet.png`, 4 × 7 à 16, dazu `Faceset.png` | geprüft: Zeilen 1 bis 4 Laufen, 5 Angriff, 6 Sprung, 7 Tod, Gegenstand und zwei Sonderposen; eingebaut mit M15: `Shaman` und `CaveLion`, je `SeparateAnim/Idle.png` und `Walk.png` und das Porträt `Faceset.png`, 38 × 38; mit M17 `Cavegirl2` als Sammlerin, Porträt 37 × 38 |
| Dialogfeld (M15) | `Ui/Dialog/DialogBoxFaceset.png` und `DialogBox.png`, je 300 × 58; `ChoiceBox.png` 64 × 20, Ränder 5; `DialogInfo.png` 4 Blasen à 20 × 16; `Ui/Arrow.png` 13 × 13; `Ui/Input/Keyboard/Key1.png` bis `Key3.png` | geprüft am 21.11.2026; eingebaut mit M15. `YesButton.png` und `NoButton.png` tragen englische Wörter und bleiben ungenutzt |
| Boden und Natur der Steinzeit | `Backgrounds/Tilesets/TilesetFloor.png`, `TilesetNature.png`, `TilesetRelief.png` | gesichtet; Regeln für Übergänge fehlen |
| Wände der Testkammer | `Backgrounds/Tilesets/Interior/TilesetWallSimple.png` | gesichtet: vier Mauer-Rahmen |
| Hebel, Druckplatte, Stacheln (M8) | `Backgrounds/Tilesets/TilesetDungeon.png`, Zellen als (Spalte, Zeile) à 16: Druckplatte oben (2,1) und gedrückt (3,1), Hebel rot (3,3) und blau (4,3), Stacheln oben (4,1) und unten (5,1) | geprüft am 17.11.2026; Hebel und Druckplatte eingebaut mit M8 |
| Türen (M8) | `Backgrounds/Tilesets/TilesetHouse.png` Zelle (2,3): Holztür; `TilesetElement.png` Zelle (1,11): Gittertor | geprüft am 17.11.2026: nur geschlossen – ein Bild der offenen Tür hat das Paket nicht; eingebaut mit M8 |
| Taste E (M8) | `Ui/Input/Keyboard/KeyE.png`, 13 × 13 | geprüft am 17.11.2026; eingebaut mit M8 |
| Missionsliste (M17) | `Ui/Theme/Theme Wood/checked.png` und `unchecked.png` 16 × 16, beschnitten auf 14 × 14; `nine_path_bg_2.png` als Grund; `nine_path_panel.png` mit `nine_path_panel_interior.png` für die Hinweise; `Ui/Arrow.png` – eingeklappt gedreht –; `Ui/Input/Keyboard/KeyJ.png` | geprüft am 22.11.2026; eingebaut mit M17 und in Godot gezeichnet angesehen |
| Ausgang (M17) | `Backgrounds/Tilesets/TilesetElement.png` Zelle (6,11): offene Luke mit Treppe, beige | geprüft am 22.11.2026; eingebaut mit M17 |
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
| Schrift | `Ui/Font/NormalFont.ttf` | Probe gerendert: Ziffern, Großbuchstaben und Umlaute da, das ß fehlt; gebaut für 9 Pixel; mit A2 für die Schadenszahlen eingebaut; im Dialog seit M15 und in der Missionsanzeige seit M17 mit 3 Pixeln mehr Wortabstand, weil ihr Leerzeichen nur 1 Pixel breit ist |
| Zeitkapsel (M18) | eigenes Bild des Nutzers, nicht aus dem Paket: Original `assets/test_art/objects/zeitkapsel.jpg`, im Spiel `time_capsule.png` 66 × 64 | geprüft am 22.11.2026: Pixelgrafik im Raster 200 × 200, das Schachbrett ist Teil des JPG; Claude hat daraus die PNG gewonnen – freigestellt, verkleinert, mit dunklem Rand, gespiegelt; eingebaut mit M18 |
| Zeitsteuerung, Landung, Bereitschaft (M18) | `Backgrounds/Tilesets/TilesetDungeon.png` Zelle (7,3): Kristall; `FX/Smoke/SmokeCircular/SpriteSheet.png` 8 à 30 × 14; `FX/Magic/Spark/SpriteSheet.png` 10 à 27 × 35 | geprüft am 22.11.2026; eingebaut mit M18 |
| Fundstück (M19) | `Items/Scroll/Scroll.png` 14 × 14, dazu das Funkeln aus `FX/Particle/Spark.png` | geprüft am 22.11.2026; eingebaut mit M19 |
| Menüs (M20) | `Ui/Theme/Theme Wood/`: Knöpfe, `nine_path_bg.png`, `slider_progress.png`, `h_slidder_grabber.png`, `checked.png`, `unchecked.png`, `nine_path_focus.png`; `Backgrounds/Tilesets/TilesetLogic.png` Kreuz rot (4,5) und weiß (7,5); `Ui/Input/Keyboard/` und `Ui/Input/Mouse/`; das Bild der Zeitkapsel aus `assets/test_art/` | geprüft am 22.11.2026; eingebaut mit M20a und in Godot gezeichnet angesehen. `button_pressed.png` liegt 1 Pixel tiefer als die anderen Knöpfe |
| Karte und Missionen (M20b) | `Ui/Theme/Theme Wood/`: `tab_unselected.png`, `tab_selected.png`, `tab_hover.png` je 16 × 12 als Reiter, `nine_path_bg.png` als Kartenfläche und Spur, `slider_progress.png` als Griff der Bildlaufleiste, die Kästchen aus M17; `assets/test_art/objects/time_capsule_icon.png` 16 × 16 | geprüft am 25.11.2026; eingebaut mit M20b und in Godot gezeichnet angesehen. `tab_unselected.png` liegt 1 Pixel tiefer als die anderen Reiter |
| Geräusche | `Audio/Sounds/Whoosh & Slash/`, `Hit & Impact/`, `Magic & Skill/`, `Jump & Bounce/` | nur die Namen; anhören kann nur der Nutzer |
| Musik | `Audio/Musics/`, 41 Stücke, etwa „2 - The Cave“ für die Steinzeit | nur die Namen |

## Gate G1 und Ausblick

Gate G1 ist bestanden: Nach dem Test von A2 hat der Nutzer am 17.11.2026 geschrieben: „Alles getestet und alles funktioniert … lass uns weitermachen“. Claude wertet das als „die Spielfigur fühlt sich gut an“. Nachstellen lässt sich weiter alles ohne Code über die Werte-Dateien in `data/`. Der Ton fehlt noch; er kommt mit A3 fast am Ende des Projekts.

Phase 2 ist fertig: M8 – Interaktion, M9 – Zerstörbares, M10 – Truhen & Beute, M11 – Inventar & Ausrüstung und M12 – HUD, zuletzt am 18.11.2026. A5 – Oberfläche ist dabei zweimal gewachsen: das Holz-Thema für Fenster, dann Herzen, Energie-Kugel, Ausdauer-Leiste und Symbole. Phase 3 ist fertig: M13 – Erster Gegner, am 18.11.2026 nach einer Nachbesserung; mit ihm hat A6 – Gegner, NPCs, Bosse begonnen, und die Welt erscheint seitdem mit Zoom 2. Im neuen Chat folgte M14 – Gegnertypen: ein Baukasten für viele Gegner, mit dem Höhlenmenschen als Nahkämpfer und der Steinwerferin als Fernkämpferin; fertig am 18.11.2026. Am 21.11.2026 folgte M15 – NPCs & Dialog: ein Dialogfenster mit Antworten, der Schamane mit Geschenk und der Jäger, der nur Auskunft gibt; nach einer Nachbesserung fertig am selben Tag – die Spielfigur dreht sich im Gespräch zum NPC. Phase 4 – Spielrahmen hat begonnen: M16 – Speichern & Laden ist fertig, am 21.11.2026 im neuen Chat nach dem Plan gebaut und vom Nutzer getestet – mit Zeitanker, Kapselstand und Levelstand. M17 – Missionen ist fertig, am 22.11.2026 nach dem Plan gebaut und vom Nutzer getestet: je Level eine Missionen-Datei, eine Liste zum Ein- und Ausklappen, die Sammlerin als Auftraggeberin und ein Tor vor dem Ausgang. M18 – Räume & Levelwechsel ist fertig, am selben Tag im neuen Chat nach dem Plan gebaut und vom Nutzer getestet: die Zeitkapsel im Level, innen die Lobby, der SceneManager, Räume und das Testfeld als zweites Level. M19 – Freischaltungen ist am selben Tag im selben Chat nach dem Vorschlag gebaut und vom Nutzer getestet, fertig. M20a – Hauptmenü, Spielstände, Pause, Optionen und Kamera ist am selben Tag im neuen Chat nach der Vorgabe des Nutzers gebaut und vom Nutzer getestet, fertig. M20b – Karte & Missionsfenster hat Claude am 23.11.2026 vorgeschlagen, der Nutzer hat es am 25.11.2026 mit „weiter“ angenommen; gebaut und getestet am selben Tag, fertig. Damit ist M20 – Menüs fertig und mit ihm Phase 4 – Spielrahmen. Als Nächstes steht Gate G2 an; Claude hat dazu am 25.11.2026 einen Vorschlag gemacht. Nach Phase 4 steht Gate G2 an: Alle Mechaniken laufen in der Testkammer zusammen und überstehen Speichern und Laden. Der Ton kommt erst mit A3.

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
- Ein neuer Zustand für einen Gegner: unter `Brain` einen Knoten anlegen, ihm ein Skript geben, das von `EnemyState` erbt, und ihn aus einem anderen Zustand mit `machine.transition_to(&"Name")` aufrufen. Der Knotenname ist der Name des Zustands.
- Den Sichtkegel eines Gegners sieht man, wenn bei seinem Kind `Perception` `debug_draw` an ist; F1 blendet ihn mit der Debug-Anzeige aus und ein.
- Knoten, die eine geerbte Szene überschreibt, nicht in ihrer Grundszene löschen – `Perception`, `CharacterView`, `Health` und `LootDropper` in `enemy.tscn`, `MeleeAttack` und `Attacks/Melee` in `melee_enemy.tscn`, `RangedAttack` und `Attacks/Ranged` in `ranged_enemy.tscn` –; das gibt Fehler in `caveman.tscn` und `stone_thrower.tscn`.
- Ein neuer Gegner (M14): im Editor „Neue geerbte Szene“ aus `melee_enemy.tscn` oder `ranged_enemy.tscn`, als `entities/enemies/<name>.tscn` speichern, dann Skin, Werte-Dateien – Kopien aus `data/enemies/` –, Waffe und Beute wählen; ins Level instanzieren und `patrol_tiles` setzen. Mehr unter „Gegnertypen im Einzelnen (M14)“.
- Einen Angriff abschalten, ohne ihn zu löschen: beim Knoten unter `Attacks` `enabled` aus.
- Bildebenen der Oberfläche: HUD und Missionsanzeige 90, Debug-Anzeige 100, Inventarfenster 105, Dialogfenster 106, seit M20 Menüs 107 bis 109, Fadenkreuz 110, Überblendung 120. Ein neues Fenster gehört zwischen 100 und 110, eine neue Anzeige am Bildrand unter 100.
- Auch das Dialogfenster ist im Editor unsichtbar (`DialogWindow/Root` ist ausgeblendet). Zum Ansehen dort das Auge an- und danach wieder ausschalten.
- Ein neues Menü, das die Figur anhalten soll, meldet `EventBus.menu_changed(player_id, true)` beim Öffnen und genau einmal `false` beim Schließen; `PlayerInput` zählt mit. Hört es Tasten, die auch die Figur nutzt, gehört es in der Szene hinter die anderen Fenster und fängt sie in `_input` ab.
- Ein neuer NPC und ein neues Gespräch: siehe „NPCs und Dialog im Einzelnen (M15)“. Texte im Gespräch weiter ohne ß, unteres Anführungszeichen, Gedankenstrich und das Zeichen für drei Punkte.
- Ein Commit mit dem Code eines Moduls, aber noch ohne die abschließende Stand-Datei, ist kein Problem: Die Stand-Datei kommt mit dem Abschluss-ZIP nach und wird einfach als eigener Commit hochgeladen.
- Neue Splitter: eine Datei aus `data/effects/debris_*.tres` kopieren, Streifen und `piece_count` anpassen und sie einem `DebrisCue` geben. Die Streifen in `FX/Particle/` sind Bruchstücke nebeneinander, keine Animation; mit `tint` lässt sich ein Streifen einfärben.
- Spielstand im Test: Der Stopp-Knopf des Editors beendet ohne Speichern – zum Speichern beim Beenden das X am Spielfenster oder in der Testkammer Ende. Zurücksetzen: F4 oder die Datei unter `%APPDATA%\Godot\app_userdata\TimeTraveller\saves\` löschen.
- Ein neues Ding, das sich seinen Zustand merken soll: `components/persistent/persistent.tscn` als Kind anhängen, im Skript `get_saved_state()` und `apply_saved_state(daten)` schreiben und bei jeder Änderung das Signal aus `save_signal` senden. Wiederherstellen ohne Beute, Splitter und Effekte.
- Dinge mit `Persistent` und Zeitanker im Level nicht umbenennen oder verschieben, wenn ein Spielstand sie behalten soll – ihre Kennung ist der Pfad in der Level-Szene.
- Ein neues Level bekommt eine `level_id` und meldet sich in `_enter_tree()` bei `GameState` – Muster in `levels/test_chamber/test_chamber.gd`. Ein Zeitanker: `world/time_anchor/time_anchor.tscn` instanzieren.
- F5 bis F8 fängt der Godot-Editor ab, solange das Spiel eingebettet läuft – neue Entwickler-Tasten nicht dorthin legen.
- Claude kann seit M16 die Linux-Fassung von Godot 4.7.2 ohne Fenster nutzen, um Szenen und Skripte zu laden und Abläufe durchzuspielen. Die `.uid`-Dateien, die Godot dabei anlegt, liefert es nicht mit.
- Seit M17 lässt Claude die Testkammer auch mit Bild laufen: Godot mit einem virtuellen Bildschirm (Xvfb) und dem Renderer `gl_compatibility`; die Bilder kommen aus dem Spiel in 480 × 270. Ob es sich gut anfühlt, sieht weiter nur der Nutzer.
- Container setzen Lage, Größe und Drehung ihrer Kinder. Soll sich ein Bild in einem Container drehen, liegt es in einem eigenen `Control` – so der Pfeil der Missionsliste.
- Statische Variablen (`static var`) überleben in Godot 4.7 das Neuladen der Szene, bis das Spiel endet; so merkt sich die Missionsliste, ob sie eingeklappt ist.
- Ein Bedienelement auf der Oberfläche, das Klicks annehmen soll, bekommt `mouse_filter` „Stop“; liegt die Maus darauf, greift die Figur nicht an (seit M17). Alles, was nur zeigt, bekommt „Ignore“.
- Eine neue Mission, ein neues Ereignis oder ein neuer Auftraggeber: siehe „Missionen im Einzelnen (M17)“. Titel und Ziele weiter ohne ß, unteres Anführungszeichen, Gedankenstrich und das Zeichen für drei Punkte – `check()` meldet sie.
- Seit M18 startet F5 die Startszene `levels/boot/boot.tscn`, nicht mehr die Testkammer. Wer eine Szene direkt mit „Szene starten“ öffnet, beginnt dort einen Lauf; läuft im Spielstand einer in einem anderen Level, endet er – mit Warnung im Ausgabefenster.
- Ein neues Level: neue Szene mit einem `Node2D` als Wurzel und dem Skript `levels/level.gd` – `level_id`, `level_size` –, darunter ein Raum aus `world/room/room.tscn` mit `draw_floor`, Wände als `StaticBody2D` mit Formen und `PlaceholderView`, die Zeitkapsel aus `world/time_capsule/time_capsule.tscn`, ein `MissionTracker` mit eigener Missionen-Datei und als letztes Kind `levels/level_frame/level_frame.tscn`. Dann in `data/world/travel.tres` einen Eintrag – Kennung, Name, Szene – und in `data/dialogs/time_console.tres` eine Antwort mit einer Zeile, deren `action` die Kennung ist; höchstens drei Antworten passen in das Gespräch.
- Ein neuer Raum: `world/room/room.tscn` ins Level, `room_id`, `title` und `size` setzen; Wände, Dinge und Gegner des Raums als seine Kinder. Zwischen zwei Räumen braucht es einen Durchgang in den Wänden. Dinge mit `Persistent` nicht in einen anderen Raum verschieben, wenn ein Spielstand sie behalten soll – ihr Pfad ändert sich.
- Das Bild der Zeitkapsel austauschen: eine PNG mit durchsichtigem Rand in 66 × 64 Pixeln unter `assets/test_art/objects/time_capsule.png` ersetzen – die Tür links unten, der Fuß der Kapsel 8 Pixel über der Unterkante. Eine andere Größe geht über `frame_size` und `offset` in `data/skins/time_capsule.tres`; die Formen in `world/time_capsule/time_capsule.tscn` dann nachziehen.
- Szenen wechselt nur der `SceneManager`. Ein neuer Weg aus einem Level meldet `level_exit_requested` oder `level_leave_requested`; eine Reise `travel_requested`.
- Eine neue Freischaltung: in `data/unlocks/unlocks.tres` einen Eintrag ergänzen – Kennung, Name, Taste für den Hinweis – und die Kennung dort eintragen, wo sie sperrt: bei einer Fähigkeit in `unlock_id` ihrer Szene, für eine neue Mechanik der Figur am Baustein `UnlockGate`. Freischalten: ein Fundstück `world/unlock_pickup/unlock_pickup.tscn` mit `unlock_id`, an einer Mission `reward_unlocks`, an einer Gesprächszeile `unlock`.
- Ältere Prüflisten, die Dash, Fernkampf, Schleichen oder Fähigkeiten brauchen: seit M19 vorher Pos1 drücken.
- Seit M20 beginnt F5 mit dem Hauptmenü. Ältere Prüflisten, die mit F5 beginnen: danach „Start“ und einen Platz wählen. F4 löscht nur den offenen Platz.
- Spielstände und Optionen zurücksetzen: die Dateien unter `%APPDATA%\Godot\app_userdata\TimeTraveller\` löschen – `saves\slot_1.json` bis `slot_3.json` und `options.cfg` –, oder im Hauptmenü einen Platz löschen.
- Ein neues Menü: eine Szene unter `ui/menus/<name>/` mit einem `CanvasLayer`, dessen Skript von `MenuScreen` erbt, darin `Root` mit dem Thema `ui/menus/menu_theme.tres` und `Window` mit den Bedienelementen; aus einem anderen Menü mit `open_child()` öffnen und es als Kind neben `Root` hängen. Was nur die Maus erreichen soll, bekommt `focus_mode` „None“.
- Etwas, das mit der Pause anhalten soll, läuft in einem Knoten mit `process_mode` „Inherit“ oder „Pausable“; ein Zeitgeber aus `get_tree().create_timer()` hält nur an, wenn sein zweiter Wert `false` ist. Was trotz Pause laufen muss – Menüs, Überblendung, Fadenkreuz –, hat „Always“.
- Ein Raum heißt auf der Karte wie sein `title`; ohne `title` steht die Kennung da. Für die Karte zählen nur Räume aus `world/room/room.tscn` in der Gruppe „rooms“.
- Die Karte zeigt nur Räume, die betreten wurden. Zum Testen deckt Pos1 alle Räume des Levels auf; zurück geht es mit F4 oder einem Abbruch der Reise.
- Vollbild lässt sich nur im eigenen Fenster prüfen: im Editor im Bereich „Spiel“ oben rechts das Menü öffnen und „Embed Game on Next Play“ abhaken; danach wieder einschalten.

## Offene Punkte

- M18 – Räume & Levelwechsel ist fertig. Offen geblieben: ob in Level 1 eine Zeitkapsel steht (Phase 5). Das Pausenmenü bietet „Reise abbrechen“ seit M20 an.
- M20 ist fertig, M20a und M20b, und damit Phase 4. Gate G2 ist vorgeschlagen. Auf der Karte fehlen noch Wände und Türen (mit A4), eigene Markierungen und Schnellreise. Später: Tastenbelegung ändern, Gamepad, Textgröße, eine Taste für Vollbild; Musik und Geräusche sind erst mit A3 zu hören.
- Die Debug-Zeile „Spielstand“ ist mit dem Platz vorn breiter geworden; die Debug-Anzeige reicht damit weiter nach links über das HUD. F1 blendet sie aus.
- Ältere Spielstände haben keine Spielzeit; sie zählt ab dem ersten Spielen nach M20 und zeigt bis dahin „unter 1 Min.“.
- Das Repo war am 25.11.2026 von hier aus nicht zu lesen. Der nächste Schritt prüft zuerst, ob M20a und M20b vollständig darin liegen und ob `project.godot` die Startszene `levels/boot/boot.tscn` nennt.
- Die Nachfrage „Reise abbrechen“ im Pausenmenü lässt die erste Zeile der Zeitkapsel weg – „Noch sind nicht alle Pflichtmissionen erfüllt.“ –, weil sie nach erfüllten Pflichtmissionen nicht stimmt; dann bricht „Abbrechen“ trotzdem ab und verwirft den Fortschritt, Einsteigen geht weiter nur an der Zeitkapsel.
- M19 – Freischaltungen ist fertig. Erfahrung, Stufen und der Fähigkeitsbaum aus dem Konzept kommen erst nach M20, weil der Baum ein Menü braucht; ebenso Ausbaustufen und kleine Verbesserungen wie mehr Leben.
- `project.godot` fehlt in den Commits `4b15a16`, `60679fd` und `7c91b12`: Die Hauptszene steht im Repo noch auf der Testkammer. Mit M20a bitte mit committen.
- Ein Fundstück zeigt nicht, was es freischaltet – das steht erst im Hinweis. Ein eigenes Bild je Freischaltung wäre möglich, etwa mit den offenen Rollen aus `Items/Scroll/`.
- Gesperrte Mechaniken geben keine Rückmeldung, wenn man ihre Taste drückt; ein Ton dafür käme mit A3.
- Die Zeitkapsel ist gespiegelt – die Tür links –, damit HUD und Missionsliste sie beim Start nicht verdecken; der Nutzer hat das mit dem Test von M18 bestätigt. Soll sie einmal andersherum stehen, lässt sich das in `time_capsule.png` zurückdrehen; Startpunkte, `Interactable` und `ReadyEffect` müssten dann auf die rechte Seite.
- Steht die Figur direkt vor der Zeitkapsel, ragt deren Spitze oben fast an den Bildrand; Missionsliste und Hinweise oben in der Mitte können sie kurz verdecken.
- Die Zeitkapsel innen ist ein leerer Raum mit dem Kristall als Zeitsteuerung; Lagerkiste, Werkbank, Händler und die Zeitkarte kommen später. An der Zeitsteuerung passen höchstens drei Antworten – mit mehr Leveln braucht es die Zeitkarte oder Seiten im Gespräch.
- Gegner in Räumen ohne Spielfigur laufen weiter; anhalten ist für später geplant.
- M17 – Missionen ist fertig, mit dem Test am 22.11.2026 bestätigt – auch, was Claude beim Bauen ergänzt hat: die Fragen der Sammlerin vor Annehmen und Abgabe, „Keine offenen Missionen“, der breitere Wortabstand der Anzeige. Wer M17 nachtestet, beginnt mit F4: Eine schon geöffnete grosse Truhe aus einem alten Spielstand lässt sich nicht noch einmal öffnen, ein gefällter Baum gibt keine Äste mehr.
- Nicht in M17, laut Plan später: Seit M18 übernimmt die Zeitkapsel im Level die Aufgabe von Tor und Luke; Missionen in der Zeitkapsel selbst bekämen eine eigene Datei im selben Format; Missionen schalten Fähigkeiten frei (M19), Erfahrung und Stufen laut Konzept (laut Vorschlag vom 22.11.2026 nach M20); ein Fenster mit allen Missionen und ihren Beschreibungen, der Zustand der Liste wird mit den Optionen gemerkt (M20). Offen: Ziele „Ort erreichen“, Missionen, die sich verzweigen oder scheitern können, Wegweiser, Missionen je Spieler im Mehrspieler.
- Die ausgeklappte Missionsliste deckt oben links einen Teil der Welt ab – mit drei Missionen etwa 195 × 75 Pixel der Fläche 480 × 270. Dafür gibt es J; kürzere Texte der Ziele machen sie schmaler.
- Eine Truhe oder ein Ding, das schon vor einer Mission geöffnet oder zerstört war, meldet sein Ereignis nicht mehr. Im Level gilt deshalb: Pflichtmissionen an Dinge hängen, die erst während der Mission erreichbar werden.
- Beute am Boden ist nach dem Tod weg – auch das Geschenk eines NPCs oder ein Schlüssel aus einer Truhe, solange die Figur sie nicht aufgehoben hat. Pflicht-Gegenstände in Leveln deshalb von Hand als `Pickup` legen, nicht nur als Beute – oder eine eigene Regel dafür, zusammen mit der offenen Strafe beim Tod.
- Nicht in M16: eine Strafe beim Tod, Gegner, die tot bleiben, etwa Bosse. Mehrere Spielstände und das Startmenü kamen mit M20, die Zeitkapsel mit M18, die Missionen mit M17.
- Beenden über `get_tree().quit()` speichert nicht von selbst; „Spiel beenden“ im Pausenmenü schickt deshalb wie die Taste Ende erst das Schließen des Fensters, dann speichert der SaveManager.
- In `project.godot` im Repo fehlt „Snap 2D Transforms to Pixel“ (`rendering/2d/snap/snap_2d_transforms_to_pixel`), das laut M3 gesetzt ist; die Datei ist seit M1 unverändert. Bei Gelegenheit in den Projekteinstellungen nachsehen.
- Beim Bauen von M14 ergänzt: Die Debug-Anzeige zeigt je Gegner eine Zeile statt zwei, und sie verschwindet nach dem Tod; Chase zeigt, ob der Gegner verfolgt, abwartet oder zurückweicht; `ProjectileSkin` kann mit `first_frame` ein einzelnes Bild aus einem Streifen nehmen; ein Skin kennt den Wurf `shoot`. Mit dem Test vom Nutzer bestätigt.
- Fernkämpfer: Steine lassen sich nicht abwehren oder zurückschlagen; die Steinwerferin zielt auf die Stelle, an der die Figur gerade steht, ohne vorzuhalten; beim Abwarten steht sie still, statt zur Seite auszuweichen. Zurückweichen in eine Ecke beendet sie nicht – dort bleibt sie stehen und wirft weiter.
- Zoom: Gewünscht war „4x“; eingestellt ist 2, mit dem Test bestätigt. Andere Werte gehen ohne Code in `data/world/view.tres`; Abstände der Gegner und die faire Grenze passen sich an.
- Ausholen gibt es nicht mehr: Der Schlag kommt mit dem ersten Bild der Hieb-Animation; die des Höhlenmenschen hat nur ein Bild. Ein Gegner mit eigener Ausholbewegung bekäme später ein eigenes Bild dafür.
- Beim Bauen von M13 ergänzt, vom Nutzer mit dem Test bestätigt: In der Testkammer sind Sichtkegel und Hörkreis zu sehen, seit der Nachbesserung auch die faire Grenze als Rahmen; F1 blendet sie aus; ist in der Verfolgung eine andere Figur näher, nimmt er die; kommt er auf dem Rückweg nicht weiter, patrouilliert er von dort aus; Schleichen zählt auch im Stehen mit gehaltener Strg-Taste. Mit der Nachbesserung: F3 schaltet den Zoom durch, die Kamera rundet auf das Raster des Bildes.
- Gegner haben noch keine Wegfindung: Sie laufen gerade auf ihr Ziel zu und gleiten an Hindernissen entlang. Wege um Blöcke herum kommen mit den Kacheln (A4).
- Aus dem Konzept noch offen für Gegner: Lärm beim Zerstören lockt sie an; höchstens drei greifen zugleich an, der Rest umkreist; weitere Gegnertypen – Schildträger, Flieger, Wache, Unterstützer – folgen auf Wunsch des Nutzers später. Treffer unterbrechen einen Gegner nicht und stoßen ihn nicht zurück.
- Drei Dinge hat Claude in M12 selbst ergänzt, der Nutzer hat sie mit dem Test bestätigt: Kugel und Leiste wachsen in ganzen Pixeln und zeigen mindestens einen, die Herzen mindestens ein Viertel, solange noch etwas da ist; Fähigkeiten und Geschoss-Zelle stehen in einer Reihe, die sich anpasst; die Debug-Anzeige lässt sich mit `align_right` wieder nach links stellen.
- Zwei Dinge hat Claude in M11 selbst ergänzt, der Nutzer hat sie mit dem Test bestätigt: Esc schließt das Inventarfenster ebenfalls, und das Fenster liegt über der Debug-Anzeige.
- Im Inventarfenster haben mehr als 20 Plätze noch keinen Raum; ein größeres Inventar braucht später Blättern oder einen größeren Rahmen.
- Eine Sache hat Claude in M10 selbst ergänzt, der Nutzer hat sie mit dem Test bestätigt: das goldene Funkeln beim Öffnen. Zurücknehmen ohne Code: in `world/chest/chest.tscn` den Knoten `OpenEffect` löschen.
- Schlüssel gibt es bisher nur für Truhen. Türen mit Schloss – das Paket hat dafür den Schlüsselloch-Block in `TilesetDungeon.png` – kommen, wenn ein Level sie braucht.
- Drei Dinge hat Claude in M9 selbst entschieden, der Nutzer hat sie mit dem Test bestätigt: keine Energie aus Zerstörbarem, Blätter je Hieb am Baum, der graugrüne Fels als Stein. Zurücknehmen ginge ohne Code: `feeds_attacker` an der Hurtbox anschalten, den Knoten `LeafHit` löschen, in `data/skins/rock.tres` eine andere Zelle wählen.
- Seit M16: Zerstörtes kommt nicht wieder, auch nicht nach F2, Tod oder Laden; Beute am Boden ist danach weg. Ob Dinge in Leveln später nachwachsen, etwa Töpfe, ist offen.
- Ein Kanal kennt nur ODER: Eine Tür ist offen, sobald einer ihrer Schalter an ist. Ein Tor, das zwei Hebel zugleich braucht, gibt es noch nicht.
- M15 – NPCs & Dialog ist fertig. Beim Bauen hat Claude selbst entschieden, vom Nutzer mit dem Test bestätigt: der Jäger als NPC, der nur Auskunft gibt; Belohnung und „erledigt“ an einzelnen Zeilen statt am ganzen Gespräch, damit der Schamane erst nach dem Geschenk zu seinem kurzen Satz wechselt; der wippende Pfeil, wenn es weitergeht; der Rahmen über dem Kästchen unter der Maus; nach dem Schließen greift die Figur erst nach dem Loslassen der Maustaste an. Alles lässt sich ohne Code zurücknehmen oder ändern – in den Werte-Dateien und Szenen.
- Nicht in M15: Händler und Schmied – Aufträge kamen mit M17, der Auftraggeber `QuestGiver` –; Antworten mit Bedingungen, etwa nur mit Schlüssel; „erledigt“ je Spieler; Ton (A3); NPCs, die umherlaufen; Gespräche, die von selbst beginnen, wenn man nah kommt.
- Während eines Gesprächs läuft die Welt weiter: Ein Gegner kann die Figur dabei treffen. Ob ein Treffer das Gespräch abbrechen soll, ist noch offen.
- Ton (A3): auf Wunsch des Nutzers verschoben, fast ans Ende des Projekts, mit Phase 7 – Feinschliff. Bis dahin hat kein Modul Ton; `SoundCue` und die Ton-Tabelle entstehen erst dann.
- Der Hieb-Effekt richtet sich nicht von selbst nach der Trefferzone: Ändern sich `start_distance` oder `reach` in `data/player/sword.tres`, ist `distance` am Knoten `SlashEffect` der Spielfigur nachzuziehen. Heute ist es 8, also `start_distance` + 2.
- Grafik, noch ungeprüft – Claude klärt das, bevor ein Schritt es braucht: Lage des Katanas über der Figur (erst wenn das Schwert sichtbar wird); Effekte, die im Katalog „unklar“ heißen (wenn ein Schritt sie braucht); alle Töne, bisher nur die Namen (A3); Übergangsregeln der Kacheln (A4); `TilesetFloor.png` mit 417 Pixeln Höhe, nicht durch 16 teilbar (A4).
- Schießen zeigt kein eigenes Bild der Figur; das Paket hat für die `NinjaGreen` keins. Die Geschosse haben seit M11a ihr Flugbild.
- Wer vor wem gezeichnet wird, richtet sich noch nach der Reihenfolge der Knoten. Eine Sortierung nach Höhe im Bild folgt mit den Kacheln in A4. Seit M9 fällt das am Baum auf: Läuft die Figur hinter seine Krone, steht sie trotzdem davor. Die Zeitkapsel hat deshalb seit M18 einen hohen Körper: Die Figur kommt nicht hinter sie.
- Zauber: „keine eigene Kategorie“ ist nur vorläufig gewählt. Die Entscheidung liegt beim Nutzer.
- Unsichtbarkeit: Seit M13 verlieren Gegner die Figur, und Treffer zählen doppelt, solange sie die Figur nicht bemerkt haben.
- Geschosse kommen seit M9 als Beute aus Töpfen, Kisten und Steinen nach, seit M10 auch aus Truhen. Energie aus Fläschchen und Speicherpunkten folgt später.
- Dynamit trifft die Spielfigur nicht. Ob es später auch eigenen Schaden geben soll, entscheidet der Nutzer.
- `data/player/ammo.tres` ist seit M11a nicht mehr eingehängt; `bow.tres` gilt nur noch ohne `AmmoSelector`. Beide bleiben vorerst liegen.
- Die Debug-Anzeige stößt an ihre Grenze, seit M9 mit bis zu zwölf Zeilen. Seit M12 zeigt das HUD Leben, Energie, Ausdauer, Fähigkeiten und Geschoss; die Debug-Anzeige bleibt zum Nachprüfen und steht oben rechts.
- Tod & Speichern: entschieden am 21.11.2026, gebaut mit M16 – siehe „Festlegungen“ und „Spielstand im Einzelnen (M16)“.
- Stottert die Bewegung auf einem Monitor mit mehr als 60 Hz, gibt es dafür die Physik-Interpolation als Projekteinstellung. Sie ist bewusst noch aus.
- Der Sicherungsordner `E:\GitHub\TT_alt` kann gelöscht werden, falls er noch existiert.
- In `components/`, `levels/test_chamber/`, `entities/player/`, `entities/npcs/` und `data/` liegt noch je eine `.gitkeep`, die nicht mehr gebraucht wird.
