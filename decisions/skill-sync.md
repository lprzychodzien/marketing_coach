# Decision: Skill Sync Strategy

## Context

The marketing-coach depends on `coreyhaines31/marketingskills` for its domain knowledge (~40 skill files covering CRO, copywriting, SEO, analytics, etc.). These skills evolve independently. The coach needs a way to pull in updates without breaking the coaching layer.

## Decision

**Use a git submodule for skills, with manual review before merging.**

The `_upstream/` directory is a git submodule pointing to `https://github.com/coreyhaines31/marketingskills.git`. Skills live at `_upstream/skills/`. Updates are pulled explicitly via `sync.sh` — not automatically.

## Rationale

- **Separation of concerns.** Skills (domain knowledge) and coach (behavior) are versioned independently. Upstream can rewrite every skill file and the coach still behaves like a coach.
- **Review before merge.** Automatically pulling upstream changes could silently change coaching recommendations. Manual review lets the coach author evaluate whether changes align with coaching philosophy.
- **Submodule over copy.** Copying skill files into the repo would make diffing against upstream tedious. A submodule preserves a clean diff when upstream changes.
- **Submodule over npm package.** The skills are markdown files consumed by an LLM at runtime, not code imported by a build system. A submodule is simpler and more transparent.

## Alternatives Considered

- **Automatic sync (cron/GitHub Action).** Rejected — silent updates risk behavior changes without review.
- **Copy skills into repo.** Rejected — no clean way to diff against upstream or track which version you're on.
- **Fork and customize.** Could work as a future option if the coach needs modified versions of specific skills.
- **npm package.** Overkill for markdown files consumed at LLM inference time.

## How to Sync

```bash
./sync.sh
```

This runs `git submodule update --remote skills/` and shows the diff. Review the changes, commit if they look good.

## When to Sync

- When a new release is published on the upstream repo (check releases page)
- When you need a skill that was recently added upstream
- On a regular cadence (monthly) as maintenance

Do not sync mid-coaching-session. Wait until a natural break.
