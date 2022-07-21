<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

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

</xsl:stylesheet>
