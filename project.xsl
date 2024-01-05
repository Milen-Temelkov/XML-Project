<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/> 
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Каталог за коли</title>
        <link rel="stylesheet" href="Catalogue.css" type="text/css" />
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

      <div class="car-container">
        <div class="car-details">
          <h2>
            <xsl:value-of select="key('brandById', model/@brandID)/@name"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="model"/>
          </h2>
          <p>Година: <xsl:value-of select="year"/></p>
          <p>Скоростна кутия: <xsl:value-of select="transmission"/></p>
          <p>Цена: <xsl:value-of select="price"/></p>
          <p>Местоположение: <xsl:value-of select="location"/></p>
          <p>Цвят: <xsl:value-of select="colour"/></p>
          <p>Обем на двигателя: <xsl:value-of select="engine/volume"/> L</p>
          <p>Тип на двигателя: <xsl:value-of select="engine/type"/></p>
          <p>Мощност: <xsl:value-of select="engine/power"/></p>
          <p>Пробег: <xsl:value-of select="engine/miliage"/></p>
          <p>Еко категория: <xsl:value-of select="engine/ecoStandart"/></p>
        </div>
        <div class="car-image">
          <img src="{unparsed-entity-uri(image/@src)}" disable-output-escaping="yes"/>
        </div>
      </div>

  	</xsl:for-each>
  </xsl:template>

  <xsl:key name="brandById" match="brands/brand" use="@ID"/>

</xsl:stylesheet>
