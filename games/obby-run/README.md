# Obby Run 🏃‍♂️

Classic Roblox obstacle course — jump, dodge, and survive to the finish.

## Structure

```
obby-run/
├── README.md         ← this file
├── obby-run.rbxlx    ← the place file (open this in Studio)
├── scripts/          ← Luau scripts (for reference)
│   ├── checkpoint.lua
│   ├── kill-block.lua
│   └── finish-line.lua
└── assets/           ← models, textures, audio
```

## Milestones

- [ ] Basic terrain + start platform
- [ ] First 3 obstacles (jump, dodge, timing)
- [ ] Checkpoint system
- [ ] Finish line + timer
- [ ] 10+ obstacles
- [ ] Polish: colors, lighting, sounds
- [ ] Publish to Roblox

## Tips

- Save as `.rbxlx` (XML) so Git can track changes
- Commit often: "Add spike pit", "Fix checkpoint respawn"
- Use Server Scripts for gameplay, LocalScripts for UI
