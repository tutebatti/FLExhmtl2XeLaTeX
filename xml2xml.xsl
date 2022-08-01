<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="2.0"
    >

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    <xsl:variable name="apo">'</xsl:variable> <!-- needed to use single quotation mark in filters etc. -->

    <xsl:template match="phono-received-pronunciation">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
        <xsl:element name="orthography">
            <xsl:copy-of select="following-sibling::orth-estrangela"/>
            <xsl:copy-of select="following-sibling::orth-serto"/>
            <xsl:copy-of select="following-sibling::orth-madnḥaya"/>
            <xsl:copy-of select="following-sibling::dots-sublinear"/>
            <xsl:copy-of select="following-sibling::dots-sublinear-label"/>
            <xsl:copy-of select="following-sibling::dots-supralinear"/>
            <xsl:copy-of select="following-sibling::dots-supralinear-label"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="orth-estrangela|orth-serto|orth-madnḥaya|dots-sublinear|dots-sublinear-label|dots-supralinear|dots-supralinear-label"
    />

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@id|@entryguid|@intref"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="etymology">
        <xsl:choose>
            <xsl:when test="position() = [1]">
                <xsl:copy-of select="ancestor::entry//etymaramaicbefore"/>
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>

            <xsl:when test="position() = last()">
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
                <xsl:copy-of select="ancestor::entry//etymsemiticafter"/>
            </xsl:when>

            <xsl:when test="descendant::abbreviation = '&lt;SEM&gt;'">
                <xsl:copy-of select="ancestor::entry//etymaramaicafter"/>
                <xsl:copy-of select="ancestor::entry//etymsemiticbefore"/>
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="etymaramaicbefore|etymsemiticbefore|etymaramaicafter|etymsemiticafter"
    />

    <xsl:template match="etymology-gloss-stem">
        <xsl:variable name="stemabbreviations">
            <xsl:value-of select="'(It|Š|Št|G|Gt|Gtn|L|Lt|N|Nt|Ntn|D|Dt|H|C|CD|CG|I|II|III|IV|V|VI|VII|VIII|IX|X)'"/>
        </xsl:variable>
        <xsl:element name="stemglosspair">
            <xsl:analyze-string select="." regex="{$stemabbreviations}(, | )">
                <xsl:matching-substring>
                    <xsl:element name="stem">
                        <xsl:value-of select="regex-group(1)"/>
                    </xsl:element>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:analyze-string select="." regex="(.* of) ({$stemabbreviations})">
                        <xsl:matching-substring>
                            <xsl:element name="pseudo-gloss">
                                <xsl:value-of select="regex-group(1)"/>
                                <xsl:element name="pseudo-gloss-stem">
                                    <xsl:value-of select="regex-group(2)"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:element name="gloss">
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:element>
    </xsl:template>

    <xsl:template match="etymologies">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
        <xsl:if test="
            following-sibling::compmorphperf or
            following-sibling::compmorphimpf or
            following-sibling::compmorphactpartm or
            following-sibling::compmorphpasspart or
            following-sibling::compmorphinf or
            following-sibling::compmorphtable
            ">
            <xsl:element name="morphology">
                <xsl:copy-of select="following-sibling::compmorphperf"/>
                <xsl:copy-of select="following-sibling::compmorphimpf"/>
                <xsl:copy-of select="following-sibling::compmorphactpartm"/>
                <xsl:copy-of select="following-sibling::compmorphpasspart"/>
                <xsl:copy-of select="following-sibling::compmorphinf"/>
                <xsl:copy-of select="following-sibling::compmorphtable"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="compmorphperf|compmorphimpf|compmorphactpartm|compmorphpasspart|compmorphinf|compmorphtable"
    />

</xsl:stylesheet>
