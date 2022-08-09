<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

    <xsl:template match="/">
      <xsl:text>
\documentclass[10pt, a4paper, twocolumn, twoside]{book}

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

\begin{document}
    </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>
\end{document}
    </xsl:text>
  </xsl:template>

  <!-- Letter Heads -->

  <xsl:template match="letterHead">
    <xsl:text>\bigskip

    \begin{center}\begin{Huge}</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>\end{Huge}\end{center}\bigskip</xsl:text>
  </xsl:template>

</xsl:stylesheet>
