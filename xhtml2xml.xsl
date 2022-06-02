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
  @class='variantformentrybackrefs' or
  @class='variantentrytypes' or
  @class='variantentrytype' or
  @class='abbreviation' or
  @class='variantformentrybackref' or
  @class='etymologies' or
  @class='etymology' or
  @class='preccomment' or
  @class='languages' or
  @class='language' or
  @class='form' or
  @class='gloss' or
  @class='sharedgrammaticalinfo' or
  @class='morphosyntaxanalysis' or
  @class='partofspeech' or
  @class='sensecontent' or
  @class='sensenumber' or
  @class='sense' or
  @class='definitionorgloss' or
  @class='examplescontents' or
  @class='examplescontent' or
  @class='example' or
  @class='translationcontents' or
  @class='translationcontent' or
  @class='complexformtypes' or
  @class='complexformtype'
  ]">
    <xsl:element name="{@class}"><xsl:apply-templates/></xsl:element>
  </xsl:template>
  
  <xsl:template match="xhtml:span[contains(@class, 'subentries')]">
    <xsl:element name="subentries"><xsl:apply-templates/></xsl:element>
  </xsl:template>
  
  <xsl:template match="xhtml:span[contains(@class, 'subentry')]">
    <xsl:element name="subentry"><xsl:apply-templates/></xsl:element>
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
  
  <!-- handle multiple verb stems of etymology entries -->
  
  <xsl:template match="xhtml:span[@class='gloss']//xhtml:span">
    <xsl:choose>
      <xsl:when test="@style='color:#F0F;'">
        <xsl:element name="etymologyglossverbstem"><xsl:apply-templates/></xsl:element>
      </xsl:when>
      <xsl:otherwise> 
        <xsl:element name="etymologyglossverbstemgloss"><xsl:apply-templates/></xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
