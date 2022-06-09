<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    >

  <xsl:output method="text" version="1.0" encoding="UTF-8" />
  <xsl:strip-space elements="*"/>

  <!-- ##################### -->
  <!-- (Xe-)LaTeX main frame -->
  <!-- ##################### -->
  
  <xsl:template match="/">
    <xsl:text>
\documentclass[10pt, a4paper, twocolumn, twoside]{book}

\usepackage{polyglossia, xunicode}

\usepackage[dvipsnames]{xcolor}

\setdefaultlanguage{english}
\setmainfont{Charis SIL}

\setotherlanguages{syriac,arabic,hebrew,geez}
\setotherlanguage[variant=ancient]{greek}
\newfontfamily\syriacfont[Script=Syriac, Scale=1.1]{Serto Antioch Bible}
\newfontfamily\serto[Script=Syriac, Scale=1.1]{Serto Antioch Bible}
\newfontfamily\estrangela[Script=Syriac, Scale=1.1]{Estrangelo Edessa}
\newfontfamily\madnhaya[Script=Syriac, Scale=1.1]{East Syriac Adiabene}
\newfontfamily\arabicfont[Script=Arabic, Scale=1.1]{Amiri}
\newfontfamily\hebrewfont[Script=Hebrew]{Ezra SIL}
\newfontfamily\geezfont[Script=Ethiopic]{Abyssinica SIL}
\newfontfamily\greekfont[Script=Greek]{SBL Greek}

\begin{document}
    </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>
\end{document}    
    </xsl:text>
  </xsl:template>
  
  <!-- ################# -->
  <!-- non-Latin scripts -->
  <!-- ################# -->
  
  <!-- Syriac -->
  
  <xsl:template match="syriac">
    <xsl:text> \textsyriac{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- Arabic -->
  
  <xsl:template match="arabic">
    <xsl:text> \textarabic{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- Hebrew -->
  
  <xsl:template match="hebrew">
    <xsl:text> \texthebrew{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- Geez -->
    
  <xsl:template match="geez">
    <xsl:text> \textgeez{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- Greek -->
    
  <xsl:template match="geez">
    <xsl:text> \textgreek{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- RTL -->
    
  <xsl:template match="rtl">
    <xsl:text>\RLE{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- ############### -->
  <!-- Headword matter -->
  <!-- ############### -->
  
  <!-- main headword -->
  
  <xsl:template match='mainheadword'>
    <xsl:text>
    
    \begin{huge}</xsl:text><xsl:apply-templates/><xsl:text>\end{huge}</xsl:text>
  </xsl:template>
  
  <!-- Sedra ID -->
  
  <xsl:template match='sedra-id'>
    <xsl:text> [Sedra-ID </xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
  </xsl:template>
  
  <!-- gender inflection -->
  
  <xsl:template match='gender-inflection'>
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>.</xsl:text>
  </xsl:template>
  
  <!-- Homograph entry numbering -->
  
  <xsl:template match="homographentrynumber">
    <xsl:text> \textsuperscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- Variant entries -->
  
  <xsl:template match="variantformentrybackrefs">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>
  
  <!-- Part-of-speech -->
  
  <xsl:template match="partofspeech">
    <xsl:text> \textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- ########### -->
  <!-- Etymologies -->
  <!-- ########### -->
  
  <xsl:template match="etymologies">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>
  
  <xsl:template match="etymology//abbreviation">
    <xsl:choose>
      <xsl:when test="./ancestor::etymology[position() != [0]] and
      not(normalize-space(.)='&lt;SEM&gt;') and
      not(normalize-space(ancestor::etymology/preceding-sibling::etymology//abbreviation) = '&lt;SEM&gt;') and
      not(normalize-space(ancestor::etymology/following-sibling::etymology//abbreviation) = '&lt;SEM&gt;')
      ">
        <xsl:text> | </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:when test="normalize-space(.)='&lt;SEM&gt;'">
        <xsl:text>
        
        </xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="form">
    <xsl:text> \textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="gloss">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <!-- ###### -->
  <!-- Senses -->
  <!-- ###### -->
  
  <xsl:template match="sensenumber">
    <xsl:text>
    
    \textbf{</xsl:text><xsl:apply-templates/><xsl:text>)} </xsl:text>
  </xsl:template>
  
  <xsl:template match="definitionorgloss">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <!-- ######## -->
  <!-- Examples -->
  <!-- ######## -->
  
  <xsl:template match="examplescontent">
    <xsl:text>
    
    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="simtho-period">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="simtho-reference-century">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="examplescontent/abbreviation">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="examplescontent/text()">
    <xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="simtho-reference-page">
    <xsl:text> p.\,</xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="example">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="highlightedsyriac">
    <xsl:text> \textsyriac{\textcolor{BrickRed}{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>

  <xsl:template match="translationcontent">
    <xsl:text> \begin{footnotesize}``</xsl:text><xsl:apply-templates/><xsl:text>''\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <!-- ########## -->
  <!-- Subentries -->
  <!-- ########## -->
  
  <xsl:template match="subentry">
    <xsl:text>
    
    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="complexformtype/abbreviation">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
</xsl:stylesheet>
