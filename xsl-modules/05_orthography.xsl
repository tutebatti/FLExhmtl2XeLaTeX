<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="orthography">
    <xsl:text>

    ORTHO </xsl:text><xsl:apply-templates/>
  </xsl:template>
    
  <xsl:template match="orth-estrangela">
    <xsl:text>Est. {\estrangelafont </xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="orth-serto">
    <xsl:text> Ser. \textsyriac{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="orth-madnḥaya">
    <xsl:text> Mad. {\madnhayafont </xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
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

</xsl:stylesheet>
