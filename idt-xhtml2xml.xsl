<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="1.0"
    >

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    <xsl:variable name="apo">'</xsl:variable> <!-- needed to use single quotation mark in filters etc. -->

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="xhtml:div[@class='letHead']"/>

    <xsl:template match="xhtml:div[@class='entry']">
        <xsl:element name="{@class}">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
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
  @class='senses' or
  @class='sensecontent' or
  @class='sensenumber' or
  @class='sense' or
  @class='lexsensereferences' or
  @class='lexsensereference' or
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
        <xsl:element name="{@class}">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
    

</xsl:stylesheet>
