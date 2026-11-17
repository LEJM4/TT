# Grafik-Katalog – Ninja Adventure Asset Pack

Stand: 17.11.2026 · erstellt aus der Dateiliste (Namen und Pixelgrößen) · **am 16.11.2026 teilweise am Bild geprüft** – siehe „Prüfstand am Bild“ am Ende

- Quelle: https://pixel-boy.itch.io/ninja-adventure-asset-pack – Lizenz CC0
- Ablage im Projekt: `assets/ninja_adventure/` (alle Pfade unten sind relativ dazu)
- Umfang: 2.234 Dateien – 1.915 PNG, 128 GIF (nur Vorschauen), 147 WAV, 41 OGG, 1 TTF
- Stil: Pixelart in Draufsicht, Grundraster 16 × 16 Pixel

**Lesehilfe:** „4 × 4 à 16“ heißt 4 Spalten × 4 Zeilen, jedes Bild 16 × 16 Pixel.
Ein ⚠ markiert eine Annahme, die nur aus den Maßen abgeleitet ist. „Geprüft“ heißt: Claude hat das Bild vergrößert angesehen; „gesichtet“ heißt: Inhalt grob angesehen, Einzelheiten offen.

## Überblick

| Bereich | Ordner | Anzahl | Grundmaß |
| --- | --- | --- | --- |
| Figuren | `Actor/Character/` | 92 | 16 × 16 je Bild |
| Animierte Hauptfigur | `Actor/CharacterAnimated/` | 1 Figur, 5 Waffen | 32 × 32 je Bild |
| Monster | `Actor/Monster/` | 66 | 16 × 16 je Bild |
| Bosse | `Actor/Boss/` | 20 | 40 bis 96 je Bild |
| Tiere | `Actor/Animal/` | 26 | meist 16 × 16 je Bild |
| Kacheln | `Backgrounds/Tilesets/` | 23 Tilesets | 16 × 16 je Kachel |
| Animierte Kacheln | `Backgrounds/Animated/` | 9 Gruppen | meist 16 × 16 |
| Effekte | `FX/` | 75 Bilder | Streifen |
| Gegenstände | `Items/` | 140 Bilder | bis 16 × 16 |
| Oberfläche | `Ui/` | 359 Bilder | gemischt |
| Ton | `Audio/` | 41 Musik, 147 Geräusche | OGG, WAV |

## Figuren – `Actor/Character/<Name>/`

Jede Figur hat ein Gesamtblatt, dieselben Animationen einzeln und ein Porträt.

| Datei | Größe | Aufteilung | Inhalt |
| --- | --- | --- | --- |
| `SpriteSheet.png` | 64 × 112 | 4 × 7 à 16 | alles in einem Blatt: Zeilen 1–4 Laufen, 5 Angriff, 6 Sprung, 7 Tod, Gegenstand und zwei Sonderposen – geprüft |
| `SeparateAnim/Walk.png` | 64 × 64 | 4 × 4 à 16 | Laufen: 4 Blickrichtungen × 4 Bilder – geprüft |
| `SeparateAnim/Idle.png` | 64 × 16 | 4 × 1 à 16 | Stehen: ein Bild je Blickrichtung |
| `SeparateAnim/Attack.png` | 64 × 16 | 4 × 1 à 16 | Angriff: ein Bild je Blickrichtung |
| `SeparateAnim/Jump.png` | 64 × 16 | 4 × 1 à 16 | Sprung: ein Bild je Blickrichtung |
| `SeparateAnim/Dead.png` | 16 × 16 | 1 Bild | Tod |
| `SeparateAnim/Item.png` | 16 × 16 | 1 Bild | Gegenstand hochhalten |
| `SeparateAnim/Special1.png`, `Special2.png` | 16 × 16 | je 1 Bild | Sonderposen |
| `Faceset.png` | 38 × 38 | 1 Bild | Porträt für Dialoge |

Die vier Spalten sind die Blickrichtungen, von links: unten, oben, links, rechts – geprüft am 16.11.2026 an NinjaGreen und Caveman.

