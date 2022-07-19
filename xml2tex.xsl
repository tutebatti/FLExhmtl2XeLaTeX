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

\setotherlanguage{syriac}
\newfontfamily\syriacfont[Script=Syriac, Scale=1.0]{Serto Antioch Bible}
\setotherlanguage{estrangela}
\newfontfamily\estrangelafont[Script=Syriac, Scale=1.0]{Estrangelo Edessa}
\setotherlanguage{madnhaya}
\newfontfamily\madnhayafont[Script=Syriac, Scale=1.0]{East Syriac Adiabene}

\setotherlanguage{arabic}
\newfontfamily\arabicfont[Script=Arabic, Scale=1.0]{Amiri}

\setotherlanguage{hebrew}
\newfontfamily\hebrewfont[Script=Hebrew, Scale=1.0]{Ezra SIL}

\setotherlanguage{geez}
\newfontfamily\geezfont[Script=Ethiopic, Scale=1.0]{Abyssinica SIL}

\setotherlanguage[variant=ancient]{greek}
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
<!--     <xsl:text> \textsyriac{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text> -->
    <xsl:text> \textsyriac{</xsl:text><xsl:value-of select="replace(.,'_([A-z]*)','\\textenglish{$1}')"/><xsl:text>}</xsl:text>
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
    <xsl:choose>
      <xsl:when test='preceding::italics and following::italics'>
        <xsl:text>\textit{\textsubscript{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\textsubscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- superscript -->

  <xsl:template match="superscript">
    <xsl:choose>
      <xsl:when test='preceding::italics and following::italics'>
        <xsl:text>\textit{\textsuperscript{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\textsuperscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
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
  
  <xsl:variable name="sedraid">
    <xsl:value-of select="//sedra-id"/>
  </xsl:variable>
  
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
  
  <xsl:template match="variantentrytypes">  
    <xsl:choose>
      <xsl:when test="position() = 1">
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="variantformentrybackref">
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="$nextelement = 'variantentrytypes'">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>,</xsl:text>
      </xsl:when>
      <xsl:when test="$nextelement = 'variantformentrybackref'">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>;</xsl:text>
      </xsl:when>
      <xsl:when test="position() = last()">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <!-- Part-of-speech -->
  
  <xsl:template match="partofspeech">
    <xsl:text> \textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <!-- ########### -->
  <!-- Phonology -->
  <!-- ########### -->
  
  <xsl:template match="pronunciations">
    <xsl:text>
    
    +TEMP+ </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="transliteration">
    <xsl:text>
    
    PHONO /</xsl:text><xsl:apply-templates/><xsl:text>/</xsl:text>
  </xsl:template>
  
  <xsl:template match="phono-received-pronunciation">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>
  
  <!-- ########### -->
  <!-- Orthography -->
  <!-- ########### -->
  
  <xsl:template match="orth-estrangela/syriac">
    <xsl:text>
    
    ORTHO Est. \textestrangela{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="orth-serto/syriac">
    <xsl:text> Ser. \textsyriac{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="orth-madnḥaya/syriac">
    <xsl:text> Mad. \textmadnhaya{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="dots-sublinear">
    <xsl:text> DOTS Sub. </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="dots-supralinear">
    <xsl:text> Supra</xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="dots-sublinear-label|dots-supralinear-label">
    <xsl:text> \begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <!-- ########### -->
  <!-- Etymologies -->
  <!-- ########### -->
  
  <xsl:template match="etymaramaicbefore">
    <xsl:text>
    
    \smallskip
    \textbf{Aramaic etymologies}
    
    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="etymsemiticbefore">
    <xsl:text>
    
    \smallskip
    \textbf{Semitic etymologies}
    
    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="etymaramaicafter">
    <xsl:text>
    
    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="etymsemiticafter">
    <xsl:text>
    
    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>
  
  <xsl:template match="etymologies">
    <xsl:text>
    
    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="etymology">
    <xsl:variable name="precedingelement">
      <xsl:value-of select="(preceding-sibling::*[1])/name()"/>
    </xsl:variable>
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$precedingelement = 'etymaramaicbefore' or $precedingelement = 'etymsemiticbefore'">
        <xsl:text>
        
        \noindent{}</xsl:text><xsl:apply-templates/><xsl:text> | </xsl:text>
      </xsl:when>
      <xsl:when test="$nextelement = 'etymaramaicafter' or $nextelement = 'etymsemiticafter'">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text> | </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="etymology//language">
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$nextelement = 'language'">
        <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>}, </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
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
        <xsl:text> \textit{</xsl:text><xsl:value-of select="replace(.,'([,()])','\\textup{$1}')"/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
   
  <xsl:template match="gloss">
    <xsl:choose>
            <xsl:when test="./stemglosspair">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> `</xsl:text><xsl:apply-templates/><xsl:text>'</xsl:text>
            </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="gloss/stemglosspair/stem">
    <xsl:text> \textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="gloss/stemglosspair/gloss">
    <xsl:text> `</xsl:text><xsl:apply-templates/><xsl:text>' </xsl:text>
  </xsl:template>
  
  <xsl:template match="gloss/stemglosspair/pseudo-gloss">
    <xsl:text> \textit{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
  </xsl:template>
  
  <xsl:template match="gloss/stemglosspair//pseudo-gloss-stem">
    <xsl:text> \textup{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
  </xsl:template>
  
  <xsl:template match="bibliography">
    <xsl:text> [</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
  </xsl:template>
  
  <xsl:template match="preccomment">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>
  
  <!-- ########### -->
  <!-- Morpholoy -->
  <!-- ########### -->
  
  <xsl:template match="compmorphperf">
    <xsl:text>
    
    MORPHO perf. f. </xsl:text><xsl:apply-templates/><xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="compmorphimpf">
    <xsl:text>impf. sing./pl. </xsl:text><xsl:apply-templates/><xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="compmorphactpartm">
    <xsl:text>act. part. m./f. </xsl:text><xsl:apply-templates/><xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="compmorphpasspart">
    <xsl:text>pass. part. (abs./emph pairs) </xsl:text><xsl:apply-templates/><xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="compmorphinf">
    <xsl:text>inf. </xsl:text><xsl:apply-templates/><xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="compmorphtable">
    <xsl:text>Conj. Table </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
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
  
  <xsl:template match="sensetype">
    <xsl:text>(\textit{</xsl:text><xsl:apply-templates/><xsl:text>}) </xsl:text>
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
      <xsl:value-of select="substring(., string-length(.), 1)"/>
    </xsl:variable>
    
    <xsl:variable name="lastcharpreceding">
      <xsl:value-of select="substring(preceding-sibling::syriac[1], string-length(preceding-sibling::syriac[1]), 1)"/>
    </xsl:variable>

    <xsl:variable name="firstcharfollowing">
      <xsl:value-of select="substring(following-sibling::syriac[1], 1, 1)"/>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="position() = [1]">
        <xsl:text>\textsyriac{\textcolor{BrickRed}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:choose>
          <xsl:when test="matches($lastcharself, '[ܐܕܗܘܙܨܪܬ ]') or matches($firstcharfollowing, ' ')">
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <xsl:when test="position() != [1] and position() != last()">
        <xsl:choose>
          <xsl:when test="matches($lastcharpreceding, '[ ܐܕܗܘܙܨܪܬ]')">
            <xsl:text>\textcolor{BrickRed}{</xsl:text>
            <xsl:apply-templates/>
            <xsl:choose>
              <xsl:when test="
              matches($lastcharself, '[ܐܕܗܘܙܨܪܬ]') or
              matches($firstcharfollowing, ' ')
              ">
                <xsl:text>}</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          
          <xsl:when test="not(matches($lastcharpreceding, '[ ܐܕܗܘܙܨܪܬ]'))">
            <xsl:text>\char"200D{}\textcolor{BrickRed}{\char"200D{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:choose>
              <xsl:when test="
              matches($lastcharself, '[ܐܕܗܘܙܨܪܬ]') or
              matches($firstcharfollowing, ' ')
              ">
                <xsl:text>}</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="position() = last()">
        <xsl:choose>
          <xsl:when test="matches($lastcharpreceding, '[ ܐܕܗܘܙܨܪܬ]')">
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
    \includegraphics[width=0.7\columnwidth]{../pictures/</xsl:text><xsl:value-of select='$sedraid'/><xsl:text>.png}
    \caption{
    \begin{tiny}</xsl:text>
    <xsl:apply-templates select=".//caption"/>
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
