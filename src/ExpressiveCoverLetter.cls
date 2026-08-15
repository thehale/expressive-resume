\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExpressiveCoverLetter}[2021/12/13 Expressive Cover Letter Template]

%% ----- Options -----
% https://www.latex-project.org/help/documentation/clsguide.pdf

% None currently

%% ----- Parent Class -----
\LoadClass{Expressive}

%% ----- Required Packages -----
\RequirePackage{ragged2e}

%% Define page layout
\RequirePackage[margin=0.5in]{geometry}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}

%% ----- Custom Commands -----
% Header Block
\newcommand{\coverletterheader}[5]{
    \begin{Center}
        \nametitle{#1}{}\\
        \rule{\linewidth}{1pt}

        #2\contactseparator#3\contactseparator#4\contactseparator#5
    \end{Center}
}
\newcommand{\objective}[1]{%
    \begin{flushleft}
        \textsc{Objective}: #1
    \end{flushleft}
}

%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{12pt}{18pt}\selectfont}
\setlength{\textwidth}{7.5in}
\setlength{\textheight}{10in}
\pagenumbering{arabic}
