<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

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

  <xsl:template match="referencedentry">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

</xsl:stylesheet>
