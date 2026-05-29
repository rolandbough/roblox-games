# Biome Safari 🦁🌍

Find 50 animals hidden across multiple biomes. A scavenger hunt adventure!

## Concept

Player spawns in a central hub with portals to different biomes. Each biome has 8-12 animals hidden in the environment. Find all 50 to win.

## Biomes & Animals

| Biome    | Animals to find | Theme |
|----------|----------------|-------|
| ❄️ Winter  | 10 | Penguins, polar bears, seals, arctic foxes, snow owls, walrus, reindeer, snow hare, wolf, ermine |
| 🌲 Forest  | 10 | Deer, fox, bear, rabbit, owl, squirrel, wolf, hedgehog, badger, woodpecker |
| 🦒 Savanna | 10 | Lion, giraffe, zebra, elephant, cheetah, rhino, hippo, ostrich, gazelle, meerkat |
| 🌊 Ocean   | 10 | Dolphin, whale, shark, sea turtle, octopus, clownfish, manta ray, jellyfish, seahorse, crab |
| 🏜️ Desert  | 5  | Camel, scorpion, fennec fox, rattlesnake, tortoise |
| 🌴 Jungle  | 5  | Toucan, jaguar, sloth, monkey, tree frog |

**Total: 50 animals**

## Structure

```
safari/
├── README.md
├── safari.rbxlx         ← the place file
├── scripts/
│   ├── animal-spawn.lua     ← creates a findable animal
│   ├── collection-log.lua   ← tracks which animals are found
│   ├── hud.lua              ← progress UI
│   ├── hub-teleport.lua     ← biome portal system
│   └── win-condition.lua    ← checks all 50 found
├── models/
│   ├── animals/             ← animal models per biome
│   ├── biomes/              ← terrain/portal models
│   └── hub/                 ← central hub parts
└── assets/
    ├── sounds/              ← animal sounds, discovery jingles
    └── textures/
```

## Milestones

- [ ] Build central hub with biome portals
- [ ] Scaffold Winter biome with 10 animals
- [ ] Scaffold Forest biome with 10 animals
- [ ] Scaffold Savanna biome with 10 animals
- [ ] Scaffold Ocean biome with 10 animals
- [ ] Add Desert + Jungle biomes (5 each)
- [ ] Animal spawn system (hidden, interactable)
- [ ] Collection log GUI
- [ ] Hint system (animal sounds, tracks, glowing clues)
- [ ] Win sequence + scoreboard
- [ ] Polish: lighting, sounds, particle effects
