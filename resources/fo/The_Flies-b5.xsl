<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>

<xsl:variable name="p-speaker-fontsize" select="'10pt'"/>
<xsl:variable name="p-speaker-fontfamily" select="'Verdana'"/>

<xsl:variable name="p-line-fontsize" select="'11pt'"/>
<xsl:variable name="p-line-lineheight" select="'12pt'"/>

<xsl:variable name="p-li-fontsize" select="'11pt'"/>
<xsl:variable name="p-li-lineheight" select="'12pt'"/>

<xsl:variable name="p-note-fontsize" select="'11pt'"/>
<xsl:variable name="p-note-lineheight" select="'12pt'"/>

<xsl:variable name="p-stagedir-fontsize" select="'10pt'"/>
<xsl:variable name="p-stagedir-fontfamily" select="'Verdana'"/>

<xsl:variable name="h1-fontsize" select="'14pt'"/>
<xsl:variable name="h2-fontsize" select="'12pt'"/>

<!-- DejaVuSansCondensed is replaced by Verdana --> 


<xsl:variable name="header-fontsize" select="'9pt'"/>

  <xsl:template match="/">

<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">





  <fo:layout-master-set>


<!--
    <fo:simple-page-master master-name="simple"
                  page-height="250cm"
                  page-width="176cm"
                  margin-top="1cm"
                  margin-bottom="2cm"
                  margin-left="2.5cm"
                  margin-right="2.5cm">
      <fo:region-body margin-top="3cm"/>
      <fo:region-before extent="3cm"/>
      <fo:region-after extent="2cm"/>
    </fo:simple-page-master>
-->

    <!-- layout for the first page -->
    <fo:simple-page-master master-name="noheaders_center"
        page-height="250mm"
        page-width="176mm"
        margin-top="10mm"
        margin-bottom="20mm"
        margin-left="25mm"
        margin-right="25mm">
        <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
    </fo:simple-page-master>

      <fo:simple-page-master master-name="headers_right"
          page-height="250mm"
          page-width="176mm"
          margin-top="10mm"
          margin-bottom="20mm"
          margin-left="30mm"
          margin-right="20mm">
      <fo:region-body margin-top="1cm" margin-bottom="2cm"/>
      <fo:region-before extent="1cm" region-name="region-before-odd"/>
      <fo:region-after extent="2cm"/>
    </fo:simple-page-master>

      <fo:simple-page-master master-name="headers_left"
          page-height="250mm"
          page-width="176mm"
          margin-top="10mm"
          margin-bottom="20mm"
          margin-left="20mm"
          margin-right="30mm">
      <fo:region-body margin-top="1cm" margin-bottom="2cm"/>
      <fo:region-before extent="1cm" region-name="region-before-even"/>
      <fo:region-after extent="2cm"/>
    </fo:simple-page-master>



     <fo:page-sequence-master master-name="run1">
      <fo:repeatable-page-master-reference master-reference="noheaders_center"
        maximum-repeats="4"/>
    </fo:page-sequence-master>


    <fo:page-sequence-master master-name="run2">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference
          master-reference="headers_right"
          odd-or-even="odd" />
        <fo:conditional-page-master-reference
          master-reference="headers_left"
          odd-or-even="even" />
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

  </fo:layout-master-set>


      <!-- bookmark section -->
    <fo:bookmark-tree>
        <fo:bookmark internal-destination="preface">
            <fo:bookmark-title>Tulkotāja priekšvārds</fo:bookmark-title>
	      <!--
	      <xsl:for-each select="PLAY/SECTION[@class='preface']/SUBSECTION">
                <fo:bookmark>
		    <xsl:attribute name="internal-destination">preface_<xsl:value-of select="position()"/></xsl:attribute>
                    <fo:bookmark-title><xsl:value-of select="TITLE"/></fo:bookmark-title>
                </fo:bookmark>
	      </xsl:for-each>
	      -->
        </fo:bookmark>
        <fo:bookmark internal-destination="personae">
            <fo:bookmark-title>Darbojošās personas</fo:bookmark-title>
        </fo:bookmark>
        <fo:bookmark internal-destination="act1">
            <fo:bookmark-title>1.cēliens</fo:bookmark-title>
            <fo:bookmark internal-destination="act1-1"><fo:bookmark-title>1.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act1-2"><fo:bookmark-title>2.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act1-3"><fo:bookmark-title>3.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act1-4"><fo:bookmark-title>4.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act1-5"><fo:bookmark-title>5.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act1-6"><fo:bookmark-title>6.aina</fo:bookmark-title></fo:bookmark>
        </fo:bookmark>
        <fo:bookmark internal-destination="act2">
            <fo:bookmark-title>2.cēliens</fo:bookmark-title>
            <fo:bookmark internal-destination="act2-1"><fo:bookmark-title>1.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2-2"><fo:bookmark-title>2.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2-3"><fo:bookmark-title>3.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2-4"><fo:bookmark-title>4.aina</fo:bookmark-title></fo:bookmark>
        </fo:bookmark>
        <fo:bookmark internal-destination="act2b">
            <fo:bookmark-title>2.cēliens, 2.daļa</fo:bookmark-title>
            <fo:bookmark internal-destination="act2b-1"><fo:bookmark-title>1.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2b-2"><fo:bookmark-title>2.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2b-3"><fo:bookmark-title>3.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2b-4"><fo:bookmark-title>4.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2b-5"><fo:bookmark-title>5.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2b-6"><fo:bookmark-title>6.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2b-7"><fo:bookmark-title>7.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act2b-8"><fo:bookmark-title>8.aina</fo:bookmark-title></fo:bookmark>
        </fo:bookmark>
        <fo:bookmark internal-destination="act3">
            <fo:bookmark-title>3.cēliens</fo:bookmark-title>
            <fo:bookmark internal-destination="act3-1"><fo:bookmark-title>1.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act3-2"><fo:bookmark-title>2.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act3-3"><fo:bookmark-title>3.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act3-4"><fo:bookmark-title>4.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act3-5"><fo:bookmark-title>5.aina</fo:bookmark-title></fo:bookmark>
            <fo:bookmark internal-destination="act3-6"><fo:bookmark-title>6.aina</fo:bookmark-title></fo:bookmark>
        </fo:bookmark>
        <fo:bookmark internal-destination="notes">
            <fo:bookmark-title>Tulkotāja piezīmes</fo:bookmark-title>
        </fo:bookmark>
    </fo:bookmark-tree>

  <fo:page-sequence master-reference="run1"  initial-page-number="1">

