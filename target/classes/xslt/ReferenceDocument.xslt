<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:meta="http://www.gale.com/goldschema/metadata"
	xmlns:media="http://www.gale.com/goldschema/media" xmlns:essay="http://www.gale.com/goldschema/essay"
	xmlns:gift-doc="http://www.gale.com/goldschema/gift-doc" xmlns:pres="http://www.gale.com/goldschema/pres"
	xmlns:vault-link="http://www.gale.com/goldschema/vault-linking"
	xmlns:list="http://www.gale.com/goldschema/list"
	xmlns:verse="http://www.gale.com/goldschema/verse"
	xmlns:table="http://www.gale.com/goldschema/table"
	exclude-result-prefixes="meta media essay gift-doc pres vault-link list verse table">

	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:include href="xslt/BoldItalicsAndPStyles.xslt" />
	<xsl:include href="xslt/CommonExclusions.xslt" />

	<xsl:template match="/gift-doc:document">
		<h1> 
          <xsl:value-of select="//meta:title-display"/> 
     	</h1>
	</xsl:template>
	<xsl:template match="/gift-doc:document/gift-doc:body">
		<h1> 
          <xsl:value-of select="//essay:pre"/> 
     	</h1>
	</xsl:template>
</xsl:stylesheet>