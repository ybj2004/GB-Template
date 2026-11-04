%!TEX root = GB-template.tex
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{GB-template}[2026/11/03 v2.0.0 GB-template document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[UTF8]{ctexbook}[2020/01/01]

% ----- Loading packages
\RequirePackage{geometry}
\RequirePackage{pbox}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{lmodern}
\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{amsmath}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{hologo}
\RequirePackage[noautomatic]{imakeidx}
\RequirePackage[backend = biber, style = gb7714-2025]{biblatex}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\addbibresource{bibfile.bib}
\indexsetup{firstpagestyle = fancy}

\renewbibmacro*{title+issuetitle}{%
    \usebibmacro{periodical}%
    \newunit
    \iffieldundef{series}{}{\newunit\printfield{series}}%
    \usebibmacro{periodical+issue}%
    \iffieldundef{number}{}{\multinumberparser{\thefield{number}}}%
    \iffieldundef{volume}
        {\printfield{year}%
            \iffieldundef{number}{}{\printtext{\mkbibparens{\multinumberfirst}}}%
            \bibrangedash
            \iffieldundef{endyear}{}{%
                \printfield{endyear}%
                \iffieldundef{number}{}{\printtext{\mkbibparens{\multinumbersecond}}}%
            }%
        }
        {\multivolparser{\thefield{volume}}%
            \printfield{year}%
            \setunit{\periodicaldatevoldelim}%
            \printtext{\multivolfirst}%
            \iffieldundef{number}{}{\printtext{\mkbibparens{\multinumberfirst}}}%
            \bibrangedash
            \iffieldundef{endyear}{}{%
                \printfield{endyear}%
                \setunit{\periodicaldatevoldelim}%
                \printtext{\multivolsecond}%
                \iffieldundef{number}{}{\printtext{\mkbibparens{\multinumbersecond}}}%
            }%
        }%
    \usebibmacro{issue}%
    \newunit
}

% ----- Paper Layout
\geometry{papersize = {210mm, 297mm}}
\geometry{left = {25mm}, top = {10mm}, bottom = {20mm}, right = {15mm}, headheight = {13pt}, footskip = {8mm}}

% ----- Header and Footer
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LE,RO]{\zihao{5}\heiti\usebiaozhunhao}
\fancyfoot[LE]{\makebox[4mm][r]{\makebox[0pt][l]{\zihao{-5}\songti\thepage}}}
\fancyfoot[RO]{\makebox[4mm][l]{\makebox[0pt][r]{\zihao{-5}\songti\thepage}}}


