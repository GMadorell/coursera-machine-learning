
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "10.01 - Large Scale Machine Learning.md" > "10.01 - Large Scale Machine Learning.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "10.01 - Large Scale Machine Learning"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "10.01 - Large Scale Machine Learning"}}.tex

	python scripts/apply_template.py -i "10.01 - Large Scale Machine Learning.tex" -o "10.01 - Large Scale Machine Learning.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex -shell-escape "10.01 - Large Scale Machine Learning".tex
	bibtex "10.01 - Large Scale Machine Learning"
	latex -shell-escape "10.01 - Large Scale Machine Learning".tex
	latex -shell-escape "10.01 - Large Scale Machine Learning".tex
	pdflatex -shell-escape "10.01 - Large Scale Machine Learning".tex

debug:
	$(MAKE) clean
	$(MAKE) build
	xdg-open "10.01 - Large Scale Machine Learning.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc