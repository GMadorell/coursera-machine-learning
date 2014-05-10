
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "08.02 - Dimensionality Reduction.md" > "08.02 - Dimensionality Reduction.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "08.02 - Dimensionality Reduction"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "08.02 - Dimensionality Reduction"}}.tex

	python scripts/apply_template.py -i "08.02 - Dimensionality Reduction.tex" -o "08.02 - Dimensionality Reduction.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex "08.02 - Dimensionality Reduction".tex
	bibtex "08.02 - Dimensionality Reduction"
	latex "08.02 - Dimensionality Reduction".tex
	latex "08.02 - Dimensionality Reduction".tex
	pdflatex "08.02 - Dimensionality Reduction".tex

debug:
	$(MAKE) build
	xdg-open "08.02 - Dimensionality Reduction.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc