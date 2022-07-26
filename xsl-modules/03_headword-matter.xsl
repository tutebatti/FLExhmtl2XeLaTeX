<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- main headword -->

  <xsl:template match="mainheadword|minorentrycomplex/headword">
    <xsl:text>
    %%%%%%%%%%%%%%
    %%% New entry
    %%%%%%%%%%%%%%

    \bigskip{}
    \noindent \begin{huge}</xsl:text><xsl:apply-templates/><xsl:text>\end{huge}</xsl:text>
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
    <xsl:text>\begin{large}\textsubscript{</xsl:text><xsl:apply-templates/><xsl:text>}\end{large}</xsl:text>
  </xsl:template>

  <!-- gender inflection -->

  <xsl:template match="gender-inflection">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>.</xsl:text>
  </xsl:template>

  <!-- Greek equivalence -->

  <xsl:template match="entry/greek">
    <xsl:text> \textgreek{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- Variant entries -->

  <xsl:template match="variantformentrybackrefs">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="variantentrytypes">
    <xsl:choose>
      <xsl:when test="position() = 1"> <!-- First variant entry has no leading space. -->
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="variantformentrybackref">
    <xsl:variable name="nextelement"> <!-- Local variable is generated to check the next element. -->
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>

    <xsl:choose> <!-- Depending on the next element and position, comma, semicolon, or nothing is set as trailing character -->
      <xsl:when test="$nextelement = 'variantentrytypes'">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>,</xsl:text>
      </xsl:when>
      <xsl:when test="$nextelement = 'variantformentrybackref'">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>;</xsl:text>
      </xsl:when>
      <xsl:when test="position() = last()">
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- Minor entries -->

  <xsl:template match="entry/minorentrycomplex">
    <xsl:text>

    </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

  <!-- Root reference -->

  <xsl:template match="minimallexreference_root">
    <xsl:text> √(</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>

  <!-- Part-of-speech -->
  <!-- This seems to come later, but belongs logically to the headword (?). -->

  <xsl:template match="partofspeech">
    <xsl:text>~\textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- ########### -->
  <!-- Phonology? -->
  <!-- ########### -->

  <xsl:template match="pronunciations">
    <xsl:text>

    +TEMP+ </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

</xsl:stylesheet>
