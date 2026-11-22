class_name UnlockInfo
extends Resource
## UnlockInfo - eine Freischaltung: eine Mechanik, die gesperrt sein kann (M19).
##
## Steht in der Werte-Datei data/unlocks/unlocks.tres (UnlockSettings).
## Spielstand, Fundstücke, Missionen und Gespräche nennen sie über ihre Kennung
## id, etwa "dash". Was sie sperrt, sagt die Kennung an der Spielfigur: Dash,
## Fernkampf und Schleichen am Baustein UnlockGate, eine Fähigkeit an ihrem
## unlock_id.

## Kennung: englisch, klein, eindeutig, etwa "dash".
@export var id: StringName = &""
## Name in der Anzeige, etwa "Dash". Die Schrift kennt kein ß, kein unteres
## Anführungszeichen, keinen Gedankenstrich und keine drei Punkte als ein Zeichen.
@export var title := ""
## Die Taste dazu, wie sie im Hinweis steht, etwa "Leertaste". Darf leer bleiben.
@export var key_hint := ""
## Symbol, etwa für das Fähigkeiten-Menü (M20). Darf leer bleiben.
@export var icon: Texture2D
## Ist sie von Anfang an frei? Dann lässt sie sich nicht sperren.
@export var unlocked_at_start := false


## Der Text im Hinweis oben in der Mitte, etwa "Dash (Leertaste)".
func get_notice_title() -> String:
	if key_hint.strip_edges().is_empty():
		return title
	return "%s (%s)" % [title, key_hint]
