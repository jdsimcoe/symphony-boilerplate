<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="structure-navigation" mode="main">

  <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="{$root}" class="navbar-brand"><img src="{$workspace}/assets/img/nightwind.svg" alt="Nightwind Productions"/></a>
      </div><!-- /.navbar-header -->
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
      </div> <!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
</xsl:template>


<xsl:template match="structure-navigation/entry" mode="nav">
  <xsl:variable name="parent-id" select="@id" />

  <xsl:if test="not(parent/item) and title/@handle != 'home'">
    <li>
      <xsl:choose>
        <xsl:when test="@id = /data/structure-navigation/entry/parent/item/@id">
          <xsl:attribute name="class">
            <xsl:text>dropdown dropdown-normal</xsl:text>
            <xsl:if test="$pt1 = slug">
              <xsl:text> active</xsl:text>
            </xsl:if>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="$pt1 = slug">
          <xsl:attribute name="class">
            <xsl:text>active</xsl:text>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>

      <a href="{$root}{path}">
        <xsl:value-of select="title"/>
      </a>
      <xsl:if test="@id = /data/structure-navigation/entry/parent/item/@id">
        <ul class="dropdown-menu">
          <xsl:for-each select="/data/structure-navigation/entry[parent/item/@id = $parent-id]">
            <xsl:variable name="child-id" select="@id" />
<!--             <h2><xsl:value-of select="$child-id"/></h2> -->
            <li>
              <xsl:if test="slug = $pt2">
                <xsl:attribute name="class">
                  <xsl:text>active</xsl:text>
                </xsl:attribute>
              </xsl:if>
              <a href="{$root}{path}">
                <xsl:value-of select="title"/>
              </a>
              <xsl:if test="@id = /data/structure-navigation/entry/parent/item/@id">
                <ul class="sub-drop">
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