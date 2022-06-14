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
    
</xsl:stylesheet>
