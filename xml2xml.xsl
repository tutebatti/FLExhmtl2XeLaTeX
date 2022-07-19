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
            <xsl:apply-templates select="node()|@*[id|dir]"/>
        </xsl:copy>
    </xsl:template>
      
    <xsl:template match="etymology">
        <xsl:choose>
            <xsl:when test="position() = [1]">
                <xsl:copy-of select="//etymaramaicbefore"/>
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
                      
            <xsl:when test="position() = last()">
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
                <xsl:copy-of select="//etymsemiticafter"/>
            </xsl:when>
            
            <xsl:when test="descendant::abbreviation = '&lt;SEM&gt;'">
                <xsl:copy-of select="//etymaramaicafter"/>
                <xsl:copy-of select="//etymsemiticbefore"/>
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
            <xsl:value-of select="'(G|N|D|H|Gt|C|CG|I|II|III|IV|V|VI|VII|VIII|IX|X)'"/>
        </xsl:variable>
        <xsl:element name="stemglosspair">
            <xsl:analyze-string select="." regex="{$stemabbreviations} ">
                <xsl:matching-substring>
                    <xsl:element name="stem">
                        <xsl:value-of select="regex-group(1)"/>
                    </xsl:element>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:analyze-string select="." regex=".* of {$stemabbreviations}">
                        <xsl:matching-substring>
                            <xsl:element name="pseudo-gloss">
                                <xsl:value-of select="."/>
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
    
</xsl:stylesheet>
