\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{natneurosci}[06/1/2011 v1.1]
\LoadClassWithOptions{preprint}

\RequirePackage[super,sort&compress]{natbib}
\RequirePackage[labelfont=bf,labelsep=quad]{caption}

%% Set the citation and bibliography style
\bibpunct{}{}{,}{s}{,}{,}
\bibliographystyle{naturemag}
%% make labels in bibliobraphy be #.
\renewcommand\@biblabel[1]{#1.}

% suppress introduction heading altogether
\renewenvironment{introduction}{%
  \clearpage%
}{}

% symbol footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Controls caption formatting in list of figures
\renewcommand*\numberline[1]{\textbf{#1}\space\space}
\renewcommand*{\l@figure}[2]{%
  \setlength\@tempdima{2.3em}%
  \noindent \textbf{Figure} #1\hfil\newline\newline }
