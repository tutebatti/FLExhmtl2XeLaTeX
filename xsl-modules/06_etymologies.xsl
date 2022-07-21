<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="etymaramaicbefore">
    <xsl:text>

    \smallskip
    \textbf{Aramaic etymologies}

    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>

  <xsl:template match="etymsemiticbefore">
    <xsl:text>

    \smallskip
    \textbf{Semitic etymologies}

    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>

  <xsl:template match="etymaramaicafter">
    <xsl:text>

    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>

  <xsl:template match="etymsemiticafter">
    <xsl:text>

    \noindent{}\begin{footnotesize}</xsl:text><xsl:apply-templates/><xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>

  <xsl:template match="etymologies">
    <xsl:text>

    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="etymology">
    <xsl:variable name="precedingelement">
      <xsl:value-of select="(preceding-sibling::*[1])/name()"/>
    </xsl:variable>
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$precedingelement = 'etymaramaicbefore' or $precedingelement = 'etymsemiticbefore'">
        <xsl:text>

        \noindent{}</xsl:text><xsl:apply-templates/><xsl:text> | </xsl:text>
      </xsl:when>
      <xsl:when test="$nextelement = 'etymaramaicafter' or $nextelement = 'etymsemiticafter'">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text> | </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="etymology//language">
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$nextelement = 'language'">
        <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>}, </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="form">
    <xsl:choose>
      <xsl:when test="./(
      arabic |
      hebrew |
      geez |
      greek
      )">
        <xsl:text></xsl:text>
        <xsl:apply-templates select="(arabic | hebrew | geez | greek)"/>
	<xsl:text> \textit{</xsl:text>
        <xsl:apply-templates select="text()"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> \textit{</xsl:text><xsl:value-of select="replace(.,'([,()])','\\textup{$1}')"/><xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gloss">
    <xsl:choose>
            <xsl:when test="./stemglosspair">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> `</xsl:text><xsl:apply-templates/><xsl:text>'</xsl:text>
            </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair/stem">
    <xsl:text> \textbf{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair/gloss">
    <xsl:text> `</xsl:text><xsl:apply-templates/><xsl:text>' </xsl:text>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair/pseudo-gloss">
    <xsl:text> \textit{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair//pseudo-gloss-stem">
    <xsl:text> \textup{</xsl:text><xsl:apply-templates/><xsl:text>} </xsl:text>
  </xsl:template>

  <xsl:template match="bibliography">
    <xsl:text> [</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="preccomment">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

</xsl:stylesheet>
