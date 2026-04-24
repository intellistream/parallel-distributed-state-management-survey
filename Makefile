.PHONY: all pdf clean

TECTONIC ?= $(HOME)/.cargo/bin/tectonic
TEXINPUTS_DIR := third_party/acmart-src//:
MAIN_TEX := main.tex
MAIN_PDF := main.pdf

all: pdf

pdf: $(MAIN_PDF)

$(MAIN_PDF): $(MAIN_TEX) refs.bib
	@test -x "$(TECTONIC)" || { echo "tectonic not found at $(TECTONIC)"; exit 1; }
	TEXINPUTS=$(TEXINPUTS_DIR) $(TECTONIC) $(MAIN_TEX)

clean:
	rm -f $(MAIN_PDF) *.aux *.bbl *.blg *.fls *.fdb_latexmk *.log *.out *.toc *.synctex.gz *.xdv