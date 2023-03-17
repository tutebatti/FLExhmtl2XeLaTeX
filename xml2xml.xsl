<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="2.0"
    >

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>

    <!-- needed to use single quotation mark in filters etc. -->

    <xsl:variable name="apo">'</xsl:variable>

    <!-- identitiy transformation -->

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@id|@entryguid|@intref"/>
        </xsl:copy>
    </xsl:template>

    <!-- handling of ortography: -->
    <!-- 1) parent "orthography" introduced -->
    <!-- 2) copies of respective elements inside parent inserted -->

    <xsl:template match="phono-received-pronunciation">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
        <xsl:element name="orthography">
            <xsl:element name="orth-estrangela">
                <xsl:copy-of select="following-sibling::orth-estrangela/syriac/rtl/text()"/>
            </xsl:element>
            <xsl:element name="orth-serto">
                <xsl:copy-of select="following-sibling::orth-estrangela/syriac/rtl/text()"/>
            </xsl:element>
            <xsl:element name="orth-madnḥaya">
                <xsl:copy-of select="following-sibling::orth-madnḥaya/syriac/rtl/text()"/>
            </xsl:element>
            <xsl:copy-of select="following-sibling::dots-sublinear"/>
            <xsl:copy-of select="following-sibling::dots-sublinear-label"/>
            <xsl:copy-of select="following-sibling::dots-supralinear"/>
            <xsl:copy-of select="following-sibling::dots-supralinear-label"/>
        </xsl:element>
    </xsl:template>

    <!-- because of copies (above), elements are excluded from identity transformation -->

    <xsl:template match="
    orth-estrangela|
    orth-serto|
    orth-madnḥaya|
    dots-sublinear|
    dots-sublinear-label|
    dots-supralinear|
    dots-supralinear-label"
    />

    <!-- Rearrangement of entire etymologies section -->
    <!-- 1) Parent <etymologies> introduced -->
    <!-- 2) Children for each language introduced -->
    <!-- 3) Copies of "before"/"after" elements inserted at beginning/end -->
    <!-- 4) Only elements with languages belonging to the respective block are matched -->

    <xsl:template match="etymologies">
      <xsl:element name="etymologies">
        <xsl:element name="etymaramaic">
            <xsl:apply-templates select="etymology[
            matches(languages/language[1]/abbreviation/text(), '(Cf. )?(Arm|OA|OfA|QA|JA|NA|PA|BA|TO|HA|SA|JPA|JBA|CPA|M[^(&gt;)hio]|CU|WNA|NM|T|(TVW[2])|ŠS|JNA|JNAB|B)')]"/>
          <xsl:copy-of select="ancestor::entry//etymaramaicbefore"/>
          <xsl:copy-of select="ancestor::entry//etymaramaicafter"/>
        </xsl:element>
        <xsl:element name="etymsemitic">
            <xsl:apply-templates select="etymology[
            matches(languages/language[1]/abbreviation/text(), '(Cf. )?(Sem|Akk|Ebl|Hbr|Pho/Pun|Ugr|Arb|(Mo)|(Min)|Qat|Sab|Gez|Hrs|Jib|(Mhr))')]"/>
          <xsl:copy-of select="ancestor::entry//etymsemiticbefore"/>
          <xsl:copy-of select="ancestor::entry//etymsemiticafter"/>
        </xsl:element>
        <xsl:element name="etymgreek">
            <xsl:apply-templates select="etymology[
            matches(languages/language[1]/abbreviation/text(), '&lt; Gr')]"/>
          <xsl:copy-of select="ancestor::entry//etymgreekbefore"/>
          <xsl:copy-of select="ancestor::entry//etymgreekafter"/>
        </xsl:element>
      </xsl:element>

    <!-- Introduction of parent "morphology" -->
    <!-- 1) Test if morphology elements are present -->
    <!-- 2) Copy respective elements inside -->

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

    <!-- because of copies (above), elements are excluded from identity transformation -->

    <xsl:template match="
    etymaramaicbefore|
    etymsemiticbefore|
    etymaramaicafter|
    etymsemiticafter"
    />

        <xsl:template match="
    compmorphperf|
    compmorphimpf|
    compmorphactpartm|
    compmorphpasspart|
    compmorphinf|
    compmorphtable"
    />

    <!-- Further processing of stem-gloss combinations in etymologies -->
    <!-- 1) Match strings against list of possible stem abbreviations -->
    <!-- 2) Put into respective elements -->

    <xsl:template match="etymology-gloss-stem">

        <xsl:variable name="stemabbreviations">
            <xsl:value-of select="'(It|Š|Št|G|Gt|Gtn|L|Lt|N|Nt|Ntn|D|Dt|H|C|CD|CG|I|II|IIt|III|IV|V|VI|VII|VIII|IX|X)'"/>
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

</xsl:stylesheet>
