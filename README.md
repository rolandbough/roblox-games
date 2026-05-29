# Roblox Games 🎮

Roblox Studio projects — version controlled with style.

## Workflow

- **Save places as `.rbxlx`** (XML format) — this makes diffs readable
  In Studio: File → Save As → "Roblox XML File" (.rbxlx)
- **One folder per game/project**
- **Commit often** with descriptive messages

## Getting Started

1. Open Roblox Studio
2. File → Open → pick a `.rbxlx` file from `games/`
3. Build, script, test
4. Commit your changes back

## Structure

```
roblox-games/
├── games/          ← one folder per game
│   └── obby-run/   ← your first project
├── scripts/        ← reusable Luau scripts (checkpoints, kill blocks, etc.)
├── assets/         ← shared models, audio, textures
└── templates/      ← starter templates for new games
```

## Tools

Requires: Roblox Studio (macOS), Git

### Optional: Rojo
If you want a more dev-like workflow with source files outside Studio, check out [Rojo](https://rojo.space/).
