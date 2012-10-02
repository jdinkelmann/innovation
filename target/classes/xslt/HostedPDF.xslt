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

	<xsl:template match="shared:media/media:image[@image-type='document view' and @data-type='pdf']">
		<xsl:if test="$hasImage='true' or $hasFullText='true'">
			<xsl:apply-templates select="vault-link:vault-link" mode="pdf-page" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="shared:media/media:image[@image-type='page view']" mode="pdf-page">
		<xsl:if test="$hasImage='true' or $hasFullText='true'">
			<xsl:apply-templates select="vault-link:vault-link" mode="pdf-page" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="vault-link:vault-link" mode="pdf-page">
		<xsl:variable name="linkType" select="vault-link:link-type" />
		<xsl:variable name="action" select="vault-link:action" />
		<xsl:if test="$linkType = 'external' and $action = 'point'">
			<xsl:variable name="pdfId" select="vault-link:where/vault-link:path" />
			<xsl:value-of select="ext:addPdfPage($document, $pdfId)" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="gift-doc:node-metadata" mode="pdf-page">
		<xsl:if test="$hasImage='true' or $hasFullText='true'">
			<xsl:apply-templates select="gift-doc:pagination-group/gift-doc:pagination" mode="pdf-page"/>
			<xsl:apply-templates select="meta:pdf-page-range" mode="pdf-page"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="gift-doc:pagination" mode="pdf-page">
		<xsl:variable name="totalPages" select="meta:total-pages" />
	    <xsl:value-of select="ext:setPdfPageCount($document, $totalPages)" />
	</xsl:template>

	<xsl:template match="meta:pdf-page-range" mode="pdf-page">
		<xsl:variable name="beginPage" select="meta:begin-page" />
		<xsl:variable name="endPage" select="meta:end-page" />
		<xsl:value-of select="ext:addPdfPage($document, $beginPage)" />
		<xsl:value-of select="ext:addPdfPage($document, $endPage)" />
	</xsl:template>

</xsl:stylesheet>