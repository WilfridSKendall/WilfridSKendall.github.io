# ~/HTML/WilfridSKendall/Kozani-Cacoullos-2024
title             := Kozani-Cacoullos-2024
biblio-source     := bibliography-SG.bib
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
QUARTO_OPT    := --highlight-style tango

INKSCAPE      := /usr/bin/inkscape

.PHONY: main handout notes full see see_handout see_notes qrcode

##################################################

main:           $(beamer)
handout:        $(handout-2x2)
notes:          $(notes-2x2)

full:           $(handout) $(handout-2x2) $(beamer)

see:            main;    xdg-open $(beamer)
see_handout:    $(handout-2x2); xdg-open $(handout-2x2)
see_notes:      $(notes-2x2); xdg-open $(notes-2x2)

#################################################

$(beamer): $(source) $(biblio) $(macros)
	git log -1 > $(version)
	sed -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(QUARTO_OPT)              \
	--citeproc --bibliography=$(biblio) --csl=$(csl)

%.tex: %.qmd $(biblio)
	$(QUARTO) render $< --to=latex $(QUARTO_OPT)

$(biblio): $(biblio-source)
	sed --regexp-extended -f $(HOME)/lib/bibfix.sed \
		-e "s/Kendall, Wilfrid Stephen/WSK/" \
		"$<" > $(biblio)

qrcode: image/talk_URL.jpg
	qrencode -s 1 -l H -o image/talk_URL.png "https://wilfridskendall.github.io/talks/Kozani-Cacoullos-2024/Kozani-Cacoullos-2024-handout.pdf"
	convert image/talk_URL.png image/talk_URL.jpg
	rm image/talk_URL.png

	
#################################################

%-handout.pdf: %.qmd $(biblio)
	git log -1 > $(version)
	sed -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(QUARTO_OPT) --output $@    \
	--citeproc --bibliography=$(biblio) --csl=$(csl)  \
	-M classoption=handout

%-notes.pdf: %.qmd $(biblio)
	git log -1 > $(version)
	sed -e "1iThese notes were produced from \`$<\`:\n" -f $(versionsed) $(version)  | \
	$(QUARTO) render $< - --to=beamer $(QUARTO_OPT) --output $@    \
	--citeproc --bibliography=$(biblio) --csl=$(csl)  \
	-M classoption=notes -M classoption=handout

%-2x2.pdf: %.pdf
	$(PDFNUP) --tidy --landscape --frame 'true' --scale '0.95' --nup '2x2' $^ -o $@

image/%.pdf: image/%.svg
	$(INKSCAPE) --export-area-drawing --export-type="pdf" $< 

%.jpg: %.png ; convert $^ $@ ; rm $^

image/talk_URL.png:
	qrencode -s 1 -l H -o "$@" \
		"https://wilfridskendall.github.io/talks/Kozani-Cacoullos/Kozani-Cacoullos-handout.pdf"
