<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="structure-navigation" mode="main">

  <header class="navigation">
    <div class="navigation-wrapper">
      <a href="javascript:void(0)" class="logo">
        <img src="https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/placeholder_logo_1.png" alt="Client logo" />
      </a>
      <a href="" class="navigation-menu-button" id="js-mobile-menu">MENU</a>
      <div class="nav">
        <ul id="navigation-menu">
          <xsl:apply-templates select="entry" mode="nav"/>
<!--           <li class="nav-link"><a href="javascript:void(0)">Products</a></li>
          <li class="nav-link"><a href="javascript:void(0)">About Us</a></li>
          <li class="nav-link"><a href="javascript:void(0)">Contact</a></li>
          <li class="nav-link more"><a href="javascript:void(0)">More</a>
            <ul class="submenu">
              <li><a href="javascript:void(0)">Submenu Item</a></li>
              <li><a href="javascript:void(0)">Another Item</a></li>
              <li class="more"><a href="javascript:void(0)">Item with submenu</a>
                <ul class="submenu">
                  <li><a href="javascript:void(0)">Sub-submenu Item</a></li>
                  <li><a href="javascript:void(0)">Another Item</a></li>
                </ul>
              </li>
              <li class="more"><a href="javascript:void(0)">Another submenu</a>
                <ul class="submenu">
                  <li><a href="javascript:void(0)">Sub-submenu</a></li>
                  <li><a href="javascript:void(0)">An Item</a></li>
                </ul>
              </li>
            </ul>
          </li> -->
        </ul>
      </div>
<!--       <div class="navigation-tools">
        <div class="search-bar">
          <div class="search-and-submit">
            <input type="search" placeholder="Enter Search" />
            <button type="submit">
              <img src="https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/search-icon.png" alt="search icon" />
            </button>
          </div>
        </div>
        <a href="javascript:void(0)" class="sign-up">Sign Up</a>
      </div> -->
    </div>
  </header>

<!--   <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="{$root}" class="navbar-brand"><img src="{$workspace}/assets/img/nightwind.svg" alt="Nightwind Productions"/></a>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <xsl:apply-templates select="entry" mode="nav"/>
          <xsl:if test="$cookie-username">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-wrench"></i></a>
              <ul class="dropdown-menu">
                <li><a href="/symphony/">Symphony</a></li>
                <li><a href="?debug">Debug</a></li>
                <li><a href="?logs">Logs</a></li>
              </ul>
            </li>
          </xsl:if>
        </ul>
      </div>
    </div>
  </nav> -->
</xsl:template>


<xsl:template match="structure-navigation/entry" mode="nav">
  <xsl:variable name="parent-id" select="@id" />

  <xsl:if test="not(parent/item) and title/@handle != 'home'">
    <li>
      <xsl:attribute name="class">
        <xsl:text>nav-link</xsl:text>
        <xsl:choose>
          <xsl:when test="@id = /data/structure-navigation/entry/parent/item/@id">
            <xsl:text> more</xsl:text>
            <xsl:if test="$pt1 = slug">
              <xsl:text> more active</xsl:text>
            </xsl:if>
          </xsl:when>
          <xsl:when test="$pt1 = slug">
            <xsl:text> active</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:attribute>

      <a href="{$root}{path}">
        <xsl:value-of select="title"/>
      </a>

      <xsl:if test="@id = /data/structure-navigation/entry/parent/item/@id">
        <ul class="submenu">
          <xsl:for-each select="/data/structure-navigation/entry[parent/item/@id = $parent-id]">
            <xsl:variable name="child-id" select="@id" />
            <li>
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="@id = /data/structure-navigation/entry/parent/item/@id">
                    <xsl:text>more</xsl:text>
                    <xsl:if test="slug = $pt2"> active</xsl:if>
                  </xsl:when>
                  <xsl:when test="slug = $pt2">active</xsl:when>
                </xsl:choose>
              </xsl:attribute>
              <a href="{$root}{path}">
                <xsl:value-of select="title"/>
              </a>
              <xsl:if test="@id = /data/structure-navigation/entry/parent/item/@id">
                <ul class="submenu">
                  <xsl:for-each select="/data/structure-navigation/entry[parent/item/@id = $child-id]">
                    <li>
                      <xsl:if test="slug = $pt3">
                        <xsl:attribute name="class">
                          <xsl:text>active</xsl:text>
                        </xsl:attribute>
                      </xsl:if>
                      <a href="{$root}{path}">
                        <xsl:value-of select="title"/>
                      </a>
                    </li>
                  </xsl:for-each>
                </ul>
              </xsl:if>
            </li>
          </xsl:for-each>
        </ul>
      </xsl:if>
    </li>
  </xsl:if>

</xsl:template>

</xsl:stylesheet>