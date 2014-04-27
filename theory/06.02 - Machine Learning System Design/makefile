
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "06.02 - Machine Learning System Design.md" > "06.02 - Machine Learning System Design.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "06.02 - Machine Learning System Design"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "06.02 - Machine Learning System Design"}}.tex

	python scripts/apply_template.py -i "06.02 - Machine Learning System Design.tex" -o "06.02 - Machine Learning System Design.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex "06.02 - Machine Learning System Design".tex
	bibtex "06.02 - Machine Learning System Design"
	latex "06.02 - Machine Learning System Design".tex
	latex "06.02 - Machine Learning System Design".tex
	pdflatex "06.02 - Machine Learning System Design".tex

debug:
	$(MAKE) build
	xdg-open "06.02 - Machine Learning System Design.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc