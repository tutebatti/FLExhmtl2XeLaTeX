<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="2.0"
    >

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    <xsl:variable name="apo">'</xsl:variable> <!-- needed to use single quotation mark in filters etc. -->

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*[not(xml:space) and not(xhtml:class)]"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/xhtml:html">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <xsl:template match="xhtml:body">
        <xsl:element name="entries">
          <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:head"/>

    <xsl:template match="xhtml:div[@class='letHead']">
        <xsl:element name="letterHead">
          <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:div[@class='entry']|xhtml:div[@class='minorentrycomplex']">
        <xsl:element name="{@class}">
            <xsl:attribute name="id">
                <xsl:value-of select="./@id"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()|@*[id]"/> <!-- check why "id" is needed to avoid copying of @class attribute -->
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:span[
                @class='mainheadword' or
                @class='headword' or
                @class='sedra-id' or
                @class='minimallexreferences_root' or
                @class='minimallexreference_root' or
                @class='gender-inflection' or
                @class='variantformentrybackrefs' or
                @class='variantentrytypes' or
                @class='variantentrytype' or
                @class='abbreviation' or
                @class='variantformentrybackref' or
                @class='pronunciations' or
                @class='pronunciation' or
                @class='cvpattern' or
                @class='location' or
                @class='tone' or
                @class='transliteration' or
                @class='phono-received-pronunciation' or
                @class='orth-estrangela' or
                @class='orth-serto' or
                @class='orth-madnḥaya' or
                @class='dots-sublinear' or
                @class='dots-sublinear-label' or
                @class='dots-supralinear' or
                @class='dots-supralinear-label' or
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
                @class='compmorphperf' or
                @class='compmorphimpf' or
                @class='compmorphactpartm' or
                @class='compmorphpasspart' or
                @class='compmorphinf' or
                @class='compmorphtable' or
                @class='senses' or
                @class='sensetype' or
                @class='sensecontent' or
                @class='sensenumber' or
                @class='sense' or
                @class='lexsensereferences' or
                @class='lexsensereference' or
                @class='definitionorgloss' or
                @class='source' or
                @class='simtho-sense-created-by' or
                @class='simtho-period' or
                @class='simtho-reference-century' or
                @class='simtho-reference-author' or
                @class='reference' or
                @class='simtho-reference-page' or
                @class='simtho-ex-created-by' or
                @class='restrictions' or
                @class='subentries_verbal-stems-measures' or
                @class='subentry_verbal-stems-measures' or
                @class='examplescontents' or
                @class='examplescontent' or
                @class='example' or
                @class='pictures' or
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
            <xsl:if test="@entryguid">
                <xsl:attribute name="entryguid">
                    <xsl:value-of select="./@entryguid"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:div[@class='picture' or @class='captionContent']">
        <xsl:element name="{@class}">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:span[contains(@class, 'subentries ')]">
        <xsl:element name="subentries">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:span[contains(@class, 'subentry ')]">
        <xsl:element name="subentry">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <!-- rtl -->

    <xsl:template match="xhtml:span[@dir='rtl' and not(@class='letter' or @style)]">
        <xsl:element name="rtl">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
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
                <xsl:element name="highlightedsyriac">
                    <xsl:apply-templates select="node()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="syriac">
                    <xsl:apply-templates select="node()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- handle homograph entry numbering [is that a good term for this?] -->

    <xsl:template match="xhtml:span[@style='font-size:10pt;font-weight:bold;font-size:58%;position:relative;top:0.3em;']">
        <xsl:element name="homographentrynumber">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <!-- sense numbering in lexsensereferences -->

    <xsl:template match="xhtml:span[@style='font-size:9pt;font-weight:normal;']">
        <xsl:element name="lexsensereference_sensenumber">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <!-- Arabic -->

    <xsl:template match="xhtml:span[@style=concat('font-family:',$apo,'Amiri',$apo,',serif;font-size:10pt;')]">
        <xsl:element name="arabic">
            <xsl:apply-templates/>
        </xsl:element>
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

    <xsl:template match="xhtml:span[@class='gloss']/xhtml:span[not(@style='font-style:italic;')]">
        <xsl:variable name="number-of-children">
            <xsl:value-of select="count(./xhtml:span)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="./xhtml:span[1]/text() = 'id.'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="$number-of-children > 1">
                <xsl:for-each select="tokenize(.,'; ')">
                    <xsl:element name='etymology-gloss-stem'>
                        <xsl:value-of select="normalize-space()"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- superscript -->

    <xsl:template match="xhtml:span[@style='font-size:58%;position:relative;top:-0.6em;']">
        <xsl:element name="superscript"><xsl:apply-templates/></xsl:element>
    </xsl:template>

    <!-- subscript -->

    <xsl:template match="xhtml:span[@style='font-size:58%;position:relative;top:0.3em;']">
        <xsl:element name="subscript"><xsl:apply-templates/></xsl:element>
    </xsl:template>

    <!-- italics -->

    <xsl:template match="xhtml:span[@style='font-style:italic;']">
        <xsl:element name="italics"><xsl:apply-templates/></xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:span">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <!-- internal references -->

    <xsl:template match="xhtml:a">
        <xsl:attribute name="intref">
            <xsl:value-of select="@href"/>
        </xsl:attribute>
        <xsl:apply-templates select="node()"/>
    </xsl:template>

</xsl:stylesheet>
