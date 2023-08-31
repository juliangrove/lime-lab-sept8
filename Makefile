default:
	nix-shell --pure --run "make lime-lab-sept8.pdf"

lime-lab-sept8.tex: lime-lab-sept8.org
	emacs --batch --eval="(load \"${MYEMACSLOAD}\")" $< -f org-beamer-export-to-latex --kill

lime-lab-sept8.pdf: lime-lab-sept8.tex
	pdflatex lime-lab-sept8
	bibtex lime-lab-sept8
	pdflatex lime-lab-sept8
	pdflatex lime-lab-sept8

clean:
	rm -f *.aux *.nav *.tex *.toc *.snm *.pdf *.bbl *.blg *.bcf *.out *.log *~
