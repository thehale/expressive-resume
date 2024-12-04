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
\newkeycommand{\resumeheader}[
    firstname,middleinitial,lastname,
    email,
    phone,  % Must be in XXX-XXX-XXXX format to become a valid link
    github,
    linkedin,
    city,  % Ignored if `state` is not also provided
    state,
    qrcode  % Path to an image of a 1000x1000px QR Code
]{
    \begin{flushleft}
        \nametitle{\commandkey{firstname}}{\ifcommandkey{middleinitial}{\commandkey{middleinitial}. }{}\commandkey{lastname}}
        \vspace{7pt}
        {%
            \ifcommandkey{email}%
            {%
                \email{\commandkey{email}}%
                \ifcommandkey{phone}{\contactseparator}%
                {\ifcommandkey{github}{\contactseparator}%
                    {\ifcommandkey{linkedin}{\contactseparator}%
                        {\ifcommandkey{state}{\contactseparator}{}}}}%
            }%
            {}%
            \ifcommandkey{phone}%
            {%
                \phone{\commandkey{phone}}%
                \ifcommandkey{github}{\contactseparator}%
                {\ifcommandkey{linkedin}{\contactseparator}%
                    {\ifcommandkey{state}{\contactseparator}{}}}%
            }%
            {}%
            \ifcommandkey{github}%
            {%
                \github{\commandkey{github}}%
                \ifcommandkey{linkedin}{\contactseparator}%
                {\ifcommandkey{state}{\contactseparator}{}}%
            }%
            {}%
            \ifcommandkey{linkedin}%
            {%
                \linkedin{\commandkey{linkedin}}%
                \ifcommandkey{state}{\contactseparator}{}%
            }%
            {}%
            \ifcommandkey{state}%
            {\location{\ifcommandkey{city}{\commandkey{city}, }{}\commandkey{state}}}%
            {}%
        }
    \end{flushleft}

    \ifcommandkey{qrcode}{%
        % QR Code - Generated with https://www.logodesign.net/qrcode-generator
        \begin{tikzpicture}[remember picture,overlay]%
            \node[anchor=north east,yshift=-.33in,xshift=-.5in]%
            at (current page.north east)%
            {\includegraphics[width=.1\linewidth]{\commandkey{qrcode}}};
        \end{tikzpicture}
        \vspace{-16pt}
    }{}
}
\newcommand{\tagline}[2]{%
    \begin{flushleft}
        \textsc{#1}: #2
    \end{flushleft}
}
\newcommand{\summary}[1]{\tagline{Summary}{#1}}
\newcommand{\objective}[1]{\tagline{Objective}{#1}}


%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{12pt}{12pt}\selectfont}
\setlength{\textwidth}{7.5in}
\setlength{\textheight}{10in}
\pagenumbering{arabic}
