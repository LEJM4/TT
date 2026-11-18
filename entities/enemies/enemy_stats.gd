class_name EnemyStats
extends Resource
## EnemyStats - Werte-Datei eines Gegners: Tempo, Zeiten und Kampf (M13).
##
## Die Werte des Höhlenmenschen stehen in data/enemies/caveman.tres. Leben,
## Schlag, Sehen und Hören stehen in eigenen Werte-Dateien daneben.
## Abstände stehen in Kacheln (1 Kachel = 16 Pixel der Grafik), Tempo in Pixeln
## pro Sekunde - so lässt es sich mit der Spielfigur vergleichen (Gehen 80).
## Die Schlagweite steht nicht hier: Er schlägt zu, sobald die Figur in der
## Trefferzone seines Schlags steht (MeleeStats: start_distance + reach).

@export_group("Tempo")
## Tempo auf Patrouille und auf dem Rückweg, in Pixeln pro Sekunde.
@export var patrol_speed := 30.0
## Tempo beim Verfolgen, in Pixeln pro Sekunde.
@export var chase_speed := 60.0
## Tempo auf dem Weg zur letzten bekannten Stelle, in Pixeln pro Sekunde.
@export var search_speed := 45.0

@export_group("Zeiten")
## So lange wartet er an jedem Ende der Patrouille, in Sekunden.
@export var patrol_wait := 1.0
## So lange bleibt er stehen, wenn er eine Figur bemerkt - das "!" -, in Sekunden.
@export var alert_time := 0.4
## So lange darf er die Figur aus den Augen verlieren, bevor er sucht, in Sekunden.
@export var lose_time := 1.5
## Pause nach einem Schlag, bevor er weiter verfolgt, in Sekunden.
@export var attack_recover := 0.6
## So lange schaut er sich an der letzten bekannten Stelle um, in Sekunden.
@export var search_time := 3.0
## Nach so vielen Sekunden dreht er sich beim Umschauen um 90°.
@export var look_interval := 0.75
## Höchstens so lange geht er zur letzten bekannten Stelle, dann schaut er sich um, in Sekunden.
@export var search_walk_limit := 4.0
## Kommt er auf dem Rückweg so lange nicht voran, patrouilliert er von dort aus, in Sekunden.
@export var give_up_time := 1.5
## So lange bleibt er nach dem Tod liegen, bevor er verschwindet, in Sekunden.
@export var remove_delay := 1.0

@export_group("Kampf")
## Faktor auf Treffer, solange er die Figur nicht bemerkt hat - Überraschung.
@export var surprise_factor := 2.0
## Wird er unbemerkt getroffen, sucht er so weit in der Richtung des Angreifers, in Kacheln.
@export var hit_search_tiles := 2.0
