<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="toolkit.xsl"/>
<xsl:import href="date-time-advanced.xsl" />
<xsl:import href="globals.xsl"/>
<xsl:import href="navigation.xsl"/>
<xsl:import href="head.xsl"/>
<xsl:import href="footer.xsl"/>
<xsl:import href="contact.xsl"/>
<xsl:import href="error.xsl"/>

<xsl:output method="xml"
    doctype-public="XSLT-compat"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />

<xsl:param name="cookie-username" />

<xsl:template match="/">
  <xsl:call-template name="master"/>
</xsl:template>

<xsl:template name="master">

  <html lang="en">

  <!-- This template calls our <head> tag and associated metadata -->
  <xsl:call-template name="head"/>

  <body>
    <xsl:attribute name="id">
      <xsl:choose>
        <xsl:when test="ds-structure-url.slug">
          <xsl:value-of select="ds-structure-url.slug"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$pt1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <!-- Calling main navigation -->
    <xsl:apply-templates select="data/structure-navigation" mode="main" />

    <div id="main">

      <!-- This template calls our background image -->
      <xsl:apply-templates select="data/structure-url/entry" mode="background"/>

      <!-- The overlay darkens the background image to make it more on-brand -->
      <div class="overlay">&#160;</div>

      <!-- Calling the header tagline -->
      <xsl:choose>
        <xsl:when test="data/structure-url/error">
          <xsl:call-template name="error-tagline"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="data/structure-url/entry" mode="tagline" />
        </xsl:otherwise>
      </xsl:choose>

    </div>

    <!-- Our main page content -->
    <div id="content">
      <xsl:apply-templates />
    </div>

    <!-- Calling the footer -->
    <xsl:call-template name="footer"/>

  </body>

</html>

</xsl:template>


</xsl:stylesheet>
