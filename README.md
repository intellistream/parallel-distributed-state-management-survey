# Beyond Storage: State as a Runtime Control Problem in Parallel and Distributed Systems

This repository contains an ACM Computing Surveys submission package centered on the survey "Beyond Storage: State as a Runtime Control Problem in Parallel and Distributed Systems". The project is organized as a 35-page main manuscript plus a separate supplement under the same analytical frame.

For collaboration and agent-specific writing rules, see `AGENTS.md`.

## Layout

- `main.tex`: main CSUR manuscript.
- `supplement.tex`: appendix-style supplement with its own cited references.
- `refs.bib`: BibTeX database for the current draft.
- `figures/`: TikZ figure sources for the propagation view and integrated runtime loop.
- `third_party/acmart-src/`: vendored ACM template files (`acmart` v2.19).

## Build

Use Tectonic's stable v2 compile entrypoint:

```bash
tectonic -X compile -Z search-path="$(pwd)/third_party/acmart-src" main.tex
tectonic -X compile -Z search-path="$(pwd)/third_party/acmart-src" supplement.tex
```

Or build both PDFs together with:

```bash
make pdf
```

To verify that the actual compile path is using the vendored ACM template rather than Tectonic's cached copy, run:

```bash
make verify-template
```

Then inspect:

- `output/v219_stdout/main.stdout.log`
- `output/v219_stdout/supplement.stdout.log`

The first lines should show:

```text
Document Class: acmart 2026/06/27 v2.19
```

If a relative `search-path` still resolves to Tectonic's cached template on a local machine, prefer an absolute path to `third_party/acmart-src/`. The repository `Makefile` already does this to avoid accidentally compiling against the bundled older `acmart` copy.

The submission target is ACM `acmart` with `\documentclass[manuscript]{acmart}`. The main paper and supplement are packaged as separate files for CSUR editorial review.

## Status

The current package preserves the root-level manuscript structure, uses a vendored ACM template source, and keeps the main paper and supplement as separate submission artifacts for low-diff collaboration and review.
