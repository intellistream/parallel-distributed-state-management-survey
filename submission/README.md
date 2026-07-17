# Submission Source Packages

This directory contains portable LaTeX source packages prepared from the
repository root. No absolute local paths, build logs, or generated PDFs are
included.

## arxiv

`arxiv/main_arxiv.tex` is the author-attributed, combined manuscript for an
arXiv submission. It preserves the current `main.tex` front matter, including
all authors, affiliations, ORCIDs, correspondence note, and funding note. The
four original supplement source files are included as an appendix, and all
citations are resolved through one `refs.bib` bibliography.

Build from `submission/arxiv`:

```bash
tectonic -X compile -Z search-path=acmart main_arxiv.tex
```

## acm-csur

`acm-csur` is the LaTeX source package for ACM CSUR editorial submission. It
keeps the main manuscript and supplement as separate documents, each with its
own entry point and bibliography, matching the current ACM manuscript layout.
The publication manuscript is `main.tex`; `supplement.tex` is electronic
supplementary material. This separation identifies the material intended for
the 35-page publication limit and the material intended for the online
supplement.

Build from `submission/acm-csur`:

```bash
tectonic -X compile -Z search-path=acmart main.tex
tectonic -X compile -Z search-path=acmart supplement.tex
```

The package contains only source and required figure/template assets. Its
`readme.txt` gives the Digital Library description required for supplementary
online-only material. Create a ZIP archive from the contents of
`submission/acm-csur`, not from the enclosing repository.

## Final Portal Check

The supplied CSUR guidelines require a Long Survey Paper to remain within 35
formatted pages including references, require author names and affiliations,
and require funding acknowledgment in a first-page footnote when applicable.
They also require a short `readme.txt` for supplementary online-only material.
Before final submission, confirm the current ScholarOne upload slots, provide
the submitting author's ORCID, and complete the author-rights workflow in the
portal. The local package verification covers source completeness and
compilation only.
