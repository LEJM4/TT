class_name HealthStats
extends Resource
## HealthStats - Werte-Datei für den Baustein Health.
##
## Beispiele: data/player/health.tres, data/dummy/health.tres.

## Größtes Leben.
@export var max_health := 100.0
## Sekunden Unverwundbarkeit nach einem Treffer. 0 schaltet sie ab.
@export var invulnerable_time := 0.0
