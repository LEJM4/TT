# assets

Hier liegen Grafik und Ton.

## Ninja Adventure Asset Pack

Kopiere den **Inhalt** des Ordners `Ninja Adventure - Asset Pack` nach
`assets/ninja_adventure/`, sodass diese Struktur entsteht:

```
assets/ninja_adventure/Actor/...
assets/ninja_adventure/Audio/...
assets/ninja_adventure/Backgrounds/...
assets/ninja_adventure/FX/...
assets/ninja_adventure/Items/...
assets/ninja_adventure/Ui/...
assets/ninja_adventure/LICENSE.txt
```

Die Unterordner bitte nicht umbenennen – der Grafik-Katalog in
`docs/asset_katalog.md` verweist auf genau diese Pfade.

Beim nächsten Start liest Godot alle Bilder ein und legt neben jede Datei
eine `.import`-Datei. Diese `.import`-Dateien gehören mit ins Repo.

Quelle: https://pixel-boy.itch.io/ninja-adventure-asset-pack – Lizenz CC0.

## Eigene Testgrafik – `assets/test_art/`

Bilder, die nicht aus dem Paket stammen und vorerst für spätere Pixelgrafik stehen.

- `objects/zeitkapsel.jpg` – das Original der Zeitkapsel, 2048 × 2048. Das Schachbrett im Hintergrund ist Teil des Bildes, nicht durchsichtig; im Spiel wird es nicht benutzt.
- `objects/time_capsule.png` – die Zeitkapsel im Spiel (seit M18), 66 × 64 Pixel mit durchsichtigem Rand: aus dem Original gewonnen, verkleinert und gespiegelt, damit die Tür links liegt. Ein neues Bild in derselben Größe ersetzt sie ohne weitere Änderung; die Lage steht in `data/skins/time_capsule.tres`.
