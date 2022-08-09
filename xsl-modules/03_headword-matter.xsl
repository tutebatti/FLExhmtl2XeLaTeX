<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- entry -->

  <xsl:template match="
    entry|
    minorentrycomplex
    ">
    <xsl:text>

    %%%%%%%%%%%%%%
    %%% New entry
    %%%%%%%%%%%%%%

    </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <!-- headword -->

  <xsl:template match="mainheadword|minorentrycomplex/headword">
    <xsl:text>\hypertarget{</xsl:text>
      <xsl:value-of select="ancestor::entry/@id"/>
      <xsl:value-of select="ancestor::minorentrycomplex/@id"/>
    <xsl:text>}{}

    \bigskip{}\begin{huge}</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>\end{huge}</xsl:text>
  </xsl:template>

  <!-- Sedra ID -->

  <!-- Sedra ID is read as global variable to be available throughout-->
  <xsl:variable name="sedraid">
    <xsl:value-of select="//sedra-id"/>
  </xsl:variable>

  <!-- link to Sedra is generated -->
  <xsl:template match="sedra-id">
    <xsl:text> [\href{https://sedra.bethmardutho.org/lexeme/get/</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>}{Sedra-ID </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>}]</xsl:text>
  </xsl:template>

  <!-- Homograph entry numbering -->

  <xsl:template match="homographentrynumber">
    <xsl:text>\begin{large}\textsubscript{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>}\end{large}</xsl:text>
  </xsl:template>

  <!-- gender inflection -->

  <xsl:template match="gender-inflection">
    <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>.</xsl:text>
  </xsl:template>

  <!-- originform as "Note to Etymologist" -->

  <xsl:template match="originform">
    <xsl:text> \hl{NOTE TO ETYM EDITOR:} </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <!-- Variant entries -->

  <xsl:template match="variantformentrybackrefs">
    <xsl:text> (</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="variantentrytypes">
    <xsl:choose>

      <xsl:when test="position() = 1"> <!-- First variant entry has no leading space. -->
        <xsl:text></xsl:text>
          <xsl:apply-templates/>
        <xsl:text></xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <xsl:text> </xsl:text>
          <xsl:apply-templates/>
        <xsl:text></xsl:text>
      </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

  <xsl:template match="variantformentrybackref">

    <xsl:variable name="nextelement"> <!-- Local variable is generated to check the next element. -->
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>

    <xsl:choose> <!-- Depending on the next element and position, comma, semicolon, or nothing is set as trailing character -->

      <xsl:when test="$nextelement = 'variantentrytypes'">
        <xsl:text> </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>,</xsl:text>
      </xsl:when>

      <xsl:when test="$nextelement = 'variantformentrybackref'">
        <xsl:text> </xsl:text>
          <xsl:apply-templates/>
        <xsl:text>;</xsl:text>
      </xsl:when>

      <xsl:when test="position() = last()">
        <xsl:text> </xsl:text>
          <xsl:apply-templates/>
        <xsl:text></xsl:text>
      </xsl:when>

    </xsl:choose>
  </xsl:template>

  <!-- Minor entries -->

  <xsl:template match="entry/minorentrycomplex">
    <xsl:text>

    </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <!-- Root reference -->

  <xsl:template match="minimallexreference_root">
    <xsl:text> √(</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <!-- Aramaic references -->

  <xsl:template match="minimallexreference_aramaic">
    <xsl:text> Cf. Simtho Etym Related Lexemes: </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="minimallexreference_aramaic/ownertype_name"/>

</xsl:stylesheet>
