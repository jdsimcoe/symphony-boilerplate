<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="data">
    <data>
      <xsl:apply-templates select="entry" mode="path-reflection"/>
    </data>
  </xsl:template>


  <xsl:template match="entry" mode="path-reflection">
    <xsl:param name="path-display-normalized">
      <xsl:choose>
        <xsl:when test="slug!=''">
          <xsl:value-of select="translate(concat(parent/item/text(),'/',slug/@handle),' ','')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="translate(concat(parent/item/text(),'/',tag/@handle),' ','')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>

    <xsl:element name="path-display">
      <xsl:value-of select="normalize-space($path-display-normalized)"/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>