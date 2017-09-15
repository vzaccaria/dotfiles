
.DEFAULT: all

%.pdf: %.tex
	jslatex $< lualatex --nobibtex

%.ref.pdf: %.tex
	jslatex $< lualatex

%.tex: %.org
	emacsclient --eval "(progn (find-file \"$<\") (org-latex-export-to-latex))"

%.beamer.tex: %.org
	emacsclient --eval "(progn (find-file \"$<\") (org-beamer-export-to-latex))"
	mv $*.tex $@

.PHONY: clean
clean:
	rm -rf *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc _minted-* *.pyg *.fls *.fdb_latexmk *.synctex.gz

.PHONY: dist-clean
dist-clean: clean
	rm -f *.pdf
