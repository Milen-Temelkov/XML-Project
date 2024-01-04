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
          <!-- Use key() function to get the brand name -->
          <xsl:value-of select="key('brandById', model/@brandID)/@name"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="model"/>
        </h2>
        <p>Year: <xsl:value-of select="year"/></p>
        <p>Transmission: <xsl:value-of select="transmission"/></p>
        <p>Price: <xsl:value-of select="price"/></p>
        <p>Location: <xsl:value-of select="location"/></p>
        <p>Colour: <xsl:value-of select="colour"/></p>
        <p>Volume: <xsl:value-of select="engine/volume"/></p>
        <p>Type: <xsl:value-of select="engine/type"/></p>
        <p>Power: <xsl:value-of select="engine/power"/></p>
        <p>Mileage: <xsl:value-of select="engine/miliage"/></p>
        <p>Eco Standard: <xsl:value-of select="engine/ecoStandart"/></p>
        <img src="{unparsed-entity-uri(image/@src)}" disable-output-escaping="yes"/>
      </div>

  	</xsl:for-each>
  </xsl:template>

  <xsl:key name="brandById" match="brands/brand" use="@ID"/>

</xsl:stylesheet>
