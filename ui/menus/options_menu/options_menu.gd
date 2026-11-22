extends MenuScreen
## OptionsMenu - die Optionen (M20): Lautstärke für alles, Musik und Geräusche,
## Vollbild und die Tastenbelegung zum Ansehen.
##
## Dasselbe Menü öffnen Hauptmenü und Pausenmenü; beide hängen es als Kind an.
## Jede Änderung gilt sofort und steht gleich in user://options.cfg - das
## erledigt GameOptions. Die Lautstärke geht in Schritten von 10 %, mit der Maus
## oder mit Pfeil links und rechts, A und D. Musik und Geräusche sind erst mit
## A3 - Ton zu hören. Läuft das Spiel im Editor eingebettet, steht unter dem
## Vollbild ein Hinweis: Dort lässt Godot das Fenster nicht umschalten.
## „Tastenbelegung“ zeigt die Tasten (ui/menus/key_list/); ändern kommt später.

@onready var _master := $Root/Window/Interior/Rows/Volumes/Master as HSlider
@onready var _music := $Root/Window/Interior/Rows/Volumes/Music as HSlider
@onready var _sound := $Root/Window/Interior/Rows/Volumes/Sound as HSlider
@onready var _master_value := $Root/Window/Interior/Rows/Volumes/MasterValue as Label
@onready var _music_value := $Root/Window/Interior/Rows/Volumes/MusicValue as Label
@onready var _sound_value := $Root/Window/Interior/Rows/Volumes/SoundValue as Label
@onready var _fullscreen := $Root/Window/Interior/Rows/Fullscreen as CheckBox
@onready var _embedded_hint := $Root/Window/Interior/Rows/EmbeddedHint as Label
@onready var _keys := $Root/Window/Interior/Rows/Keys as Button
@onready var _back := $Root/Window/Interior/Rows/Back as Button
@onready var _key_list := $KeyList as MenuScreen


func _ready() -> void:
	super._ready()
	_master.value_changed.connect(_on_volume_changed.bind(GameOptions.MASTER_VOLUME, _master_value))
	_music.value_changed.connect(_on_volume_changed.bind(GameOptions.MUSIC_VOLUME, _music_value))
	_sound.value_changed.connect(_on_volume_changed.bind(GameOptions.SOUND_VOLUME, _sound_value))
	_fullscreen.toggled.connect(_on_fullscreen_toggled)
	_keys.pressed.connect(open_child.bind(_key_list))
	_back.pressed.connect(back)


func _before_open() -> void:
	_show_volume(_master, _master_value, GameOptions.MASTER_VOLUME)
	_show_volume(_music, _music_value, GameOptions.MUSIC_VOLUME)
	_show_volume(_sound, _sound_value, GameOptions.SOUND_VOLUME)
	_fullscreen.set_pressed_no_signal(GameOptions.is_fullscreen())
	_embedded_hint.visible = Engine.is_embedded_in_editor()


func _show_volume(slider: HSlider, label: Label, key: StringName) -> void:
	var percent := roundf(GameOptions.get_volume(key) * 100.0)
	slider.set_value_no_signal(percent)
	label.text = "%d %%" % roundi(percent)


func _on_volume_changed(value: float, key: StringName, label: Label) -> void:
	GameOptions.set_value(key, value / 100.0)
	label.text = "%d %%" % roundi(value)


func _on_fullscreen_toggled(on: bool) -> void:
	GameOptions.set_value(GameOptions.FULLSCREEN, on)
