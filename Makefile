TARGET=paper
SRC=$(TARGET).tex
ALL_SRCS = $(wildcard document/*.tex)
DVI=$(SRC:.tex=.dvi)
PDF=$(SRC:.tex=.pdf)
TEX=platex
DVIPDF=dvipdfmx
DIFFDIR=old_version

.SUFFIXES: .tex .dvi .pdf

all:$(PDF) 
	evince $(PDF) &

$(DVI): $(SRC) $(ALL_SRCS)

$(PDF): $(DVI) 

.dvi.pdf:
	$(DVIPDF) $<

.tex.dvi: 
	$(TEX) $<
	$(TEX) $<

clean:
	rm -f $(DVI) *.aux *.log *.toc *.pbm *.bmc $(PDF) diff.pdf diff.tex
