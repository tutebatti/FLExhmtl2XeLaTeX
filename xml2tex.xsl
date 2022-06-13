<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
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

\usepackage[colorlinks=true, urlcolor=blue]{hyperref}

\usepackage{graphicx}

\setdefaultlanguage{english}
\setmainfont{Charis SIL}

\usepackage[]{mdframed}
\definecolor{lightgreen}{RGB}{230, 240, 194}
\newmdenv[linecolor=gray,backgroundcolor=lightgreen]{sidebar}

\setotherlanguages{syriac,arabic,hebrew,geez}
\setotherlanguage[variant=ancient]{greek}
\newfontfamily\syriacfont[Script=Syriac, Scale=1.0]{Serto Antioch Bible}
\newfontfamily\serto[Script=Syriac, Scale=1.0]{Serto Antioch Bible}
\newfontfamily\estrangela[Script=Syriac, Scale=1.0]{Estrangelo Edessa}
\newfontfamily\madnhaya[Script=Syriac, Scale=1.0]{East Syriac Adiabene}
\newfontfamily\arabicfont[Script=Arabic, Scale=1.0]{Amiri}
\newfontfamily\hebrewfont[Script=Hebrew, Scale=1.0]{Ezra SIL}
\newfontfamily\geezfont[Script=Ethiopic, Scale=1.0]{Abyssinica SIL}
\newfontfamily\greekfont[Script=Greek]{SBL Greek}

\usepackage{setspace}
\onehalfspacing
\lineskiplimit=-\maxdimen

\begin{document}
    </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>
