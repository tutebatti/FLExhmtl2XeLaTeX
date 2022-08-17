<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- Simtho tokens per million (tkm) -->

  <xsl:template match = "simtho-tkm">
    <xsl:text>

    Simtho-TKM: </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

</xsl:stylesheet>
