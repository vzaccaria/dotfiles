
.PHONY: clean
clean:
	rm -rf *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc _minted-* *.pyg *.fls *.fdb_latexmk

.PHONY: dist-clean
dist-clean: clean
	rm -f *.pdf
