<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>


<xsl:template match="data">
  <xsl:choose>
    <xsl:when test="count(structure-url/entry)">
      <xsl:apply-templates select="structure-url/entry" mode="main"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="error"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="structure-url/entry" mode="main">
  <xsl:choose>
    <xsl:when test="slug/@handle = 'contact'">
      <xsl:value-of select="content" disable-output-escaping="yes" />
      <xsl:call-template name="contact-form" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="content" disable-output-escaping="yes" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


</xsl:stylesheet>