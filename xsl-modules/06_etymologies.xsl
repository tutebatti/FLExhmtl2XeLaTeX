<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="etymaramaic">
    <xsl:if test="node()">
      <xsl:text>

      \smallskip
      \textbf{Aramaic etymologies}</xsl:text>
        <xsl:apply-templates/>
      <xsl:text></xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="etymsemitic">
    <xsl:if test="node()">
      <xsl:text>

      \smallskip
      \textbf{Semitic etymologies}</xsl:text>
        <xsl:apply-templates/>
      <xsl:text></xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="etymgreek">
    <xsl:if test="node()">
      <xsl:text>

      \smallskip
      \textbf{Greek etymology}</xsl:text>
        <xsl:apply-templates/>
      <xsl:text></xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="
    etymaramaicbefore|
    etymaramaicafter|
    etymsemiticbefore|
    etymsemiticafter
    ">
    <xsl:text>

    \begin{footnotesize}</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>\end{footnotesize}</xsl:text>
  </xsl:template>

  <xsl:template match="etymologies">
    <xsl:text>

    </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="etymology">

    <!-- Local variable is generated to check the preceding element. -->
    <xsl:variable name="precedingelement">
      <xsl:value-of select="(preceding-sibling::*[1])/name()"/>
    </xsl:variable>

    <!-- Local variable is generated to check the next element. -->
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>

    <!-- Depending on the preceding/next element, a line break and separators are set. -->
    <xsl:choose>

      <xsl:when test="
        position() = 1 or
        $precedingelement = 'etymaramaicbefore' or
        $precedingelement = 'etymsemiticbefore'
      ">
        <xsl:text>

        </xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <xsl:text> </xsl:text>
      </xsl:otherwise>

    </xsl:choose>
      <xsl:apply-templates/>
    <xsl:choose>

      <xsl:when test="
      $nextelement = 'etymology'
      ">
        <xsl:text>~| </xsl:text>
      </xsl:when>

      <xsl:otherwise/>

    </xsl:choose>
  </xsl:template>

  <xsl:template match="etymology//language">

    <!-- Local variable is generated to check the next element. -->
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>

    <!-- Depending on the next element, a comma is set as trailing character. -->
    <xsl:choose>

      <xsl:when test="$nextelement = 'language'">
        <xsl:text>\textbf{</xsl:text>
          <xsl:apply-templates/>
        <xsl:text>}, </xsl:text>
      </xsl:when>

      <xsl:when test="descendant::abbreviation = '&lt;SEM&gt;'"/>

      <xsl:otherwise>
        <xsl:text>\textbf{</xsl:text>
          <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

  <xsl:template match="form">
    <xsl:choose>

      <xsl:when test="./(
      arabic|
      hebrew|
      geez|
      greek
      )">
        <xsl:text> </xsl:text>
          <xsl:apply-templates select="(arabic | hebrew | geez | greek)"/>
        <xsl:text> \textit{</xsl:text>
          <xsl:apply-templates select="text()"/>
        <xsl:text>}</xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <!-- Interpunctuation is set in upright case. -->
        <xsl:text> \textit{</xsl:text>
          <xsl:value-of select="replace(.,'([,()])','\\textup{$1}')"/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

  <xsl:template match="gloss">
    <!-- Glosses (mainly of verbs) with multiple stems are handled. -->
    <xsl:choose>

            <xsl:when test="./stemglosspair">
                <xsl:apply-templates/>
            </xsl:when>

            <xsl:otherwise>
                <xsl:text> `</xsl:text>
                  <xsl:apply-templates/>
                <xsl:text>'</xsl:text>
            </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair/stem">

    <!-- Local variable is generated to check the next element. -->
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>

    <xsl:choose>

            <xsl:when test="$nextelement = 'stem'">
                <xsl:text> \textbf{</xsl:text>
                  <xsl:apply-templates/>
                <xsl:text>},</xsl:text>
            </xsl:when>

            <xsl:otherwise>
                <xsl:text> \textbf{</xsl:text>
                  <xsl:apply-templates/>
                <xsl:text>}</xsl:text>
            </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair/gloss">
    <xsl:text> `</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>' </xsl:text>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair/pseudo-gloss">
    <xsl:text> \textit{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>} </xsl:text>
  </xsl:template>

  <xsl:template match="gloss/stemglosspair//pseudo-gloss-stem">
    <xsl:text> \textup{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>} </xsl:text>
  </xsl:template>

  <xsl:template match="bibliography">
    <!-- Number sign is masked for LaTeX. -->
    <xsl:text> [</xsl:text>
      <xsl:value-of select="replace(current(), '#', '\\#')"/>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="preccomment">
    <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

    <xsl:template match="languagenotes">
      <xsl:text> (</xsl:text>
        <xsl:apply-templates/>
      <xsl:text>)</xsl:text>
    </xsl:template>

  <xsl:template match="etymology/comment">
    <xsl:text> &gt;\textit{</xsl:text>
      <xsl:apply-templates/>}
    <xsl:text></xsl:text>
  </xsl:template>

</xsl:stylesheet>
