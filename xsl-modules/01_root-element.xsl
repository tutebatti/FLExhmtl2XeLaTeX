<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

    <!-- Match root element and insert LaTeX preamble at top -->

    <xsl:template match="/">
      <xsl:text>\documentclass[10pt, a4paper, twocolumn, twoside]{book}

\usepackage{titlesec} % used for formatting of chapter/section headings etc., needs to be loaded before bidi

\usepackage{fancyhdr} % custom headers
\pagestyle{fancy}

% For the following, cf. the docs of fancyhdr in the section on dictionary style
\renewcommand{\chaptermark}[1]{}
\renewcommand{\sectionmark}[1]{}

\usepackage{ifthen} % needed for following "\ifthenelse" command
\newcommand{\mymarks}{
  \ifthenelse{\equal{\leftmark}{\rightmark}}
  {\rightmark} % if equal
  {\LRE{\rightmark{} --– \leftmark{}}}} % if not equal

    \fancyhead[LE,RO]{\mymarks}
    \fancyhead[LO,RE]{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}

\usepackage{polyglossia, xunicode}

\usepackage[dvipsnames]{xcolor} % used for coloring, option 'dvipsnames' provides extended color names
\usepackage{soul} % used for highlighting via \hl

\usepackage[hidelinks]{hyperref} % adapt internal and external linking

\usepackage{graphicx}

\usepackage[]{mdframed} % used for sidebars
\definecolor{lightgreen}{RGB}{230, 240, 194}
\newmdenv[linecolor=gray,backgroundcolor=lightgreen]{sidebar}

\setdefaultlanguage{english}
\setmainfont{Charis SIL}

\setotherlanguage{syriac}
\newfontfamily\syriacfont[Script=Syriac, Scale=1.0]{Serto Antioch Bible}
\newfontfamily\estrangelafont[Script=Syriac, Scale=1.0]{Estrangelo Edessa}
\newfontfamily\madnhayafont[Script=Syriac, Scale=1.0]{East Syriac Adiabene}

\setotherlanguage{arabic}
\newfontfamily\arabicfont[Script=Arabic, Scale=1.0]{Amiri}

\setotherlanguage{hebrew}
\newfontfamily\hebrewfont[Script=Hebrew, Scale=1.0]{Ezra SIL}

\setotherlanguage{amharic}
\newfontfamily\amharicfont[Script=Ethiopic, Scale=1.0]{Abyssinica SIL}

\setotherlanguage[variant=ancient]{greek}
\newfontfamily\greekfont[Script=Greek]{SBL Greek}

\usepackage{setspace} % adjust for linespacing (note: Arabic can cause problems because of exceeding lineheight)
\onehalfspacing
\lineskiplimit=-\maxdimen

\setlength{\parindent}{0pt} % deactivate automatic indentation in new lines

% formatting of chapter/section headings, cf. docs of package titlesec
\setcounter{secnumdepth}{-1} % avoids chapter and section numbering
\titleformat{\chapter}[display]{\normalfont\bfseries}{}{0pt}{\Huge\center}
\titleformat{\section}[runin]{\normalfont\bfseries}{}{0pt}{\huge}

\begin{document}
\tableofcontents
    </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>
\end{document}
    </xsl:text>
  </xsl:template>

  <!-- Letter Heads -->

  <xsl:template match="letterHead">
    <xsl:text>\chapter{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>}</xsl:text>
  </xsl:template>

</xsl:stylesheet>
