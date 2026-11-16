class_name Hitbox
extends Area2D
## Hitbox - teilt Schaden an jede Hurtbox aus, die sie berührt.
##
## Benutzung: die Szene hitbox.tscn einhängen, darunter eine CollisionShape2D
## legen und im Inspektor als Maske die Ebene der Ziele wählen:
## "enemy_hurtbox" trifft Gegner, "player_hurtbox" trifft Spieler.
## Scharf ist sie nur zwischen activate() und deactivate() - oder dauerhaft
## mit active_on_start, etwa für ein Schadensfeld.
##
## Abschalten: Knoten löschen - es wird kein Schaden mehr ausgeteilt.

## Ein Treffer hat Schaden gemacht.
signal hit_landed(hurtbox: Hurtbox)

## Schaden pro Treffer.
@export var damage := 10.0
## Sekunden zwischen zwei Treffern auf dasselbe Ziel. 0: jedes Ziel nur einmal je Aktivierung.
@export var hit_interval := 0.0
## Von Anfang an scharf?
@export var active_on_start := false

## Ist die Hitbox gerade scharf?
var is_active := false

# Zeitpunkt des letzten Treffers je Ziel; Schlüssel ist die Kennung der Hurtbox.
var _last_hit := {}
var _clock := 0.0
var _frames_to_skip := 0


func _ready() -> void:
	if active_on_start:
		activate()


## Macht die Hitbox scharf. Jedes Ziel kann wieder getroffen werden.
func activate() -> void:
	is_active = true
	_last_hit.clear()
	# Die Physik kennt eine neue Lage erst nach ihrem nächsten Schritt.
	_frames_to_skip = 1


## Entschärft die Hitbox.
func deactivate() -> void:
	is_active = false


func _physics_process(delta: float) -> void:
	if not is_active:
		return
	_clock += delta
	if _frames_to_skip > 0:
		_frames_to_skip -= 1
		return
	for area in get_overlapping_areas():
		var hurtbox := area as Hurtbox
		if hurtbox == null:
			continue
		var target_id := hurtbox.get_instance_id()
		if _last_hit.has(target_id):
			if hit_interval <= 0.0:
				continue
			var since: float = _clock - _last_hit[target_id]
			if since < hit_interval:
				continue
		var direction := (hurtbox.global_position - global_position).normalized()
		if hurtbox.receive_hit(damage, direction):
			_last_hit[target_id] = _clock
			hit_landed.emit(hurtbox)
