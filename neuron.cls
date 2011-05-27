\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neuron}[06/1/2011 v1.1]
\LoadClassWithOptions{preprint}

\RequirePackage{natbib}
\RequirePackage[labelsep=period]{caption}

%% Set the citation and bibliography style
\bibliographystyle{neuron}
\bibpunct[; ]{(}{)}{;}{a}{,}{;}

\renewcommand\abstracttitle{Summary}
\renewcommand\methodstitle{Experimental Procedures}

\newenvironment{highlights}{%
  \setlength{\parindent}{0in}%
  \section*{Highlights}\par\vspace{-6pt}%
  \begin{list}{$\bullet$ }{%
      \setlength{\topsep}{0in}%
      \setlength{\leftmargin}{0in}%
      \setlength{\listparindent}{0in}%
      \setlength{\labelsep}{0em}%
      \setlength{\labelwidth}{0in}%
      \setlength{\itemsep}{0pt}}
}{\end{list}}

\renewcommand*\numberline[1]{#1.\space}
\renewcommand*{\l@figure}[2]{%
  \setlength\@tempdima{2.3em}%
  \noindent Figure #1\hfil\newline\newline }
