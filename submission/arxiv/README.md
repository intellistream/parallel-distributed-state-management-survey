# arXiv Source

Compile the combined, author-attributed manuscript from this directory:

```bash
tectonic -X compile -Z search-path=acmart main_arxiv.tex
```

The appendix is assembled from the unchanged files in
`supplement_sections/`, and `main_arxiv.tex` has one `\bibliography{refs}`.
For arXiv upload, archive the contents of this directory so that
`main_arxiv.tex`, `refs.bib`, `acmart/`, `figures/`, and
`supplement_sections/` remain at their current relative paths.
