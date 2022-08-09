<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:template match="
    (simtho-sense-created-by|
    simtho-ex-created-by)
    /abbreviation
    ">
    <xsl:text> \textcolor{Dandelion}{(</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)}</xsl:text>
  </xsl:template>

  <xsl:template match="simtho-contributor/abbreviation">
    <xsl:text>

    \textcolor{Dandelion}{</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}</xsl:text>

  </xsl:template>


  <xsl:template match="
    datecreated|
    datemodified
    "/>
  <!--
    <xsl:text>

    \begin{scriptsize}\textcolor{Dandelion}{(entry created: </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>

  <xsl:template match="entry/datemodified">
    <xsl:text> \begin{scriptsize}\textcolor{Dandelion}{(entry modified: </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>

  <xsl:template match="subentry/datecreated">
    <xsl:text>

    \begin{scriptsize}\textcolor{Dandelion}{(subentry created: </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>

  <xsl:template match="subentry/datemodified">
    <xsl:text> \begin{scriptsize}\textcolor{Dandelion}{(subentry modified: </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)}\end{scriptsize}</xsl:text>
  </xsl:template>
  -->

</xsl:stylesheet>
