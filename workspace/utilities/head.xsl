<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="head">

  <head>
    <title>
      <xsl:if test="/data/structure-url/entry != '' and $pt1 != ''">
        <xsl:value-of select="/data/structure-url/entry/title" />
        <xsl:text> · </xsl:text>
      </xsl:if>
      <xsl:value-of select="$website-name"/>
      <xsl:text> · </xsl:text>
      <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='website-title']/content)" disable-output-escaping="yes" />
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author">
      <xsl:attribute name="content">
        <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='meta-author']/content)" disable-output-escaping="yes" />
      </xsl:attribute>
    </meta>
    <meta name="keywords">
      <xsl:attribute name="content">
        <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='meta-keywords']/content)" disable-output-escaping="yes" />
      </xsl:attribute>
    </meta>
    <meta name="description">
      <xsl:attribute name="content">
        <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='meta-description']/content)" disable-output-escaping="yes" />
      </xsl:attribute>
    </meta>

    <link rel="dns-prefetch" href="{$root}" />
    <link rel="dns-prefetch" href="//www.google-analytics.com"/>
    <link rel="dns-prefetch" href="//use.typekit.net" />

    <link href="{$workspace}/assets/css/main.css" rel="stylesheet" />
    <link href="{$root}/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" href="{$root}/apple-touch-icon-precomposed.png" />

    <xsl:value-of select="normalize-space(/data/globals/entry[title/@handle='typekit']/content)" disable-output-escaping="yes" />

    <script type="text/javascript" src="{$workspace}/assets/js/application.min.js"></script>

  </head>

</xsl:template>

</xsl:stylesheet>