\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rftthesis}[2016/12/14 Standard RFT thesis class]


% base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax
\LoadClass[
 headings = small,
 fontsize = 12pt,
 parskip = half-,
 DIV = calc,
%  bibliography = totoc,
%  index = totoc
]{scrreprt}


% required packages
\RequirePackage{babel}

% \RequirePackage{cmap}
% \RequirePackage{microtype}
\RequirePackage{lmodern}
% \RequirePackage{helvet}


%% page setup
\KOMAoptions{
 paper = A4,
 pagesize,
 headlines = 1.1,
 headsepline,
 DIV = last
}
\typearea[8mm]{15}


%% graphics and colors
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{colortbl}

\definecolor{tub_red}  {RGB}{197,  14,  31}
\definecolor{tub_black}{RGB}{  0,   0,   0}
\definecolor{tub_gray} {RGB}{113, 113, 113}

\definecolor{tub_spot_red}   {cmyk}{0.20, 1.00, 1.00, 0.00}
\definecolor{tub_spot_yellow}{cmyk}{0.00, 0.50, 1.00, 0.00}
\definecolor{tub_spot_green} {cmyk}{0.85, 0.30, 0.60, 0.10}
\definecolor{tub_spot_blue}  {cmyk}{1.00, 0.35, 0.30, 0.00}


% tables
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{ragged2e}

