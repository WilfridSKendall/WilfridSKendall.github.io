# Fibre-SIRSN-talk
title             := Short-Fibre-SIRSN-talk
#biblio-source     := bibliography-SIRSN.bib # Link to file '~/Reading/bibliography/Stochastic Geometry-SIRSN.bib'
biblio-source     := bibliography-SIRSN.bib
version           := VERSION.txt
versionsed        := version.sed

source            := $(title).qmd
biblio            := $(title).bib
macros            := $(title).sty
# csl               := ~/lib/pandoc/CSL/ima-journal-of-applied-mathematics.csl
csl               := ima-journal-of-applied-mathematics.csl
beamer            := $(title).pdf
handout           := $(title)-handout.pdf
handout-2x2       := $(title)-handout-2x2.pdf
notes             := $(title)-notes.pdf
notes-2x2         := $(title)-notes-2x2.pdf

##################################################
# Utilities:
SED           := /usr/bin/sed
PDFNUP        := /usr/bin/pdfjam
CONVERT       := /usr/bin/convert
QRENCODE      := /usr/bin/qrencode
ZBARIMG       := /usr/bin/zbarimg

QUARTO	      := /usr/local/bin/quarto
QUARTO_OPT    := --highlight-style tango 

.PHONY: main handout notes full see see_handout see_notes qrcode
.INTERMEDIATE: Abstract-template.qmd

##################################################
# General targets:
main:           $(beamer)
handout:        $(handout-2x2)
notes:          $(notes-2x2)

full:           $(handout) $(handout-2x2) $(beamer)

see:            main;    xdg-open $(beamer)
see_handout:    $(handout-2x2); xdg-open $(handout-2x2)
see_notes:      $(notes-2x2); xdg-open $(notes-2x2)

#################################################
# Creating main pdf file 
$(beamer): $(source) $(biblio) $(macros)
	git log -1 > $(version)
	$(SED) -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(QUARTO_OPT)              \
	--citeproc --bibliography=$(biblio) --csl=$(csl)

%.tex: %.qmd $(biblio)
	$(QUARTO) render $< --to=latex $(QUARTO_OPT)

$(biblio): $(biblio-source)
	$(SED) --regexp-extended -f $(HOME)/lib/bibfix.sed \
		-e "s/Kendall, Wilfrid Stephen/WSK/" \
		"$<" > $(biblio)

#################################################
# Creating abstract
Abstract-template.qmd : $(source)
	$(SED) -e'/subtitle: *|/d' -e'/^$$/a{{< include _Abstract-paragraph.qmd >}}\n\n## References'  -e'/^$$/q' $(source) > $@
Abstract.docx: Abstract-template.qmd _Abstract-paragraph.qmd
	$(QUARTO) render Abstract-template.qmd --to=docx $(QUARTO_OPT) \
	--citeproc --bibliography=$(biblio) --csl=$(csl)#
Abstract.txt: Abstract-template.qmd _Abstract-paragraph.qmd
	$(QUARTO) render $< --output $@ --to=plain $(QUARTO_OPT) \
	--citeproc --bibliography=$(biblio) --csl=$(csl)


#################################################
# Creating other pdf files:
%-handout.pdf: %.qmd $(biblio) # $(figures-pdf)
	$(SED) -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(QUARTO_OPT) --output $@    \
	--citeproc --bibliography=$(biblio) --csl=$(csl)  \
	-M classoption=handout

%-notes.pdf: %.qmd $(biblio) # $(figures-pdf)
	$(SED) -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(QUARTO_OPT) --output $@    \
	--citeproc --bibliography=$(biblio) --csl=$(csl)  \
	-M classoption=notes -M classoption=handout

%-2x2.pdf: %.pdf
	$(PDFNUP) --tidy --landscape --frame 'true' --scale '0.95' --nup '2x2' $^ -o $@

#################################################
# Creating QR-codes:
# Note use of `ImageMagick` program `convert`.
# For `qrcode` and `zbarimg` see `~/lib/QRcode`
qrcode:
	$(QRENCODE) -s 1 -l H -o image/talk_URL.png \
		"https://wilfridskendall.github.io/talks/Short-Fibre-SIRSN-talk-2024/Short-Fibre-SIRSN-talk-handout.pdf"
	$(CONVERT) image/talk_URL.png image/talk_URL.jpg
	$(ZBARIMG) image/talk_URL.jpg | tail -1
	
	
