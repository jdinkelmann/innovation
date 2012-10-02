<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:meta="http://www.gale.com/goldschema/metadata"
	xmlns:media="http://www.gale.com/goldschema/media"
	xmlns:essay="http://www.gale.com/goldschema/essay"
	xmlns:gift-doc="http://www.gale.com/goldschema/gift-doc"
	xmlns:pres="http://www.gale.com/goldschema/pres"
	xmlns:vault-link="http://www.gale.com/goldschema/vault-linking"
	xmlns:list="http://www.gale.com/goldschema/list"
	xmlns:shared="http://www.gale.com/goldschema/shared"
	xmlns:ext="xalan://com.gale.asl.model.document.DocumentBase"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="meta media essay gift-doc pres vault-link list shared ext fn">

	<xsl:param name="document" />
	<xsl:param name="callistoUrl" />
	<xsl:param name="contentSet" />
	<xsl:param name="portletContextPath" />
	<xsl:param name="hasImage" />
	<xsl:param name="hasFullText" />

	<xsl:include href="xslt/HostedPDF.xslt" />

	<xsl:template match="//media:image[child::vault-link:vault-link[child::vault-link:link-type/text()='external' and child::vault-link:action/text()='embed' and child::vault-link:data-type/text() = 'image/jpeg']]">
           	<xsl:variable name="imageDocument" select="substring-before(./vault-link:vault-link/vault-link:where/vault-link:path,'.jpg')" />
           	<xsl:variable name="imageDescription" select="media:caption" />
		   	<xsl:variable name="altDescription" select="@alt" />
		   	<xsl:variable name="metaTermValue" select="./meta:descriptive-indexing/meta:indexing-term/meta:term/meta:term-value"/>
		    <xsl:if test="normalize-space($metaTermValue) != 'Table'">
			   <xsl:variable name="src" select="concat($callistoUrl,'/',$contentSet,'/',$imageDocument)" />
		       <a name="{$imageDocument}" class="inline_image">
					<img style="border:0" src="http://callisto11.ggimg.com/imgsrv/FastFetch/UBER2/{$imageDocument}" width="{@width}" height="{@height}" alt="{$altDescription}" title="{$altDescription}" />
				</a>
			</xsl:if>
	</xsl:template>

	<xsl:template match="shared:media[child::media:image[@image-type='inline' and (@data-type='jpg' or @data-type='jpeg')][child::vault-link:vault-link[child::vault-link:link-type/text() = 'external' and child::vault-link:action/text() = 'embed']]]">
		<xsl:if test="$hasImage='true'">
            <xsl:variable name="imageDocument" select="substring-before(media:image[@image-type='inline']/vault-link:vault-link/vault-link:where/vault-link:path,'.jpg')" />
            <xsl:variable name="imageDescription" select="media:image[@image-type='inline']/vault-link:vault-link/vault-link:display-link" />
			<xsl:variable name="documentId" select="media:image[@image-type='document view']/vault-link:vault-link/vault-link:where/vault-link:path" />
			<xsl:variable name="altDescription" select="media:image[@image-type='document view']/vault-link:vault-link/vault-link:display-link" />
			<xsl:variable name="src" select="concat($callistoUrl,'/',$contentSet,'/',$imageDocument)" />
	        <a name="{$imageDocument}" class="inline_image">
				<xsl:if test="$documentId != ''">
					<xsl:attribute name="href">
						<xsl:value-of select="concat($portletContextPath,'/DocumentDispatcherPage/DocumentDispatcherWindow?action=1&amp;javax.portlet.action=doForward&amp;windowstate=normal&amp;documentId=GALE|',$documentId,'&amp;mode=view')" />
					</xsl:attribute>
				</xsl:if>
				<img style="border:0" src="{$src}" alt="{$altDescription}" title="{$altDescription}" />
	        </a>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>