<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="sidebar-title">

    <xsl:variable name="lemma">
      <xsl:value-of select="parent::entry/mainheadword/syriac/rtl/text()"/>
    </xsl:variable>

    <xsl:text>

    \begin{sidebar}[]
    \begin{center}
    \begin{footnotesize}
    \textsc{
    \textbf{
    \textcolor{BrickRed}{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text> \textsyriac{</xsl:text>
      <xsl:value-of select="$lemma"/>
    <xsl:text>}}}}
    \end{footnotesize}
    \end{center}</xsl:text>
  </xsl:template>

  <xsl:template match="sidebar-text">
    <xsl:text>

    \noindent{}\begin{footnotesize}</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>\end{footnotesize}\end{sidebar}</xsl:text>
  </xsl:template>

  <xsl:template match="sidebar-text/text()">
    <!-- The square bullet is replaced. -->
    <xsl:value-of select="replace(current(), '▪', '\\textbullet{}')"/>
  </xsl:template>

</xsl:stylesheet>
