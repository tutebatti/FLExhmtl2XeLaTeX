<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

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

</xsl:stylesheet>
