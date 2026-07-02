# Efficient State Management in Parallel and Distributed Systems

This repository contains a draft ACM Computing Surveys article titled "Efficient State Management in Parallel and Distributed Systems". The goal is a synthesis-driven systems survey, not a bibliography dump or a collection of paper-by-paper summaries.

For collaboration and agent-specific writing rules, see `AGENTS.md`.

## Layout

- `main.tex`: survey manuscript draft.
- `supplement.tex`: appendix-style supplement with its own cited references.
- `refs.bib`: BibTeX database for the current draft.
- `figures/`: TikZ figure sources for the propagation view and integrated runtime loop.
- `third_party/acmart-src/`: official `acmart` source snapshot.

## Build

Use Tectonic with the vendored ACM template source in the TeX search path:

```bash
TEXINPUTS=third_party/acmart-src//: tectonic main.tex
TEXINPUTS=third_party/acmart-src//: tectonic supplement.tex
```

If `tectonic` is not on `PATH`, use the local binary available on the machine, for example `/home/shuhao/.local/bin/tectonic`.

## Status

This is a working draft with a mature survey taxonomy, integrated figures, a standalone appendix-style supplement, and a broadened bibliography connecting foundational stream-processing, stateful-runtime, serving, retrieval, and retention systems. It is intended for continued polishing toward ACM CSUR submission.
