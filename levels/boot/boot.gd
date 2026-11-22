extends Node
## Boot - die Startszene des Spiels (M18).
##
## Sie zeigt nichts und gibt sofort an den SceneManager ab: Er setzt das Spiel
## dort fort, wo es aufgehört hat - im laufenden Level, in der Zeitkapsel oder
## mit einem neuen Lauf im Startlevel. Mit M20 kommt hier das Startmenü dazu.
## Hauptszene des Projekts: Projekt -> Projekteinstellungen -> Anwendung ->
## Ausführen -> Hauptszene, oder im Dateisystem Rechtsklick auf boot.tscn ->
## "Als Hauptszene festlegen".
##
## Ohne SceneManager lädt sie fallback_scene, ohne Überblendung.

## Szene, die ohne SceneManager geladen wird.
@export_file("*.tscn") var fallback_scene := "res://levels/test_chamber/test_chamber.tscn"


func _ready() -> void:
	var manager := get_node_or_null("/root/SceneManager")
	if manager != null:
		manager.call_deferred("start_game")
	elif not fallback_scene.is_empty():
		get_tree().change_scene_to_file.call_deferred(fallback_scene)
	else:
		push_warning("Boot: kein SceneManager und keine Ersatzszene - es geht nicht weiter.")
