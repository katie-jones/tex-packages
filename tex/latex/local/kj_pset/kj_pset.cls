\LoadClass[12pt,fleqn]{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kj_pset}[2014/10/14 Problem sets]

\RequirePackage{outlines}
\RequirePackage{enumitem}
\RequirePackage{etoolbox} % if/else statements
\RequirePackage{fancyhdr}
\RequirePackage[top=1in,bottom=1in,headsep=1cm]{geometry}
\RequirePackage{color}
\RequirePackage{xifthen}
\RequirePackage{changepage}
\RequirePackage{calc}
\RequirePackage{marginnote}

% add headers etc
\pagestyle{fancy}

\reversemarginpar
\setlength{\abovedisplayskip}{1em}
\setlength{\abovedisplayshortskip}{1em}

\definecolor{light-gray}{gray}{0.4}

% headers
\lhead{\textcolor{light-gray}{\@lname}}
\chead{}
\rhead{\textcolor{light-gray}{\@date}}
\lfoot{}
\cfoot{}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}

% no indent paragraphs
\setlength{\parindent}{0px}
\setlength{\parskip}{1em}

% styling for lists
\setlist[itemize,3]{label=-}
\setlist[itemize]{topsep=0pt,parsep=3pt,itemsep=0pt}
\setlist[itemize,1]{topsep=3pt}

% read in vars
\newcommand{\name}[2]{\def\@fname{#1}\def\@lname{#2}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\pset}[1]{\def\@pset{#1}}
\newcommand{\coursename}[1]{\def\@coursename{#1}}

% title command
\renewcommand{\maketitle}{
    {\Large\@coursename}\\[6pt]
    \large\@pset\\[3pt]
    \large\@fname~\@lname\\[12pt]
    \normalsize
}


\newcommand{\q}[1]{%
\marginnote{\large\textbf{#1}}}

\newcommand{\twocol}[2]{%
    \parbox[t]{0.45\linewidth}{#1}
    \hfill\parbox[t]{0.45\linewidth}{#2}}
            
            