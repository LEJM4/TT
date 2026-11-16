class_name Dash
extends Node
## Dash - kurzer, schneller Satz in eine Richtung als Baustein.
##
## Benutzung: die Szene dash.tscn als Kind an eine Figur hängen und im
## Inspektor eine Werte-Datei (DashStats) wählen. Die Figur meldet den
## Tastendruck mit request() und ruft try_start(richtung) auf, solange
## has_request() gilt. Während is_dashing wahr ist, bewegt sie sich mit
## get_velocity(). Liegt ein Geschwister "Health" daneben, ist die Figur
## beim Dash kurz unverwundbar.
##
## Abschalten: Knoten löschen - die Figur kann dann nicht mehr dashen.

## Ein Dash hat begonnen.
signal dash_started(direction: Vector2)
## Der Dash ist vorbei.
signal dash_finished

## Werte-Datei mit Strecke, Dauer, Schutz und Pause.
@export var stats: DashStats

## Läuft gerade ein Dash?
var is_dashing := false

var _velocity := Vector2.ZERO
var _time_left := 0.0
var _cooldown_left := 0.0
var _has_request := false
var _request_left := 0.0
var _health: Health


func _ready() -> void:
	if stats == null:
		push_warning("Dash: keine Werte-Datei gesetzt, nutze Standardwerte.")
		stats = DashStats.new()
	_health = get_parent().get_node_or_null("Health") as Health


func _physics_process(delta: float) -> void:
	if _cooldown_left > 0.0:
		_cooldown_left -= delta
	if _has_request:
		_request_left -= delta
		if _request_left < 0.0:
			_has_request = false
	if not is_dashing:
		return
	_time_left -= delta
	if _time_left <= 0.0:
		is_dashing = false
		dash_finished.emit()


## Merkt einen Dash-Wunsch vor. Er gilt in diesem Schritt und noch buffer_time lang.
func request() -> void:
	_has_request = true
	_request_left = stats.buffer_time


## Wartet ein Dash-Wunsch darauf, ausgeführt zu werden?
func has_request() -> bool:
	return _has_request


## Ist gerade ein neuer Dash möglich?
func is_ready() -> bool:
	return not is_dashing and _cooldown_left <= 0.0


## Sekunden, bis der nächste Dash möglich ist.
func get_cooldown_left() -> float:
	return maxf(_cooldown_left, 0.0)


## Tempo und Richtung des laufenden Dashs.
func get_velocity() -> Vector2:
	return _velocity


## Startet einen Dash in die Richtung, wenn es gerade möglich ist. Liefert, ob er begann.
func try_start(direction: Vector2) -> bool:
	if not is_ready() or direction == Vector2.ZERO:
		return false
	var tick := get_physics_process_delta_time()
	var ticks := maxi(roundi(stats.duration / tick), 1)
	# Tempo so, dass nach genau "ticks" Schritten die Strecke zurückgelegt ist.
	_velocity = direction.normalized() * (stats.distance / (ticks * tick))
	# Das Ende liegt mitten zwischen zwei Schritten; Rundungsfehler ändern die Schrittzahl nicht.
	_time_left = (ticks - 0.5) * tick
	_cooldown_left = stats.cooldown
	_has_request = false
	is_dashing = true
	if _health != null:
		_health.make_invulnerable(stats.invulnerable_time)
	dash_started.emit(_velocity.normalized())
	return true
