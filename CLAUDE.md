# CLAUDE.md — 10-Rule Architecture

These rules apply to every task inthis project unless explicitly overridden.
Bias: caution over speed on non-trivial work. Use judgment on trivial tasks.

**Goals / Definition-of-Done live in [@GOALS.md](./GOALS.md)** — read that for the
phase plan (Phase 0 done; Phase 1 in flight; Phase 2–4 pending). The
LLM-first reconstruction strategy is in
[`v4doc/100-restart-with-llm-first-reconstruction.md`](./v4doc/100-restart-with-llm-first-reconstruction.md).

## Rule 1 — Think Before Coding

State assumptions explicitly. If uncertain, ask rather than guess.
Push back when a simpler approach exists. Stop when confused.

## Rule 2 — Simplicity First

Minimum code that solves the problem. Nothing speculative.
No features beyond what was asked. No abstractions for single-use code.

## Rule 3 — Surgical Changes

Touch only what you must. Clean up only your own mess.
Don't "improve" adjacent code, comments, or formatting. Match existing style.

## Rule 4 — Goal-Driven Execution

Define success criteria. Loop until verified.
Don't follow steps. Define success and iterate independently.

## Rule 5 — Token budgets are not advisory

Per-task: 4,000 tokens. Per-session: 30,000 tokens.
If approaching budget, summarize and start fresh. Surface the breach.

## Rule 6 — Read before you write

Before adding code, read exports, immediate callers, shared utilities.
If unsure why code is structured a certain way, ask.

## Rule 7 — Checkpoint after every significant step

Summarize what was done, what's verified, what's left.
Don't continue from a state you can't describe back. Stop and restate.

## Rule 8 — Fail loud

"Completed" is wrong if anything was skipped silently.
"Tests pass" is wrong if any were skipped.
Default to surfacing uncertainty, not hiding it.

## Rule 9 — Doubt the result, check implicit assumptions

Passing tests aren't proof — data, UI, or files can still be wrong.
Hypothesize where bugs could hide; check directly (read data, view screenshots, inspect outputs) BEFORE writing test-code.
If unsure, surface the observation loudly.
Only after finding errors by inspection: codify as a regression test.

## Rule 10 — At the end of any work that produces visible output, OPEN the HTML in the browser

The user wants to SEE what was done — not just read a summary. When a step
finishes that produced an integrity dashboard, an entity inspector, a
stichprobe view, a card-render, or any other browseable artefact: open the
file with `open <path>` (or equivalent) so it lands in their browser
immediately. Do not just print the path and stop.

Applies after: migration runs, loader runs, extraction passes, dedupe
passes, and all G3 review gates per `GOALS.md`. Hand-in-hand with Rule 9
(doubt the result) — the browser view is how the user judges integrity.
