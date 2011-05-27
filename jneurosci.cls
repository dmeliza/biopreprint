%% Class jneurosci
%% Copyright 2011 C Daniel Meliza, dmeliza@uchicago.edu
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
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
