\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kj_cv_NA}[2013/10/25 cv North America]

\newif\ifNA
\NAtrue

\DeclareOption{eur}{\NAfalse}
\DeclareOption{na}{\NAtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[]{article}

% PACKAGES
\RequirePackage{titlesec} % define title/section stying
\RequirePackage{color} % use colors
% \RequirePackage{tgpagella} % fonts
\RequirePackage[light,math]{kurier}
\RequirePackage[T1]{fontenc} % directly input accents
\RequirePackage{xcolor} % define colors using other colors
\RequirePackage{etoolbox} % if/else statements
\RequirePackage{calc} % for calculating lengths
\RequirePackage{url} % for links
\RequirePackage[unicode,hidelinks]{hyperref} % for links (to email)
\RequirePackage{enumitem} % to customize lists
%\RequirePackage{tabularx}

%list style
\setlist[itemize,1]{leftmargin=0.3cm,labelsep=0.25cm,itemsep=0em,parsep=0em,topsep=0em,label=\tiny\raisebox{\bulletraise}{\textbullet}}

\pagestyle{empty}


% font style
\renewcommand*{\familydefault}{\rmdefault}

% text colors
\definecolor{color0}{rgb}{0,0,0} % black
\definecolor{color1}{rgb}{0.22,0.45,0.70} % light blue
\definecolor{color2}{rgb}{0.45,0.45,0.45} % dark grey
\definecolor{color3}{rgb}{0.2,0.2,0.2}

\ifNA
\colorlet{color1}{color0}
\fi

% lengths
\setlength{\parskip}{0em} % small space between paragraphs
\setlength{\parindent}{0pt}
\newlength{\datecolumnwidth}
\setlength{\datecolumnwidth}{0.15\textwidth}
\newlength{\sepcolumnwidth}
\setlength{\sepcolumnwidth}{0.02\textwidth}
\newcommand*{\textcolumnwidth}{\textwidth-\datecolumnwidth-\sepcolumnwidth}
\newlength{\sectionspacing}
\setlength{\sectionspacing}{0.3em}
\newlength{\mytitlespacing}
\setlength{\mytitlespacing}{0.1em}

% font commands
\newcommand*{\namefont}{\huge\bfseries\upshape}
\newcommand*{\titlefont}{\huge\mdseries\upshape}
\newcommand*{\addressfont}{\small\mdseries\upshape}
\newcommand*{\addbullet}{%
    {~~~{\rmfamily\textbullet}~~~}}

\ifNA
\newcommand*{\sectionfont}{\Large\bfseries\upshape\centering\scshape\color{color1}}
\else
\newcommand*{\sectionfont}{\Large\bfseries\upshape\color{color1}}
\fi

\newcommand*{\quotefont}{\normalsize\centering\itshape}
\newcommand*{\regularfont}{\normalsize\upshape}

% font styles
\newcommand*{\namestyle}[1]{{\namefont\textcolor{color1}{#1}}}
\newcommand*{\titlestyle}[1]{{\titlefont\textcolor{color2!85}{#1}}}
\newcommand*{\addressstyle}[1]{{\addressfont\textcolor{color2}{#1}}}


% redefine section
% SECTION LENGTHS
\newlength{\ruleheight}
\ifNA
\setlength{\ruleheight}{0pt}
\else
\setlength{\ruleheight}{0.4ex}
\fi
\newlength{\baseletterheight}
\settoheight{\baseletterheight}{\sectionfont{X}}
\newlength{\normalletter}
\settoheight{\normalletter}{{\normalsize X}}
\newlength{\tinyletter}
\settoheight{\tinyletter}{{\tiny X}}
\newlength{\bulletraise}
\setlength{\bulletraise}{0.5\normalletter-0.5\tinyletter}


\renewcommand{\section}[1]{%
	\vspace{0.3em}
    \ifNA
    {\sectionfont #1\\}
    \else%
    \parbox[t]{\datecolumnwidth}{\strut\raggedleft\raisebox{0.5\baseletterheight-\ruleheight}{{\color{color1}\rule{\datecolumnwidth}{\ruleheight}}}}%
    \hspace{\sepcolumnwidth}%
    {\sectionfont #1\par}
	\fi
    \vspace{\sectionspacing}
}




% variables
\newcommand{\addtitle}[2]{%
    {\centering\namestyle{#1}%
        \ifstrempty{#2}{}{\titlestyle{| #2}}\\[0.1em]}
}

\newcommand{\addcontact}[4]{%
    {\centering\addressstyle{#1\\#2 \addbullet #3\ifstrempty{#4}{}{\addbullet #4}}
}}
 
\newcommand{\addquote}[1]{%
    {\quotefont #1}
}




\newcommand{\datedcventry}[5]{%
    \ifNA
    #2\ifstrempty{#3}{}{, #3}\hfill #1\par
    #4
    \ifstrempty{#5}{}{%
        \begin{itemize}
            #5
        \end{itemize}
    }
    \else
    \parbox[t]{\datecolumnwidth}{\regularfont\small\raggedleft #1}%
    \hspace{\sepcolumnwidth}%
    \parbox[t]{\textcolumnwidth}{%
        \regularfont #2\hfill #3%
        \ifstrempty{#4}{}{\\[0.1em] #4}%
        
        \ifstrempty{#5}{}{%
            \begin{itemize}
                #5
            \end{itemize}
        }
    }
    \fi
	\vskip 0.5em
    \par
}
