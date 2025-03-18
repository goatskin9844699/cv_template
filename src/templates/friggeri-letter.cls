\ProvidesClass{friggeri-letter}[2015/10/31 Cover letter for friggeri resume]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{letter}%
}
\ProcessOptions\relax
\LoadClass[11pt]{letter}

\RequirePackage[left=22mm,top=17mm,right=22mm,bottom=12mm,nohead,nofoot]{geometry}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor, tabularx}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

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

\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[]{Lato-Light.ttf}%%% modified by Karol Kozioł for ShareLaTex use

\newfontfamily\headingfont[]{texgyreheros-bold.otf}

%\defaultfontfeatures{Mapping=tex-text}
%\setmainfont
%[Mapping=tex-text, Color=textcolor,
%BoldFont=texgyreheros-bold.otf,
%ItalicFont=texgyreheros-italic.otf,
%BoldItalicFont=texgyreheros-bolditalic.otf
%]
%{texgyreheros-regular.otf}
%
%\setmathfont{texgyreheros-regular.otf}
%%


%%%%%%%%%%
% Header %
%%%%%%%%%%

% symbols for contact information
\RequirePackage{marvosym}
\RequirePackage{tikz}
\usetikzlibrary{calc,positioning}

% defines one's email (optional)
\newcommand*{\contact}[6]{
    \def\@street{#1}
    \def\@city{#2}
    \def\@zip{#3}
    \def\@country{#4}
    \def\@phone{#5}
    \def\@email{#6}
}


\newcommand{\rolefont}{%
    \fontsize{14pt}{24pt}\selectfont%
    %\thinfont%
    \color{white}%
}

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
        \fontsize{10pt}{12pt}\color{header}%
        \parbox[t]{\textwidth}{
            \thinfont
            \centering
            \vspace{1mm}
            \@street, \@city, \@zip, \@country \hspace{2.5mm}
            \Mobilefone \hspace{1mm} \@phone \hspace{2.5mm} \Letter \hspace{1mm} \@email            
        }
        %
    };
    \end{tikzpicture}
    \vspace{8 mm}
}