**Nach Thema**

- **Steinzeit:** Caveman, Caveman2, Cavegirl, Cavegirl2, CaveLion, CaveLion2
- **Antike, Orient:** GladiatorBlue, RedGladiator, Sultan, Sultan2
- **Mittelalter:** Knight, KnightGold, Noble, Princess, Hunter, Monk, Monk2, Shaman, ShamanLion, SorcererBlack, SorcererOrange, Skeleton, SkeletonDemon, Vampire
- **Dorfbewohner:** Villager, Villager2 bis Villager6, Village6, Boy, Child, Woman, OldWoman, OldMan, OldMan2, OldMan3, ManGreen
- **Japan:** NinjaBlue, NinjaBlue2, NinjaBomb, NinjaDark, NinjaEskimo, NinjaFire, NinjaGray, NinjaGreen, NinjaLeaf, NinjaMageBlack, NinjaMageOrange, NinjaMasked, NinjaRed, NinjaRed2, NinjaThunder, NinjaWater, NinjaYellow, RedNinja3, Samurai, SamuraiBlue, SamuraiRed, Master, Tengu, Tengu2, FighterRed, FighterWhite
- **Modern, Zukunft:** RobotGreen, RobotGrey, RobotCamouflage, CamouflageGreen, CamouflageRed, Inspector
- **Fabelwesen und Sonstige:** DemonGreen, DemonRed, EggBoy, EggGirl, Eskimo, Flam, GoldStatue, Statue, GreenPig, Pig, Lion, LionBoy, LionOrange, LionYellow, MaskFrog, MaskRacoon, MaskGoldRacoon, Monkey, MonkeyBoxerBlue, MonkeyBoxerRed, Spirit

**Abweichungen**

- `Child` und `OldWoman`: nur `SpriteSheet.png` mit 64 × 32, kein `SeparateAnim/`
- `NinjaFire`, `NinjaLeaf`, `NinjaThunder`, `NinjaWater`: kein `SeparateAnim/Idle.png`
- `MaskFrog`: `Dead14.png` liegt neben dem Gesamtblatt, `SeparateAnim/Dead.png` fehlt
- `SamuraiRed`: das Gesamtblatt heißt `redsamurai.png`
- `ManGreen`: das Porträt heißt `Faceset1.png`
- `Cavegirl2`: Porträt 37 × 38

## Animierte Hauptfigur – `Actor/CharacterAnimated/NinjaGreen/`

Die einzige Figur mit vollem Bewegungsumfang – Kandidat für die Spielfigur.
Gesamtblatt `SpriteSheet.png` mit 256 × 544; einzeln unter `Separate/`:

| Datei | Größe | Aufteilung à 32 | Nutzen im Spiel |
| --- | --- | --- | --- |
| `Idle.png` | 128 × 128 | 4 × 4 | Stehen |
| `Walk.png` | 128 × 128 | 4 × 4 | Laufen |
| `Attack.png` | 128 × 128 | 4 × 4 | Nahkampf |
| `Roll.png` | 128 × 96 | 4 × 3 | Dash |
| `Push.png` | 128 × 128 | 4 × 4 | Kisten schieben |
| `Jump.png` | 96 × 128 | 3 × 4 | Sprung |
| `Hit.png` | 128 × 64 | 4 × 2 | Treffer |
| `Dead.png` | 32 × 64 | 1 × 2 | Tod |
| `Item.png` | 32 × 64 | 1 × 2 | Gegenstand hochhalten |
| `Pickup.png` | 32 × 64 | 1 × 2 | Aufheben |
| `Climb.png` | 32 × 128 | 1 × 4 | Klettern |
| `Swim.png` | 128 × 128 | 4 × 4 | Schwimmen |

Waffen dazu in `Actor/CharacterAnimated/Weapon/`: `Axe.png`, `Hammer.png`, `Katana.png`, `Net.png`, `Pickaxe.png`, je 256 × 256.
Geprüft am 16.11.2026: Jedes Bild ist 32 × 32. Bei Blättern mit vier Spalten sind die Spalten die Blickrichtungen – unten, oben, links, rechts –, die Zeilen die Bilder der Animation. `Katana.png` hat 4 × 4 Bilder à 64 im Raster von `Attack.png`. ⚠ Wie die Waffe über der Figur liegt, zeigt erst Godot.

