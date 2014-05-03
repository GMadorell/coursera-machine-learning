
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "07.01 - Support Vector Machines.md" > "07.01 - Support Vector Machines.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "07.01 - Support Vector Machines"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "07.01 - Support Vector Machines"}}.tex

	python scripts/apply_template.py -i "07.01 - Support Vector Machines.tex" -o "07.01 - Support Vector Machines.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex "07.01 - Support Vector Machines".tex
	bibtex "07.01 - Support Vector Machines"
	latex "07.01 - Support Vector Machines".tex
	latex "07.01 - Support Vector Machines".tex
	pdflatex "07.01 - Support Vector Machines".tex

debug:
	$(MAKE) build
	xdg-open "07.01 - Support Vector Machines.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc