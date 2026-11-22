class_name GameOptions
extends RefCounted
## GameOptions - die Einstellungen des Spielers an einer Stelle (M20):
## Lautstärke für alles, Musik und Geräusche, Vollbild und ob die Missionsliste
## eingeklappt ist.
##
## Sie stehen in einer eigenen Datei, getrennt von den Spielständen und für alle
## drei Plätze gleich: user://options.cfg, unter Windows in
## %APPDATA%\Godot\app_userdata\TimeTraveller\. Ohne Datei gelten die Grundwerte
## aus data/ui/options.tres (OptionsDefaults).
## Alles hier ist statisch - kein Knoten, kein globaler Dienst, nichts in
## project.godot. Wer eine Einstellung braucht, fragt hier: das Optionen-Menü,
## die Missionsanzeige. Gelesen wird die Datei beim ersten Bedarf. set_value()
## ändert eine Einstellung, wendet sie sofort an und schreibt die Datei.
## apply_all() wendet alle an; die Startszene ruft beim Start ensure_applied().
##
## Lautstärke: auf die Audio-Busse Master, Music und Sounds aus
## default_bus_layout.tres im Projektordner; 0 schaltet stumm. Hören lässt sich
## Musik und Geräusch erst mit A3 - Ton.
## Vollbild: das Fenster des Spiels. Läuft das Spiel im Editor eingebettet, lässt
## Godot das Fenster nicht umschalten - der Wert wird gemerkt und gilt, sobald
## das Spiel in einem eigenen Fenster läuft.
##
## Zurücksetzen: user://options.cfg löschen - dann gelten wieder die Grundwerte.

## Datei mit den Einstellungen des Spielers.
const OPTIONS_PATH := "user://options.cfg"
## Werte-Datei mit den Grundwerten.
const DEFAULTS_PATH := "res://data/ui/options.tres"

## Namen der Einstellungen, auch die Schlüssel in der Datei.
const MASTER_VOLUME := &"master_volume"
const MUSIC_VOLUME := &"music_volume"
const SOUND_VOLUME := &"sound_volume"
const FULLSCREEN := &"fullscreen"
const MISSIONS_COLLAPSED := &"missions_collapsed"

## Einstellung -> Abschnitt in der Datei.
const SECTIONS := {
	MASTER_VOLUME: "audio",
	MUSIC_VOLUME: "audio",
	SOUND_VOLUME: "audio",
	FULLSCREEN: "display",
	MISSIONS_COLLAPSED: "interface",
}
## Lautstärke -> Audio-Bus.
const BUSES := {
	MASTER_VOLUME: &"Master",
	MUSIC_VOLUME: &"Music",
	SOUND_VOLUME: &"Sounds",
}

static var _values := {}
static var _loaded := false
static var _applied := false
static var _warned_embedded := false


## Der Wert einer Einstellung, etwa GameOptions.get_value(GameOptions.FULLSCREEN).
static func get_value(key: StringName) -> Variant:
	_ensure_loaded()
	return _values.get(key)


## Eine Lautstärke von 0 bis 1.
static func get_volume(key: StringName) -> float:
	return clampf(float(get_value(key)), 0.0, 1.0)


## Läuft das Spiel im Vollbild?
static func is_fullscreen() -> bool:
	return bool(get_value(FULLSCREEN))


## Ist die Missionsliste eingeklappt?
static func is_missions_collapsed() -> bool:
	return bool(get_value(MISSIONS_COLLAPSED))


## Ändert eine Einstellung, wendet sie sofort an und schreibt die Datei.
## Liefert, ob die Datei geschrieben ist.
static func set_value(key: StringName, value: Variant) -> bool:
	_ensure_loaded()
	if not SECTIONS.has(key):
		push_warning("GameOptions: Die Einstellung \"%s\" gibt es nicht." % key)
		return false
	_values[key] = _clean(key, value)
	_apply(key)
	return save()


## Wendet alle Einstellungen an: Lautstärke und Vollbild.
static func apply_all() -> void:
	_ensure_loaded()
	for key: StringName in SECTIONS:
		_apply(key)
	_applied = true


## Wie apply_all(), aber nur beim ersten Aufruf in diesem Spiel - die Startszene
## ruft es bei jedem Besuch auf.
static func ensure_applied() -> void:
	if not _applied:
		apply_all()


## Schreibt alle Einstellungen in die Datei. Liefert, ob es ging.
static func save() -> bool:
	_ensure_loaded()
	var file := ConfigFile.new()
	for key: StringName in SECTIONS:
		file.set_value(SECTIONS[key], String(key), _values[key])
	var error := file.save(OPTIONS_PATH)
	if error != OK:
		push_warning("GameOptions: %s lässt sich nicht schreiben (Fehler %d)." % [OPTIONS_PATH, error])
		return false
	return true


## Liest die Datei neu - fehlt sie, gelten die Grundwerte.
static func reload() -> void:
	_values = _defaults()
	_loaded = true
	if not FileAccess.file_exists(OPTIONS_PATH):
		return
	var file := ConfigFile.new()
	var error := file.load(OPTIONS_PATH)
	if error != OK:
		push_warning("GameOptions: %s ist unlesbar (Fehler %d) - es gelten die Grundwerte." % [OPTIONS_PATH, error])
		return
	for key: StringName in SECTIONS:
		var section: String = SECTIONS[key]
		if file.has_section_key(section, String(key)):
			_values[key] = _clean(key, file.get_value(section, String(key)))


static func _ensure_loaded() -> void:
	if not _loaded:
		reload()


# Die Grundwerte aus der Werte-Datei; ohne sie feste Werte.
static func _defaults() -> Dictionary:
	var defaults: OptionsDefaults = null
	if ResourceLoader.exists(DEFAULTS_PATH):
		defaults = load(DEFAULTS_PATH) as OptionsDefaults
	if defaults == null:
		push_warning("GameOptions: %s fehlt - es gelten feste Grundwerte." % DEFAULTS_PATH)
		defaults = OptionsDefaults.new()
	return {
		MASTER_VOLUME: clampf(defaults.master_volume, 0.0, 1.0),
		MUSIC_VOLUME: clampf(defaults.music_volume, 0.0, 1.0),
		SOUND_VOLUME: clampf(defaults.sound_volume, 0.0, 1.0),
		FULLSCREEN: defaults.fullscreen,
		MISSIONS_COLLAPSED: defaults.missions_collapsed,
	}


# Ein Wert in der Form, die die Einstellung braucht: Lautstärken als Zahl von 0
# bis 1, alles andere als ja oder nein.
static func _clean(key: StringName, value: Variant) -> Variant:
	if BUSES.has(key):
		if value is float or value is int:
			return clampf(float(value), 0.0, 1.0)
		return 1.0
	return value == true


static func _apply(key: StringName) -> void:
	if BUSES.has(key):
		_apply_volume(BUSES[key], float(_values[key]))
	elif key == FULLSCREEN:
		_apply_fullscreen(bool(_values[key]))


static func _apply_volume(bus_name: StringName, volume: float) -> void:
	var bus := AudioServer.get_bus_index(bus_name)
	if bus < 0:
		return
	AudioServer.set_bus_mute(bus, volume <= 0.0)
	AudioServer.set_bus_volume_db(bus, linear_to_db(maxf(volume, 0.001)))


static func _apply_fullscreen(on: bool) -> void:
	if DisplayServer.get_name() == "headless":
		return
	if Engine.is_embedded_in_editor():
		if not _warned_embedded:
			_warned_embedded = true
			push_warning("GameOptions: Das Spiel läuft im Editor eingebettet - Vollbild gilt erst im eigenen Fenster.")
		return
	var mode := DisplayServer.window_get_mode()
	var full := mode == DisplayServer.WINDOW_MODE_FULLSCREEN or mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
	if on and not full:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif not on and full:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
