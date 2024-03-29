% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, oneside, letterpaper]{book}

%
% Options
%
\RequirePackage{etoolbox}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[width=5.75in, letterpaper]{geometry}
\usepackage{ragged2e}
% \RaggedRight
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                % justification={justified,RaggedRight},
                justification=centering,
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\arabic{footnote}}
% \renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[medium, md, sc]{titlesec}
\setlength{\headheight}{-10pt}
% \setlength{\headsep}{-10pt}
% \setlength{\voffset}{-10pt}
\setlength{\topmargin}{0pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage[sort, numbers]{natbib}
% \RequirePackage[super,comma,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\usepackage{doi}

\titleformat{\section}[block]
{\Large\bfseries}%
{\thesection}
{5mm}
{}
\titleformat{\subsection}[block]
{\large\bfseries}%
{\thesubsection}
{5mm}
{}

\titleformat{\chapter}[block]
{\Huge\bfseries}%
{\thechapter}
{5mm}
{}

\usepackage[acronym, nonumberlist, toc]{glossaries}
\titlespacing{\chapter}{0pt}{-50pt}{0pt}


% \RequirePackage[palatino]{quotchap}
% \renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
% \renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}
% \makeatletter
% \let\size@chapter\small
% \makeatother

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
  \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
  \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\dailyAdvisor#1{\gdef\@dailyAdvisor{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{Utrecht University}
\universitycity{Utrecht}
% \universitystate{Earth}

% School color found from university's graphic identity site:
% http://isites.harvard.edu/icb/icb.do?keyword=k75408&pageid=icb.page392732
\definecolor{SchoolColor}{rgb}{0.5, 0.5, 0.5} % Crimson 255/205/0
\definecolor{chaptergrey}{rgb}{0.5, 0.5, 0.5} % for chapter numbers

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}

% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
	\input{frontmatter/personalize}
	\maketitle
	\copyrightpage
	\abstractpage
% 	\tableofcontents
	{\footnotesize\tableofcontents}
% 	\listoffigures % optional
% 	\dedicationpage
	\acknowledgments
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
% 	\vspace*{\fill}
% 	\vspace{100pt}
	\begin{center}
	\Huge \textcolor{SchoolColor}{\thetitle} \normalsize \\
	\vspace{-50pt}
	\begin{figure}[tbph]
      \vspace{20pt}
      \centering
      \hspace*{-32pt}
      \includegraphics[width=1\textwidth]{figures/UU_logo_2021_EN_RGB.png}
    \end{figure}
     
% 	\textsc{a master thesis presented \\ by\\
% 	\theauthor\\ to\\ The Department of \@department\\
% 	\vspace{12pt}
% 	in partial fulfillment of the requirements\\
% 	for the degree of\\ \@degree\\
% 	in the subject of\\ \@field\\
% 	\vspace{12pt}
% 	\@university\\  %, \@universitystate\\
% 	\@degreemonth\ \@degreeyear\\
% 
	\textsc{a master thesis presented \\ by\\
	\theauthor\\ to\\ The Department of \@department\\
	\vspace{12pt}
	in partial fulfillment of the requirements\\
	for the degree of\\ \@degree\\
	in the subject of\\ \@field\\
	\vspace{12pt}
	\@university\\  %, \@universitystate\\
	October\ \@degreeyear\\
% 	
	\vspace{12pt}
	First supervisor: \@coadvisorOne\\
	Second supervisor: \@coadvisorTwo\\
	Daily supervisor: \@dailyAdvisor
	}
	\end{center} \vspace*{\fill}
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
% 	\vspace*{\fill}
	\scshape \noindent \small \copyright \small 2022\hspace{3pt}-- \theauthor \\
	\noindent all rights reserved.
	\vspace*{\fill}
	\newpage
	\rm
}

\newcommand{\abstractpage}{
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{3}
	\pagestyle{fancy}
	\lhead{Thesis advisor: Anna-Lena Lamprecht \@advisor} \rhead{\@author}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
	\Large \textcolor{SchoolColor}{\@title} \normalsize \\
	\vspace*{20pt}
	\scshape Abstract \\ \rm
	\end{center}
	\input{frontmatter/abstract}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
}

\newcommand{\dedicationpage}{
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
}

\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} \newpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}


\renewcommand{\backmatter}{
    {\footnotesize\bibliography{masterthesis,FAIR4RS-subgroup4}}
    \addcontentsline{toc}{chapter}{References}
    \printglossary[type=\acronymtype]
    \begin{appendices}
        \include{chapters/appendix}
    \end{appendices}
    % \input{endmatter/personalize}
    \clearpage
    \bibliographystyle{plainnat}
    \include{endmatter/colophon}
}
\makeglossaries

% for definition of research software: https://tex.stackexchange.com/questions/385675/how-do-i-add-begindefinition-enddefinition
\newtheorem{definition}{Definition}
\usepackage{multirow}
\usepackage{tabularx}

\usepackage{longtable}
\usepackage{a4wide}
\usepackage{makecell}
\usepackage{afterpage}

% capitalize all autoref references
\AtBeginDocument{
  \def\chapterautorefname{Chapter}%
  \def\sectionautorefname{Section}%
  \def\subsectionautorefname{Subsection}%
  \def\subsubsectionautorefname{Subsubsection}%
  \def\paragraphautorefname{Paragraph}%
  \def\subparagraphautorefname{Subparagraph}%
}%

% https://tex.stackexchange.com/questions/94845/problems-with-toprule-and-midrule-in-a-table
\usepackage{booktabs} 
% https://tex.stackexchange.com/questions/124346/latex-error-not-in-outer-par-mode
\usepackage{adjustbox}


% \usepackage{showframe}

% for line breaks in url
% \usepackage{xurl}
