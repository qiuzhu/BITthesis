TARGETS = main
LATEXMK = latexmk

all:
	$(LATEXMK) -synctex=1 -xelatex  $(TARGETS)

clean:
	$(LATEXMK) -CA
	-find -name '*.aux' -exec rm -f {} \;
	-find -name '*.bak' -exec rm -f {} \;
	-find -name '*.dvi' -exec rm -f {} \;
	-find -name '*~' -exec rm -f {} \;
	-find -name '#*#' -exec rm -f {} \;
	-find -name 'semantic.cache' -exec rm -f {} \;
	-find -name '*.log' -exec rm -f {} \;
	-rm -f *.bbl *.blg *.log *.out *.ps *.thm *.toc *.toe *.lof *.lot 
	-rm -f *.loa *.aen *synctex*
	-rm -f *.html *.css *.scm *.hlog
	-rm -f _region_.tex
	-rm -f -rf auto
	-rm -f *.fen
	-rm -f *.ten
	-rm -rf ./body/auto
	-rm -rf ./reference/auto
	-rm -rf ./setup/auto
	-rm -rf ./preface/auto
	-rm -rf *.prv
	@echo All done.

.PHONY: all clean
