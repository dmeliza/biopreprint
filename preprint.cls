%% Class preprint
%% Adapted from nature.cls, by Peter Czoschke, czoschke@mrl.uiuc.edu
%% v1.0 21 Apr 2008
%% Major revision by C Daniel Meliza, dmeliza@uchicago.edu
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{preprint}[2011/10/05 v1.2]
\typeout{A class for writing preprints}
\typeout{Original by Peter Czoschke, adapted by Dan Meliza}
\typeout{ }


\DeclareOption{lineno}{%
  \AtEndOfClass{\RequirePackage{lineno}}
  \AtBeginDocument{\linenumbers}
}

%% Global option whether or not figures are shown
\newif\if@showfigures\@showfiguresfalse
\DeclareOption{showfigures}{
  \@showfigurestrue
}

%% Global option whether or not single spaced
\newif\if@singlespace\@singlespacefalse
\DeclareOption{singlespace}{
  \@singlespacetrue
}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{times}
\RequirePackage{mathptmx}
\RequirePackage{fullpage}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage[none]{hyphenat}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{latexsym}
\RequirePackage{amsfonts}
\RequirePackage{url}
\RequirePackage{booktabs}
\RequirePackage{rotating}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

%% Some style parameters
\setlength\parindent{0in}
\setlength\parskip{12pt}
\newcommand{\spacing}[1]{\renewcommand{\baselinestretch}{#1}\large\normalsize}
\if@singlespace
\spacing{1}
\else
\spacing{2}
\fi

%% Reduce the amount of skip around equations
\setlength{\abovedisplayskip}{0ex}
\g@addto@macro\normalsize{\setlength{\abovedisplayskip}{0ex}}

%% Redefine title
\def\@maketitle{%
  \newpage\spacing{1}\setlength{\parskip}{12pt}%
    {\Large\bfseries\noindent\raggedright \textsf{\@title} \par}%
    {\noindent\sloppy \@author}%
}

%% Define the affiliations environment, list each institution as an \item
%% Put after \maketitle
\newenvironment{affiliations}{%
    \setcounter{enumi}{1}%
    \setlength{\parindent}{0in}%
    \spacing{1}%
    \slshape\sloppy%
    \begin{list}{\upshape$^{\arabic{enumi}}$}{%
        \usecounter{enumi}%
        \setlength{\leftmargin}{0in}%
        \setlength{\topsep}{0in}%
        \setlength{\labelsep}{0in}%
        \setlength{\labelwidth}{0in}%
        \setlength{\listparindent}{0in}%
        \setlength{\itemsep}{0ex}%
        \setlength{\parsep}{0in}%
        }
    }{\end{list}}


%% Define the frontpage environment for running title, corresponding
%% author, etc.
\newenvironment{frontpage}{%
    \setlength{\parindent}{0in}%
    \spacing{1}%
    \begin{list}{}{%
        \setlength{\leftmargin}{0in}%
        \setlength{\listparindent}{0in}%
        \setlength{\labelsep}{0em}%
        \setlength{\labelwidth}{0in}%
        \setlength{\itemsep}{12pt}%
        \let\makelabel\frontpagelabel}
    }
    {\end{list}}
\newcommand*{\frontpagelabel}[1]{\textbf{#1}\hspace{1em}}

%% Redefine the \section formats.
\renewcommand{\section}{\@startsection {section}{1}{0pt}%
  {-1ex}{0.01ex minus 1ex}%
  {\bfseries\large}%
}
\renewcommand{\subsection}{\@startsection {subsection}{2}{0pt}%
  {-1ex}{0.01ex minus 1ex}%
  {\itshape}%
}


% define some text
\newcommand\abstracttitle{Abstract}
\newcommand\methodstitle{Methods}
\newcommand\introtitle{Introduction}
\newcommand\resultstitle{Results}
\newcommand\discussiontitle{Discussion}
\newcommand\referencestitle{References}

%% Redefine the abstract environment to look like a normal section
\renewenvironment{abstract}{%
  \clearpage%
  \section*{\abstracttitle}
}{}

%% Define the methods environment.  Use \subsection to separate.
\newenvironment{methods}{%
  \section*{\methodstitle}%
}{}

%% Define the introduction environment; default is to suppress subsections
\newenvironment{introduction}{%
  \clearpage%
  \section*{\introtitle}%
}{}

\newenvironment{results}{%
  \section*{\resultstitle}%
}{}

\newenvironment{discussion}{%
  \section*{\discussiontitle}%
}{}

\newcommand{\references}[1]{%
  \clearpage%
  \section*{\referencestitle}%
  \bibliography{#1}%
}

%% No heading for References section, but eat up the extra space from \section command
\if@singlespace
\renewcommand\refname{\vspace{-24pt}\setlength{\parskip}{12pt}}
\else
\renewcommand\refname{\vspace{-48pt}\setlength{\parskip}{12pt}}
\fi

%% Figures are generally not embedded in the file; to print the
%% legends use \includegraphics and \captionof; the graphics
%% themselves will be ignored (except if option showfigures is set)
\if@showfigures
\else
\AtBeginDocument{\let\includegraphics\NAT@ignore}
\newcommand{\NAT@ignore}[2][]{}
\fi

%redefine caption to captionlistentry to suppress figure floats
\renewenvironment{figure}{%
  \if@showfigures
  \else
  \let\caption\captionlistentry%
  \fi
  \@float{figure}
 }{\end@float}

% format list of figures
\renewcommand\listfigurename{Figure Legends}
