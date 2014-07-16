<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="footer">

  <footer class="footer">
    <div class="container">
      <div class="row copy">
        <div class="col-lg-12">
          <div class="social center">
            <ul>
              <li><a href="{$main-facebook}" target="_blank"><i class="icon-social-facebook"></i></a></li>
              <li><a href="{$main-instagram}" target="_blank"><i class="glyphicon glyphicon-camera"></i></a></li>
              <li><a href="{$main-twitter}" target="_blank"><i class="icon-social-twitter"></i></a></li>
              <li><a href="{$main-newsletter}" target="_blank"><i class="glyphicon glyphicon-envelope"></i></a></li>
              <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='social']/content)" disable-output-escaping="yes" />
            </ul>
          </div>
          <p class="center">
            <xsl:choose>
              <xsl:when test="$this-year = 2013">
                <xsl:text>&#xa9;&#160;</xsl:text>
                <xsl:value-of select="$this-year" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>&#xa9;&#160;2013–</xsl:text>
                <xsl:value-of select="$this-year" />
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>.&#160;</xsl:text>
            <xsl:value-of select="$website-name"/>
            <xsl:text>. All rights reserved.</xsl:text>
            <xsl:text>&#160;&#160;•&#160;&#160;Design, branding &amp; code by </xsl:text>
            <a href="http://simko.io/"><strong>Simko.io</strong></a>
          </p>
          <div class="center">
           <i class="icon-oregon icon-medium"></i>
          </div>
        </div> <!-- .row -->
      </div>
    </div><!-- .container -->
  </footer>

  <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='analytics']/content)" disable-output-escaping="yes" />

  <xsl:call-template name="livereload"/>

</xsl:template>

</xsl:stylesheet>