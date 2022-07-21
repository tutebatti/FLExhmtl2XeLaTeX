<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="pictures">
    <xsl:text>

    \begin{center}
    \begin{figure}[h]
    \centering
    \includegraphics[width=0.7\columnwidth]{../pictures/</xsl:text><xsl:value-of select='$sedraid'/><xsl:text>.png}
    \caption{
    \begin{tiny}</xsl:text>
    <xsl:apply-templates select=".//caption"/>
    <xsl:text>
    \end{tiny}}
    \end{figure}
    \end{center}</xsl:text>
  </xsl:template>

</xsl:stylesheet>
