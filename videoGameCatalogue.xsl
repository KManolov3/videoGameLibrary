<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:str="http://exslt.org/strings">
	<xsl:output method="xml" version="1.0" indent="yes"/>
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm" master-name="page">
					<fo:region-body margin="20mm 0mm 20mm 0mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="page">
				<fo:flow flow-name="xsl-region-body">
					<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
						<fo:block position="absolute" text-align="center" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="48pt" padding-before="50mm" color="black">
							<fo:block margin-bottom="50mm">
								Catalogue of Genre-defining Video Games
							</fo:block>
							<fo:external-graphic src="url('images/controller.jpg')" margin-left="5cm" margin-bottom="15mm" content-height="200pt" content-width="200pt"/>
						</fo:block>
					</fo:block-container>
				</fo:flow>
			</fo:page-sequence>
			<xsl:for-each select="catalogue/studios/studio">
				<fo:page-sequence master-reference="page">
					<fo:flow flow-name="xsl-region-body">
						<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
							<fo:block position="absolute" text-align="center" padding-before="12mm" margin-left="2cm" font-family="Monotype Corsiva" font-size="40pt" color="black">
								<xsl:value-of select="studio_name"/>
							</fo:block>
							<fo:block position="absolute" text-align="center" font-weight="bold" margin-left="2cm" padding-before="20mm" color="black">
								<xsl:apply-templates select="."/>
							</fo:block>
							<fo:block position="relative" font-family="Roboto" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Headquarters: 
							</fo:block>
							<fo:block position="relative" font-family="Calibri" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
								<xsl:value-of select="headquarters"/>
							</fo:block>
							<fo:block position="relative" font-family="Roboto" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Company was founded on: 
							</fo:block>
							<fo:block position="relative" font-family="Calibri" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
								<xsl:value-of select="date_founded"/>
							</fo:block>
							
							<xsl:if test="not(parent_company = 'N/A')">
								<fo:block position="relative" font-family="Roboto" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
									<xsl:value-of select="studio_name"/>
									is part of: 
								</fo:block>
								<fo:block position="relative" font-family="Calibri" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
									<xsl:value-of select="parent_company"/>
								</fo:block>
							</xsl:if>							
							
							<fo:block position="relative" font-family="Roboto" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Video games developed by 
								<xsl:value-of select="studio_name"/>:
							</fo:block>
							<xsl:for-each select="id(@gameRef)">
								<fo:block position="relative" font-family="Calibri" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
									<xsl:value-of select="video_game_name"/>
								</fo:block>
							</xsl:for-each>
						</fo:block-container>
					</fo:flow>
				</fo:page-sequence>
			</xsl:for-each>
			<xsl:for-each select="catalogue/video_games/video_game">
				<fo:page-sequence master-reference="page">
					<fo:flow flow-name="xsl-region-body">
						<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
							<fo:block position="absolute" text-align="center" padding-before="12mm" margin-left="2cm" font-family="Times New Roman" font-size="40pt" color="black">
								<xsl:apply-templates select="."/>
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Developed by: 
								<xsl:variable name="studioRef">
									<xsl:value-of select="@studioRef"/>
								</xsl:variable>
								
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
									<xsl:value-of select="//studio[@studioID=$studioRef]/studio_name"/>
								</fo:inline>
							</fo:block>
							
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Game genre: 
								<xsl:variable name="genreRef">
									<xsl:value-of select="@genreRef"/>
								</xsl:variable>
								
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
									<xsl:value-of select="//genre[@genreID=$genreRef]/genre_name"/>
								</fo:inline>
							</fo:block>
							
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Date Published: 
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
									<xsl:value-of select="date_published"/>
								</fo:inline>
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Price: 
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
									<xsl:value-of select="price"/>
								</fo:inline>
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Metacritic Score: 
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
									<xsl:value-of select="metacritic_score"/>
								</fo:inline>
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								PG: 
								<fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
									<xsl:value-of select="parental_guidance"/>
								</fo:inline>
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Description: 
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
								<xsl:value-of select="description"/>
							</fo:block>
							
							<fo:block position="absolute" text-align = "center" padding-before = "5mm" padding-after = "5mm" margin-left="2cm">
								<xsl:apply-templates select="gameplay_images/gameplay_image_upper"/>
							</fo:block>
							
							
						</fo:block-container>
					</fo:flow>
				</fo:page-sequence>
				<fo:page-sequence master-reference="page">
					<fo:flow flow-name="xsl-region-body">
						<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Platforms supported: 
							</fo:block>
							<xsl:for-each select="platforms/platform">
								<fo:block position="relative" font-family="Arial" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
									<xsl:value-of select="."/>
								</fo:block>
							</xsl:for-each>
									
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Franchise Name: 
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
								<xsl:value-of select="franchise_name"/>
							</fo:block>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Game Modes: 
							</fo:block>
							<xsl:for-each select="game_modes/game_mode">
								<fo:block position="relative" font-family="Arial" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
									<xsl:value-of select="."/>
								</fo:block>
							</xsl:for-each>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Additional Content: 
							</fo:block>
							<xsl:for-each select="additional_content/content">
								<fo:block position="relative" font-family="Arial" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
									<xsl:value-of select="name"/>, 
									<xsl:value-of select="type"/> released on
									<xsl:value-of select="date_published"/>
								</fo:block>
							</xsl:for-each>
							<fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" padding-before="5mm" margin-left="2cm">
								Awards received: 
							</fo:block>
							<xsl:for-each select="awards/award">
								<fo:block position="relative" font-family="Arial" font-size="14pt" color="black" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
									<xsl:value-of select="."/>
								</fo:block>
							</xsl:for-each>
							<fo:block position="absolute" text-align = "center" padding-before = "5mm" padding-after = "5mm" margin-left="2cm">
								<xsl:apply-templates select="gameplay_images/gameplay_image_lower"/>
							</fo:block>
						</fo:block-container>
					</fo:flow>
				</fo:page-sequence>
			</xsl:for-each>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="studio">
		<fo:external-graphic margin-left="5cm" margin-bottom="15mm" content-height="300pt" content-width="300pt">
			<xsl:attribute name="src">
				url('images/studios/<xsl:value-of select="@studioID"/>.jpg')
			</xsl:attribute>
		</fo:external-graphic>
	</xsl:template>
	
	
	<xsl:template match="video_game">
		<fo:external-graphic margin-left="5cm" margin-bottom="15mm" content-height="400pt" content-width="400pt">
			<xsl:attribute name="src">
				url('images/games/<xsl:value-of select="@gameID"/>.jpg')
			</xsl:attribute>
		</fo:external-graphic>
	</xsl:template>
	
	<xsl:template match="gameplay_image_upper">
		<fo:external-graphic margin-left="5cm" margin-bottom="15mm" content-height="230pt" content-width="500pt">
			<xsl:attribute name="src">
				url('images/games/<xsl:value-of select="@href"/>.jpg')
			</xsl:attribute>
		</fo:external-graphic>
	</xsl:template>
	
	<xsl:template match="gameplay_image_lower">
		<fo:external-graphic margin-left="5cm" margin-bottom="15mm" content-height="300pt" content-width="500pt">
			<xsl:attribute name="src">
				url('images/games/<xsl:value-of select="@href"/>.jpg')
			</xsl:attribute>
		</fo:external-graphic>
	</xsl:template>
	
</xsl:stylesheet>
