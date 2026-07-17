# ACM CSUR LaTeX Source

This package keeps the ACM main manuscript and supplement as distinct entry
points:

```bash
tectonic -X compile -Z search-path=acmart main.tex
tectonic -X compile -Z search-path=acmart supplement.tex
```

Archive the contents of this directory for submission. `main.tex` and
`supplement.tex` retain their existing front-matter and bibliography behavior;
the supplied `acmart/` directory pins the class and bibliography style used
for local verification. `main.tex` is the publication manuscript; the separate
`supplement.tex` is electronic supplementary material. See `readme.txt` for
the required supplement description and the page-boundary statement.
