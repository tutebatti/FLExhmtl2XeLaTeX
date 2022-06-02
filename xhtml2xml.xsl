<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"
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
  @class='sensecontent' or 
  @class='sensenumber' or 
  @class='sense' or 
  @class='definitionorgloss' or 
  @class='examplescontents' or 
  @class='examplescontent' or 
  @class='example' or 
  @class='translationcontents' or 
  @class='translationcontent' or 
  @class='subentries' or 
  @class='subentry' or 
  @class='complexformtypes' or 
  @class='complexformtype'
  ]">
    <xsl:element name="{@class}"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <!-- Syriac -->
   
  <xsl:template match="xhtml:span[@lang='syc-Syrj']">
    <!-- 1) omit nested Syriac: ancestor::span[@lang='syc-Syrj'] and -->
    <!-- 2) omit Arabic, Hebrew, and Geez -->
      <xsl:if test="

      not(@style=concat('font-family:',$apo,'Amiri',$apo,',serif;font-size:10pt;'))
      and not(@style=concat('font-family:',$apo,'SBL Hebrew',$apo,',serif;font-size:10pt;'))
      and not(@style=concat('font-family:',$apo,'Abyssinica SIL',$apo,',serif;font-size:10pt;'))
      ">
        <xsl:element name="syriac"><xsl:apply-templates/></xsl:element>
      </xsl:if>
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

</xsl:stylesheet>