<!--
      <fo:static-content flow-name="xsl-region-before">
      <fo:block text-align="end"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <xsl:value-of select="PLAY/FM/P[@class='play.title']"/> - <fo:page-number/>
      </fo:block>
    </fo:static-content>

    -->




    <fo:flow flow-name="xsl-region-body">

    <!-- vaaks -->
    <fo:block margin-top="-20mm" margin-left="0mm">
    <fo:external-graphic src="musas_150_nav.jpg" border="solid 0.1pt" content-width="140mm"  background-color="white"/>
    </fo:block>


    <!-- tuksha lapa-->
    <fo:block font-size="24pt"
            font-family="Verdana"
            line-height="24pt"
            space-after.optimum="15pt"
            text-align="center"
            padding-top="3pt"
	    break-before="page">
          &#xA0;
    </fo:block>


      <fo:block font-size="20pt"
            font-family="Verdana"
            line-height="20pt"
            space-after.optimum="10pt"
            text-align="center"
            padding-top="3pt"
	    break-before="page">
        <xsl:value-of select="PLAY/FM/P[@class='play.author']"/>
      </fo:block>

      <fo:block font-size="20pt"
            font-family="Verdana"
            line-height="20pt"
            space-after.optimum="10pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">
        <xsl:value-of select="PLAY/FM/P[@class='play.title']"/>
      </fo:block>


      <fo:block font-size="14pt"
            font-family="Verdana"
            line-height="14pt"
            space-after.optimum="6pt"
            text-align="center"
	    font-style="italic"
            padding-top="3pt">
         <xsl:value-of select="PLAY/FM/P[@class='original.author']"/>. 
   	<xsl:value-of select="PLAY/FM/P[@class='original.title']"/>
      </fo:block>


      <fo:block font-size="12pt"
            font-family="Verdana"
	    margin-top="14em"
            line-height="12pt"
            space-after.optimum="12pt"
            text-align="center"
            padding-top="3pt">        
	<xsl:value-of select="PLAY/FM/P[@class='description']"/>
      </fo:block>


      <fo:block font-size="12pt"
            font-family="Verdana"
            line-height="12pt"
            space-after.optimum="12pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="0pt">        
	<xsl:value-of select="PLAY/FM/P[@class='translator']"/>
      </fo:block>


      <fo:block font-size="12pt"
            font-family="Verdana"
            line-height="12pt"
	    margin-top="14em"
            space-after.optimum="12pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">        
	<xsl:value-of select="PLAY/FM/P[@class='place.time']"/>
      </fo:block>


      <xsl:for-each select="PLAY/FM/P[not(@class)]">
      <fo:block font-size="10pt"
            font-family="Verdana"
            line-height="10pt"
            space-after.optimum="4pt"
            background-color="white"
            color="black"
            text-align="justify"
            padding-top="3pt">
	<xsl:attribute name="break-before">
	<xsl:if test="position()=1">page</xsl:if>
	<xsl:if test="position()&gt;1">auto</xsl:if>
	</xsl:attribute>
	<xsl:apply-templates select="." mode="firstpage"/>
      </fo:block>
      </xsl:for-each>


      <fo:block font-size="10pt"
            font-family="Verdana"
            line-height="10pt"
            space-after.optimum="4pt"
            background-color="white"
            color="black"
            text-align="justify"
            padding-top="3pt"> 
<!--    <fo:external-graphic src="copyleft1.tif"/> -->

<fo:instream-foreign-object content-width="10pt" content-height="10pt" baseline-shift="-10%">
<svg xmlns="http://www.w3.org/2000/svg" version="1.0" viewBox="0 0 196 196">
<circle cx="98" cy="98" r="88" fill="none" stroke="black" stroke-width="20" />
<path d="M 97.28125,43 C 71.21839,43 49.38119,61.152555 43.71875,85.5 L 70,85.5 
C 74.741911,75.172905 85.17979,68 97.28125,68 C 113.84124,67.999998 127.28125,81.44 127.28125,98 
C 127.28124,114.56 113.84125,128 97.28125,128 C 85.17978,128 74.741911,120.8271 70,110.5 L 43.71875,110.5 
C 49.38118,134.84745 71.21838,153 97.28125,153 C 127.64125,153 152.28124,128.36 152.28125,98 
C 152.28125,67.64 127.64124,42.999998 97.28125,43 z" style="fill:#000" /></svg> </fo:instream-foreign-object>   
	    Copyleft. Translation by Vilnis Zariņš, 2009. Use and distribute this translation for non-commercial purposes only. If you alter, transform, or build upon this work, please retain this copyleft notice.
      </fo:block>



<fo:block font-size="14pt" 
font-family="Verdana" 
line-height="10pt" 
space-before="2em"
space-after.optimum="15pt">Saturs</fo:block>


<fo:table table-layout="fixed" width="100%" border-collapse="separate">
<fo:table-column column-width="12cm"/>
<fo:table-column column-width="1cm"/>
<fo:table-body font-size="10pt" font-family="Verdana">

<fo:table-row line-height="12pt">
<!-- <fo:table-cell><fo:block text-align="end">(A)</fo:block></fo:table-cell> -->
<fo:table-cell>
<fo:block  text-align-last="justify">
<fo:basic-link color="blue" internal-destination="preface">Tulkotāja 
priekšvārds</fo:basic-link>&#xA0;<fo:leader leader-pattern="dots"/>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="preface"/></fo:block>
</fo:table-cell>
</fo:table-row>


<fo:table-row line-height="12pt">
<!-- <fo:table-cell><fo:block text-align="end">(A)</fo:block></fo:table-cell> -->
<fo:table-cell>
<fo:block  text-align-last="justify">
<fo:basic-link color="blue" internal-destination="personae">Darbojošās personas</fo:basic-link>&#xA0;<fo:leader leader-pattern="dots"/>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="personae"/></fo:block>
</fo:table-cell>
</fo:table-row>


<fo:table-row line-height="12pt">
<!-- <fo:table-cell><fo:block text-align="end">(A)</fo:block></fo:table-cell> -->
<fo:table-cell>
<fo:block text-align-last="justify">
<fo:basic-link color="blue" internal-destination="act1">1. cēliens</fo:basic-link>&#xA0;<fo:leader leader-pattern="dots"/>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="act1"/></fo:block>
</fo:table-cell>
</fo:table-row>

<fo:table-row line-height="12pt">
<!-- <fo:table-cell><fo:block text-align="end">(A)</fo:block></fo:table-cell> -->
<fo:table-cell>
<fo:block  text-align-last="justify">
<fo:basic-link color="blue" internal-destination="act2">2. cēliens</fo:basic-link>&#xA0;<fo:leader leader-pattern="dots"/>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="act2"/></fo:block>
</fo:table-cell>
</fo:table-row>

<fo:table-row line-height="12pt">
<!-- <fo:table-cell><fo:block text-align="end">(A)</fo:block></fo:table-cell> -->
<fo:table-cell>
<fo:block  text-align-last="justify">
<fo:basic-link color="blue" internal-destination="act2b">2. cēliens, 2. daļa</fo:basic-link>&#xA0;<fo:leader leader-pattern="dots"/>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="act2b"/></fo:block>
</fo:table-cell>
</fo:table-row>

<fo:table-row line-height="12pt">
<!-- <fo:table-cell><fo:block text-align="end">(A)</fo:block></fo:table-cell> -->
<fo:table-cell>
<fo:block text-align-last="justify">
<fo:basic-link color="blue" internal-destination="act3">3. cēliens</fo:basic-link>&#xA0;<fo:leader leader-pattern="dots"/>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="act3"/></fo:block>
</fo:table-cell>
</fo:table-row>


<fo:table-row line-height="12pt">
<!-- <fo:table-cell><fo:block text-align="end">(A)</fo:block></fo:table-cell> -->
<fo:table-cell>
<fo:block text-align-last="justify">
<fo:basic-link color="blue" internal-destination="notes">Tulkotāja piezīmes</fo:basic-link>&#xA0;<fo:leader leader-pattern="dots"/>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="end"><fo:page-number-citation ref-id="notes"/></fo:block>
</fo:table-cell>
</fo:table-row>


</fo:table-body>
</fo:table>






      </fo:flow>
  </fo:page-sequence>







  <fo:page-sequence master-reference="run2" initial-page-number="3">


    <fo:static-content flow-name="region-before-odd">
      <fo:block text-align="end"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        Tulkotāja priekšvārds&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<fo:page-number/>
      </fo:block>
    </fo:static-content>

    <fo:static-content flow-name="region-before-even">
      <fo:block text-align="start"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <fo:page-number/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:value-of select="/PLAY/FM/P[@class='play.author']"/>. <xsl:value-of select="/PLAY/FM/P[@class='play.title']"/>
      </fo:block>
    </fo:static-content>



    <fo:static-content flow-name="xsl-region-after">
      <fo:block text-align="end"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <!-- <fo:page-number/>. lpp. -->
      </fo:block>
    </fo:static-content>

    
    <fo:flow flow-name="xsl-region-body">

      <xsl:apply-templates select="PLAY/SECTION[@class='preface']"/>

    </fo:flow>
   </fo:page-sequence>







  <fo:page-sequence master-reference="run2" initial-page-number="auto">


    <fo:static-content flow-name="region-before-odd">
      <fo:block text-align="end"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        Darbojošās personas&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<fo:page-number/>
      </fo:block>
    </fo:static-content>

    <fo:static-content flow-name="region-before-even">
      <fo:block text-align="start"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <fo:page-number/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:value-of select="/PLAY/FM/P[@class='play.author']"/>. <xsl:value-of select="/PLAY/FM/P[@class='play.title']"/>
      </fo:block>
    </fo:static-content>



    <fo:static-content flow-name="xsl-region-after">
      <fo:block text-align="end"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <!-- <fo:page-number/>. lpp. -->
      </fo:block>
    </fo:static-content>


    <fo:flow flow-name="xsl-region-body">
      <xsl:apply-templates select="PLAY/PLAYSUBT"/>

      <xsl:apply-templates select="PLAY/PERSONAE"/>
    </fo:flow>
   </fo:page-sequence>





  <xsl:apply-templates select="PLAY/ACT"/>



  <fo:page-sequence master-reference="run2" initial-page-number="auto">


    <fo:static-content flow-name="region-before-odd">
      <fo:block text-align="end"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        Tulkotāja piezīmes&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<fo:page-number/>
      </fo:block>
    </fo:static-content>

    <fo:static-content flow-name="region-before-even">
      <fo:block text-align="start"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <fo:page-number/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:value-of select="/PLAY/FM/P[@class='play.author']"/>. <xsl:value-of select="/PLAY/FM/P[@class='play.title']"/>
      </fo:block>
    </fo:static-content>



    <fo:static-content flow-name="xsl-region-after">
      <fo:block text-align="end"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <!-- <fo:page-number/>. lpp. -->
      </fo:block>
    </fo:static-content>


    <fo:flow flow-name="xsl-region-body">
      <xsl:apply-templates select="PLAY/SECTION[@class='notes']"/>
    </fo:flow>
   </fo:page-sequence>

  </fo:root>  
  </xsl:template>

  <xsl:template match="P" mode="firstpage">
      <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="PLAY/SECTION">
      <fo:block id="{@id}" font-size="{$h1-fontsize}"
            font-family="Verdana"
	    break-before="page"
            line-height="18pt"
            space-after.optimum="15pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">        
	<xsl:value-of select="TITLE"/>
      </fo:block>

      <xsl:apply-templates select="SUBSECTION|OL|P"/>
  </xsl:template>


  <xsl:template match="PLAY/SECTION/SUBSECTION">
      <fo:block id="{@id}" font-size="{$h2-fontsize}"
            space-before="16pt"
            page-break-after="avoid"
            font-family="Verdana"
            line-height="16pt"
            space-after.optimum="15pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">        
	<xsl:value-of select="TITLE"/>
      </fo:block>
     <xsl:apply-templates select="P"/>
  </xsl:template>



  <xsl:template match="PLAY/PLAYSUBT">
    <fo:block font-size="{$h2-fontsize}"
            font-family="DejaVuSansCondensed"
	    break-before="page"
            line-height="16pt"
            space-after.optimum="15pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">        
	<xsl:value-of select="."/>
      </fo:block>

  </xsl:template>




  <xsl:template match="PLAY/PERSONAE">
 <fo:block id="{@id}" font-size="{$h2-fontsize}"
            font-family="DejaVuSansCondensed"
            line-height="16pt"
            space-after.optimum="15pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">        
	<xsl:value-of select="TITLE"/>
      </fo:block>

   <xsl:for-each select="PGROUP">
    <xsl:for-each select="PERSONA">
      <fo:block font-size="{$p-speaker-fontsize}"
                font-family="{$p-speaker-fontfamily}"
                line-height="{$p-speaker-fontsize}"
		margin-left="72pt"
                text-align="left">
	<xsl:attribute name="space-after.optimum">
<xsl:if test="position()=last()">12pt</xsl:if>
<xsl:if test="position()&lt;last()">3pt</xsl:if>
        </xsl:attribute>
        <xsl:value-of select="."/>
      </fo:block>
    </xsl:for-each>
   </xsl:for-each>
  </xsl:template>

  <xsl:template match="PLAY/ACT">


  <fo:page-sequence master-reference="run2" initial-page-number="auto">


    <fo:static-content flow-name="region-before-odd">
      <fo:block text-align="end"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <xsl:value-of select="@title"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<fo:page-number/>
      </fo:block>
    </fo:static-content>

    <fo:static-content flow-name="region-before-even">
      <fo:block text-align="start"
      border-after-color="black"
border-after-style="solid"
border-after-width="0.5pt"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <fo:page-number/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:value-of select="/PLAY/FM/P[@class='play.author']"/>. <xsl:value-of select="/PLAY/FM/P[@class='play.title']"/>
      </fo:block>
    </fo:static-content>



    <fo:static-content flow-name="xsl-region-after">
      <fo:block text-align="end"
            font-size="{$header-fontsize}"
            font-family="Verdana"
            line-height="14pt">
        <!-- <fo:page-number/>. lpp. -->
      </fo:block>
    </fo:static-content>

    
    <fo:flow flow-name="xsl-region-body">




      <fo:block id="{@id}" font-size="{$h1-fontsize}"
            font-family="DejaVuSansCondensed"
	    break-before="page"
            line-height="{$h1-fontsize}"
            space-after.optimum="15pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">        
	<xsl:value-of select="TITLE"/>
      </fo:block>

      <fo:block font-size="{$h2-fontsize}"
                font-family="DejaVuSansCondensed"
                line-height="{$h2-fontsize}"
                space-after.optimum="3pt"
                text-align="justify">
        <xsl:value-of select="SUBTITLE"/>
      </fo:block>


    <xsl:apply-templates select="SCENE"/>


