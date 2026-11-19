# AGENTS.md

Rules for AI coding agents working in this Home Assistant configuration (any tool: Claude Code, Codex, Copilot, Cursor, …).

## Baseline: Home Assistant best practices

General HA rules come from the **home-assistant-best-practices** skill: https://github.com/homeassistant-ai/skills. Install it as a skill or plugin; a link alone is not loaded by agents. Main points:
- Prefer native triggers and conditions over Jinja templates
- Use `entity_id`, not `device_id`
- Pick the right helper, and choose automation modes deliberately
- Rename entities carefully (follow the skill's safe-refactoring workflow)
- Reload vs. restart correctly

**Where the skill and this file disagree, this file wins.**

## What this is

The live Home Assistant config directory for ArveVM's home ("MyAssistedHome"). It runs in Docker on Unraid. Inside the container it is mounted as `/config`, so command_line sensors and other in-HA paths use `/config/...`, not the host path. The HA version is in `.HA_VERSION`. Edits here affect the running system only after HA reloads or restarts.

The public docs live in a separate wiki repo (https://github.com/ArveVM/MyAssistedHome/wiki). Package files link to the wiki pages that describe them, so a change to a solution usually means its wiki page needs updating too.

## Validating changes

There is no build, lint or test tooling. Before a reload or restart, the config must be checked in HA (**Developer tools → YAML → Check configuration**, or `check_config` inside the container). Many domains (templates, automations, scripts, input_*) can be reloaded from the same page without a full restart.

## Architecture: packages, "Functionality vs. Solutions"

`configuration.yaml` holds almost nothing besides `homeassistant: packages: !include_dir_named packages` and the trusted-network auth providers, which must stay there. Everything else is a package under `packages/`:

- `packages/integrations/` covers **functionality**: one file per integration or core domain (recorder, http, lovelace, nordpool, tts, …). `default_config.yaml` pulls in the UI-managed `automations.yaml`, `scenes.yaml` and `scripts.yaml` from the root.
- `packages/solutions/` covers **solutions**: ArveVM's own grouping of everything needed to automate one thing (hotwater SoC, heaters, pwrctrl power control, hastats, …). `solutions/general/` holds house-wide solutions (e.g. `notify.yaml`), `solutions/areas/` holds per-room or per-device solutions, and `solutions/pwrctrl/` holds the power-control family. Some solutions sit next to a `.md` file of notes.
- `packages/solutions_draft/` holds work in progress. It is git-ignored but **loaded by HA** like any other package. Dependencies between draft and published packages are fine and expected while restructuring.

`!include_dir_named` recurses into subfolders and uses the **file name (without extension) as the package name**. File names must be unique across all of `packages/`, even in different subfolders, or HA rejects the config. Files without a `.yaml` extension (e.g. `kids_linen_copy.yamlssss`) are deliberately parked and not loaded.

Solutions are being restructured **one at a time** (a 10+ month job). Work only on the solution the user names. Don't sweep or bulk-change other solutions unless asked.

### Conventions used in package files

- **File header:** every file opens with a short header of 3 lines: what the solution does, a `# Wiki:` link, and an `# Idea:` credit if there is one. Comments are prefixed `# ArveVM;` / `# AVM;`. Comments are allowed anywhere, including above automations.
- **Node-anchors are the solution's inputs.** They're declared under `homeassistant: customize: package.node_anchors:` (a dummy entity) after a `# ArveVM; INPUT - change to your own entities:` line, and reused with `*anchor` later in the same file. Anchors hold entity ids, lists of entities (speakers, buttons, phones) and per-file constants. Anchors only work within one file. If you comment out an anchor, also comment out every `*alias` that uses it, or the YAML won't load.
- The old `solution: "<name>"` customize attribute (`&solution_attribute`) is **dropped** for restructured solutions. Older files still have it, so leave it there unless asked. A replacement (Spook labels) is undecided.
- **Naming:** `<solution>_<what>`, e.g. `timer.coffeemaker_ready` paired with `input_number.coffeemaker_ready_min`. Put the unit in setting names (`_min`). Template entities use the modern `template:` format with `unique_id`.
- User-tunable parameters are `input_number`/`input_*` helpers shown on the solution's dashboard card, not hard-coded values.
- **One main script per solution** (e.g. `script.coffeemaker_start`). Buttons, dashboards, voice, NFC tags and other automations call it, so a new input never needs changes in the solution. A device's own automation (e.g. `kitchen_switch3.yaml` for the Namron K8) calls that script instead of being listed in the solution.
- **One automation per solution** where practical: trigger `id:`s plus a `choose:` with one branch per trigger.
- **Messages:** speak with `script.announce` (fields `message`, `speakers` or `floor`, `volume`) and push to phones with `script.notify_phones` (`group: parents|kids|family`, `message`, `title`, `data`, `persistent`). Both are in `solutions/general/notify.yaml`. Use them instead of calling `tts.*` or `notify.*` directly.

### Writing YAML (rules)

- **Package-first:** write YAML as it will exist in a single package file. For a new entity, ask whether it goes into an existing package or a new one, unless the user already said.
- **Reuse before creating:** check `scripts.yaml`, `packages/` and `custom_templates/` for existing scripts, helpers or Jinja macros before writing new ones. Call existing scripts instead of copying them. Don't `!include` script YAML into a package; use `!include` only for dashboard cards.
- **Calling scripts:** prefer `script.turn_on` (doesn't wait, and pass fields under `data: variables:`). Calling `action: script.<name>` directly is fine when the next step must wait for the script to finish.
- **Modern syntax** in new code: `triggers:`/`trigger:`, `conditions:`/`condition:`, `actions:`/`action:`. Prefer native conditions; use Jinja `{{ … }}` and `variables:` where native options don't fit. Use `choose:` (and `default:` where useful) instead of nested conditions.
- **Old syntax:** when editing a file that uses old syntax (`trigger:`/`platform:`, `action:`/`service:`, `data_template`, …), point out where it is and ask whether to modernise the file. Until the user says yes, match the file's existing style.
- **Every automation** has an `id`, an `alias` and an explicit `mode` (`single`/`restart`/`queued`/`parallel`). Scripts also get an explicit `mode`.
- **Explicit triggers:** avoid "any change" triggers. Use `to:`/`from:` lists, or `not_from`/`not_to` for unavailable/unknown. An `event.*` entity is the exception, since any state change is a press. Filter on `event_type` there.

## Dashboards (`dashboard/`)

`packages/integrations/lovelace.yaml` keeps the default UI dashboards in storage mode and adds YAML dashboards (dashboard keys must contain a hyphen). Each YAML dashboard file includes `views/*.yaml`, and the views `!include` reusable cards:

- `sol_cards/` has one `<solution>_card.yaml` and/or `<solution>_chip.yaml` per solution. A chip file must be included under the `chips:` list of a `custom:mushroom-chips-card`.
- `area_cards/` and `backend_cards/` hold per-area cards and server/Unraid cards.
- Card files reuse the same `package.node_anchors` header trick for local variables. Some use the `lovelace_gen` custom component for Jinja and variable injection into included cards.
- `_cards_old/` is retired and git-ignored.

## Every solution has a wiki page

Each solution must have its own page in the wiki repo, named `Solution-<Name>.md` (e.g. `Solution-HAstats.md`, `Solution-PowerControl-Limit-Hour.md`). Wiki page names use hyphens, so `Solution-Foo-Bar.md` becomes the URL `.../wiki/Solution-Foo-Bar`.

- **New solution:** use the restructured layout. `Solution-Coffeemaker.md` is the reference until `Solution-_-template-New-Solution.md` is updated. The layout is:
  - A summary box (`> **What:** … **Status:** draft|testing|live · **Area:** · **Label:** … **Files:** … **Needs:**`).
  - Why (with a "Scope / not included" line).
  - How it works (a Mermaid flowchart plus short bullets).
  - Setup: a link to the shared "How to copy/install one of my solutions" guide in `2.1-HA-base-configuration.md`, plus the anchor names and settings. Don't repeat the generic install or anchor instructions on each page.
  - Dashboard table, Troubleshooting (solution-specific only), Credits, Roadmap / History (Planned, ToDo notes, dated History).

  Add the page as a `[[Solution-<Name>]]` link, with its status in brackets, in the right section of `3-Solutions.md`.
- **Link both ways:** the package's header comment links to the wiki page URL, and the page's table links to the package and card files under `https://github.com/ArveVM/MyAssistedHome/blob/master/...`.
- **Changed solution:** update the page too (How it works, the table, and a dated line in Solution history).
- **Missing page:** if a solution has no page yet, or its header still has a placeholder link like `https://github.com/ArveVM/    blablabla`, point that out and offer to create the page.
- **Private files:** files under `solutions_draft/` or listed as private in `.gitignore` are not on GitHub. Don't link to them from the wiki.

The wiki is its own git repo (branch `master`). Its commits are separate from this repo's.

Adding a solution touches four places: the package in `packages/solutions/`, its card or chip in `dashboard/sol_cards/`, an `!include` line in the right view (`views/solutions_view.yaml` or `solutions_draft_view.yaml`), and its `Solution-<Name>.md` wiki page.

## Git / what's published

The repo is public, and `.gitignore` decides what is shared. It ignores secrets (`secrets.yaml`, `secrets_google_*`), `.storage/`, `custom_components/`, `blueprints/`, `www/`, `tts/`, the DB and logs, the UI-managed `automations/scenes/scripts.yaml`, and `packages/solutions_draft/`. The bottom of `.gitignore` also lists individual package and card files that are kept private on purpose. Check there before assuming a file is tracked, and don't move private content into tracked files.

Never read or edit `secrets.yaml`, `secrets_*.json`, `.storage/`, or `home-assistant_v2.db*` (a multi-GB SQLite DB in use by the running HA). Reference secrets only through `!secret <key>`.
