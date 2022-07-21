<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- main headword -->

  <xsl:template match="mainheadword">
    <xsl:text>

    \begin{huge}</xsl:text><xsl:apply-templates/><xsl:text>\end{huge}</xsl:text>
  </xsl:template>

  <!-- Sedra ID -->

  <xsl:variable name="sedraid">
    <xsl:value-of select="//sedra-id"/>
  </xsl:variable>

  <xsl:template match="sedra-id">
    <xsl:text> [\href{https://sedra.bethmardutho.org/lexeme/get/</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}{Sedra-ID </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}]</xsl:text>
  </xsl:template>

  <!-- gender inflection -->

  <xsl:template match="gender-inflection">
    <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text>.</xsl:text>
  </xsl:template>

  <!-- Homograph entry numbering -->

  <xsl:template match="homographentrynumber">
    <xsl:text> \textsubscript{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- Variant entries -->

  <xsl:template match="variantformentrybackrefs">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="variantentrytypes">
    <xsl:choose>
      <xsl:when test="position() = 1">
        <xsl:text></xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="variantformentrybackref">
    <xsl:variable name="nextelement">
      <xsl:value-of select="(following-sibling::*[1])/name()"/>
    </xsl:variable>

    <xsl:choose>
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

  <!-- Part-of-speech -->

  <xsl:template match="partofspeech">
    <xsl:text> \textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
  </xsl:template>

  <!-- ########### -->
  <!-- Phonology? -->
  <!-- ########### -->

  <xsl:template match="pronunciations">
    <xsl:text>

    +TEMP+ </xsl:text><xsl:apply-templates/><xsl:text></xsl:text>
  </xsl:template>

</xsl:stylesheet>
