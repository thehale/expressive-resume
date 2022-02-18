\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExpressiveResume}[2021/12/13 Expressive Resume Template]

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
        linkedin,
        github,
        city,  % Ignored if `state` is not also provided
        state,
        qrcode,  % Path to an image of a 1000x1000px QR Code
        fixobjectivespacing  % Fixes issues with vertical spacing when using QR Code + Objective statement.
        ]{
    \begin{flushleft}
        \nametitle{\commandkey{firstname}}{\ifcommandkey{middleinitial}{\commandkey{middleinitial}. }{}\commandkey{lastname}}
        {%
            \ifcommandkey{email}%
                {%
                    \email{\commandkey{email}}%
                    \ifcommandkey{phone}{\contactseparator}%
                        {\ifcommandkey{linkedin}{\contactseparator}%
                            {\ifcommandkey{github}{\contactseparator}%
                                {\ifcommandkey{state}{\contactseparator}{}}}}%
                }%
                {}%
            \ifcommandkey{phone}%
                {%
                    \phone{\commandkey{phone}}%
                    \ifcommandkey{linkedin}{\contactseparator}%
                        {\ifcommandkey{github}{\contactseparator}%
                            {\ifcommandkey{state}{\contactseparator}{}}}%
                }%
                {}%
            \ifcommandkey{linkedin}%
                {%
                    \linkedin{\commandkey{linkedin}}%
                    \ifcommandkey{github}{\contactseparator}%
                        {\ifcommandkey{state}{\contactseparator}{}}%
                }%
                {}%
            \ifcommandkey{github}%
                {%
                    \github{\commandkey{github}}%
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
            \node[anchor=north east,yshift=-.5in,xshift=-.5in]%
                at (current page.north east)%
                {\includegraphics[width=.1\linewidth]{\commandkey{qrcode}}};
        \end{tikzpicture}
        \vspace{-12pt}
        \ifcommandkey{fixobjectivespacing}{\vspace{-10pt}}{}
    }{}
}
\newcommand{\objective}[1]{%
    \begin{flushleft}
        \textsc{Objective}: #1
    \end{flushleft}
}

%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\setlength{\textwidth}{7.5in}
\setlength{\textheight}{10in}
\pagenumbering{arabic}
