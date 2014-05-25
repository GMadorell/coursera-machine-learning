
initialize:
	python scripts/initialize.py

build:
	pandoc -f markdown -t latex "10.02 - Application Example: Photo OCR.md" > "10.02 - Application Example: Photo OCR.tex"
	# Use listings.
	# sed -i -e 's/\\begin{verbatim}/\\begin{minipage}\{0\.95\\textwidth}\\begin{lstlisting}/g' "10.02 - Application Example: Photo OCR"}}.tex
	# sed -i -e 's/\\end{verbatim}/\\end{lstlisting}\\end{minipage}/g' "10.02 - Application Example: Photo OCR"}}.tex

	python scripts/apply_template.py -i "10.02 - Application Example: Photo OCR.tex" -o "10.02 - Application Example: Photo OCR.tex" -t latex.template

	python scripts/transform_img_eps.py

	latex -shell-escape "10.02 - Application Example: Photo OCR".tex
	bibtex "10.02 - Application Example: Photo OCR"
	latex -shell-escape "10.02 - Application Example: Photo OCR".tex
	latex -shell-escape "10.02 - Application Example: Photo OCR".tex
	pdflatex -shell-escape "10.02 - Application Example: Photo OCR".tex

debug:
	$(MAKE) clean
	$(MAKE) build
	xdg-open "10.02 - Application Example: Photo OCR.pdf" &
	$(MAKE) clean

publish:
	$(MAKE) build
	$(MAKE) clean   

clean:
	rm -f *.out *.aux *.dvi *.log *.blg *.bbl *.tex-e *.toc *.pyc