## Monster – `Actor/Monster/<Name>/`

66 Monster. Blatt mit 64 × 64 = 4 × 4 à 16: Spalten = Blickrichtungen wie bei den Figuren, Zeilen = 4 Laufbilder – geprüft an Slime; dazu `Faceset.png` mit 38 × 38.
Das Blatt heißt `SpriteSheet.png` oder wie das Monster (`Beast.png`, `Slime.png`, `mushroom.png` …).

Axolot, AxolotBlue, Bamboo, BambooYellow, Bear, Beast, Beast2, BlueBat, Butterfly, ButterflyBlue, Cyclope, Cyclope2, Dragon, DragonYellow, Eye, Eye2, Fish, FishRed, Flam, Flam2, GoldRacoon, GreenOctopus, Grey Trex, HeartGreen, HeartRed, KappaGreen, KappaRed, LanternGreen, LanternRed, Larva, Larva2, Lizard, Lizard2, Mole, Mole2, Mollusc, Mollusc2, Mouse, MouseBlack, Mushroom, Mushroom2, Octopus, Octopus2, Owl, Owl2, Panda, Racoon, RedOctopus, Reptile, Reptile2, Skull, SkullBlue, Slime, Slime2, Slime3, Slime4, Snake, Snake2, Snake3, Snake4, SpiderRed, SpiderYellow, Spirit, Spirit2, TRex, YellowsBat

## Bosse – `Actor/Boss/<Name>/`

Jede Animation ist ein waagerechter Streifen. Die Bildgröße stammt aus der zugehörigen Vorschau-GIF, die Bildzahl aus Streifenbreite ÷ Bildbreite.

| Boss | Bild | Animationen (Bilder) |
| --- | --- | --- |
| DemonCyclop, DemonCyclop2 | 50 × 50 | Idle 5, Walk 6, Hit 3 |
| GiantFlam, GiantSpirit | 50 × 50 | Idle 5, Hit 3 |
| GiantBamboo, GiantBamboo2 | 62 × 62 | Idle 6, Walk 12, Attack 5, Charge 3, Hit 4 |
| GiantFrog, GiantFrog2 | 40 × 40 | Idle 5, Jump 6, Attack 3, Charge 7, Hit 3 |
| GiantRacoon, GiantRacoonGold | 60 × 60 | Idle 6, Jump 5, Attack 4, Charge 2 |
| GiantSlime, GiantSlime2 | 62 × 52 | Idle 5, Jump 13, Hit 5 |
| GiantBlueSamurai, GiantRedSamurai | 96 × 48, Angriff 96 × 96 | Idle 6, Walk 6, Hit 4, AttackLeft/Right 4, ChargeLeft/Right 3 |
| SquidGreen, SquidRed | 76 × 79 | Idle 4, Walk 4, Attack 6, AttackLoop 4, Shoot 5, Hit 4 |
| TenguRed | 82 × 82 | Idle 6, Walk 10, Attack 15, Trans 11, Hit 8 |
| TenguBlue | 68 × 68, Walk und Attack 82 × 82 | Idle 6, Walk 10, Attack 15, Trans 11, Hit 8 |
| DragonBlue, DragonGreen | Einzelteile | `Head` 44 × 46, `Body1` und `Body2` 31 × 27, `BodyEnd` 29 × 40, `Wing` 57 × 57 – ein Boss aus Gliedern |

Hinweis: Bei `GiantFrog` heißt die Datei `Idle40x40.png`, bei `GiantFrog2` `Idle.png`.

## Tiere – `Actor/Animal/<Name>/`

26 Tiere, meist mehrere Farben. Regelfall: `SpriteSheet<Farbe>.png` mit 32 × 16 = 2 Bilder à 16; dazu `Faceset<Farbe>.png` mit 38 × 38.

Cat, CatBlack, CatCyclop, CatOrange, CatWhite, Chicken, Cow, Dog, Dog2, DogBlack, DogOrange, DogYellow, Donkey, Fish, Frog, Hamster, Horse, Hyena, Lion, LionCub, Lioness, Monkey, Parrot, Pig, Racoon, WildBoar

Abweichende Maße (⚠ jeweils 2 Bilder nebeneinander): CatOrange 44 × 17, CatWhite 34 × 15, DogBlack 36 × 17, DogOrange 36 × 16, DogYellow 42 × 17, Hamster 30 × 13 bis 15, Hyena 28 × 13, WildBoar 34 × 16, Lion und Lioness 32 × 23.
Seitenansichten: Cow 48 × 16, Donkey und Horse 46 × 16, Lion und Lioness 60 × 16.

## Kacheln – `Backgrounds/Tilesets/`

Alle im 16er-Raster. Der Inhalt ist aus dem Namen geschlossen, außer wo „gesichtet“ steht.

| Datei | Größe | Kacheln | Inhalt laut Name |
| --- | --- | --- | --- |
| `TilesetNature.png` | 384 × 336 | 24 × 21 | Bäume, Felsen, Büsche – gesichtet |
| `TilesetRelief.png` | 320 × 192 | 20 × 12 | Klippen, Höhenstufen – gesichtet |
| `TilesetReliefDetail.png` | 192 × 192 | 12 × 12 | Details für Felsen |
| `TilesetFloor.png` | 352 × 417 | 22 × ⚠ 26 | Böden: Gras, Erde, Sand, Schnee – gesichtet; Höhe kein Vielfaches von 16 |
| `TilesetFloorB.png` | 176 × 112 | 11 × 7 | Böden |
| `TilesetFloorDetail.png` | 256 × 80 | 16 × 5 | Bodendetails |
| `TilesetField.png` | 80 × 240 | 5 × 15 | Felder |
| `TilesetWater.png` | 448 × 272 | 28 × 17 | Wasser, Ufer |
| `TilesetHole.png` | 176 × 80 | 11 × 5 | Löcher, Gruben |
| `TilesetDesert.png` | 320 × 192 | 20 × 12 | Wüste |
| `tileset_camp.png` | 368 × 144 | 23 × 9 | Lager |
| `tileset_bed.png` | 224 × 192 | 14 × 12 | Betten |
| `TilesetHouse.png` | 528 × 368 | 33 × 23 | Häuser |
| `TilesetTowers.png` | 384 × 96 | 24 × 6 | Türme |
| `TilesetVillageAbandoned.png` | 320 × 192 | 20 × 12 | verlassenes Dorf |
| `TilesetDungeon.png` | 192 × 64 | 12 × 4 | Dungeon: Knöpfe, Platten, Stacheln – gesichtet |
| `TilesetElement.png` | 256 × 240 | 16 × 15 | einzelne Objekte: Kisten, Fässer, Möbel – gesichtet |
| `TilesetLogic.png` | 128 × 160 | 8 × 10 | Schalter, Rätsel-Elemente |
| `Pipes.png` | 240 × 48 | 15 × 3 | Rohre |
| `Interior/TilesetInterior.png` | 256 × 320 | 16 × 20 | Möbel, Innenräume |
| `Interior/TilesetInteriorFloor.png` | 352 × 272 | 22 × 17 | Innenböden |
| `Interior/TilesetWallSimple.png` | 160 × 176 | 10 × 11 | Wände: vier Mauer-Rahmen – gesichtet |
| `Interior/Elements.png` | 144 × 48 | 9 × 3 | Kleinteile |

Fahrzeuge in `Backgrounds/Vehicles/`: `Boat.png` 80 × 32, `Crane.png` 33 × 36, `FishNet.png` und `FishNetFull.png` 33 × 25, `Sail.png` 30 × 43.

## Animierte Kacheln – `Backgrounds/Animated/`

