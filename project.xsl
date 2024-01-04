<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/> 
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Каталог за коли</title>
      </head>
      <body>
        <h1>Каталог за коли</h1>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="/catalogue/carList">
    <xsl:for-each select="/catalogue/carList/car">
      <xsl:sort
          select = "price"
          data-type="number"
          order = "ascending">
      </xsl:sort>

      <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
        <h2>
          <xsl:value-of select="details/brand"/> <xsl:text> </xsl:text> <xsl:value-of select="details/model"/>
        </h2>
        <p>Year: <xsl:value-of select="year"/></p>
        <p>Transmission: <xsl:value-of select="transmission"/></p>
        <p>Price: <xsl:value-of select="price"/></p>
        <p>Location: <xsl:value-of select="location"/></p>
        <p>Colour: <xsl:value-of select="colour"/></p>
        <p>Engine:</p>
        <ul>
          <li>Volume: <xsl:value-of select="engine/volume"/></li>
          <li>Type: <xsl:value-of select="engine/type"/></li>
          <li>Power: <xsl:value-of select="engine/power"/></li>
          <li>Mileage: <xsl:value-of select="engine/miliage"/></li>
          <li>Eco Standard: <xsl:value-of select="engine/ecoStandart"/></li>
        </ul>
        <img src="image1.jpg">    <!--this does not work properly you should get the url from the xml-->
      </div>

  	</xsl:for-each>
  </xsl:template>

</xsl:stylesheet>