# biopreprint

This project has been migrated to codeberg: https://codeberg.org/dmeliza/biopreprint

Once upon a time, scientific journals required you to submit manuscripts for review in specific formats,
and many hours were spent by graduate students and postdocs as they sadly reformatted after every rejection.

Out of this frustration, biopreprint was born: a A LaTeX class and associated files for generating preprints for
journal submissions that would generate PDF files that looked more or less like what the journals expected. If you would like to use this system, please take a look at the `latex_maint` branch.

With the rise of BioRXiv and other preprint repositories, most journals now accept initial submissions in any format, so my lab now uses a much simpler workflow based on [pandoc](https://pandoc.org). The output looks professional but not excessively polished (please, don't use two-column formats), and includes various features like double-spacing and line numbers that your reviewers will love.

## Instructions

1. Use `manuscript.md` to draft your manuscript in [pandoc-flavored markdown](https://pandoc.org/MANUAL.html#pandocs-markdown). You can use LaTeX math mode and citations. Add references to `references.bib` or set the `bibliography` metadata field to point to your `.bib` files.

2. When the text is reasonably complete, run `pandoc --template=preprint-template.tex -o manuscript.tex manuscript.md` to generate the LaTeX template.

3. Continue any further work in `manuscript.tex`

4. Generate the PDF for submission by running `pdflatex manuscript` then `bibtex manuscript`. Then run `pdflatex manuscript` until it stops mentioning citations and references.

5. Good luck!

## Generating Word documents

A few journals (looking at you, _Science_) still require manuscripts to be submitted in Word format. Good news! You can use pandoc to convert your LaTex file to docx. For example, this command does a pretty good job of getting you most of the way to a submittable document.

`pandoc --bibliography=references.bib --csl=cslfiles/science.csl -o manuscript.docx manuscript.tex`

You can find CSL files in various places around the web. There are a few in the `cslfiles` directory to get you started.
