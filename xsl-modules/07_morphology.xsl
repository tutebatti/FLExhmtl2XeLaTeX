<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="morphology">
    <xsl:text>

    MORPHO </xsl:text><xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="compmorphperf">
    <xsl:text>perf. f. </xsl:text><xsl:apply-templates/><xsl:text>, </xsl:text>
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

</xsl:stylesheet>
