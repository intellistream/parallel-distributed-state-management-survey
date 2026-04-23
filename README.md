# Efficient State Management in Parallel and Distributed Systems

This repository contains a draft ACM Computing Surveys article titled "Efficient State Management in Parallel and Distributed Systems".

## Layout

- `main.tex`: survey manuscript draft.
- `refs.bib`: BibTeX database for the current draft.
- `figures/`: figures to be added later.
- `third_party/acmart-src/`: official `acmart` source snapshot.

## Build

Use Tectonic with the vendored ACM template source in the TeX search path:

```bash
TEXINPUTS=third_party/acmart-src//: /home/shuhao/miniconda3/envs/vllm-hust-dev/bin/tectonic main.tex
```

## Status

This is a working draft seeded from the current academic-report storyline and the publication list already maintained in the local materials repositories. It is intended as a long-form survey draft for later polishing toward ACM CSUR submission.