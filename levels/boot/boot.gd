extends Node
## Boot - die Startszene des Spiels (M18), seit M20 mit dem Hauptmenü.
##
## Beim Start wendet sie die Optionen an - Lautstärke, Vollbild (GameOptions) -
## und schließt den Spielstand: Im Hauptmenü ist kein Platz offen, geschrieben
## wird erst, wenn in der Spielstand-Auswahl einer gewählt ist. Das Hauptmenü
## selbst ist ihr Kind MainMenu (ui/menus/main_menu/). Auch „Hauptmenü“ im
## Pausenmenü führt hierher zurück.
## Hauptszene des Projekts: Projekt -> Projekteinstellungen -> Anwendung ->
## Ausführen -> Hauptszene, oder im Dateisystem Rechtsklick auf boot.tscn ->
## "Als Hauptszene festlegen".
##
## Ohne MainMenu geht es wie vor M20 gleich weiter: mit dem Platz, der zuletzt
## gespeichert wurde, dort, wo das Spiel aufgehört hat (SceneManager.start_game()).
## Ohne SceneManager lädt sie dann fallback_scene, ohne Überblendung.

## Szene, die ohne Hauptmenü und ohne SceneManager geladen wird.
@export_file("*.tscn") var fallback_scene := "res://levels/test_chamber/test_chamber.tscn"


func _ready() -> void:
	GameOptions.ensure_applied()
	var saves := get_node_or_null("/root/SaveManager")
	if get_node_or_null("MainMenu") != null:
		if saves != null:
			saves.call("close_slot")
		return
	# Ohne Hauptmenü wie vor M20: weiter mit dem zuletzt gespeicherten Platz.
	if saves != null and int(saves.get("active_slot")) == 0:
		saves.call("open_slot", saves.call("get_last_slot"))
	var manager := get_node_or_null("/root/SceneManager")
	if manager != null:
		manager.call_deferred("start_game")
	elif not fallback_scene.is_empty():
		get_tree().change_scene_to_file.call_deferred(fallback_scene)
	else:
		push_warning("Boot: kein Hauptmenü, kein SceneManager und keine Ersatzszene - es geht nicht weiter.")
