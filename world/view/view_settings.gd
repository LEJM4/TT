class_name ViewSettings
extends Resource
## ViewSettings - wie groß die Welt auf dem Bild erscheint, und die Kachel als Maß (M13).
##
## Die Werte stehen in data/world/view.tres. Kamera, Wahrnehmung der Gegner und
## Testkammer lesen dieselbe Datei.
##
## Skalierung: Die Welt rechnet immer in Pixeln der Grafik - 1 Kachel = 16 Pixel.
## world_scale ändert nur, wie groß die Kamera sie zeichnet. Abstände, Tempo und
## Trefferzonen bleiben gleich; nichts wird mit dem Faktor multipliziert.
## HUD, Fenster und Debug-Anzeige zoomen nicht mit.
##
## Fairness: Ein Gegner bemerkt eine Figur nur, wenn er auf ihrem Bild steht -
## mindestens fair_margin_tiles vom Rand entfernt. So sieht die Figur jeden
## Gegner, bevor er sie bemerkt, bei jedem Zoom.
##
## Ändern: data/world/view.tres doppelklicken. Zum Ausprobieren schaltet F3 in der
## Testkammer den Zoom 1 bis 4 durch; die Datei bleibt dabei, wie sie ist.

## Kantenlänge einer Kachel in Pixeln der Grafik - das Maß für Abstände.
const TILE_SIZE := 16.0
## Größter Zoom; F3 schaltet bis hierher und beginnt dann wieder bei 1.
const MAX_SCALE := 4

## Vergrößerung der Welt, nur ganze Zahlen - so bleiben die Pixel scharf.
## Sichtbar bei 480 × 270: 1 = 30 × 17 Kacheln, 2 = 15 × 8,4, 3 = 10 × 5,6, 4 = 7,5 × 4,2.
@export_range(1, 4, 1) var world_scale := 2
## So viele Kacheln muss ein Gegner mindestens vom Bildrand einer Figur entfernt
## sein, damit er sie bemerken kann. 0: Der Bildrand selbst ist die Grenze.
@export_range(0.0, 4.0, 0.25) var fair_margin_tiles := 1.0


## Kacheln in Pixel der Grafik.
static func tiles(count: float) -> float:
	return count * TILE_SIZE


## Sichtbarer Ausschnitt der Welt in Pixeln der Grafik bei dieser Bildgröße.
func visible_size(viewport_size: Vector2) -> Vector2:
	return viewport_size / float(maxi(world_scale, 1))


## Halbe Breite und Höhe des Bereichs um eine Figur, in dem ein Gegner sie
## bemerken kann, in Pixeln der Grafik.
func fair_half_extent(viewport_size: Vector2) -> Vector2:
	var half := visible_size(viewport_size) * 0.5 - Vector2.ONE * tiles(fair_margin_tiles)
	return half.max(Vector2.ZERO)
