<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="1.0"
    >

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:strip-space elements="*"/>
  <xsl:variable name="apo">'</xsl:variable> <!-- needed to use single quotation mark in filters etc. -->

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="xhtml:div[
  @class='letHead'
  ]"/>

  <xsl:template match="xhtml:div[
  @class='entry'
  ]">
    <xsl:element name="{@class}"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <xsl:template match="xhtml:span[
  @class='mainheadword' or
  @class='headword' or
  @class='sedra-id' or
  @class='gender-inflection' or
  @class='variantformentrybackrefs' or
  @class='variantentrytypes' or
  @class='variantentrytype' or
  @class='abbreviation' or
  @class='variantformentrybackref' or
  @class='etymaramaicbefore' or
  @class='etymsemiticbefore' or
  @class='etymaramaicafter' or
  @class='etymsemiticafter' or
  @class='etymologies' or
  @class='etymology' or
  @class='preccomment' or
  @class='languages' or
  @class='language' or
  @class='form' or
  @class='comment' or
  @class='gloss' or
  @class='languagenotes' or
  @class='bibliography' or
  @class='sharedgrammaticalinfo' or
  @class='morphosyntaxanalysis' or
  @class='partofspeech' or
  @class='sensecontent' or
  @class='sensenumber' or
  @class='sense' or
  @class='definitionorgloss' or
  @class='simtho-sense-created-by' or
  @class='simtho-period' or
  @class='simtho-reference-century' or
  @class='simtho-reference-page' or
  @class='simtho-ex-created-by' or
  @class='restrictions' or
  @class='subentries_verbal-stems-measures' or
  @class='subentry_verbal-stems-measures' or
  @class='examplescontents' or
  @class='examplescontent' or
  @class='example' or
  @class='pictures' or
  @class='picture' or
  @class='captionContent' or
  @class='caption' or
  @class='sidebar-title' or
  @class='sidebar-text' or
  @class='translationcontents' or
  @class='translationcontent' or
  @class='complexformtypes' or
  @class='complexformtype' or
  @class='minimallexreferences' or
  @class='minimallexreference' or
  @class='minimallexreferences_derivatives-adjs-etc-' or
  @class='minimallexreference_derivatives-adjs-etc-' or
  @class='ownertype_name' or
  @class='ownertype_abbreviation' or
  @class='configtargets' or
  @class='configtarget' or
  @class='primaryentryrefs' or
  @class='primaryentryref' or
  @class='entrytypes' or
  @class='entrytype' or
  @class='reverseabbr' or
  @class='referencedentries' or
  @class='referencedentry' or
  @class='datecreated' or
  @class='datemodified' or
  @class='simtho-contributors' or
  @class='simtho-contributor'
  ]">
    <xsl:element name="{@class}"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <xsl:template match="xhtml:span[contains(@class, 'subentries ')]">
    <xsl:element name="subentries"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <xsl:template match="xhtml:span[contains(@class, 'subentry ')]">
    <xsl:element name="subentry"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- rtl -->

  <xsl:template match="xhtml:span[@dir='rtl' and not(@class='letter' or @style)]">
    <xsl:element name="rtl"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- Syriac -->

  <!-- 1) omit nested Syriac -->
  <!-- 2) omit homograph entry numbering -->
  <!-- 3) omit Arabic, Hebrew, and Geez -->

  <xsl:template match="xhtml:span[@lang='syc-Syrj' and
  not(descendant::xhtml:span[@lang='syc-Syrj']) and
  not(@style='font-size:10pt;font-weight:bold;font-size:58%;position:relative;top:0.3em;') and
  not(descendant::xhtml:span[@style=concat('font-family:',$apo,'Amiri',$apo,',serif;font-size:10pt;')]) and
  not(descendant::xhtml:span[@style=concat('font-family:',$apo,'SBL Hebrew',$apo,',serif;font-size:10pt;')]) and
  not(descendant::xhtml:span[@style=concat('font-family:',$apo,'Abyssinica SIL',$apo,',serif;font-size:10pt;')])
  ]">
    <xsl:choose>
      <xsl:when test="@style='background-color:#CFC;'">
        <xsl:element name="highlightedsyriac"><xsl:apply-templates/></xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="syriac"><xsl:apply-templates/></xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- handle homograph entry numbering [is that a good term for this?] -->

  <xsl:template match="xhtml:span[@style='font-size:10pt;font-weight:bold;font-size:58%;position:relative;top:0.3em;']">
    <xsl:element name="homographentrynumber"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- Arabic -->

  <xsl:template match="xhtml:span[@style=concat('font-family:',$apo,'Amiri',$apo,',serif;font-size:10pt;')]">
    <xsl:element name="arabic"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- Hebrew -->

  <xsl:template match="xhtml:span[@style=concat('font-family:',$apo,'SBL Hebrew',$apo,',serif;font-size:10pt;')]">
    <xsl:element name="hebrew"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- Geez -->

  <xsl:template match="xhtml:span[@style=concat('font-family:',$apo,'Abyssinica SIL',$apo,',serif;font-size:10pt;')]">
    <xsl:element name="geez"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- Greek -->

  <xsl:template match="xhtml:span[@style=concat('font-family:',$apo,'SBL Greek',$apo,',serif;')]">
    <xsl:element name="greek"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- handle multiple verb stems of etymology entries -->

  <xsl:template match="xhtml:span[@class='gloss']//xhtml:span">
    <xsl:choose>
      <xsl:when test="@style='color:#F0F;'">
        <xsl:element name="etymology-gloss_verbstem"><xsl:apply-templates/></xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="etymology-gloss_gloss"><xsl:apply-templates/></xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- subscript -->
  
  <xsl:template match="xhtml:span[@style='font-size:58%;position:relative;top:0.3em;']">
    <xsl:element name="superscript"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- italics -->

  <xsl:template match="xhtml:span[@style='font-style:italic;']">
    <xsl:element name="italics"><xsl:apply-templates/></xsl:element>
  </xsl:template>
</xsl:stylesheet>
