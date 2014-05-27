%!TEX root = GB-template.tex
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{GB-template}[2014/05/24 v1.0 GB-template document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[UTF8, fancyhdr, hyperref]{ctexbook}[2009/09/13]

% ----- Loading packages
\RequirePackage{geometry}
\RequirePackage{pbox}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{caption}
\RequirePackage{chngcntr}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{hologo}
\RequirePackage{letltxmacro}
\RequirePackage[xindy]{imakeidx}

% ----- Paper Layout
\geometry{papersize = {210mm, 297mm}}
\geometry{left = {25mm}, top = {10mm}, bottom = {20mm}, right = {15mm}}

% ----- Header and Footer
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LE,RO]{\zihao{5}\heiti\usebiaozhunhao}
\fancyfoot[LE]{\makebox[4mm][r]{\makebox[0pt][l]{\zihao{-5}\songti\thepage}}}
\fancyfoot[RO]{\makebox[4mm][l]{\makebox[0pt][r]{\zihao{-5}\songti\thepage}}}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

% Sectioning
\CTEXsetup[titleformat = {\zihao{3}\heiti}, beforeskip = {8mm}, afterskip = {10mm}]{chapter}
\CTEXoptions[contentsname = {目\qquad{}次}, bibname = {参~考~文~献}, indexname = {索\qquad\quad{}引}]
\patchcmd{\listoffigures}{\chapter *{\listfigurename }\@mkboth {\MakeUppercase \listfigurename }{\MakeUppercase \listfigurename }}{\vskip 1.2ex}{}{}
\patchcmd{\listoftables}{\chapter *{\listtablename }\@mkboth {\MakeUppercase \listtablename }{\MakeUppercase \listtablename }}{\vskip 1.2ex}{}{}
\newcommand{\patchchapter}{%
    \patchcmd{\caption@chapter@ORI}%
        {\if@openright\cleardoublepage\else\clearpage\fi}%
        {\relax\relax}{}{}%
}
\newcommand{\restorechapter}{%
    \patchcmd{\caption@chapter@ORI}{\relax\relax}%
        {\if@openright\cleardoublepage\else\clearpage\fi}%
        {}{}%
}
\newcommand*{\autoclearpage}{\if@openright\cleardoublepage\else\clearpage\fi}
\newcommand*{\clearevenpage}{\clearpage \if@twoside \ifodd\c@page \hbox{}\newpage \if@twocolumn \hbox{}\newpage \fi \fi \fi}
\let\LiamOldMainmatter\mainmatter
\renewcommand{\mainmatter}{\LiamOldMainmatter%
    \chapter*{\usename}%
    \CTEXsetup[name = {,}, number = {\arabic{chapter}}, format = {\zihao{5}\heiti}, nameformat = {}, aftername = {\quad}, titleformat = {}, beforeskip = {0ex}, afterskip = {2.3ex plus .2ex}, indent = {0pt}]{chapter}%
    \CTEXsetup[name = {,}, number = {\arabic{chapter}.\arabic{section}}, format = {\zihao{5}\heiti}, nameformat = {}, aftername = {\quad}, titleformat = {}, beforeskip = {-.5em plus -.1em minus -.1em}, afterskip = {.5em plus .1em}, indent = {0pt}]{section}%
    \CTEXsetup[name = {,}, number = {\arabic{chapter}.\arabic{section}.\arabic{subsection}}, format = {\zihao{5}\heiti}, nameformat = {}, aftername = {\quad}, titleformat = {}, beforeskip = {-.5em plus -.1em minus -.1em}, afterskip = {.5em plus .1em}, indent = {0pt}]{subsection}%
    \CTEXsetup[name = {,}, number = {\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}, format = {\zihao{5}\songti}, nameformat = {}, aftername = {\quad}, titleformat = {}, beforeskip = {-.5em plus -.1em minus -.1em}, afterskip = {.5em plus .1em}, indent = {0pt}]{subsubsection}%
    \setcounter{secnumdepth}{3}
    \patchchapter
}
\let\LiamOldAppendix\appendix
\renewcommand{\appendix}{%
    \LiamOldAppendix%
    \appendixsectioning
    \restorechapter
    \titlecontents{chapter}[3.0em]{}{\contentslabel{3.0em}}{\hspace*{-3.0em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
}
\newcommand{\appendixsectioning}{%
    % \CTEXsetup[format = {\centering}]{chapter}
    \CTEXsetup[format = {\centering}, nameformat = {\zihao{5}\heiti}, titleformat = {\zihao{5}\heiti}, beforeskip = {9mm}, afterskip = {10mm}, aftername = {\endgraf}]{chapter}%
}
\newcommand{\gchapter}[1]{\chapter[（规范性附录）#1]{（规范性附录）\\#1}}
\newcommand{\zchapter}[1]{\chapter[（资料性附录）#1]{（资料性附录）\\#1}}

% ----- Title Page
\newcommand{\maketitlepage}{%
    \pagestyle{empty}
    \begingroup
    \setlength{\parindent}{0pt}
    \hskip-1.2mm\begin{tikzpicture}
    \node at (0, 0) {\setlength{\fboxsep}{0pt}\makebox[0pt][l]{\parbox[t][0pt]{170mm}{\zihao{5}\bfseries ICS \useICS\\\usefenlei}}};
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
    \newgeometry{left = {25mm}, top = {30mm}, bottom = {24mm}, right = {20mm}, headsep = {5mm}, footskip = {4mm}}
    \pagestyle{fancy}
}

% ----- Preamble(s)
\newenvironment{preamble}[1]{\chapter{#1}}{\clearpage}

% ----- Parameters
\newcommand*{\ICS}[1]{\newcommand*{\useICS}{#1}}
\newcommand*{\fenlei}[1]{\newcommand*{\usefenlei}{#1}}
\newcommand*{\biaozhunhao}[1]{\newcommand*{\usebiaozhunhao}{#1}}
\newcommand*{\daitibiaozhunhao}[1]{\newcommand*{\usedaitibiaozhunhao}{#1}}
\newcommand*{\name}[1]{\newcommand*{\usename}{#1}}
\newcommand*{\enname}[1]{\newcommand*{\useenname}{#1}}
\newcommand*{\conformity}[1]{\newcommand*{\useconformity}{#1}}
\newcommand*{\department}[1]{\newcommand*{\usedepartment}{#1}}
\newcommand*{\fabudate}[1]{\newcommand*{\usefabudate}{#1}}
\newcommand*{\shishidate}[1]{\newcommand*{\useshishidate}{#1}}

% ----- Caption Style of Figure and Table
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\renewcommand{\thefigure}{图~\thechapter.\arabic{figure}}
\renewcommand{\thetable}{图~\thechapter.\arabic{table}}
\renewcommand{\figurename}{\relax}
\renewcommand{\tablename}{\relax}
\captionsetup{font = {bf}}

% ----- Footnote Style
\renewcommand\@makefntext[1]{%
    \hspace*{2\ccwd}\zihao{-5}\songti%
        \makebox[3\ccwd][l]{注~\@thefnmark:}\parbox[t]{\linewidth - 5\ccwd}{#1}%
}

% ----- Index and Bib
% \renewcommand{\imki@wrindexentrysplit}[3]{%
% \expandafter\protected@write\csname#1@idxfile\endcsname{}%
%     {\string\indexentry{#2}{\arabic{chapter}90\arabic{section}90\arabic{subsection}90\arabic{subsubsection}}}%
% }
\renewcommand{\imki@wrindexentrysplit}[3]{%
\expandafter\protected@write\csname#1@idxfile\endcsname{}%
    {\string\indexentry{#2}{\arabic{chapter}90\arabic{section}90\arabic{subsection}}}%
}
\patchcmd{\imki@makeindex}{\edef\imki@program{\imki@progdefault}}{\edef\imki@program{zhmakeindex}}{}{}
\patchcmd{\imki@putindex}{\@input@}{%
  \imki@exec{python adjustind.py \jobname}\@input@}{}{}

\AtBeginDocument{%
    \makeindex[options=-s gb-idxstyle.mst, columns = 1]%
    \bibliographystyle{gbt7714-2005}%
    \frontmatter%
    \renewcommand{\thepage}{\Roman{page}}%
    \maketitlepage%
    \patchchapter%
    \tableofcontents\listoffigures\listoftables%
    \restorechapter%
}
% \AtBeginDocument{\makeindex[options=-s gb-idxstyle.mst, columns = 1, intoc = true]}


% ----- Back Cover
\newcommand{\makecoverpage}{%
    \clearevenpage
    \newgeometry{scale = 1}
    \begin{tikzpicture}
        \node at (0, 0) {};
        \node at (\paperwidth - 5mm, -25mm) {\rotatebox[origin = br]{90}{\makebox[0pt][r]{\pbox{.5\textwidth}{\linespread{1}\selectfont\bfseries\usebiaozhunhao\\\phantom{\bfseries\usebiaozhunhao}}}}};
    \end{tikzpicture}
}
\AtEndDocument{%
    \backmatter
    \nocite*{}
    \bibliography{bibfile}
    \addcontentsline{toc}{chapter}{参考文献}
    \printindex
    \addcontentsline{toc}{chapter}{索引}
    \makecoverpage
}

% ----- Style of Table of Contents
\hypersetup{hidelinks}
\contentsmargin{1em}
\titlecontents{chapter}[1.2em]{}{\contentslabel{1.2em}}{\hspace*{-1.2em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{section}[3.8em]{}{\contentslabel{2.3em}}{\hspace*{-2.3em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[6.1em]{}{\contentslabel{3.2em}}{\hspace*{-3.2em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{figure}[3.0em]{}{\contentslabel{3.0em}}{\hspace*{-3.0em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}
\titlecontents{table}[3.0em]{}{\contentslabel{3.0em}}{\hspace*{-3.0em}}{\titlerule*[.7pc]{$\cdot$}\contentspage}

% ----- Title Font
\newcommand*{\titlefont}{\CJKfontspec{SimSun}}

% ----- Logo
\newcommand*{\BibTeX}{\hologo{BibTeX}}

% ----- Paths
\graphicspath{{./figures/}}
\providecommand*\input@path{}
\newcommand\addinputpath[1]{
  \expandafter\def\expandafter\input@path
  \expandafter{\input@path{#1}}}
\addinputpath{body/}
