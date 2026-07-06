.PHONY: all pdf clean
.PHONY: verify-template

TECTONIC ?= tectonic
TEMPLATE_DIR := $(abspath third_party/acmart-src)
TECTONIC_FLAGS ?= -X compile -Z search-path=$(TEMPLATE_DIR)
MAIN_TEX := main.tex
MAIN_PDF := main.pdf
SUPPLEMENT_TEX := supplement.tex
SUPPLEMENT_PDF := supplement.pdf
VERIFY_DIR := output/v219_stdout

ifeq ($(OS),Windows_NT)
MKDIR_VERIFY = powershell -NoProfile -Command "New-Item -ItemType Directory -Force -Path '$(VERIFY_DIR)' | Out-Null"
CLEAN_ARTIFACTS = powershell -NoProfile -Command "$$paths = @('$(MAIN_PDF)','$(SUPPLEMENT_PDF)','*.aux','*.bbl','*.blg','*.fls','*.fdb_latexmk','*.log','*.out','*.toc','*.synctex.gz','*.xdv'); foreach ($$pattern in $$paths) { Get-ChildItem -Path $$pattern -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue }"
else
MKDIR_VERIFY = mkdir -p $(VERIFY_DIR)
CLEAN_ARTIFACTS = rm -f $(MAIN_PDF) $(SUPPLEMENT_PDF) *.aux *.bbl *.blg *.fls *.fdb_latexmk *.log *.out *.toc *.synctex.gz *.xdv
endif

all: pdf

pdf: $(MAIN_PDF) $(SUPPLEMENT_PDF)

$(MAIN_PDF): $(MAIN_TEX) refs.bib
	$(TECTONIC) $(TECTONIC_FLAGS) $(MAIN_TEX)

$(SUPPLEMENT_PDF): $(SUPPLEMENT_TEX) refs.bib
	$(TECTONIC) $(TECTONIC_FLAGS) $(SUPPLEMENT_TEX)

verify-template:
	$(MKDIR_VERIFY)
	$(TECTONIC) $(TECTONIC_FLAGS) --print $(MAIN_TEX) > $(VERIFY_DIR)/main.stdout.log 2>&1
	$(TECTONIC) $(TECTONIC_FLAGS) --print $(SUPPLEMENT_TEX) > $(VERIFY_DIR)/supplement.stdout.log 2>&1

clean:
	$(CLEAN_ARTIFACTS)
