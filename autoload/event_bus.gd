extends Node
## EventBus - die zentrale Meldestelle des Spiels.
##
## Module kennen sich nicht direkt. Wer etwas mitzuteilen hat, sendet hier
## eine Meldung; wer es wissen will, hört zu.
##
## Neue Meldung:  eine Zeile "signal ..." in dieser Datei ergänzen
## Senden:        EventBus.name_der_meldung.emit(werte)
## Zuhören:       EventBus.name_der_meldung.connect(funktion)

## Testmeldung für den Setup-Check (M0).
@warning_ignore("unused_signal")
signal setup_checked(source: String)
