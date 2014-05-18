
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "09.01 - Anomaly Detection.md" > "09.01 - Anomaly Detection.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "09.01 - Anomaly Detection"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "09.01 - Anomaly Detection"}}.tex

	python scripts/apply_template.py -i "09.01 - Anomaly Detection.tex" -o "09.01 - Anomaly Detection.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex -shell-escape "09.01 - Anomaly Detection".tex
	bibtex "09.01 - Anomaly Detection"
	latex -shell-escape "09.01 - Anomaly Detection".tex
	latex -shell-escape "09.01 - Anomaly Detection".tex
	pdflatex -shell-escape "09.01 - Anomaly Detection".tex

debug:
	$(MAKE) clean
	$(MAKE) build
	xdg-open "09.01 - Anomaly Detection.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc