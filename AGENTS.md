# Agent Guide

## Repository Role

This repository is a long-form ACM Computing Surveys manuscript workspace, not an implementation repository. The primary artifacts are `main.tex`, `supplement.tex`, `refs.bib`, and the publication figures. The expected output is synthesis prose with a clear systems abstraction, not a bibliography dump or a paper-by-paper summary list.

## Core Frame

Every paper integrated into the manuscript should be understood through the same five-field frame:

- State object: what mutable or persistent state is governed?
- Control surface: what runtime decision or actuation point is exposed?
- Coupling path: how does the local state decision affect wider system behavior?
- Evaluation boundary: what end-to-end metric or constraint makes the result meaningful?
- Remaining gap: what control, ownership, lifecycle, recovery, or composition problem remains open?

If these fields are not clear, the paper is not ready for prose integration.

## Default Workflow

When continuing the survey, work on one subsection-sized literature cluster at a time, such as serving disaggregation, stream migration and checkpointing, retrieval index evolution, continual-retention control, approximation-aware execution, or hardware-conscious state movement. Read related papers together, add or correct BibTeX entries in `refs.bib`, and then revise the relevant prose in `main.tex` or supporting appendix material in `supplement.tex`.

Prefer local strengthening over top-level restructuring. The current taxonomy should remain stable unless a cluster genuinely cannot fit it.

## Writing Rules

- Preserve the systems framing: access and scheduling, execution optimization, evolution and reuse, plus cross-domain synthesis.
- Group papers by mechanism and control problem, not by chronology alone.
- Each expanded subsection should include local problem framing, mechanism synthesis, comparison or tradeoff discussion, and an explicit open gap.
- Favor cross-paper comparison sentences over serial summary sentences.
- Do not paste or lightly rewrite abstracts into the manuscript.
- Do not add references without prose explaining why they matter to the survey frame.
- Keep appendix material in `supplement.tex` when it supports the main argument with extra evidence, figures, or case walkthroughs without interrupting the main paper.

## Definition Of Done

A survey-editing task is complete only when:

- The targeted section gained real synthesis, not just extra citations.
- `refs.bib` is consistent with the new discussion.
- New citations resolve in the affected TeX file.
- The affected PDF compiles successfully.
- The new text ends with at least one explicit open systems gap, design implication, or boundary clarification.

## Build Commands

Use Tectonic with the vendored ACM template source in the TeX search path:

```bash
TEXINPUTS=third_party/acmart-src//: tectonic main.tex
TEXINPUTS=third_party/acmart-src//: tectonic supplement.tex
```

If `tectonic` is not on `PATH`, use the local binary available on this machine, for example `/home/shuhao/.local/bin/tectonic`.

## Non-Goals

- Do not turn the repository into a disconnected reading-note archive.
- Do not insert large numbers of references without adding synthesis.
- Do not make the manuscript an author-centric work list.
- Do not perform broad structural rewrites unless the current taxonomy clearly fails.

One-sentence principle: advance the survey by deepening one control problem at a time, and always convert literature intake into comparative systems prose.