\newcolumntype{L}{>{\RaggedRight\hspace{0pt}}X}
\newcolumntype{R}{>{\RaggedLeft\hspace{0pt}}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{P}[1]{>{\RaggedRight\hspace{0pt}}p{#1}}

% siunitx
\RequirePackage{siunitx}[2016/03/01] % ver. 2.6q
\sisetup{
 binary-units = true,
 detect-all,
 detect-display-math,
 group-digits = true,
 group-minimum-digits = 4,
 group-separator = {.},
 per-mode = symbol,
 range-phrase = {--},
 range-units=single,
 retain-explicit-plus
}

\RequirePackage{tikz}

\RequirePackage[
  style = numeric,
  backend = biber
]{biblatex}[2016/05/08] % ver. 3.4

\RequirePackage[
 colorlinks = true,
 linkcolor  = ,
 linktoc    = all,
 urlcolor   =
]{hyperref}

\RequirePackage[xindy, acronym, symbols, shortcuts, numberedsection]{glossaries}


%% font family: sans serif
\renewcommand{\familydefault}{\sfdefault}


%% head and foot
\RequirePackage{lastpage}
\RequirePackage[
 automark,
 headsepline,
 nouppercase,
 komastyle
]{scrpage2}

\RequirePackage{cleveref}

%% page style
\pagestyle{scrheadings}

\ohead[]{\headmark}
\ihead[]{}
\chead[]{}
\ofoot[\pagemark/\pageref{LastPage}]{\pagemark/\pageref{LastPage}}
\ifoot[]{}
\cfoot[]{}

\setkomafont{pageheadfoot}{\small\usekomafont{pagenumber}}

\renewcommand*{\titlepagestyle}{empty}
\renewcommand*{\partpagestyle}{empty}
\renewcommand*{\chapterpagestyle}{scrheadings}
\renewcommand*{\indexpagestyle}{empty}


%% captions
\setkomafont{captionlabel}{\sffamily\bfseries}
\setcapindent{0em}


%% penalties
\clubpenalty 10000
\widowpenalty 10000
\displaywidowpenalty 10000


%% floats
\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{.05}


%% new commands
\def\@project{Project}
\newcommand{\project}[1]{
  \def\@project{#1}
}

\def\@type{Type}
\newcommand{\type}[1]{
  \def\@type{#1}
}

\def\@identifier{XX-0000-YY000}
\newcommand{\identifier}[1]{
  \def\@identifier{#1}
}

\def\@version{-1}
\newcommand{\version}[1]{
  \def\@version{#1}
}

\def\@matriculation{123456}
\newcommand{\matriculation}[1]{
  \def\@matriculation{#1}
}

\def\@studies{Luft- und Raumfahrttechnik}
\newcommand{\studies}[1]{
  \def\@studies{#1}
}

\def\@firstsupervisor{Prof. Dr.-Ing. Klaus Brie{\ss}}
\newcommand{\firstsupervisor}[1]{
  \def\@firstsupervisor{#1}
}

\def\@secondsupervisor{Dipl.-Ing. Max Mustermann}
\newcommand{\secondsupervisor}[1]{
  \def\@secondsupervisor{#1}
}

\def\@creatorname{John Doe}
\def\@creatorrole{Deer}
\newcommand{\creator}[2]{
  \def\@creatorname{#1}
  \def\@creatorrole{#2}
}

\def\@examinername{John Doe}
\def\@examinerrole{Deer}
\newcommand{\examiner}[2]{
  \def\@examinername{#1}
  \def\@examinerrole{#2}
}

\def\@releasename{John Doe}
\def\@releaserole{Deer}
\newcommand{\release}[2]{
  \def\@releasename{#1}
  \def\@releaserole{#2}
}


%% title page
\renewcommand{\maketitle}{
 \thispagestyle{\titlepagestyle}
 \hfill\includegraphics[height = 40mm]{art/TU_Logo_lang_RGB_rot.jpg}

 \vspace*{20mm}
 \vspace*{14.4pt}

 \vspace*{2em}
\begin{minipage}{\textwidth}
 \raggedright
 {\Large\textbf{\@title}}
\end{minipage}

 \vspace*{1em}
 \@type

 \vspace*{1em}
 \noindent\\
 Submitted by:\\
 \@author\\
 Matr. Nr.: \@matriculation\\
 Degree program: \@studies

 \noindent\\
 \noindent\\
 Fakult{\"a}t Verkehrs- und Maschinensysteme\\
 Fachgebiet Raumfahrttechnik\\
 Institut f{\"u}r Luft- und Raumfahrt\\
 Marchstra{\ss}e 12-14\\
 10587 Berlin

 \noindent\\
 \noindent\\
 Supervisors:\\
 \@firstsupervisor\\
 \@secondsupervisor\\

 \vspace*{\fill}
 \begin{center}
  \@date
 \end{center}
 \newpage
 \cleardoubleemptypage
}


%% signature page
\newcommand{\makesignatures}{
 \vspace*{\fill}
 \begin{tabularx}{\textwidth}{@{}llcC@{}}
  Erstellt: & \@creatorname & & \\
  \midrule
  & (\@creatorrole) & Datum & Unterschrift \\
  & & & \\
  & & & \\
  & & & \\
  Gepr\"uft: & \@examinername & & \\
  \midrule
  & (\@examinerrole) & Datum & Unterschrift \\
  & & & \\
  & & & \\
  & & & \\
  Genehmigt: & \@releasename & & \\
  \midrule
  & (\@releaserole) & Datum & Unterschrift \\
 \end{tabularx}
 \newpage
 \cleardoubleemptypage
}


%% contact page
\newcommand{\makecontact}{
 \textbf{Kontaktadresse}

 Technische Universit\"at Berlin \\
 Fakult\"at Transport- und Maschinensysteme \\
 Institut f\"ur Luft- und Raumfahrt \\
 Fachgebiet Raumfahrttechnik

 Marchstra{\ss}e 12 - 14 \\
 10587 Berlin \\
 Deutschland

 Telefon: +49 (0)30 314-21305 \\
 Telefax: +49 (0)30 314-21306

 \url{http://www.raumfahrttechnik.tu-berlin.de}
 \newpage
 \cleardoubleemptypage
}


%% declaration page
\newcommand{\makedeclaration}{
\chapter*{Declaration of Authorship}

I hereby certify that this thesis has been composed by me and is based on my own work, unless stated otherwise. No other person’s work has been used without due acknowledgement in this thesis. All references and verbatim extracts have been quoted, and all sources of information, including graphs and data sets, have been specifically acknowledged.

 \vspace{25mm}

 \begin{tabularx}{\textwidth}{p{5cm}p{2cm}X}
  & & \\
  \cline{1-1} \cline{3-3}
  \small Place, Date & & \small Signature
 \end{tabularx}
 \newpage
\chapter*{Agreement on rights of utilization}

The Technische Universität Berlin, represented by the Chair of Space Technology, may use the results of the thesis at hand in education and research. It receives simple (non-exclusive) rights of utilization as according to § 31 Abs. 2 Urheberrechtsgesetzt (Urhg). This right of utilization is unlimited and involves content of any kind (e.g. documentation, presentations, animations, photos, videos, equipment, parts, procedures, designs, drawings, software including source code and similar). An eventual commercial use on part of the Technische Universität Berlin will only be carried out with approval of the author of the thesis at hand under appropriate share of earnings. 

 \vspace{25mm}

 \begin{tabularx}{\textwidth}{p{5cm}p{2cm}X}
  & & \\
  \cline{1-1} \cline{3-3}
  \small Place, Date & & \small Signature \\
  &&\\
  &&\\
  &&\\
  &&\\
  \cline{3-3}
  && \small Professor Dr.-Ing. Klaus Brieß \\ 
  && \small Head of the Chair of Space Technology \\
 \end{tabularx}
 \newpage
 \cleardoubleemptypage
}
