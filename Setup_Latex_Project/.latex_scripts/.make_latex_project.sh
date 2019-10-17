#Francesco Forcellato 31/07/2019

echo Name of the project:
read project_name
echo Document title:
read title
echo author:
read author
mkdir $project_name
cd $project_name
mkdir src
mkdir templates
cat > templates/template.sty <<'end_template'
\ProvidesPackage{../templates/template}
%Import package.
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{hyperref}
\usepackage{titlesec}
\usepackage{titling}
\usepackage{fancyhdr}
\usepackage[a4paper,includeheadfoot,margin=2.54cm]{geometry}
%---end import package.

%header and footer style definition.
\setlength\headheight{14.5pt}
\pagestyle{fancy}
\fancyhf{}
\chead{\@title}
\lhead{\theauthor}
\rhead{\@date}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[CE,CO]{\leftmark}
\fancyfoot[LE,RO]{\thepage}
%---end header and foot definition.

%commands definition.
\newcommand{\R}{\mathbb{R}}

\newcommand{\definizione}[2]{
    \subsubsection{#1}{
        \emph{#2}
    }
    \ \\
}
%---end commands definition.

%style definition.
\titleformat{\subsubsection}[runin]
{\normalfont\large\bfseries}
{\thesubsubsection}
{1em}
{}

\titlespacing{\subsubsection}{10pt}{25pt}{0pt}
%---end style definition.
end_template
cd src
cat > main.tex << 'end_main'
\documentclass[11pt, twoside, a4paper]{article}
\usepackage{../templates/template}

\begin{document}

%title, index definition.
\author{
end_main
echo $author >> main.tex
cat >> main.tex << 'end_main'
}
\title{
end_main
echo $title >> main.tex
cat >> main.tex << 'end_main'
}
%---end title, index definition.
\maketitle

\newpage
\tableofcontents
\newpage

\input{sections/section1.tex}
\end{document}
end_main
mkdir sections
echo "\section{First section}Project created from bash with a Francesco Forcellato's script.">sections/section1.tex
pdflatex main.tex
pdflatex main.tex
echo Done.
