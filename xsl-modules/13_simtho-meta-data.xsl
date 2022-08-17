<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- simtho sense created by -->

  <xsl:template match="simtho-sense-created-by/abbreviation">
    <xsl:choose>

      <xsl:when test="$showcreators = true()">
        <xsl:choose>

          <xsl:when test="$compactlayout = true()">
            <xsl:text> \textcolor{Dandelion}{(sense © by </xsl:text>
              <xsl:apply-templates/>
            <xsl:text>)}</xsl:text>
          </xsl:when>

          <xsl:otherwise>
            <xsl:text>

            \textcolor{Dandelion}{Sense © by </xsl:text>
              <xsl:apply-templates/>
            <xsl:text>.}</xsl:text>
          </xsl:otherwise>

        </xsl:choose>
      </xsl:when>

      <xsl:otherwise/>

    </xsl:choose>
  </xsl:template>

  <!-- simtho ex created by -->

  <xsl:template match="simtho-ex-created-by/abbreviation">
    <xsl:choose>

      <xsl:when test="$showcreators = true()">
        <xsl:choose>

          <xsl:when test="$compactlayout = true()">
            <xsl:text>\textcolor{Dandelion}{(example © by </xsl:text>
              <xsl:apply-templates/>
            <xsl:text>)}</xsl:text>
          </xsl:when>

          <xsl:otherwise>
            <xsl:text>

            \textcolor{Dandelion}{Example © by </xsl:text>
              <xsl:apply-templates/>
            <xsl:text>.}</xsl:text>
          </xsl:otherwise>

        </xsl:choose>
      </xsl:when>

      <xsl:otherwise/>

    </xsl:choose>
  </xsl:template>

  <!-- simtho contributors -->

  <xsl:template match="simtho-contributors">
    <xsl:choose>

      <xsl:when test="$showcreators = true()">
        <xsl:choose>

          <xsl:when test="$compactlayout = true()">
            <xsl:text> \textcolor{Dandelion}{(</xsl:text>
              <xsl:apply-templates/>
            <xsl:text>)}</xsl:text>
          </xsl:when>

          <xsl:otherwise>
            <xsl:apply-templates/>
          </xsl:otherwise>

        </xsl:choose>
      </xsl:when>

      <xsl:otherwise/>

    </xsl:choose>

  </xsl:template>

  <!-- simtho contributor -->

  <xsl:template match="simtho-contributor/abbreviation">
    <xsl:choose>

      <xsl:when test="$showcreators = true()">
        <xsl:choose>

          <xsl:when test="$compactlayout = true()">
            <xsl:text>\textcolor{Dandelion}{</xsl:text>
              <xsl:variable name="replacedparenthesis">
                <xsl:value-of select="replace(.,' [(]',', ')"/>
              </xsl:variable>
              <xsl:value-of select="replace($replacedparenthesis,'[)]','')"/>

              <xsl:if test="count(../following-sibling::simtho-contributor) != 0">
                <xsl:text>; </xsl:text>
              </xsl:if>

            <xsl:text>}</xsl:text>
          </xsl:when>

          <xsl:otherwise>
            <xsl:text>

            \textcolor{Dandelion}{</xsl:text>
              <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:otherwise>

        </xsl:choose>

      </xsl:when>

      <xsl:otherwise/>

    </xsl:choose>

  </xsl:template>

  <!-- dates -->

  <xsl:template match="datecreated">
    <xsl:choose>
      <xsl:when test="$showdates = true()">
        <xsl:text>

        \begin{scriptsize}\textcolor{Dandelion}{(entry created: </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>)}\end{scriptsize}</xsl:text>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="
    (entry|
    minorentrycomplex)
    /datecreated">
    <xsl:choose>
      <xsl:when test="$showdates = true()">
        <xsl:text>

        \begin{scriptsize}\textcolor{YellowGreen}{(entry created: </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>)}\end{scriptsize}</xsl:text>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

    <xsl:template match="
    (entry|
    minorentrycomplex)
    /datemodified">
    <xsl:choose>
      <xsl:when test="$showdates = true()">
        <xsl:text>\begin{scriptsize}\textcolor{YellowGreen}{, (entry modified: </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>)}\end{scriptsize}</xsl:text>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="(subentry|subentry_verbal-stems-measures)/datecreated">
    <xsl:choose>
      <xsl:when test="$showdates = true()">
        <xsl:text>

        \begin{scriptsize}\textcolor{YellowGreen}{(subentry created: </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>)}\end{scriptsize}</xsl:text>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="(subentry|subentry_verbal-stems-measures)/datemodified">
    <xsl:choose>
      <xsl:when test="$showdates = true()">
        <xsl:text>\begin{scriptsize}\textcolor{YellowGreen}{, (subentry modified: </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>)}\end{scriptsize}</xsl:text>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
