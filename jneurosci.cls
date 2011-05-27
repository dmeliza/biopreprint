\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jneurosci}[06/1/2011 v1.1]
\LoadClassWithOptions{preprint}

\RequirePackage{natbib}
\RequirePackage[labelfont=bf,labelsep=period]{caption}

%% Set the citation and bibliography style
\bibliographystyle{jneurosci}
\bibpunct[; ]{(}{)}{;}{a}{,}{;}

\renewcommand\methodstitle{Materials and Methods}

% Controls caption formatting in list of figures
\renewcommand*\numberline[1]{\textbf{#1}\space\space}
\renewcommand*{\l@figure}[2]{%
  \setlength\@tempdima{2.3em}%
  \noindent \textbf{Figure} #1\hfil\newline\newline }