\end{document}    
    </xsl:text>
  </xsl:template>
  
  <!-- ################# -->
  <!-- scripts and fonts -->
  <!-- ################# -->
  
  <!-- Syriac -->
  
  <xsl:template match="syriac">
    <xsl:text> \textsyriac{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- Arabic -->
  
  <xsl:template match="arabic">
    <xsl:text> \textup{\textarabic{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>
  
  <!-- Hebrew -->
  
  <xsl:template match="hebrew">
    <xsl:text> \textup{\texthebrew{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>
  
  <!-- Geez -->
    
  <xsl:template match="geez">
    <xsl:text> \textup{\textgeez{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>
  
  <!-- Greek -->
    
  <xsl:template match="greek">
    <xsl:text> \textup{\textgreek{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>
  
  <!-- RTL -->
    
  <xsl:template match="rtl">
    <xsl:text>\RLE{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- italics -->

  <xsl:template match="italics">
    <xsl:text>\textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- subscript -->

  <xsl:template match="subscript">
    <xsl:text>\textsubscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- superscript -->

  <xsl:template match="superscript">
    <xsl:text>\textsuperscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- ############### -->
  <!-- Headword matter -->
  <!-- ############### -->
  
  <!-- main headword -->
  
  <xsl:template match="mainheadword">
    <xsl:text>
    
    \begin{huge}</xsl:text><xsl:apply-templates/><xsl:text>\end{huge}</xsl:text>
  </xsl:template>
  
  <!-- Sedra ID -->
  
  <xsl:template match="sedra-id">
    <xsl:text> [\href{https://sedra.bethmardutho.org/lexeme/get/</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}{Sedra-ID </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}]</xsl:text>
  </xsl:template>
  
  <!-- gender inflection -->
  
  <xsl:template match="gender-inflection">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>.</xsl:text>
  </xsl:template>
  
  <!-- Homograph entry numbering -->
  
  <xsl:template match="homographentrynumber">
    <xsl:text> \textsubscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
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
  
  <xsl:template match="(
  etymaramaicbefore |
  etymaramaicafter |
  etymsemiticbefore |
  etymsemiticafter
  )">
    <xsl:text>
    
    \begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="etymologies">
    <!--<xsl:text>
    
    \begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>-->
    <xsl:text>
    
    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="etymology">
    <xsl:choose>
      <xsl:when test="position() = [1]">
        <xsl:text>
        
        \smallskip
        \textbf{Aramaic etymologies}
        
        </xsl:text><xsl:apply-templates/><xsl:text> | </xsl:text>
      </xsl:when>
      <xsl:when test="
      not(position() = last()) and
      not(following-sibling::node()[1][.//abbreviation = '&lt;SEM&gt;']) and
      not(descendant::abbreviation = '&lt;SEM&gt;')
      ">
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text> | </xsl:text>
      </xsl:when>
      <xsl:when test="
      position() = last()
      ">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:when test="
      descendant::abbreviation = '&lt;SEM&gt;'
      ">
        <xsl:text>
    
        \smallskip
        \textbf{Semitic etymologies}
        
        </xsl:text>
      </xsl:when>
      <xsl:when test="
      following-sibling::node()[1][.//abbreviation = '&lt;SEM&gt;']
      ">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="etymology//abbreviation">
    <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="form">
    <xsl:choose>
      <xsl:when test="./(
      arabic |
      hebrew |
      geez |
      greek
      )">
        <xsl:text></xsl:text>
        <xsl:apply-templates select="(arabic | hebrew | geez | greek)"/>
	<xsl:text> \textit{</xsl:text>
        <xsl:apply-templates select="text()"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> \textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
   
  <xsl:template match="gloss">
    <xsl:choose>
      <xsl:when test=". = parent::etymology/preceding-sibling::etymology/gloss">
        <xsl:text> \textit{id.}</xsl:text>
      </xsl:when>
      <xsl:when test="descendant::etymology-gloss_gloss">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> `</xsl:text><xsl:apply-templates/><xsl:text>'</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="bibliography">
    <xsl:text> [</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
  </xsl:template>
  
  <xsl:template match="preccomment">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <!-- ###### -->
  <!-- Senses -->
  <!-- ###### -->

  <xsl:template match="sensecontent">
    <xsl:text>

    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="sensenumber">
    <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>)} </xsl:text>
  </xsl:template>
  
  <xsl:template match="definitionorgloss">
    <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="lexsensereference">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <!-- ######## -->
  <!-- Examples -->
  <!-- ######## -->
  
  <xsl:template match="examplescontent">
    <xsl:text>
    
    $\triangleright$ </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
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
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="example">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="example/rtl/syriac">
    <xsl:choose>
      <xsl:when test="position() = [1]">
        <xsl:text> \textsyriac{</xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:when test="position() != [1] and position() != last()">
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:when test="position() = last()">
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="example/rtl/highlightedsyriac">
    
    <xsl:variable name="lastcharself">
      <xsl:value-of select="substring(., string-length(.))"/>
    </xsl:variable>
    
    <xsl:variable name="lastcharpreceding">
      <xsl:value-of select="substring(preceding-sibling::syriac[1], string-length(preceding-sibling::syriac[1]))"/>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="position() = [1]">
        <xsl:text>\textsyriac{\textcolor{BrickRed}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:choose>
          <xsl:when test="matches($lastcharself, '[ܐܕܗܘܙܨܪܬ ]')">
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <xsl:when test="position() != [1] and position() != last()">
        <xsl:choose>
          <xsl:when test="matches($lastcharpreceding, '[ ܐܕܗܘܙܨܪܬ]') and not(matches($lastcharself, '[ܐܕܗ ܘܙܨܪܬ]'))">
            <xsl:text>\textcolor{BrickRed}{</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
          </xsl:when>
          
          <xsl:when test="matches($lastcharself, '[ܐܕܗܘ ܙܨܪܬ]') and not(matches($lastcharpreceding, '[ܐܕܗܘ ܙܨܪܬ]'))">
            <xsl:text>\char"200D{}\textcolor{BrickRed}{\char"200D{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          
          <xsl:when test="matches($lastcharpreceding, '[ܐܕܗܘ ܙܨܪܬ]') and matches($lastcharself, '[ܐܕܗܘ ܙܨܪܬ]')">
            <xsl:text>\textcolor{BrickRed}{</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          
          <xsl:otherwise>
            <xsl:text>\char"200D{}\textcolor{BrickRed}{\char"200D{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <xsl:when test="position() = last()">
        <xsl:choose>
          <xsl:when test="matches($lastcharpreceding, '[ܐܕܗܘ ܙܨܪܬ]')">
            <xsl:text>\textcolor{BrickRed}{</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>\char"200D{}\textcolor{BrickRed}{\char"200D{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="translationcontent">
    <xsl:text> \begin{footnotesize}``</xsl:text><xsl:apply-templates/><xsl:text>''\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <!-- ########## -->
  <!-- Pictures -->
  <!-- ########## -->
  
  <xsl:template match="pictures">
    <xsl:text> 

    \begin{center}
    \begin{figure}[h]	    
    \centering
    \includegraphics[width=0.7\columnwidth]{bytA.png}
    \caption{
    \begin{tiny}</xsl:text>
    <xsl:apply-templates select="caption"/>
    <xsl:text>
    \end{tiny}}
    \end{figure}
    \end{center}</xsl:text>
  </xsl:template>
  
  <!-- ########## -->
  <!-- Subentries -->
  <!-- ########## -->
  
  <xsl:template match="(subentry | subentry_verbal-stems-measures)">
    <xsl:text>
    
    \medskip{}
    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="(subentry | subentry_verbal-stems-measures)/headword">
    <xsl:text>\begin{large}</xsl:text><xsl:apply-templates/><xsl:text>\end{large}</xsl:text>
  </xsl:template>
  
  <xsl:template match="complexformtype/abbreviation">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="reverseabbr">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <!-- ######## -->
  <!-- Sidebars -->
  <!-- ######## -->  
  
  <xsl:template match="sidebar-title">
    <xsl:variable name="lemma">
      <xsl:value-of select="parent::entry/mainheadword/syriac/rtl/text()"/>
    </xsl:variable>
    <xsl:text>
    
    \begin{sidebar}[]
    \begin{center}
    \begin{footnotesize}
    \textsc{
    \textbf{
    \textcolor{BrickRed}{</xsl:text>
    <xsl:apply-templates/>
    <xsl:text> \textsyriac{</xsl:text>
    <xsl:value-of select="$lemma"/>
    <xsl:text>}}}}
    \end{footnotesize}
    \end{center}</xsl:text>
  </xsl:template>
  
  <xsl:template match="sidebar-text">
    <xsl:text>

    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}\end{sidebar}</xsl:text>
  </xsl:template>
  
  <xsl:template match="sidebar-text/text()">
    <xsl:text></xsl:text><xsl:value-of select="replace(current(), '▪', '\\textbullet{}')"/><xsl:text></xsl:text>
  </xsl:template>

  <!-- ################ -->
  <!-- Simtho Meta data -->
  <!-- ################ -->
  
  <xsl:template match="simtho-sense-created-by/abbreviation">
    <xsl:text> \textcolor{Dandelion}{(</xsl:text><xsl:apply-templates/><xsl:text>)}</xsl:text>
  </xsl:template>
  
  <xsl:template match="simtho-ex-created-by/abbreviation">
    <xsl:text> \textcolor{Dandelion}{(</xsl:text><xsl:apply-templates/><xsl:text>)}</xsl:text>
  </xsl:template>
  
  <xsl:template match="simtho-contributor/abbreviation">
    <xsl:text>
    
    \textcolor{Dandelion}{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="datecreated | datemodified"/>
  <!-- <xsl:text>
    
    \begin{scriptsize}\textcolor{Dandelion}{(entry created: </xsl:text><xsl:apply-templates/><xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="entry/datemodified">
    <xsl:text> \begin{scriptsize}\textcolor{Dandelion}{(entry modified: </xsl:text><xsl:apply-templates/><xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="subentry/datecreated">
    <xsl:text>
    
    \begin{scriptsize}\textcolor{Dandelion}{(subentry created: </xsl:text><xsl:apply-templates/><xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="subentry/datemodified">
    <xsl:text> \begin{scriptsize}\textcolor{Dandelion}{(subentry modified: </xsl:text><xsl:apply-templates/><xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>-->
  
  <!-- ######## -->
  <!-- Comments -->
  <!-- ######## -->
  
  <xsl:template match="comment">
    <!--<xsl:text>
    
    \begin{scriptsize}\textcolor{red}{NOTE TO EDITOR: </xsl:text><xsl:apply-templates/><xsl:text>)}\end{scriptsize}</xsl:text>-->
  </xsl:template>
  
</xsl:stylesheet>