| Ordner | Datei | Größe | Bilder |
| --- | --- | --- | --- |
| `Flag/` | `Flag<Farbe>16x16.png`, 8 Farben | 64 × 16 | 4 à 16 |
| `Plant/` | `SpriteSheet16x16.png` | 64 × 16 | 4 à 16 |
| `Water Ripples/` | `SpriteSheet16x16.png`, `SpriteSheetPurple.png` | 64 × 16 | 4 à 16 |
| `Waterfall/` | `TopSheet16x16.png`, `MiddleSheet16x16.png` | 80 × 16 | 5 à 16 |
| `Waterfall/` | `BottomSheet16x16.png` | 48 × 16 | 3 à 16 |
| `Conveyor Belt/` | `Left.png`, `Middle.png`, `Right.png` | 32 × 16 | 2 à 16 |
| `QuickSand/` | `QuickSand32x32.png` | 256 × 32 | 8 à 32 |
| `MillPropeller/` | `MillPropeller_A_64x64.png`, `_B_` | 256 × 64 | 4 à 64 |
| `WaterMill/` | `Watermill_A_34x36.png`, `_B_` | 102 × 36 | 3 à 34 × 36 |
| `Flower/` | `SpriteSheet16x16.png` | 20 × 8 | ⚠ 2 à 10 × 8 |

## Effekte – `FX/`

| Ordner | Blätter | Größe | Bilder |
| --- | --- | --- | --- |
| `Attack/CircularSlash`, `Claw`, `ClawDouble`, `Cut`, `CutX`, `SlashCurved`, `SlashDoubleCurved` | `SpriteSheet.png` | 128 × 32 | 4 à 32 |
| `Attack/CutDouble` | `SpriteSheet.png` | 160 × 32 | 5 à 32 |
| `Smoke/Smoke` | `SpriteSheet.png` | 192 × 32 | 6 à 32 |
| `Magic/Circle` | `SpriteSheetOrange.png`, `SpriteSheetWhite.png` | 128 × 32 | 4 à 32 |
| `Magic/Circle` | `SpriteSheetSpark.png` / `SpriteSheetSpark2.png` | 192 × 32 / 160 × 32 | 6 / 5 à 32 |
| `Magic/Spirit` | `SpriteSheet.png`, `SpriteSheetBlue.png`, `SpriteSheetDouble.png` | 160 × 32 | 5 à 32 |
| `Elemental/Explosion` | `SpriteSheet.png` | 360 × 40 | ⚠ 9 à 40 |
| `Elemental/Ice` | `SpriteSheet.png` / `SpriteSheetB.png`, `SpriteSheetFlake.png` | 320 × 32 / 288 × 32 | ⚠ 10 / 9 à 32 |
| `Elemental/Rock` | `SpriteSheet.png`, `SpriteSheetB.png` | 420 × 30 | ⚠ 14 à 30 |
| `Magic/Aura` | `SpriteSheet.png` | 125 × 24 | ⚠ 5 à 25 × 24 |
| `Elemental/Flam`, `Plant`, `RockSpike`, `Thunder`, `Water`, `WaterPillar` | `SpriteSheet.png` | 200 × 30, 240 × 28 und 210 × 26, 540 × 48, 160 × 28, 440 × 33, 270 × 41 | ⚠ unklar |
| `Magic/Boost`, `Shield`, `Spark` | `SpriteSheet*.png` | 424 × 35, 144 × 26, 270 × 35 | ⚠ unklar |
| `Smoke/SmokeCircular` | `SpriteSheet.png` | 240 × 14 | ⚠ unklar |
| `Slash/` | `SpriteSheetArc.png`, `Circular`, `Multi`, `Slash01`, `Slash02`, `Slash03` | 228 × 34 bis 396 × 50 | ⚠ unklar |
| `Projectile/Kunai`, `Projectile/Shuriken` | `SpriteSheet.png` | 650 × 59, 690 × 54 | ⚠ unklar |

Geprüft am 16.11.2026: `Attack/SlashCurved`, `Attack/Cut`, `Smoke/Smoke` und `Magic/Circle/SpriteSheetWhite.png` – Bildzahl wie angegeben.

