# ~/HTML/WilfridSKendall/Thessaloniki-2024
title             := Thessaloniki-2024
biblio-source     := CFTP.bib 
version           := VERSION.txt
versionsed        := version.sed

source            := $(title).qmd
biblio            := $(title).bib
macros            := $(title).sty
csl               := /home/wilfrid/lib/pandoc/CSL/ima-journal-of-applied-mathematics.csl
beamer            := $(title).pdf
handout           := $(title)-handout.pdf
handout-2x2       := $(title)-handout-2x2.pdf
notes             := $(title)-notes.pdf
notes-2x2         := $(title)-notes-2x2.pdf


##################################################

QUARTO	      := /usr/local/bin/quarto
quarto_opt    := --highlight-style tango

##################################################

main:           $(beamer)
handout:        $(handout-2x2)
notes:          $(notes-2x2)

full:           $(handout) $(handout-2x2) $(beamer)

see:            main;    xdg-open $(beamer)
see_handout:    $(handout-2x2); xdg-open $(handout-2x2)
see_notes:      $(notes-2x2); xdg-open $(notes-2x2)

#################################################

%.pdf: %.qmd $(biblio) $(macros)
	sed -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(quarto_opt)              \
	--citeproc --bibliography=$(biblio) --csl=$(csl)

%.tex: %.qmd $(biblio)
	$(QUARTO) render $< --to=latex $(quarto_opt)

$(biblio): $(biblio-source)
	sed --regexp-extended -f $(HOME)/lib/bibfix.sed \
		-e "s/Kendall, Wilfrid Stephen/WSK/" \
		"$<" > $(biblio)

image/%.pdf: image/%.svg
	$(INKSCAPE) --export-area-drawing --export-type="pdf" $< 
		
#################################################

%-handout.pdf: %.qmd $(biblio)
	sed -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(quarto_opt) --output $@    \
	--citeproc --bibliography=$(biblio) --csl=$(csl)  \
	-M classoption=handout

%-notes.pdf: %.qmd $(biblio)
	sed -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(quarto_opt) --output $@    \
	--citeproc --bibliography=$(biblio) --csl=$(csl)  \
	-M classoption=notes -M classoption=handout

%-2x2.pdf: %.pdf
	$(PDFNUP) --tidy --landscape --frame 'true' --scale '0.95' --nup '2x2' $^ -o $@
