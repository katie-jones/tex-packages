\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kj_letter}[2013/10/25 cover letter]

\newif\ifsigned
\newif\ifbw
\newif\ifcoverletter
\bwfalse
\signedfalse
\coverletterfalse
\DeclareOption{bw}{\bwtrue}
\DeclareOption{signature}{\signedtrue}
\DeclareOption{coverletter}{\coverlettertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[]{article}


\RequirePackage{color}
\RequirePackage[light,math]{kurier}
\RequirePackage[T1]{fontenc}
\RequirePackage{etoolbox}
\RequirePackage[utf8]{inputenc}

%text colors
\definecolor{color0}{rgb}{0,0,0} % black
\ifbw
\definecolor{color1}{rgb}{0,0,0}
\else
\definecolor{color1}{rgb}{0.22,0.45,0.70} % light blue
\fi
\definecolor{color2}{rgb}{0.45,0.45,0.45} % dark grey
\definecolor{color3}{rgb}{0.2,0.2,0.2}
% \colorlet{color1}{color0}


% paragraph spacing
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

% signature space
\newlength{\sigspace}
\ifsigned
\setlength{\sigspace}{5em}
\else
\setlength{\sigspace}{1.5em}
\fi


% font commands
\newcommand*{\namefont}{\huge\bfseries\upshape}
\newcommand*{\titlefont}{\huge\mdseries\upshape}
\newcommand*{\addressfont}{\small\mdseries\upshape}
\newcommand*{\addbullet}{%
    {~~~{\rmfamily\textbullet}~~~}}
\newcommand*{\sectionfont}{\Large\upshape\centering\scshape\color{color1}}
\newcommand*{\quotefont}{\normalsize\centering\itshape}
\newcommand*{\regularfont}{\normalsize\upshape}

% font styles
\newcommand*{\namestyle}[1]{\namefont\textcolor{color1}{#1}}
\newcommand*{\titlestyle}[1]{\titlefont\textcolor{color2!85}{#1}}
\newcommand*{\addressstyle}[1]{\addressfont\textcolor{color2}{#1}}
\newcommand*{\sectionstyle}[1]{\sectionfont\textcolor{color1}{#1}}


% variables
\newcommand{\myaddress}[1]{\def\@myaddress{#1}}
\newcommand{\contact}[2]{\def\@myemail{#1}\def\@mynumber{#2}}
\newcommand{\myname}[1]{\def\@myname{#1}}
\newcommand{\closing}[1]{\def\@myclosing{#1}}
\newcommand{\toaddress}[1]{\def\@toaddress{#1}}
\newcommand{\school}[1]{\def\@myschool{#1}}
\newcommand{\opening}[1]{\def\@opening{#1}}
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\attached}[1]{\def\@attached{#1}}

\ifcoverletter
\newcommand{\addtitle}{%
{\let\newcommand\renewcommand
\makeatletter
\input{size12.clo}
\makeatother
\let\newcommand\savednewcommand
    {\centering\namestyle{\@myname}\\[0.1em]}
    {\centering\addressstyle{\@myaddress\\[0.1em]\@myemail \addbullet \@mynumber}\\}
    }
}
\else
\newcommand{\addtitle}{%
  { \raggedright
 \@myname\\
 \@myaddress\\[1em]
 \@mynumber\\
 \@myemail\\} }
\fi


\newenvironment{myletter}{%
  \parbox{0.5\linewidth}{\vspace{1em} \@toaddress\\}\hfill\parbox{0.4\linewidth}{\addtitle ~\\[2em]}\\
    \ifdef{\@subject}{{\bfseries\@subject}\\\hrule\vspace{1em}}{}
    {\raggedleft\@date\\[1em]}
    \ifdef{\@opening}{\@opening}{Dear Sir or Madam:}\\[1.5em]
}{
    \@myclosing \\[\sigspace]
    \@myname
    \ifdef{\@attached}{\\[2em]
    \@attached}{}
}


