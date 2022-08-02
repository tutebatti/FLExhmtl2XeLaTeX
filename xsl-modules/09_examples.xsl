<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="examplescontent">
    <!-- $ introduces and ends LaTeX mathmode. -->
    <xsl:text>

    $\triangleright$ </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="simtho-period">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="simtho-reference-century">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="simtho-reference-author">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="reference">
    <!-- Ampersand is masked for LaTeX. -->
    <xsl:text> </xsl:text><xsl:value-of select="replace(current(), '&amp;', '\\&amp;')"/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="examplescontent/abbreviation">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="examplescontent/text()">
    <xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="simtho-reference-page">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="example">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="example/rtl/syriac">
    <xsl:choose>
      <xsl:when test="position() = [1]">
        <xsl:text> \textsyriac{</xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:when test="position() != [1] and position() != last()">
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:when test="position() = last()">
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="example/rtl/highlightedsyriac">

    <!-- Local variables are created to determine characters for connection of letters regarding the highlighted word in the example. -->

    <xsl:variable name="lastcharself">
      <xsl:value-of select="substring(., string-length(.), 1)"/>
    </xsl:variable>

    <xsl:variable name="lastcharpreceding">
      <xsl:value-of select="substring(preceding-sibling::syriac[1], string-length(preceding-sibling::syriac[1]), 1)"/>
    </xsl:variable>

    <xsl:variable name="firstcharfollowing">
      <xsl:value-of select="substring(following-sibling::syriac[1], 1, 1)"/>
    </xsl:variable>

    <xsl:variable name="nonconnectingletters">
      <xsl:value-of select="[ܐܕܗܘܙܨܪܬ ]"/>
    </xsl:variable>

    <!-- Depending on the surrounding characters and position, separation or connection are achieved via ommission or insertion of the Unicode character U200D -->

    <xsl:choose>
      <xsl:when test="position() = [1]">
        <xsl:text>\textsyriac{\textcolor{BrickRed}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:choose>
          <xsl:when test="matches($lastcharself, $nonconnectingletters) or matches($firstcharfollowing, ' ')">
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="position() != [1] and position() != last()">
        <xsl:choose>
          <xsl:when test="matches($lastcharpreceding, $nonconnectingletters)">
            <xsl:text>\textcolor{BrickRed}{</xsl:text>
            <xsl:apply-templates/>
            <xsl:choose>
              <xsl:when test="
              matches($lastcharself, $nonconnectingletters) or
              matches($firstcharfollowing, ' ')
              ">
                <xsl:text>}</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>

          <xsl:when test="not(matches($lastcharpreceding, $nonconnectingletters))">
            <xsl:text>\char"200D{}\textcolor{BrickRed}{\char"200D{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:choose>
              <xsl:when test="
              matches($lastcharself, $nonconnectingletters) or
              matches($firstcharfollowing, ' ')
              ">
                <xsl:text>}</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>\char"200D{}}\char"200D{}</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="position() = last()">
        <xsl:choose>
          <xsl:when test="matches($lastcharpreceding, $nonconnectingletters)">
            <xsl:text>\textcolor{BrickRed}{</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>\char"200D{}\textcolor{BrickRed}{\char"200D{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="translationcontent">
    <xsl:text> \begin{footnotesize}``</xsl:text><xsl:apply-templates/><xsl:text>''\end{footnotesize}</xsl:text>
  </xsl:template>

</xsl:stylesheet>
