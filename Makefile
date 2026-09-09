PACKAGE=lora

FONTS_DIR := lora-fonts/fonts/variable
FONT1_SRC := $(FONTS_DIR)/Lora[wght].ttf
FONT2_SRC := $(FONTS_DIR)/Lora-Italic[wght].ttf
FONT1_DST := Lora.ttf
FONT2_DST := Lora-Italic.ttf

FONTS := $(FONT1_DST) $(FONT2_DST)

LUALATEX_FLAGS := --interaction=nonstopmode --halt-on-error

SAMPLES = \
	sample.tex

PDF = $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf}

all:  ${PDF} $(PACKAGE).sty $(FONTS) LICENSE_FONTS


%.pdf:  %.dtx   $(PACKAGE).sty $(FONTS)
	lualatex $(LUALATEX_FLAGS) $<
	- biber $*
	lualatex $(LUALATEX_FLAGS) $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	lualatex $(LUALATEX_FLAGS) $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do lualatex $(LUALATEX_FLAGS) $<; done

$(FONT1_DST): $(FONT1_SRC)
	cp $< $@
$(FONT2_DST): $(FONT2_SRC)
	cp $< $@

fonts: $(FONTS)

%.sty:   %.ins %.dtx  
	lualatex $<


%.pdf:  %.tex   $(PACKAGE).sty $(FONTS)
	lualatex $(LUALATEX_FLAGS) $<
	- biber $*
	lualatex $(LUALATEX_FLAGS) $<
	lualatex $(LUALATEX_FLAGS) $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do lualatex $(LUALATEX_FLAGS) $<; done


%.ttf: lora-fonts/fonts/variable/%.ttf
	cp $< $@
	mv Lora[wght].ttf Lora.ttf
	mv Lora-Italic[wght].ttf Lora-Italic.ttf


LICENSE_FONTS: lora-fonts/OFL.txt
	cp $< $@

clean:
	$(RM)  *_FAMILY_* *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi\
    *.hd  *.sty *.run.xml *.bcf


distclean: clean
	$(RM) $(PDF) $(PACKAGE).sty $(FONTS) LICENSE_FONTS

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	COPYFILE_DISABLE=1  \
	tar -C .. -czvf ../$(PACKAGE).tgz --exclude '*~' --exclude arsenal-fonts \
	--exclude '*.tgz' --exclude '*.zip'  --exclude ".git*" $(PACKAGE)
	mv ../$(PACKAGE).tgz .


zip:  all clean
	make $(PACKAGE).sty
	$(RM) $(PACKAGE).log
	cd ..;\
	zip -r  $(PACKAGE).zip $(PACKAGE) -x "*.ins" -x "*.gitignore"

