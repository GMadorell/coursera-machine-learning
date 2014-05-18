
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "09.02 - Recommender Systems.md" > "09.02 - Recommender Systems.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "09.02 - Recommender Systems"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "09.02 - Recommender Systems"}}.tex

	python scripts/apply_template.py -i "09.02 - Recommender Systems.tex" -o "09.02 - Recommender Systems.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex -shell-escape "09.02 - Recommender Systems".tex
	bibtex "09.02 - Recommender Systems"
	latex -shell-escape "09.02 - Recommender Systems".tex
	latex -shell-escape "09.02 - Recommender Systems".tex
	pdflatex -shell-escape "09.02 - Recommender Systems".tex

debug:
	$(MAKE) clean
	$(MAKE) build
	xdg-open "09.02 - Recommender Systems.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc