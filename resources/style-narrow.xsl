<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:fo="http://www.w3.org/1999/XSL/Format" >

<xsl:output method="xml" encoding="UTF-8"/>
<xsl:output indent="yes"/>

<xsl:template match="/">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xlink="http://www.w3.org/1999/xlink">
<fo:layout-master-set>


<fo:simple-page-master master-name="narrow"
  page-height="297mm" page-width="210mm"
  margin-top="20mm"  margin-bottom="10mm" 
  margin-left="25mm" margin-right="75mm">
<fo:region-body
  margin-top="15mm" margin-bottom="0mm"
  margin-left="0mm" margin-right="0mm"/>
<fo:region-before
  region-name="xsl-region-before-firstpage" 
  extent="10mm"/>
<fo:region-after 
  region-name="xsl-region-after-firstpage" 
  extent="10mm"/>
</fo:simple-page-master>


<fo:simple-page-master master-name="firstpage"
  page-height="297mm" page-width="210mm"
  margin-top="20mm"  margin-bottom="10mm" 
  margin-left="25mm" margin-right="20mm">
<fo:region-body
  margin-top="15mm" margin-bottom="0mm"
  margin-left="0mm" margin-right="0mm"/>
<fo:region-before
  region-name="xsl-region-before-firstpage" 
  extent="10mm"/>
<fo:region-after 
  region-name="xsl-region-after-firstpage" 
  extent="10mm"/>
</fo:simple-page-master>


<fo:simple-page-master master-name="evenpage"
  page-height="297mm" page-width="210mm"
  margin-top="20mm"  margin-bottom="20mm" 
  margin-left="27mm" margin-right="18mm">
<fo:region-body
  margin-top="12mm" margin-bottom="0mm"
  margin-left="0mm" margin-right="0mm"/>
<fo:region-before
  region-name="xsl-region-before-evenpage" 
  extent="10mm"/>
<fo:region-after 
  region-name="xsl-region-after-evenpage" 
  extent="10mm"/>
</fo:simple-page-master>


<fo:simple-page-master master-name="oddpage"
  page-height="297mm" page-width="210mm"
  margin-top="20mm"  margin-bottom="20mm" 
  margin-left="18mm" margin-right="27mm">
<fo:region-body
  margin-top="12mm" margin-bottom="0mm"
  margin-left="0mm" margin-right="0mm"/>
<fo:region-before
  region-name="xsl-region-before-oddpage" 
  extent="10mm"/>
<fo:region-after 
  region-name="xsl-region-after-oddpage" 
  extent="10mm"/>
</fo:simple-page-master>


<fo:page-sequence-master master-name="toc" >
<fo:repeatable-page-master-alternatives>
<fo:conditional-page-master-reference
  page-position="first"
  master-reference="firstpage"/>
<fo:conditional-page-master-reference
  odd-or-even="odd"
  master-reference="oddpage"/>
<fo:conditional-page-master-reference
  odd-or-even="even"
  master-reference="evenpage"/>
</fo:repeatable-page-master-alternatives>
</fo:page-sequence-master>

<fo:page-sequence-master master-name="twoside">
<fo:repeatable-page-master-alternatives>
<fo:conditional-page-master-reference
  odd-or-even="odd"
  master-reference="oddpage"/>
<fo:conditional-page-master-reference
  odd-or-even="even"
  master-reference="evenpage"/>
</fo:repeatable-page-master-alternatives>
</fo:page-sequence-master>
</fo:layout-master-set>


<fo:page-sequence master-reference="narrow" format="i">
<fo:static-content flow-name="xsl-region-before-evenpage">
<fo:block line-height="14pt" font-size="12pt" font-family="Calibri" 
  text-align="outside">
<fo:page-number/>
</fo:block>
</fo:static-content>
<fo:static-content flow-name="xsl-region-before-oddpage">
<fo:block line-height="14pt" font-size="12pt" font-family="Calibri" 
  text-align="outside">
<fo:page-number/>
</fo:block>
</fo:static-content>


<fo:flow flow-name="xsl-region-body">
<fo:block space-before.optimum="3pt" space-after.optimum="50pt">
</fo:block>

<fo:block text-align="center" font-family="Verdana" font-weight="bold" font-size="28pt" space-before.optimum="3pt" space-after.optimum="15pt">
<xsl:value-of select="book/title"/>
</fo:block>

<fo:block space-before.optimum="3pt" space-after.optimum="20pt">
</fo:block>

<fo:block  text-align="center"  font-size="16pt"  font-family="Verdana" >
<xsl:value-of select="book/subtitle"/>
</fo:block>

<fo:block space-before.optimum="3pt" space-after.optimum="432pt">
</fo:block>
      
<fo:block text-align="center" font-size="18pt" font-family="ArialUnicodeMS" space-after.optimum="10pt">
<xsl:value-of select="book/publisher"/>
</fo:block>
      
<fo:block  text-align="center" font-size="16pt"  font-family="Calibri" >
<xsl:value-of select="book/location"/>&#160;&#160;<xsl:value-of select="book/year"/>
</fo:block>
      

<xsl:for-each select="document('../build-book/edition-notice.html')/html/body/p">
<xsl:if test="position()=1">
<fo:block break-before="page" text-align="left"  font-size="12pt"  
  space-after.optimum="10pt" font-family="Calibri" >
<xsl:value-of select="."/>
</fo:block>	
</xsl:if>
<xsl:if test="position()&gt;1">
<fo:block text-align="left"  font-size="12pt"  
  space-after.optimum="10pt" font-family="Calibri" >
<xsl:value-of select="."/>
</fo:block>	
</xsl:if>
</xsl:for-each>


<fo:block text-align="left" 
  break-before="page"
  font-size="14pt"  
  space-after.optimum="10pt" font-family="Verdana" font-weight="bold">
<xsl:choose>
<xsl:when test="book/foreword/@title"><xsl:value-of select="book/foreword/@title"/></xsl:when>
<xsl:otherwise>Priekšvārds</xsl:otherwise>
</xsl:choose>
</fo:block>	

<xsl:for-each select="document('../build-book/foreword.html')/html/body/p">
<fo:block text-align="left"  font-size="12pt"  
  space-after.optimum="10pt" font-family="Century Schoolbook" >
<xsl:value-of select="."/>
</fo:block>	
</xsl:for-each>
      

<fo:block  break-before="page" text-align="center"  font-size="16pt"  font-family="Verdana" >
Satura rādītājs
</fo:block>

<fo:table>
<fo:table-column column-width="14cm"/>
<fo:table-column column-width="1cm"/>
<fo:table-body font-size="14pt" font-family="Calibri">

<xsl:for-each select="book/section">
<fo:table-row line-height="14pt">
<fo:table-cell><fo:block text-align="start" font-weight="bold"
  space-after=".1in" text-align-last="justify">
<xsl:if test="count(//book/section)&gt;1"><xsl:value-of select="@id"/> daļa: </xsl:if><xsl:value-of select="title"/>
<fo:leader leader-pattern="dots" 
  leader-pattern-width="5pt"/>
</fo:block></fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="{generate-id(.)}"/></fo:block>
</fo:table-cell>
</fo:table-row>  


<xsl:for-each select="song">
<fo:table-row line-height="14pt">
<fo:table-cell><fo:block text-align="start"
  space-after=".1in" text-align-last="justify">
<xsl:value-of select="count(preceding::song)+1"/>. <xsl:value-of
  select="document(concat('../build-book/xml/', @id, '.xml'))/html/head/title"/>
<fo:leader leader-pattern="dots" 
  leader-pattern-width="5pt"/>
</fo:block></fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation 
ref-id="{concat('song_',@id)}"/></fo:block>
</fo:table-cell>
</fo:table-row> 
</xsl:for-each>
</xsl:for-each>
</fo:table-body>
</fo:table>
</fo:flow>
</fo:page-sequence>










<fo:page-sequence master-reference="narrow"  initial-page-number="1">
<fo:static-content flow-name="xsl-region-before-evenpage">
<fo:block 
  text-align-last="justify" 
  font-size="12pt"
  font-family="Calibri"
  space-after.optimum="3pt">
   <fo:page-number/>
   <fo:leader leader-pattern="space"/>
   <xsl:value-of select="book/title"/>
</fo:block>
<fo:block 
  space-before.optimum="3pt"
  space-after.optimum="3pt"> 
<fo:leader leader-pattern="rule" 
  rule-thickness="1pt" leader-length="100%"/> 
</fo:block>
</fo:static-content>
<fo:static-content flow-name="xsl-region-before-oddpage">
<fo:block 
  text-align-last="justify" 
  font-size="12pt"
  font-family="Calibri"
  space-after.optimum="3pt">
   <fo:retrieve-marker retrieve-class-name="sectitle"/>
   <fo:leader leader-pattern="space"/>
   <fo:page-number/>
</fo:block>
<fo:block 
  space-before.optimum="3pt"
  space-after.optimum="3pt"> 
<fo:leader leader-pattern="rule" 
  rule-thickness="1pt" leader-length="100%"/> 
</fo:block>
</fo:static-content>
<fo:flow flow-name="xsl-region-body">
<xsl:for-each select="book/section">

<fo:block id="{generate-id(.)}"  text-align="left" break-before="page"  font-size="14pt"  
space-after.optimum="10pt" font-family="Verdana" font-weight="bold">
<fo:marker marker-class-name="sectitle"><xsl:value-of select="@id"/> daļa: <xsl:value-of select="title"/></fo:marker>
<xsl:if test="count(//book/section)&gt;1"><xsl:value-of select="@id"/> daļa: </xsl:if><xsl:value-of select="title"/>
</fo:block>	  
      
<xsl:apply-templates select="song">
</xsl:apply-templates>
	  
</xsl:for-each>
	  	  

</fo:flow>
</fo:page-sequence>
</fo:root>

</xsl:template>








<xsl:template match="song">
<xsl:param name="id" select="@id"/>
<xsl:param name="narrator" select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='narrator']"/>
<xsl:param name="source" select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='sources']"/>
<xsl:param name="genre" select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='genre']"/>
<xsl:param name="genrenote" select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='genrenote']"/>
<xsl:param name="mode" select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='mode']"/>
<xsl:param name="keys" select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='keys']"/>

<fo:block text-align="left" font-size="16pt" 
id="{concat('song_',@id)}"
font-family="Calibri" font-weight="normal" font-style="normal">
<xsl:if test="position()&gt;1"><xsl:attribute name="break-before">page</xsl:attribute></xsl:if> 
<xsl:value-of select="count(preceding::song)+1"/>. <xsl:value-of
  select="document(concat('../build-book/xml/', $id, '.xml'))/html/head/title"/>
</fo:block>  

<!--
<xsl:if test="string-length($narrator)&gt;0 or count($source)&gt;0">
<fo:table table-layout="fixed" width="100%">
<fo:table-column column-width="6cm"/>
<fo:table-column column-width="11cm"/>
<fo:table-body>
<fo:table-row>
<fo:table-cell
  padding-start="3pt" padding-end="3pt"
  padding-before="3pt" padding-after="3pt" 
  border-style="solid" border-color="black" border-width="0pt"
  page-break-inside="avoid">
<xsl:choose>
<xsl:when test="count($source/p)=0">
<fo:block margin-left="0pt" text-align="left" font-size="11pt" font-family="Calibri" 
  font-weight="normal">&#160;</fo:block>
</xsl:when>
<xsl:otherwise>
<xsl:for-each select="$source/p">
<fo:block margin-left="0pt" text-align="left" font-size="11pt" font-family="Calibri" 
  font-weight="normal">
<xsl:value-of select="span"/>
<xsl:value-of select="text()"/>
</fo:block>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</fo:table-cell>
<fo:table-cell
  padding-start="3pt" padding-end="3pt"
  padding-before="3pt" padding-after="3pt" 
  border-style="solid" border-color="black" border-width="0pt"
  page-break-inside="avoid">
<fo:block margin-left="0pt" text-align="left" font-size="11pt" font-family="Calibri" 
  font-weight="normal">
<xsl:value-of select="$narrator"/>
</fo:block>
</fo:table-cell>
</fo:table-row>
</fo:table-body>
</fo:table>
</xsl:if>
-->

