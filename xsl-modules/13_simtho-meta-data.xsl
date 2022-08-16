<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- simtho sense/ex created by -->

  <xsl:template match="
    (simtho-sense-created-by|
    simtho-ex-created-by)
    /abbreviation
    ">
    <xsl:choose>

      <xsl:when test="$showcreators = true()">
        <xsl:text> \textcolor{Dandelion}{(</xsl:text>
          <xsl:apply-templates/>
        <xsl:text>)}</xsl:text>
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
            <xsl:text> \textcolor{Dandelion}{</xsl:text>
              <xsl:apply-templates/>

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
