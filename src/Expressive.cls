\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Expressive}[2024/08/10 Base Class for Expressive Resumes/Cover Letters]

\newcommand{\spacesmall}{5pt}
\newcommand{\spacenormal}{10pt}

%% ----- Options -----
% https://www.latex-project.org/help/documentation/clsguide.pdf

% None currently

%% ----- Parent Class -----
\LoadClass[letterpaper,10pt]{article}

%% ----- Required Packages -----
%% Support non-ascii characters
\RequirePackage[utf8]{inputenc}

%% Add support for custom coloring
\RequirePackage[dvipsnames]{xcolor}

%% Add support for many custom icons.
\RequirePackage{fontawesome5}

%% Add support for images
\RequirePackage{graphicx}
\RequirePackage{tikz}

%% Add advanced table formatting support
% From https://gist.github.com/LanternD/1edd0fcc64f287d841b6da3ec38c69a2
\RequirePackage{array}
\newcolumntype{L}[1]
{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]
{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]
{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\RequirePackage{multirow}
% \RequirePackage{multicolumn}  % Built-in command

%% Add support for hyperlinks
\RequirePackage{hyperref}
\definecolor{linkcolour}{rgb}{0,0.0,0.0}
\hypersetup{
    colorlinks,
    breaklinks,
    urlcolor=linkcolour,  % Color them black
    linkcolor=linkcolour  % Color them black
}

%% Add support for nuanced list formatting
\RequirePackage{enumitem}
\setlist{nosep,topsep=0pt,leftmargin=22pt}

%% Support drawing lines around experiences (\renewenvironment from https://stackoverflow.com/a/9974713/14765128)
% \RequirePackage{framed}
% \renewenvironment{leftbar}{\def\FrameCommand{\vrule width 0.25pt \hspace{\spacesmall}}\MakeFramed {\advance\hsize-\width \FrameRestore}}{\endMakeFramed}

%% Add support for customized section headers
%% https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf
\RequirePackage{titlesec}
% Section Formatting
\titleformat{\section}
{\color{blue}\Large\scshape\raggedright}  % Shape
{}
{0em}
{}
[\titlerule]
\titlespacing{\section}
{0pt}  % `left`: Left Margin
{0pt}  % `before-sep`: Vertical space before the title
{\spacenormal}  % `after-sep`: Vertical space after the title
[0pt]  % `right-sep`: Right margin (affected by `hang`, `block`, and `display`)
% Sub-Section Formatting
\titleformat{\subsection}
{\scshape\raggedright}  % Shape
{}  % Label
{0em}
{}
[]
\titlespacing{\subsection}
{0pt}  % `left`: Left Margin
{\spacesmall}  % `before-sep`: Vertical space before the title
{\spacesmall}  % `after-sep`: Vertical space after the title
[0pt]  % `right-sep`: Right margin (affected by `hang`, `block`, and `display`)

%% Add support for commands with named arguments
\RequirePackage{keycommand}
% patch by Joseph Wright ("bug in the definition of \ifcommandkey (2010/04/27 v3.1415)"),
% https://tex.stackexchange.com/a/35794/
\begingroup
\makeatletter
\catcode`\/=8 %
\@firstofone
{
\endgroup
\renewcommand{\ifcommandkey}[1]{%
\csname @\expandafter \expandafter \expandafter
\expandafter \expandafter \expandafter \expandafter
\kcmd@nbk \commandkey {#1}//{first}{second}//oftwo\endcsname
}
}

%% ----- Custom Commands -----
% Contact Information
\newcommand{\nametitle}[2]{%
    { \Huge #1 \textsc{#2} }\\
}
\newcommand{\contactseparator}{
    \hspace{\spacesmall}\textbar\hspace{\spacesmall}
}
\newcommand{\email}[1]{\faIcon{envelope} \href{mailto:#1}{#1}}
\newcommand{\phone}[1]{\faIcon{phone-alt} \href{tel:+1-#1}{#1}}
\newcommand{\github}[1]{\faIcon{github} \href{https://github.com/#1/}{github.com/#1}}
\newcommand{\linkedin}[1]{\faIcon{linkedin} \href{https://linkedin.com/in/#1/}{linkedin.com/in/#1}}
\newcommand{\location}[1]{\faIcon{map-marker-alt} #1}

% Experience/Achievements
\newcommand{\equivalent}{\textnormal{\textsc{equivalent}}}
\newcommand{\honors}[1]{\textnormal{\emph{#1}}}
\newcommand{\roletitle}[1]{\textbf{#1}}
\newcommand{\tech}[1]{{\color{Brown}\textbf{#1}}}
\newcommand{\tenure}[1]{\textbf{#1}}
\newcommand{\achievement}[1]{%
    \begin{itemize}
        \item #1
    \end{itemize}
    \vspace{\spacesmall}
}
\newcommand{\degree}[4]{%
    \noindent\textbf{#1}, #2 \hfill \tenure{#3} \vspace{\spacesmall}\par
    #4
}
\newcommand{\award}[4]{%
    \noindent\textbf{#1}, #2 \hfill \tenure{#3} \vspace{\spacesmall}\par
    #4
}
\newcommand{\project}[3]{%
    \noindent\textbf{#1} \hfill \tenure{#2} \vspace{\spacesmall}\par
    #3
    \vspace{\spacesmall}
}
\newcommand{\role}[3]{%
    \noindent\roletitle{#1} \hfill \tenure{#2}\vspace{\spacesmall}\par
    #3
}
\newcommand{\experience}[2]{%
    \noindent\textsc{#1}\dotfill

    \vspace{\spacesmall}

    \noindent#2

    \vspace{\spacesmall}
}

%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{12pt}{12pt}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{9in}
\pagenumbering{arabic}
