MAIN_en = cv_en
LATEXMK = latexmk -xelatex -shell-escape


all: main clean

main:
	$(LATEXMK) $(MAIN_en).tex

clean: 
	latexmk -c $(MAIN_en).tex

gif:
	convert -density 600 $(MAIN_en).pdf -background white -alpha background -alpha off -strip -resize @1048576 $(MAIN_en)-%02d.png
	convert -layers OptimizePlus -delay 150 -loop 0 $(MAIN_en)-*.png  $(MAIN_en).gif
	rm -r $(MAIN_en)-*.png