</fo:flow>
</fo:page-sequence>


  </xsl:template>



  <xsl:template match="SCENE">
      <fo:block id="{@id}" font-size="{$h2-fontsize}"
            page-break-after="avoid"
            font-family="DejaVuSansCondensed"
            line-height="{$h2-fontsize}"
            space-after.optimum="15pt"
            background-color="white"
            color="black"
            text-align="center"
            padding-top="3pt">
	    <xsl:attribute name="space-before">
	    <xsl:if test="position()=1">12pt</xsl:if>
	    <xsl:if test="position()&gt;1">72pt</xsl:if>
	    </xsl:attribute>
	<xsl:value-of select="TITLE"/>
      </fo:block>


      <xsl:apply-templates select="STAGEDIR|SPEECH"/>
  </xsl:template>


  <xsl:template match="SCENE/STAGEDIR|SPEECH/STAGEDIR">
      <fo:block margin-left="5em" margin-right="5em"
                page-break-after="avoid"
                font-size="{$p-stagedir-fontsize}"
                font-family="{$p-stagedir-fontfamily}"
                line-height="{$p-stagedir-fontsize}"
                space-after.optimum="3pt"
                text-align="left">
        <xsl:apply-templates/>
      </fo:block>
  </xsl:template>


  <xsl:template match="SPEAKER/STAGEDIR">
     <fo:inline font-size="{$p-stagedir-fontsize}"
                font-family="{$p-stagedir-fontfamily}"
                line-height="{$p-stagedir-fontsize}">
        <xsl:value-of select="."/>
      </fo:inline>
  </xsl:template>

  <xsl:template match="SPEECH">
        <xsl:apply-templates select="SPEAKER|LINE|STAGEDIR"/>
  </xsl:template>

  <xsl:template match="SPEAKER">
      <fo:block font-size="{$p-speaker-fontsize}"
                space-before="9pt"
                page-break-after="avoid"
                font-family="{$p-speaker-fontfamily}"
                line-height="{$p-speaker-fontsize}"
                space-after.optimum="3pt"
                text-align="center">
          <xsl:apply-templates/>
      </fo:block>
  </xsl:template>

  <xsl:template match="LINE">
      <fo:block font-size="{$p-line-fontsize}"
                font-family="Garamond"
                line-height="{$p-line-lineheight}"
                space-after.optimum="3pt"
                text-align="justify">
          <xsl:apply-templates/>
      </fo:block>
  </xsl:template>

  <xsl:template match="I">
      <fo:inline font-style="italic">
        <xsl:value-of select="."/>
      </fo:inline>
  </xsl:template>

  <xsl:template match="B">
      <fo:inline font-weight="bold">
        <xsl:value-of select="."/>
      </fo:inline>
  </xsl:template>


  <xsl:template match="text()">
     <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="ANCHOR">
     <fo:inline font-size='.75em'
             baseline-shift='super'>
        <xsl:value-of select="count(preceding::ANCHOR)+1"/>
     </fo:inline>
  </xsl:template>


  <xsl:template match="OL">
    <fo:block text-align="justify">
      <fo:list-block 
         provisional-distance-between-starts="0.7cm"
         provisional-label-separation="0.15cm">


        <xsl:for-each select="LI">
          <fo:list-item start-indent="0.5cm">
            <fo:list-item-label end-indent="label-end()">
               <fo:block  font-size="{$p-li-fontsize}" 
          font-family="Garamond"  
	  line-height="{$p-li-fontsize}" 
	  space-after.optimum="3pt" 
	  text-align="end">
	  <xsl:value-of select="position()"/>.
               </fo:block>
             </fo:list-item-label>

          <fo:list-item-body start-indent="body-start()">
            <fo:block font-size="{$p-li-fontsize}" 
          font-family="Garamond"  
	  line-height="{$p-li-lineheight}" 
	  space-after.optimum="3pt" 
	  text-align="justify">
            <xsl:value-of select="."/>
          </fo:block>
       </fo:list-item-body>
    </fo:list-item>
   </xsl:for-each>

  </fo:list-block>
</fo:block>

  </xsl:template>

  <xsl:template match="P">
      <fo:block font-size="{$p-note-fontsize}"
                font-family="Garamond"
                line-height="{$p-note-lineheight}"
                space-after.optimum="3pt"
                text-align="justify">
        <xsl:value-of select="."/>
      </fo:block>
  </xsl:template>

</xsl:stylesheet>
