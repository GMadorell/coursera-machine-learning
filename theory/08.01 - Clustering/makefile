
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "08.01 - Clustering.md" > "08.01 - Clustering.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "08.01 - Clustering"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "08.01 - Clustering"}}.tex

	python scripts/apply_template.py -i "08.01 - Clustering.tex" -o "08.01 - Clustering.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex "08.01 - Clustering".tex
	bibtex "08.01 - Clustering"
	latex "08.01 - Clustering".tex
	latex "08.01 - Clustering".tex
	pdflatex "08.01 - Clustering".tex

debug:
	$(MAKE) build
	xdg-open "08.01 - Clustering.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc