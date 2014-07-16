<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="head">

  <head>
    <title>
      <xsl:if test="/data/structure-url/entry != ''">
        <xsl:value-of select="/data/structure-url/entry/title" />
        <xsl:text> · </xsl:text>
      </xsl:if>
      <xsl:value-of select="$website-name"/>
      <xsl:text> · </xsl:text>
      <xsl:value-of select="$website-title" />
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="$meta-description" />
    <meta name="keywords" content="$meta-keywords" />
    <meta name="author" content="$meta-author" />
    <meta name="responsimage" data-server="{$root}/image/2/width/height/anchor/0/uploads/images/filename" data-static="{$workspace}/assets/img/spacer.gif" data-loading="{$workspace}/assets/img/loading.gif" />

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