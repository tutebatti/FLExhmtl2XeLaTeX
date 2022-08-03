<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- heading for senses -->

  <xsl:template match="senses">
    <xsl:text>

    \medskip{}
    \noindent{}\textbf{Senses}

    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <!-- part-of-speech -->

  <!-- 1) if the same for all senses -->

  <xsl:template match="senses/sharedgrammaticalinfo//partofspeech">
    <xsl:text>

    \textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- 2) if different in different senses -->

  <xsl:template match="sense//partofspeech">
    <xsl:text>~\textit{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
  </xsl:template>

  <!-- sense content -->

  <xsl:template match="sensecontent">
    <xsl:text>

    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <!-- sense content -->

  <xsl:template match="sensenumber">
    <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>)} </xsl:text>
  </xsl:template>

  <xsl:template match="sensetype">
    <xsl:text>(\textit{</xsl:text><xsl:apply-templates/><xsl:text>}) </xsl:text>
  </xsl:template>

  <xsl:template match="definitionorgloss">
    <xsl:variable name="precedingelement"> <!-- Local variable is generated to check the preceding element. -->
      <xsl:value-of select="(preceding-sibling::*[1])/name()"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$precedingelement = 'restrictions'"> <!-- insert space if preceded by <restrictions> -->
        <xsl:text> \textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="lexsensereference">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="lexsensereference//ownertype_abbreviation">
    <xsl:text></xsl:text><xsl:apply-templates/><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="lexsensereference//configtarget/headword">
    <xsl:text>\textsyriac{</xsl:text>
    <xsl:value-of select="normalize-space(./syriac)"/>
    <xsl:text>}</xsl:text>
    <xsl:if test="./lexsensereference_sensenumber">
      <xsl:text> </xsl:text>
      <xsl:value-of select="./lexsensereference_sensenumber"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="lexsensereference//configtarget//syriac"/>
  <xsl:template match="lexsensereference//configtarget//lexsensereference_sensenumber"/>

  <xsl:template match="sense/source">
    <xsl:text> [cf. </xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
  </xsl:template>

</xsl:stylesheet>
