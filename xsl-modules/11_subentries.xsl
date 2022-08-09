<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="
    subentry|
    subentry_verbal-stems-measures
    ">
    <xsl:text>

    %%%%%%%%%%%
    %%%subentry
    %%%%%%%%%%%

    \medskip{}
    </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="
    (subentry|
    subentry_verbal-stems-measures)
    /headword">
    <xsl:text>\begin{Large}</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>\end{Large}</xsl:text>
  </xsl:template>

  <xsl:template match="
    complexformtype/abbreviation|
    reverseabbr|
    referencedentry
    ">
    <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

</xsl:stylesheet>
