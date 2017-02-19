\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv_ch}[2015/10/25 cv Switzerland]

\newif\ifphoto
\photofalse

\newif\ifNA
\NAfalse
\DeclareOption{photo}{\phototrue}
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
\setlist[itemize,1]{nosep,itemsep=0.1em,leftmargin=1cm,labelsep=0.25cm,label=\tiny\raisebox{\bulletraise}{\textbullet}}

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
\setlength{\parskip}{0.3em} % small space between paragraphs
\setlength{\parindent}{0pt}
\newlength{\datecolumnwidth}
\setlength{\datecolumnwidth}{0.15\textwidth}
\newlength{\sepcolumnwidth}
\setlength{\sepcolumnwidth}{0.02\textwidth}
\newcommand*{\textcolumnwidth}{\textwidth-\datecolumnwidth-\sepcolumnwidth}
\newlength{\sectionspacing}
\setlength{\sectionspacing}{1em}
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
	\vspace{1.5em}
    {\sectionfont #1}\\[\sectionspacing]
}




% variables
\newcommand{\addtitle}[2]{%
    {\centering\namestyle{#1}%
        \ifstrempty{#2}{}{\titlestyle{| #2}}\\[0.1em]}
}

\newcommand{\addcontact}[3]{%
    {\centering\addressstyle{#1\\#2 \addbullet #3}\\[\mytitlespacing]}
}
 
\newcommand{\addquote}[1]{%
    {\quotefont #1}
}




\newcommand{\datedcventry}[4]{%
    \noindent #2\ifstrempty{#3}{}{, #3}\hfill #1\\[0em]
    #4
    \par
}



