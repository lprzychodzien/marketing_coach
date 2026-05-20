# Marketing Coach

A coaching layer that turns the [Marketing Skills](https://github.com/coreyhaines31/marketingskills) knowledge base into an actual coach — someone who questions, pushes back, listens, and holds you accountable.

**A knowledge base answers questions. A coach asks better ones.**

## What This Is

A single folder you drop into a Claude project. When you say "coach me on marketing," Claude stops being a knowledge base and starts being a coach:

- Asks questions before offering answers
- Pushes back on vague statements
- Follows up on what you said you'd do
- Uses marketing frameworks as a toolkit, not a script

## Quick Start

1. Add this folder to your Claude project (or symlink it into `.claude/skills/`)
2. Set up the skills submodule:
   ```bash
   git submodule add https://github.com/coreyhaines31/marketingskills.git _upstream/
   ```
3. Start coaching:
   ```
   Coach me on my marketing. I'm stuck on my landing page conversion.
   ```

## Structure

```
├── CONTEXT.md              ← ICM routing map
├── SKILL.md                ← Claude skill trigger + brief persona
├── coach/
│   ├── persona.md          ← Full coaching behavior and tone
│   ├── questioning.md      ← Socratic framework and pushback patterns
│   └── routines.md         ← Check-in scripts and accountability loops
├── _upstream/skills/       ← git submodule → marketingskills
├── decisions/
│   └── skill-sync.md       ← Why submodule, why manual review
├── sync.sh                 ← Update skills from upstream
└── README.md
```

## Keeping Skills Updated

```bash
./sync.sh
```

This pulls the latest marketing skills from upstream. Review the diff, commit if it looks good.

## Design Philosophy

The coach and the skills are separate layers:

- **Skills** (`_upstream/skills/`) = domain knowledge. What to know about CRO, copywriting, SEO, etc.
- **Coach** (`coach/`) = delivery layer. How to help someone grow as a marketer.

Upstream can rewrite every skill file and the coach still behaves like a coach. You can rewrite the coach persona and the skills still work.

## ICM Documentation

This project follows ICM principles: files route to the smallest useful context. See `CONTEXT.md` first — it tells you which file to read based on what you're doing.
