<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="error">
  <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='error']/content)" disable-output-escaping="yes" />
</xsl:template>


<xsl:template name="error-tagline">
  <blockquote>
    <h1>Error!</h1>
    <p>The page “<strong><xsl:value-of select="$pt1"/></strong>” you are trying to reach was not found.</p>
  </blockquote>
</xsl:template>


<!-- <xsl:template name="error-background">
  <xsl:attribute name="style">
    <xsl:text>background-image: url('</xsl:text>
    <xsl:value-of select="$root"/>
    <xsl:text>/image/2/1800/1200/5/0/uploads/images/</xsl:text>
    <xsl:value-of select="image/item/image"/>
    <xsl:text>');</xsl:text>
  </xsl:attribute>
</xsl:template> -->


</xsl:stylesheet>