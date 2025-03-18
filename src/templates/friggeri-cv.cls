\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass[11pt]{article}
\RequirePackage[left=22mm,top=10mm,right=22mm,bottom=12mm,nohead,nofoot]{geometry}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor, tabularx}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
%\definecolor{lightgray}{HTML}{999999}
\definecolor{lightgray}{HTML}{707070}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

%% modified by Karol Kozioł for ShareLaTex use
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\setmathfont{latinmodern-math.otf}

\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[]{Lato-Light.ttf}%%% modified by Karol Kozioł for ShareLaTex use

\newfontfamily\headingfont[]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}
%


%%%%%%%%%%
% Header %
%%%%%%%%%%

% symbols for contact information
\RequirePackage{marvosym} % needed for phone and email symbols
\RequirePackage{tikz}
\RequirePackage{fontawesome} % needed for location pin
\usetikzlibrary{calc,positioning}

% defines one's email (optional)
% usage: \email{<email adress>}
\newcommand*{\contact}[3]{
    \def\@location{#1}
    \def\@phone{#2}
    \def\@email{#3}}


\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=28mm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
        \parbox[t]{\textwidth}{
            \vspace{-7mm}
          \centering\fontsize{40pt}{72pt}\color{header}%
           {\thinfont #1}{\bodyfont  #2}
        }
    };
    \node [anchor=north] at (name.south) {%
        %
        \parbox[t]{\textwidth}{
            \fontsize{10pt}{12pt}\color{header}
            \thinfont
            \centering
            \vspace{1mm}
            \faMapMarker \hspace{1mm} \@location \hspace{2.5mm}
            \Mobilefone \hspace{1mm} \@phone \hspace{2.5mm} \Letter \hspace{1mm} \@email            
            }
        %
    };
  \end{tikzpicture}
  \vspace{8 mm}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}#1%
    %\@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{longtable}
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
    %\begin{longtable}{p{.2\textwidth}p{.8\textwidth}}
    \begin{longtable}{p{.8\textwidth}p{.2\textwidth}}
    }{%
\end{longtable}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
% this is the original layout (company + job + date on one line, date column left)
%\newcommand{\entry}[4]{%
%    #1 & 
%    \parbox[t]{13.5cm}{
%        \textbf{#2}
%        \hfill%
%        {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
%        \vspace{-2mm}#4\vspace{3mm}%
%    }\\}

% improved style with job and company separate line + date column on right and same line as job name
%\newcommand{\entry}[4]{%
%    \parbox[t]{.8\textwidth}{\textbf{#2}} & \hfill #1 \\
%        {\footnotesize\addfontfeature{Color=lightgray} #3} & \\%
%        \multicolumn{2}{p{\textwidth}}{\vspace{-2mm}#4\vspace{3mm}} \\}

% improved style with job and company on same line + date column on right and same line as job name
\newcommand{\entry}[4]{%
	\parbox[t]{.8\textwidth}{\textbf{#2}\hspace{1.5mm}{\addfontfeature{Color=lightgray}#3}}& \hfill {\textbf{#1}} \\
	%
	\multicolumn{2}{p{\textwidth}}{#4\vspace{2mm}}\\}

%% improved style with job and company separate line + date column on left
%\newcommand{\entry}[4]{%
%    #1 & \parbox[t]{13.5cm}{
%        \textbf{#2}\\
%        %\hfill%
%        {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
%        \vspace{-2mm}#4\vspace{3mm}%
%    }\\}


% define one-line CV entries (for e.g. achievements)
\newcommand{\achievments}[3]{%
    \bodyfont
    \parbox[t]{.13\textwidth}{#1} \parbox[t]{.87\textwidth}{%
        \textbf{#2}\hspace{1mm}
        {\small\addfontfeature{Color=lightgray} #3}
    }
}



%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

%\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}
%
%\DeclareFieldFormat[article]{title}{#1\par}
%\DeclareFieldFormat[inproceedings]{title}{#1\par}
%\DeclareFieldFormat[misc]{title}{#1\par}
%\DeclareFieldFormat[report]{title}{#1\par}
%
%\DeclareBibliographyDriver{article}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \usebibmacro{journal+issuetitle}%
%    \setunit{\space}%
%    \printfield{pages}%
%    \newunit%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{inproceedings}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}%
%    \printfield{booktitle}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{misc}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{booktitle}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{report}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{type}%
%    \setunit{\space}%
%    \printfield{number}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareNameFormat{author}{%
%  \small\addfontfeature{Color=lightgray}%
%  \ifblank{##3}{}{##3\space}#1%
%  \ifthenelse{\value{listcount}<\value{liststop}}
%    {\addcomma\space}
%    {}%
%}
%
%\newcommand{\printbibsection}[2]{
%  \begin{refsection}
%    \nocite{*}
%    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
%  \end{refsection}
%}
%
%\DeclareSortingScheme{chronological}{
%  \sort[direction=descending]{\field{year}}
%  \sort[direction=descending]{\field{month}}
%}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}