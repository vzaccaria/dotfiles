$(BUILDIR)/%.xelatex.pdf: %.xelatex.tex $(BUILDIR)/.f
	xelatex $< > latex.log
	xelatex $< > latex.log
	mv $*.xelatex.pdf $(BUILDIR)
	rm -f $*.xelatex.aux $*.xelatex.log
