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

	<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes" />

	<xsl:include href="xslt/BoldItalicsAndPStyles.xslt" />
	<xsl:include href="xslt/CommonExclusions.xslt" />

	<xsl:template match="/gift-doc:document">
		<html>
			<head>
				<title>U.S. History in Context</title>
				<link rel="stylesheet" type="text/css" href="/style/bootstrap.css" />
   				<link rel="stylesheet" type="text/css" href="/style/main.css" />
   				<script src="http://code.jquery.com/jquery-1.7.1.min.js">//</script>
			    <script src="/scripts/jquery.url.js" >//</script>
			   	<script type="text/javascript" src="http://appdev.ng.cengage.com/static/steal/steal.js" >//</script> 
			   	<script type="text/javascript"  src="/scripts/searchAndGetResults.js" >//</script>
			</head>
			<body>
				<div id="galeContentWrapper" class="history">
				   	<header>
				         <img src="/images/logo.png" />
				         <form name="search" class="form-horizontal">
				            <input type="hidden" value="ZXAA-MOD1|ZXACC-MOD1|ZXAL-VRL|ZXAE-VRL|History-US-Misc" name="contentSets" id="contentSets" />
				            <input type="hidden" value="History-Reference" name="displayGroups" id="displayGroups" />
				            <label for="search">Locate U.S. History Aritcles</label>
				            <div class="input-append">
				                   <input id="query" name="query" class="span4" type="search" />
				                   <button id="submitSearch" class="btn" type="button">Go!</button>
				            </div>
				         </form>
				    </header>
				    <div id="documentBody">
				    	<div class="back">
				    		<a href="#">Back to results</a>
				    	</div>
						<xsl:apply-templates select="gift-doc:body" />
						<xsl:apply-templates select="table:table" />
					</div>
				</div>
				
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>