<fo:block text-align="left" font-size="12pt"
font-family="Calibri" font-weight="normal" font-style="normal">
<xsl:value-of select="$narrator"/>
</fo:block>  


<fo:block margin-left="-10pt">
<fo:external-graphic content-width="11cm">
<xsl:attribute name="src">file:build-book/svg/<xsl:value-of select="@id"/>.svg</xsl:attribute> 
</fo:external-graphic>
</fo:block>

<xsl:if test="string-length($genre)&gt;0">
<fo:block text-align="left" font-size="12pt" font-family="Century Schoolbook" 
font-weight="normal" font-style="italic">
<xsl:choose>
<xsl:when test="$genre='1B'">Vienbalsīga</xsl:when>
<xsl:when test="$genre='1B+1B'">Pievienota otra balss</xsl:when>
<xsl:when test="$genre='1B+1B'">Divbalsīga</xsl:when>
<xsl:when test="contains($genre,'DRONE')">Burdons</xsl:when>
<xsl:otherwise>Balsu skaits nezināms</xsl:otherwise>
</xsl:choose> <xsl:if test="string-length($genrenote)&gt;0">(<xsl:value-of select="$genrenote"/>)</xsl:if>
</fo:block>  
</xsl:if>

<xsl:if test="string-length($mode)&gt;0">
<fo:block text-align="left" font-size="12pt" font-family="Century Schoolbook" 
font-weight="normal" font-style="normal">
Skaņkārta: <xsl:value-of select="$mode"/>; beigas - <xsl:value-of select="substring-before($keys,'|')"/> pak.; 
sākums - <xsl:value-of select="substring-after($keys,'|')"/> pak.
</fo:block>
</xsl:if>

<!--
<xsl:apply-templates select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='content']/(ol|p|table)"/>
-->
<xsl:apply-templates select="document(concat('../build-book/xml/', $id, '.xml'))/html/body/div[@class='content']//ol"/>


</xsl:template>

<xsl:template match="ol">
<fo:list-block>
<xsl:for-each select="li">

<fo:list-item>
  <fo:list-item-label>
    <fo:block text-align="left" font-size="14pt" font-family="Calibri" 
font-weight="normal" font-style="normal"><xsl:value-of select="@title"/></fo:block>
  </fo:list-item-label>
  <fo:list-item-body>
    <fo:block margin-left="20pt" text-align="left" font-size="14pt" font-family="Calibri" 
font-weight="normal" font-style="normal"><xsl:apply-templates/></fo:block>
  </fo:list-item-body>
</fo:list-item>
</xsl:for-each>

</fo:list-block>
</xsl:template>


<xsl:template match="p">
<fo:block margin-left="0pt" text-align="left" font-size="14pt" font-family="Calibri" 
font-weight="normal" font-style="italic"><xsl:value-of select="."/></fo:block>
</xsl:template>




<xsl:template match="text()">
<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="br">
<fo:block> </fo:block>
</xsl:template>


<xsl:template match="b">
  <fo:inline font-weight="bold">
    <xsl:apply-templates select="*|text()"/>
  </fo:inline>
</xsl:template>

<xsl:template match="i">
  <fo:inline font-style="italic">
    <xsl:apply-templates select="*|text()"/>
  </fo:inline>
</xsl:template>


<xsl:template match="table">
  <fo:table table-layout="fixed" width="100%">
    <fo:table-column column-width="8cm"/>
    <fo:table-column column-width="8cm"/>
     <fo:table-body>
      <xsl:apply-templates select="*"/>
    </fo:table-body>
  </fo:table>
</xsl:template>


<xsl:template match="tr">
  <fo:table-row>
    <xsl:apply-templates select="*|text()"/>
  </fo:table-row>
</xsl:template>

<xsl:template match="td|th">
  <fo:table-cell
    padding-start="3pt" padding-end="3pt"
    padding-before="3pt" padding-after="3pt" 
    border-style="solid" border-color="black" border-width="0pt"
    page-break-inside="avoid">
      <xsl:apply-templates select="*|text()"/>
  </fo:table-cell>
</xsl:template>


</xsl:stylesheet>
