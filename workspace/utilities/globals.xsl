<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="structure-url/entry" mode="background">
  <xsl:choose>
    <xsl:when test="string-length(hero/item/image)">
      <xsl:attribute name="style">
        <xsl:text>background-image: url('</xsl:text>
        <xsl:value-of select="$root"/>
        <xsl:text>/image/2/1800/1200/5/0/uploads/images/</xsl:text>
        <xsl:value-of select="hero/item/image"/>
        <xsl:text>');</xsl:text>
      </xsl:attribute>
    </xsl:when>
    <xsl:otherwise>
      <xsl:attribute name="style">
        <xsl:text>background-image: url('http://placehold.it/1800x1200/cccccc/cccccc');</xsl:text>
      </xsl:attribute>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="structure-url/entry" mode="tagline">
  <div class="masthead">
    <xsl:choose>
      <xsl:when test="title/@handle = 'home'">
        <h1 class="masthead-heading">
          <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='masthead-heading-home']/content)" disable-output-escaping="yes" />
        </h1>
        <div class="masthead-content">
          <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='masthead-heading-content']/content)" disable-output-escaping="yes" />
        </div>
      </xsl:when>
      <xsl:otherwise>
        <h1 class="masthead-heading">
          <xsl:value-of select="title"/>
        </h1>
        <div class="masthead-content">
          <xsl:value-of select="tagline-masthead" disable-output-escaping="yes"/>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>


<xsl:template match="matrix/item">
  <xsl:variable name="matrix-id" select="@id" />
  <!-- Outputting Matrix data -->
  <xsl:for-each select="/data/matrix-filtered/entry[@id = $matrix-id]">
    <xsl:if test="string-length(text)">
      <xsl:value-of select="text" disable-output-escaping="yes" />
    </xsl:if>
  </xsl:for-each>
</xsl:template>


</xsl:stylesheet>