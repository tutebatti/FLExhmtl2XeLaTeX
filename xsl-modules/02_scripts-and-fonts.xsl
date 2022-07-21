<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- Syriac -->
  <!-- Note: English text within <syriac> elements is set as \textenglish{};
  the range of letters specified in the regex might need adaption. -->

  <xsl:template match="syriac">
    <xsl:text> \textsyriac{</xsl:text><xsl:value-of select="replace(.,'_([A-z]*)','\\textenglish{$1}')"/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- Arabic -->
  <!-- \textup ensures non-Latin text not to be in italics -->

  <xsl:template match="arabic">
    <xsl:text> \textup{\textarabic{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>

  <!-- Hebrew -->
  <!-- \textup ensures non-Latin text not to be in italics -->

  <xsl:template match="hebrew">
    <xsl:text> \textup{\texthebrew{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>

  <!-- Geez -->
  <!-- \textup ensures non-Latin text not to be in italics -->

  <xsl:template match="geez">
    <xsl:text> \textup{\textamharic{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>

  <!-- Greek -->
  <!-- \textup ensures non-Latin text not to be in italics -->

  <xsl:template match="greek">
    <xsl:text> \textup{\textgreek{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
  </xsl:template>

  <!-- RTL -->
  <!-- The tex command \RLE ensures rtl direction. -->

  <xsl:template match="rtl">
    <xsl:text>\RLE{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- italics -->

  <xsl:template match="italics">
    <xsl:text>\textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- subscript -->
  <!-- The conditional ensures subscript to be in italics if surrounded by italic text. -->

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
  <!-- The conditional ensures subscript to be in italics if surrounded by italic text. -->

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

</xsl:stylesheet>
