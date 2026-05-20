# Marketing Coach

A coaching layer that turns the [Marketing Skills](https://github.com/coreyhaines31/marketingskills) knowledge base into an actual coach — someone who questions, pushes back, listens, and holds you accountable.

**A knowledge base answers questions. A coach asks better ones.**

## What This Is

Marketing Coach is markdown and routing instructions for an AI — not a running app. You can use it in two equally good ways:

1. **Open the repo in your editor** (e.g. Cursor) and talk to your AI assistant in that workspace.
2. **Add this folder to a Claude project** so Claude loads the coach when you ask for marketing help.

In both cases, the assistant should behave like a coach, not a knowledge base:

- Asks questions before offering answers
- Pushes back on vague statements
- Follows up on what you said you'd do
- Uses marketing frameworks as a toolkit, not a script

## Ways to Use

| Approach | Best for | How the coach gets context |
|---|---|---|
| **IDE workspace** | Daily work in Cursor (or similar) with your repo open | You prompt explicitly; the agent reads `CONTEXT.md`, `coach/`, and skills as needed |
| **Claude project** | Coaching inside Claude Desktop / Claude Code | Add this repo (or folder) to the project; optional symlink into `.claude/skills/` |

There is no separate server or extension to install. Clone the repo, initialize the skills submodule (see below), and start a conversation.

## Quick Start

### Option A — Open in your editor (Cursor, etc.)

1. Clone with submodules (required — skills live in `_upstream/`):

   ```bash
   git clone --recurse-submodules https://github.com/lprzychodzien/marketing-coach.git
   cd marketing-coach
   ```

   If you already cloned without submodules:

   ```bash
   git submodule update --init
   ```

2. Open the folder in your editor.

3. Start coaching with a direct prompt, for example:

   ```
   Read CONTEXT.md and coach/persona.md, then coach me on my marketing.
   I'm stuck on my landing page conversion.
   ```

   Or shorter, once the agent knows the repo:

   ```
   Coach me on my marketing. I'm stuck on my landing page conversion.
   ```

The agent should read `CONTEXT.md` first, then `coach/persona.md`, and only load a skill from `_upstream/skills/` after understanding your situation.

### Option B — Claude project

1. Clone or copy this repo into your machine (use `--recurse-submodules` if cloning — see Option A).

2. Add the folder to your Claude project, or symlink it into your skills directory:

   ```bash
   ln -s /path/to/marketing-coach ~/.claude/skills/marketing-coach
   ```

3. Start coaching:

   ```
   Coach me on my marketing. I'm stuck on my landing page conversion.
   ```

Claude can use `SKILL.md` as the trigger file when the project includes this folder.

## Structure

```
├── CONTEXT.md              ← ICM routing map (start here in an IDE session)
├── SKILL.md                ← Claude skill trigger + brief persona
├── coach/
│   ├── persona.md          ← Full coaching behavior and tone
│   ├── questioning.md      ← Socratic framework and pushback patterns
│   └── routines.md         ← Check-in scripts and accountability loops
├── _upstream/              ← git submodule → marketingskills (marketing domain skills)
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
