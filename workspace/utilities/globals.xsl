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
  <blockquote>
    <xsl:choose>
      <xsl:when test="title/@handle = 'home'">
        <h1><xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='home-greeting']/content)" disable-output-escaping="yes" /></h1>
      </xsl:when>
      <xsl:otherwise>
        <h1><xsl:value-of select="title"/></h1>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="tagline-masthead" disable-output-escaping="yes"/>
  </blockquote>
</xsl:template>


</xsl:stylesheet>