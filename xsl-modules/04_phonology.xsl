<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="transliteration">
    <xsl:text>

    PHONO /</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>/</xsl:text>
  </xsl:template>

  <xsl:template match="phono-received-pronunciation">
    <xsl:text> (</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

</xsl:stylesheet>
