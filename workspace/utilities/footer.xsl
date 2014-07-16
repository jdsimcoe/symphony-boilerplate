<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="footer">

  <footer class="footer">

  </footer>

  <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='analytics']/content)" disable-output-escaping="yes" />

  <xsl:call-template name="livereload"/>

</xsl:template>

</xsl:stylesheet>