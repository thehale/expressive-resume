\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExpressiveResume}[2024/12/03 Expressive Resume Template]

%% ----- Options -----
% https://www.latex-project.org/help/documentation/clsguide.pdf

% None currently

%% ----- Parent Class -----
\LoadClass{Expressive}

%% ----- Required Packages -----
%% Define page layout
\RequirePackage[margin=0.5in]{geometry}
\pagestyle{empty}

%% ----- Custom Commands -----
% Header Block
\newcommand{\resumeheader}[5]{
    \begin{flushleft}
        \nametitle{#1}{}
        \hfill
        \begin{tabular}{ll}
            #2 & #3 \\
            #4 & #5 \\
        \end{tabular}
    \end{flushleft}
}

\newcommand{\qrcode}[1]{
    % QR Code - Generated with https://www.logodesign.net/qrcode-generator
    \begin{tikzpicture}[remember picture,overlay]%
        \node[anchor=north east,yshift=-.33in,xshift=-.5in]%
        at (current page.north east)%
        {\includegraphics[width=.09\linewidth]{#1}};
    \end{tikzpicture}
    \vspace{-20pt}
}

\newcommand{\tagline}[2]{%
    \begin{flushleft}
        \textsc{#1}: #2
    \end{flushleft}
}
\newcommand{\summary}[1]{
    \begin{flushleft}
        #1
    \end{flushleft}
}
\newcommand{\objective}[1]{
    \begin{flushleft}
        #1
    \end{flushleft}
}


%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{12pt}{12pt}\selectfont}
\setlength{\textwidth}{7.5in}
\setlength{\textheight}{10in}
\pagenumbering{arabic}