**Geschosse** in `FX/Projectile/`: `Arrow.png` 13 × 5 (zeigt nach rechts – geprüft), `Kunai.png` 14 × 5, `BigKunai.png` 35 × 9, `Shuriken.png` und `ShurikenMagic.png` 32 × 16 (2 à 16), `BigShuriken.png` 46 × 23 (2 à 23), `Fireball.png`, `EnergyBall.png` und `SpriteSheetRock.png` 64 × 16 (4 à 16), `BigEnergyBall.png` 96 × 24 (4 à 24), `CanonBall.png` 80 × 16 (5 à 16), `IceSpike.png` 144 × 10, `PlantSpike.png` 96 × 20.

**Partikel** in `FX/Particle/` als schmale Streifen: Bamboo, Clouds, Fire, Grass, Leaf, LeafPink, Rain, RainOnFloor, Rock, RockGray, Snow, Spark, Vase, Wood.

**Umgebung** in `FX/Environment/`: `Fog.png` 320 × 180, `Raylight.png` 216 × 102.

## Gegenstände – `Items/`

| Ordner | Inhalt |
| --- | --- |
| `Treasure/` | `LittleTreasureChest.png` 32 × 16 und `BigTreasureChest.png` 32 × 14 (je 2 Bilder: zu und offen – geprüft), `GoldKey.png`, `SilverKey.png`, `GoldCoin.png`, `SilverCoin.png`, `Coin2.png` 40 × 10 (4 à 10), `GoldCup.png`, `SilverCup.png` |
| `Potion/` | `LifePot.png`, `MilkPot.png`, `WaterPot.png`, `EmptyPot.png`, `Heart.png`, `Medipack.png` |
| `Weapons/<Name>/` | 23 Waffen, je `Sprite.png` und meist `SpriteInHand.png`: Axe, AxeTool, BigSword, Bone, Book, Bow, Bow2, Club, Fishing Rod, Fork, Hammer, Katana, Lance, Lance2, MagicWand, Ninjaku, Pickaxe, Rapier, Sai, Stick, Sword, Sword2, Whip |
| `Projectile/` | Arrow, Bomb, Caltrop, CrateDynamite, Dynamite, Kunai, Shuriken |
| `Resource/` | BarCopper, BarGold, BarIron, BarMithril, BarPurple, BarSilver, Branch, feather, GemGreen, GemPurple, GemRed, GemYellow, Grass, Rock, Water |
| `Food/` | Beaf, Calamari, Fish, FortuneCookie, Honey, Meat, Noodle, Nut, Nut2, Octopus, Onigiri, Seed1–3, SeedBig1–3, SeedLarge, SeedLargeWhite, Shrimp, Sushi, Sushi2, TeaLeaf, Yakitori |
| `Tool/` | Anvil, Axe, Hammer, Hoe, Pickaxe, Shovel, Sickle, WateringCan |
| `Scroll/` | Scroll, ScrollEmpty, ScrollFire, ScrollIce, ScrollPlant, ScrollRock, ScrollThunder |
| `Object/` | Bag, Book, CrateEmpty, Dice, Gourd, Hourglass, MoneyBag, PanFlute |
| `Other/` | Letter, Letter2, Letter3, Stamp |
| `Action/` | `Hit.png`, `Interact.png` |

## Oberfläche – `Ui/`

