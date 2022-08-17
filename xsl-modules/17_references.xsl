<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match = "minimallexreferences_derivatives-adjs-etc-">
    <xsl:text>

    </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match = "minimallexreference_derivatives-adjs-etc-/ownertype_name">
    <xsl:text></xsl:text>
      <xsl:apply-templates/>
    <xsl:text>: </xsl:text>
  </xsl:template>

  <!-- minimallexreferences: move to another module? -->

  <xsl:template match = "minimallexreferences">
    <xsl:text> (</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>) </xsl:text>
  </xsl:template>

  <xsl:template match = "minimallexreference/ownertype_abbreviation">
    <xsl:text>\textit{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>} </xsl:text>
  </xsl:template>

</xsl:stylesheet>