% Sectioning
\ctexset{
    chapter = {
        pagestyle = {fancy},
        format = {\centering},
        nameformat = {\zihao{3}\heiti},
        titleformat = {\zihao{3}\heiti},
        beforeskip = {8mm},
        afterskip = {10mm}
    },
    contentsname = {目\qquad{}次},
    bibname = {参~考~文~献},
    indexname = {索\qquad\quad{}引}
}
\patchcmd{\listoffigures}{\chapter *{\listfigurename }\@mkboth {\MakeUppercase \listfigurename }{\MakeUppercase \listfigurename }}{\vskip 1.2ex}{}{}
\patchcmd{\listoftables}{\chapter *{\listtablename }\@mkboth {\MakeUppercase \listtablename }{\MakeUppercase \listtablename }}{\vskip 1.2ex}{}{}
\newcommand*{\autoclearpage}{\if@openright\cleardoublepage\else\clearpage\fi}
\newcommand*{\clearevenpage}{\clearpage \if@twoside \ifodd\c@page \hbox{}\newpage \if@twocolumn \hbox{}\newpage \fi \fi \fi}
\let\LiamOldMainmatter\mainmatter
\renewcommand{\mainmatter}{\LiamOldMainmatter%
    \chapter*{\usename}%
    \ctexset{
        chapter = {
            break = {\par},
            name = {,},
            number = {\thechapter},
            format = {\zihao{5}\heiti},
            nameformat = {},
            aftername = {\quad},
            titleformat = {},
            beforeskip = {\baselineskip},
            afterskip = {\baselineskip},
            indent = {0pt}
        },
        section = {
            name = {,},
            number = {\thechapter.\arabic{section}},
            format = {\zihao{5}\heiti},
            nameformat = {},
            aftername = {\quad},
            titleformat = {},
            beforeskip = {.5\baselineskip},
            afterskip = {.5\baselineskip},
            indent = {0pt}
        },
        subsection = {
            name = {,},
            number = {\thechapter.\arabic{section}.\arabic{subsection}},
            format = {\zihao{5}\heiti},
            nameformat = {},
            aftername = {\quad},
            titleformat = {},
            beforeskip = {.5\baselineskip},
            afterskip = {.5\baselineskip},
            indent = {0pt}
        },
        subsubsection = {
            name = {,},
            number = {\thechapter.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
            format = {\zihao{5}\heiti},
            nameformat = {},
            aftername = {\quad},
            titleformat = {},
            beforeskip = {.5\baselineskip},
            afterskip = {.5\baselineskip},
            indent = {0pt}
        }
    }
    \counterwithout{figure}{chapter}
    \counterwithout{table}{chapter}
    \counterwithout{equation}{chapter}
    \renewcommand{\thefigure}{图~\arabic{figure}}
    \renewcommand{\thetable}{表~\arabic{table}}
    \renewcommand{\theequation}{\arabic{equation}}
    \setlength{\parindent}{2\ccwd}
    \setlength{\parskip}{0pt}
    \setcounter{secnumdepth}{3}
}
\let\LiamOldAppendix\appendix
\renewcommand{\appendix}{%
    \LiamOldAppendix%
    \counterwithin{figure}{chapter}
    \counterwithin{table}{chapter}
    \counterwithin{equation}{chapter}
    \renewcommand{\thefigure}{图~\thechapter.\arabic{figure}}
    \renewcommand{\thetable}{表~\thechapter.\arabic{table}}
    \renewcommand{\theequation}{\thechapter.\arabic{equation}}
    \appendixsectioning
    \titlecontents{chapter}[4.5em]{}{\contentslabel{4.5em}}{\hspace*{-4.5em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
}
\newcommand{\appendixsectioning}{%
    \ctexset{chapter = {
        break = {\if@openright\cleardoublepage\else\clearpage\fi},
        name = {附\quad 录,},
        format = {\centering},
        nameformat = {\zihao{5}\heiti},
        titleformat = {\zihao{5}\heiti},
        beforeskip = {9mm},
        afterskip = {10mm},
        aftername = {\endgraf}
    }}
}
\newcommand{\gchapter}[1]{\chapter[（规范性）#1]{（规范性）\\#1}}
\newcommand{\zchapter}[1]{\chapter[（资料性）#1]{（资料性）\\#1}}

% ----- Title Page
\newcommand{\maketitlepage}{%
    \pagestyle{empty}
    \begingroup
    \setlength{\parindent}{0pt}
    \begin{tikzpicture}
    \node at (0, 0) {\setlength{\fboxsep}{0pt}\makebox[0pt][l]{\parbox[t][0pt]{170mm}{\zihao{5}\heiti ICS \useICS\\CCS \useCCS}}};
    \node at (85mm, -36mm) {\resizebox{170mm}{8mm}{\titlefont\bfseries\zihao{2}中~华~人~民~共~和~国~国~家~标~准}};
    % \draw[fill] (119mm, -23mm) rectangle (159mm, -3mm);
    \node at (139mm, -13mm) {\includegraphics[width = 40mm, height = 20mm]{GB-LOGO.jpg}};
    \node at (170mm, -52.5mm) {\setlength{\fboxsep}{0pt}\makebox[0pt][r]{\parbox{170mm}{\raggedleft\zihao{4}\heiti\usebiaozhunhao\\\zihao{5}\songti\usedaitibiaozhunhao}}};
    \draw (0mm, -65mm) -- (170mm, -65mm);
    \node at (85mm, -105mm) {\makebox[0pt][c]{\zihao{1}\heiti\usename}};
    \node at (85mm, -121mm) {\makebox[0pt][c]{\zihao{4}\heiti\useenname}};
    \node at (85mm, -133mm) {\makebox[0pt][c]{\zihao{4}\heiti\useconformity}};
    \end{tikzpicture}
    \vfill
    % \hskip-1.2mm%
    \begin{tikzpicture}
    \node at (85mm, 21mm) {\makebox[0pt][c]{\parbox[b][0pt]{170mm}{\zihao{4}\heiti\usefabudate{}发布\hfill\useshishidate{}实施}}};
    \draw (0, 20mm) -- (170mm, 20mm);
    \node at (85mm, 0mm) {\makebox[0pt][c]{\parbox[b][0pt]{170mm}{\centerline{\zihao{4}{\CJKfontspec[AutoFakeBold]{SimSun}\bfseries\usedepartment}\hskip 5mm\heiti 发\hskip 3mm布}}}};
    \end{tikzpicture}
    \endgroup
    \autoclearpage
    \setcounter{page}{1}
    \newgeometry{left = {25mm}, top = {30mm}, bottom = {24mm}, right = {20mm}, headsep = {5mm}, headheight = {13pt}, footskip = {8mm}}
    \pagestyle{fancy}
}

% ----- Preamble(s)
\newenvironment{preamble}[1]{\chapter{#1}}{\clearpage}

% ----- Parameters
\newcommand*{\ICS}[1]{\newcommand*{\useICS}{#1}}
\newcommand*{\CCS}[1]{\newcommand*{\useCCS}{#1}}
\newcommand*{\fenlei}[1]{\CCS{#1}}
\newcommand*{\biaozhunhao}[1]{\newcommand*{\usebiaozhunhao}{#1}}
\newcommand*{\daitibiaozhunhao}[1]{\newcommand*{\usedaitibiaozhunhao}{#1}}
\newcommand*{\name}[1]{\newcommand*{\usename}{#1}}
\newcommand*{\enname}[1]{\newcommand*{\useenname}{#1}}
\newcommand*{\conformity}[1]{\newcommand*{\useconformity}{#1}}
\newcommand*{\department}[1]{\newcommand*{\usedepartment}{#1}}
\newcommand*{\fabudate}[1]{\newcommand*{\usefabudate}{#1}}
\newcommand*{\shishidate}[1]{\newcommand*{\useshishidate}{#1}}

% ----- Caption Style of Figure and Table
\renewcommand{\thefigure}{图~\arabic{figure}}
\renewcommand{\thetable}{表~\arabic{table}}
\renewcommand{\figurename}{\relax}
\renewcommand{\tablename}{\relax}
\DeclareCaptionFont{heiti}{\heiti}
\captionsetup{font = {heiti}, labelsep = {quad}}

% ----- Clauses and Lists
\NewDocumentCommand{\stdclause}{m}{%
    \par\vspace{.5\baselineskip}
    \refstepcounter{section}
    \noindent{\zihao{5}\heiti\thesection\quad}{\zihao{5}\songti#1}\par
    \vspace{.5\baselineskip}
}
\newlist{stdlist}{itemize}{2}
\setlist[stdlist]{
    align = left,
    labelsep = 0pt,
    labelwidth = 3\ccwd,
    itemindent = 0pt,
    listparindent = 0pt,
    parsep = 0pt,
    itemsep = 0pt,
    topsep = 0pt
}
\setlist[stdlist,1]{label = {——}, leftmargin = 5\ccwd}
\setlist[stdlist,2]{label = {\(\cdot\)}, leftmargin = 2\ccwd}
\newlist{stdenum}{enumerate}{2}
\setlist[stdenum]{
    align = left,
    labelsep = 0pt,
    labelwidth = 3\ccwd,
    itemindent = 0pt,
    listparindent = 0pt,
    parsep = 0pt,
    itemsep = 0pt,
    topsep = 0pt
}
\setlist[stdenum,1]{label = {\alph*)}, leftmargin = 5\ccwd}
\setlist[stdenum,2]{label = {\arabic*)}, leftmargin = 2\ccwd}
\newlist{stdsymbols}{itemize}{1}
\setlist[stdsymbols]{
    align = left,
    labelsep = 0pt,
    labelwidth = 3\ccwd,
    leftmargin = 5\ccwd,
    itemindent = 0pt,
    listparindent = 0pt,
    parsep = 0pt,
    itemsep = 0pt,
    topsep = 0pt
}

% ----- Terms and Provision Presentation
\newenvironment{term}[3][section]{%
    \par\refstepcounter{#1}%
    \noindent{\zihao{5}\heiti\csname the#1\endcsname}\par
    \noindent\hspace*{2\ccwd}{\zihao{5}\heiti#2\quad#3}\par
}{}
\NewDocumentCommand{\termsource}{m}{%
    \par\noindent\hspace*{2\ccwd}[来源：#1]\par
}
\NewDocumentCommand{\stdnote}{o m}{%
    \par\noindent\hspace*{2\ccwd}%
    \parbox[t]{\linewidth - 2\ccwd}{%
        \zihao{-5}\songti
        \@hangfrom{{\heiti 注\IfNoValueTF{#1}{：}{#1：}}}#2%
    }\par
}
\NewDocumentCommand{\stdexample}{o m}{%
    \par\noindent\hspace*{2\ccwd}%
    \parbox[t]{\linewidth - 2\ccwd}{%
        \zihao{-5}\songti
        \@hangfrom{{\heiti 示例\IfNoValueTF{#1}{：}{#1：}}}#2%
    }\par
}
\NewDocumentCommand{\stdexampleframe}{o m}{%
    \par\noindent\hspace*{2\ccwd}{\zihao{-5}\heiti 示例\IfNoValueTF{#1}{：}{#1：}}\par
    \noindent\hspace*{2\ccwd}%
    \framebox{%
        \parbox{\linewidth - 2\ccwd - 2\fboxsep - 2\fboxrule}{\zihao{-5}\songti#2}%
    }\par
}
\NewDocumentCommand{\stdunits}{m}{%
    \par{\zihao{-5}\songti\hfill#1\par}
}
\NewDocumentCommand{\stdfootnotetext}{m m}{%
    \par\noindent\hspace*{2\ccwd}{\zihao{-5}\songti\textsuperscript{#1}#2}\par
}
\NewDocumentCommand{\importantnotice}{m m}{%
    \par\noindent\hspace*{2\ccwd}{\zihao{5}\heiti#1：#2}\par
}

% ----- Footnote Style
\renewcommand{\thefootnote}{\arabic{footnote})}
\renewcommand\@makefntext[1]{%
    \hspace*{2\ccwd}\zihao{-5}\songti%
        \makebox[3\ccwd][l]{\@thefnmark}\parbox[t]{\linewidth - 5\ccwd}{#1}%
}
\renewcommand{\footnoterule}{%
    \par\noindent\rule{0.25\linewidth}{0.4pt}\par\vspace{2pt}%
}

% ----- Index and Bib
\newcommand*{\GBindexlocation}{%
    \thechapter%
    \ifnum\arabic{section}>0 90\arabic{section}\fi
    \ifnum\arabic{subsection}>0 90\arabic{subsection}\fi
}
\renewcommand{\imki@wrindexentrysplit}[3]{%
\expandafter\protected@write\csname#1@idxfile\endcsname{}%
    {\string\indexentry{#2}{\GBindexlocation}}%
}

\AtBeginDocument{%
    \makeindex[options=-s gb-idxstyle.mst, columns = 1]%
    \frontmatter%
    \renewcommand{\thepage}{\Roman{page}}%
    \maketitlepage%
    \tableofcontents\listoffigures\listoftables%
}


% ----- Back Cover
\newcommand{\makecoverpage}{%
    \clearevenpage
    \newgeometry{scale = 1}
    \begin{tikzpicture}[remember picture, overlay]
        \node[rotate = 90, anchor = north, inner sep = 0] at ([xshift = -5mm, yshift = -25mm]current page.north east) {\pbox{.5\textwidth}{\linespread{1}\selectfont\bfseries\usebiaozhunhao\\\phantom{\bfseries\usebiaozhunhao}}};
    \end{tikzpicture}
}
\AtEndDocument{%
    \backmatter
    \addcontentsline{toc}{chapter}{参考文献}
    \printbibliography
    \addcontentsline{toc}{chapter}{索引}
    \printindex
    \makecoverpage
}

% ----- Style of Table of Contents
\hypersetup{hidelinks}
\contentsmargin{2em}
\titlecontents{chapter}[1.8em]{}{\contentslabel{1.8em}}{\hspace*{-1.8em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{section}[3.8em]{}{\contentslabel{2.3em}}{\hspace*{-2.3em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[6.1em]{}{\contentslabel{3.2em}}{\hspace*{-3.2em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{figure}[3.0em]{}{\contentslabel{3.0em}}{\hspace*{-3.0em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{table}[3.0em]{}{\contentslabel{3.0em}}{\hspace*{-3.0em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}

% ----- Title Font
\newcommand*{\titlefont}{\CJKfontspec[AutoFakeBold]{SimSun}}

% ----- Logo
\newcommand*{\BibTeX}{\hologo{BibTeX}}

% ----- Paths
\graphicspath{{./figures/}}
\providecommand*\input@path{}
\newcommand\addinputpath[1]{
  \expandafter\def\expandafter\input@path
  \expandafter{\input@path{#1}}}
\addinputpath{body/}
