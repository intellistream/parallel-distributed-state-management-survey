# Efficient State Management in Parallel and Distributed Systems

This repository contains a draft ACM Computing Surveys article titled "Efficient State Management in Parallel and Distributed Systems".

## Layout

- `main.tex`: survey manuscript draft.
- `refs.bib`: BibTeX database for the current draft.
- `figures/`: TikZ figure sources for the propagation view and integrated runtime loop.
- `WRITING_FRAMEWORK.md`: student handoff guide for structured literature integration and section ownership.
- `LITERATURE_MATRIX.md`: per-paper scaffold table for collaborative expansion before prose integration.
- `third_party/acmart-src/`: official `acmart` source snapshot.

## Build

Use Tectonic with the vendored ACM template source in the TeX search path:

```bash
TEXINPUTS=third_party/acmart-src//: /home/shuhao/miniconda3/envs/vllm-hust-dev/bin/tectonic main.tex
```

## Status

This is a working draft seeded from the current academic-report storyline and the publication list already maintained in the local materials repositories. The repository now includes a first-pass survey taxonomy, two conceptual figures, and a broadened bibliography that connects the draft to foundational stream-processing and stateful-runtime systems. It is intended as a long-form survey draft for later polishing toward ACM CSUR submission.