class_name EnemyAttackStats
extends Resource
## EnemyAttackStats - wann ein Gegner einen Angriff einsetzt (M14).
##
## Werte-Datei für ein Angriffs-Modul (EnemyAttack). Wie der Angriff selbst
## trifft - Schaden, Trefferzone, Geschoss, Pause bis zum nächsten -, steht in
## der Werte-Datei seiner Waffe (MeleeStats, RangedStats).
## Beispiele: data/enemies/caveman_attack.tres (Nahkampf),
## data/enemies/stone_thrower_attack.tres (Fernkampf).
## Abstände stehen in Kacheln (1 Kachel = 16 Pixel der Grafik), gemessen von
## Mitte zu Mitte; der Zoom ändert sie nicht.

@export_group("Abstand")
## Näher als das weicht er zurück, solange er sein Ziel sieht, in Kacheln.
## 0: Er geht so nah heran, wie seine Waffe es braucht.
@export var min_tiles := 0.0
## Weiter weg greift er nicht an, in Kacheln. 0: so weit, wie seine Waffe reicht.
## Mehr, als die Waffe reicht, geht nicht.
@export var max_tiles := 0.0
## Greift er nur an, wenn nichts dazwischen ist - keine Wand, kein Block?
@export var needs_line_of_sight := false

@export_group("Zeit")
## So lange steht er nach dem Angriff still, bevor er weiter verfolgt, in Sekunden.
@export var recover_time := 0.6
