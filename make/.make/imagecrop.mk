
PAGESOURCE ?= Drawings.pdf

page-%-full.pdf: $(PAGESOURCE).pdf
	pdftk $< cat $*-$* output $@

page-%-crop.pdf: page-%-full.pdf
	pdfcrop $<
	mv page-$*-full-crop.pdf page-$*-crop.pdf

