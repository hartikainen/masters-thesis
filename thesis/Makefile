.PHONY: all compile clean info
compile:

BASEFILE:=thesis-hartikainen
LATEXFILE:=$(BASEFILE).tex
OUTPUTFILE:=$(BASEFILE).pdf
INTERMEDIATES:=$(BASEFILE).log $(BASEFILE).aux $(BASEFILE).out \
	$(BASEFILE).bbl $(BASEFILE).blg $(BASEFILE)-blx.bib $(BASEFILE).bcf \
	$(BASEFILE).run.xml

compile:
	pdflatex $(LATEXFILE)
	bibtex $(BASEFILE)
	pdflatex $(LATEXFILE)
	pdflatex $(LATEXFILE)

info:
	@echo "Source: $(LATEXFILE)"
	@echo "Target: $(OUTPUTFILE)"
	@echo "Intermediates: $(INTERMEDIATES)"

clean:
	$(RM) $(INTERMEDIATES)

realclean: clean
	$(RM) $(OUTPUTFILE)
