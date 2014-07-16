# Block User Agent #

Version: 1.3

XSL template and Regular Expression combined to help fight old browsers.

### REQUIREMENTS ###

- Symphony CMS version 2.4 and up (as of the day of the last release of this extension)

### INSTALLATION ###


- Unzip the block_user_agent.zip file
- (re)Name the folder **block_user_agent**
- Put into the extension directory
- Enable/install just like any other extension
- Go to the *Preferences* page to customize the regular expression
- Include the xsl file located in extensions/block_user_agent/utilities
	- `<xsl:import href="../../extensions/block_user_agent/utilities/block_user_agent.xsl" />`
- You must call the block-user-agent template directly under the `<body>` tag. Parameters are optional
	- `<xsl:call-template name="block-user-agent" />`
	- Default parameters are:
	
		- `<xsl:param name="title" select="'This website uses technologies your browser does not support.'" />`
		- `<xsl:param name="subtitle" select="'Please upgrade now usign the links below.'" />`
		- `<xsl:param name="close" select="'Click here if you still want to access the site.'" />`
		- `<xsl:param name="firefox" select="true()" />`
		- `<xsl:param name="chrome" select="true()" />`
		- `<xsl:param name="opera" select="true()" />`
		- `<xsl:param name="ie" select="true()" />`
		- `<xsl:param name="client-side-detection" select="false()" />`

*Voila !*

<http://www.deuxhuithuit.com>
