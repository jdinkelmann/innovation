<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:essay="http://www.gale.com/goldschema/essay"
	xmlns:gift-doc="http://www.gale.com/goldschema/gift-doc" xmlns:pres="http://www.gale.com/goldschema/pres"
	xmlns:vault-link="http://www.gale.com/goldschema/vault-linking"
	xmlns:meta="http://www.gale.com/goldschema/metadata"
	exclude-result-prefixes="gift-doc pres essay vault-link meta">

	<xsl:template match="//essay:div[@document-segment-type='Table of contents' or @term-id='17200455']" />

	<xsl:template match="//vault-link:vault-link"/>

</xsl:stylesheet>