| Ordner | Inhalt |
| --- | --- |
| `Dialog/` | `DialogBox.png` und `DialogBoxFaceset.png` 300 × 58, `DialogueBoxSimple.png` 316 × 60, `ChoiceBox.png`, `FacesetBox.png`, `YesButton.png`, `NoButton.png`, `DialogInfo.png` |
| `Emote/` | `emote1.png` bis `emote30.png`, 14 × 13 |
| `Font/` | `NormalFont.ttf` (Probe gerendert: Ziffern, Großbuchstaben und Umlaute da, das ß fehlt), `font8x8.png` 120 × 64, `font24x30.png` 360 × 240 |
| `Receptacle/` | `Heart.png` 80 × 16 (5 à 16: leer bis voll in Viertelschritten – geprüft), `Heart2.png` und `Heart3.png` 64 × 16 (4 à 16), `LifeBarMiniProgress.png`, `LifeBarMiniUnder.png`, `IconHeart.png` |
| `Receptacle/Receptacle Rectangle/`, `Receptacle Sphere/` | Rahmen (`Background*.png`) und Füllungen (`Progress*.png`) für Leisten und Kugeln, darunter `ProgressHealth.png` und `ProgressMana.png` |
| `Skill Icon/Spell/` | 34 Symbole à 24 × 24, fast alle auch als `…Disabled.png`: darunter Camouflage (geprüft), Mist, Vision, Fireball, Heal, Counter, Cut |
| `Skill Icon/Items & Weapon/`, `Job & Action/`, `Meteo/` | weitere 28 Symbole à 24 × 24 mit `…Disabled.png`: darunter Interact, Talk, Punch, Potion, Kunai, Shuriken |
| `Input/Keyboard/` | Tastensymbole 13 × 13: Buchstaben, Ziffern, F1–F12, Pfeile, Shift, Ctrl, Alt, Space, Tab, Enter, Escape |
| `Input/Mouse/`, `Input/Gamepad/` | Maus mit linker, rechter, mittlerer Taste und Rad; Gamepad-Tasten |
| `Theme/Theme Wood/` | fertiges Oberflächen-Thema: Knöpfe, Rahmen als Nine-Patch, `inventory_cell.png`, Schieberegler, Reiter, Häkchen |
| `Theme/Wip/` | 12 weitere Rahmen als Entwurf |

## Ton – `Audio/`

- **Musik** in `Musics/`: 41 Stücke als OGG, darunter „Adventure Begin“, „The Cave“, „Village“, „Dark Castle“, „Temple“, „Fight“, „Dungeon“, „Ruins“, „Dark Forest“, „Crypt“
- **Jingles** in `Jingles/`: GameOver (4), LevelUp (3), Secret (4), Success (4)
- **Geräusche** in `Sounds/`: Alert (6), Ambient (9), Bonus (10), Creature (5), Elemental (26), Hit & Impact (13), Jump & Bounce (8), Magic & Skill (11), Menu (25), Voice (10), Whoosh & Slash (9)

## Lose Dateien

- Im Stamm des Pakets: `Example 1.gif` bis `Example 4.gif`, `Example 5 ( Old Version).png`, `preview-part-1.png`, `preview-part-2.png`, `MusicCover.png`, `Palette.png` – laut Name Vorschauen, Musik-Cover und Farbpalette.
- In `Actor/Character/`: `Shadow.png` 12 × 7, ein Schatten für Figuren – geprüft; `AllPreview.png` und `AllPreview2.png`, laut Name Übersichten aller Figuren.

## Prüfstand am Bild

Am 16.11.2026 hat Claude die Blätter vergrößert angesehen, die A1 bis A4 des Grafik-Plans brauchen.

| Prüfung | Stand |
| --- | --- |
| Reihenfolge der vier Blickrichtungen bei Figuren und Monstern | erledigt: unten, oben, links, rechts |
| Aufbau der animierten Hauptfigur und der Waffen-Blätter | erledigt für die Figur und `Katana.png`; offen sind die übrigen Waffen und die Lage der Waffe über der Figur |
| Die beiden Zustände der Truhen | erledigt: zu und offen |
| Alle mit ⚠ „unklar“ markierten Effekt-Streifen | offen |
| `TilesetFloor.png`: Höhe 417 ist kein Vielfaches von 16 | offen |
| Inhalt der Tilesets | teilweise: Floor, Nature, Relief, Dungeon, Element und WallSimple gesichtet; Regeln für Übergänge offen |
| `Actor/Monster/BambooYellow/` als Bild der Übungspuppe | offen, nur der Name bekannt |
| Symbole für Schnelligkeit und Stun in `Ui/Skill Icon/` | offen, noch auszuwählen |
| Töne | nur die Namen bekannt; anhören kann nur der Nutzer |
