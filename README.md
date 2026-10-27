# bmad-factory

This repository is set up with the [BMad Method](https://github.com/bmad-code-org/BMAD-METHOD) — the Breakthrough Method of Agile AI-Driven Development — for use in **Cursor**.

## What was installed

| Item | Details |
|------|---------|
| **Installer** | `npx bmad-method install` (stable release) |
| **Version** | **6.12.4** (Core + BMM modules) |
| **Modules** | `core` (BMad Core), `bmm` (BMad Method) |
| **IDE** | Cursor — 29 skills under `.agents/skills/` |
| **Config & manifests** | `_bmad/` (installer-managed; re-run install to refresh) |
| **Output folder** | `_bmad-output/` (planning and implementation artifacts) |

Install command used for this repo (non-interactive):

```bash
npx bmad-method install --directory . --modules bmm --tools cursor --yes
```

See [non-interactive installation](https://docs.bmad-method.org/how-to/non-interactive-installation/) for all flags. Official docs: [docs.bmad-method.org](https://docs.bmad-method.org/).

### Optional: `uv`

Some skills (including `bmad-build` and `bmad-build-auto`) use Python helpers via `uv run`. If those skills halt on activation, install [uv](https://docs.astral.sh/uv/getting-started/installation/) or ask your agent to set it up.

## Where things live

| Path | Purpose |
|------|---------|
| `.agents/skills/` | **Cursor skills** — invoke these in chat (e.g. `@bmad-help`, or ask to run `bmad-prd`) |
| `_bmad/` | Module config, skill sources, scripts, and catalogs |
| `_bmad/_config/bmad-help.csv` | Full skill catalog with menu codes and recommended sequencing |
| `_bmad/_config/skill-manifest.csv` | Canonical skill IDs and descriptions |
| `_bmad/custom/` | Team overrides (committed); `*.user.toml` is gitignored |
| `_bmad-output/planning-artifacts/` | PRD, architecture, epics/stories, UX docs, etc. |
| `_bmad-output/implementation-artifacts/` | Sprint status, specs, tests, retrospectives |

Skill sources for the BMM module are organized under `_bmad/bmm/plan/` (planning) and `_bmad/bmm/ship/` (implementation).

## Agents (personas)

These agent skills live in `.agents/skills/` and in `_bmad/config.toml`:

| Skill | Persona | Role |
|-------|---------|------|
| `bmad-agent-analyst` | Mary | Business Analyst |
| `bmad-agent-pm` | John | Product Manager |
| `bmad-agent-ux-designer` | Sally | UX Designer |
| `bmad-agent-architect` | Winston | System Architect |
| `bmad-agent-dev` | Amelia | Senior Software Engineer |

Ask to talk to a persona by name (e.g. “talk to John”) or invoke the skill directly. Sprint coordination and QA are **workflows** (below), not separate agent personas in this release.

## Workflows & core skills

### Planning (`plan`)

| Menu | Skill | Name |
|------|-------|------|
| BP | `bmad-brainstorming` | Brainstorm Project |
| CB | `bmad-product-brief` | Create Brief |
| WB | `bmad-prfaq` | PRFAQ Challenge |
| PRD | `bmad-prd` | Create / edit / validate PRD |
| CU | `bmad-ux` | Create UX |
| CA | `bmad-architecture` | Architecture |
| CE | `bmad-create-epics-and-stories` | Create Epics and Stories |
| SP | `bmad-sprint-planning` | Sprint Planning |
| SS | `bmad-sprint-planning` | Sprint Status (`status` action) |
| SPC | `bmad-spec` | Spec |
| PC | `bmad-project-context` | Project Context (AGENTS.md) |
| CC | `bmad-correct-course` | Correct Course |

### Ship (`ship`)

| Menu | Skill | Name |
|------|-------|------|
| BD | `bmad-build` | Build (implement stories) |
| CR | `bmad-code-review` | Code Review |
| QA | `bmad-qa-generate-e2e-tests` | QA automation tests |
| WT | `bmad-walkthrough` | Walkthrough |
| ER | `bmad-retrospective` | Retrospective |

### Core (anytime)

`bmad-help`, `bmad-review`, `bmad-deep-recon`, `bmad-forge-idea`, `bmad-brainstorming`, `bmad-party-mode`, `bmad-advanced-elicitation`, `bmad-customize`

Unattended build loop: `bmad-build-auto`.

## Recommended flow

1. **Start** — Run **`bmad-help`** when unsure what to do next; optionally **`bmad-product-brief`** (CB), **`bmad-prfaq`** (WB), or **`bmad-brainstorming`** (BP).
2. **Requirements** — **`bmad-prd`** (PRD); add **`bmad-ux`** (CU) when UI is central.
3. **Technical design** — **`bmad-architecture`** (CA).
4. **Backlog** — **`bmad-create-epics-and-stories`** (CE), then **`bmad-sprint-planning`** (SP) for readiness check and sprint status.
5. **Delivery** — **`bmad-agent-dev`** / **`bmad-build`** (BD) per story; then **`bmad-code-review`** (CR) and **`bmad-qa-generate-e2e-tests`** (QA) as needed; **`bmad-retrospective`** (ER) after an epic.

Run each major skill in a **fresh chat** when possible. Artifacts land under `_bmad-output/` per `_bmad/config.toml`.

## Updating BMad

```bash
npx bmad-method install --directory . --modules bmm --tools cursor --action update --yes
```

## Learn more

- [BMAD-METHOD on GitHub](https://github.com/bmad-code-org/BMAD-METHOD)
- [Install guide](https://docs.bmad-method.org/start/install-bmad/)
- Community: [Discord](https://discord.gg/gk8jAdXWmj)
