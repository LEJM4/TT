class_name LootTable
extends Resource
## LootTable - Beute-Liste: was beim Zerstören herausfällt (M9; ab M10 auch in Truhen).
##
## Jede Zeile (LootEntry) wird einzeln gewürfelt; es kann also nichts, eins oder
## alles fallen. Die Listen liegen unter data/loot/. Gewürfelt wird mit roll() -
## vom LootDropper, an genau einer Stelle; später entscheidet das der Gastgeber.

## Die Zeilen der Liste.
@export var entries: Array[LootEntry] = []


## Würfelt jede Zeile einmal und liefert, was fällt, als Gegenstand mit Anzahl.
func roll() -> Array[ItemStack]:
	var result: Array[ItemStack] = []
	for entry in entries:
		if entry == null or entry.item == null or entry.amount <= 0:
			continue
		if entry.chance < 1.0 and randf() >= entry.chance:
			continue
		var stack := ItemStack.new()
		stack.item = entry.item
		stack.amount = entry.amount
		result.append(stack)
	return result
