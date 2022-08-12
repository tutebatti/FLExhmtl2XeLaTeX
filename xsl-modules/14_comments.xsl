<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="comment">
    <xsl:choose>
      <xsl:when test="$showcomments = true()">
        <xsl:text>

        \begin{scriptsize}\textcolor{red}{NOTE TO EDITOR: </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>)}\end{scriptsize}</xsl:text>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
