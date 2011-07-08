all: manual

manual: manual.pdf

.PHONY: all paper

STATIC_FIGURES=
FIGURES=graphics/by-sa.pdf

manual.pdf: manual.tex $(STATIC_FIGURES) $(FIGURES)
	pdflatex $<
	pdflatex $<
#	BSTINPUTS=$(STYLES): bibtex $(patsubst %.tex,%,$<)
#	TEXINPUTS=$(STYLES): pdflatex $<
#	TEXINPUTS=$(STYLES): pdflatex $<
#	TEXINPUTS=$(STYLES): pdflatex $<

clean:
	rm -f *.pdf *.aux *.bbl *.blg *.log *.out *.spl *.toc

graphics/%.eps: graphics/%.dia
	dia -e $@ -t eps $<

graphics/%.pdf: graphics/%.eps
	ps2pdf -dEPSCrop $< $@

graphics/%.pdf: graphics/%.svg
	inkscape -A $@ -T $< 
