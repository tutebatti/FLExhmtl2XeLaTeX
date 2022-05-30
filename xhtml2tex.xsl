<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0"
    >

  <xsl:output method="text" version="1.0" encoding="UTF-8" />

  <!-- (Xe-)LaTeX main frame -->
  
  <xsl:template match="/xhtml:html">
    <xsl:text>
\documentclass[10pt, a4paper, twocolumn, twoside]{book}

\usepackage{polyglossia, xunicode}

\setdefaultlanguage{english}
\setmainfont{Linux Libertine}

\setotherlanguages[nohyphenation]{syriac,arabic,hebrew,geez}
\newfontfamily\syriacfont[Script=Syriac, Scale=1.1]{Serto Urhoy}
\newfontfamily\serto[Script=Syriac, Scale=1.1]{Serto Urhoy}
\newfontfamily\estrangela[Script=Syriac, Scale=1.1]{Estrangelo Edessa}
\newfontfamily\madnhaya[Script=Syriac, Scale=1.1]{East Syriac Adiabene}
\newfontfamily\arabicfont[Script=Arabic, Scale=1.1]{Amiri}
\newfontfamily\hebrewfont[Script=Hebrew]{Ezra SIL}
\newfontfamily\geezfont[Script=Ethiopic]{Abyssinica SIL}

\begin{document}
    </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>
\end{document}    
    </xsl:text>
  </xsl:template>
  
</xsl:stylesheet>
