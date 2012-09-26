<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:essay="http://www.gale.com/goldschema/essay"
	xmlns:gift-doc="http://www.gale.com/goldschema/gift-doc" xmlns:pres="http://www.gale.com/goldschema/pres"
	xmlns:verse="http://www.gale.com/goldschema/verse"
	xmlns:list="http://www.gale.com/goldschema/list"
	xmlns:table="http://www.gale.com/goldschema/table"
	exclude-result-prefixes="gift-doc pres essay verse list table">

	<xsl:template match="essay:div">
	   <div>
	       <xsl:attribute name="class">
	           <xsl:value-of select="@document-segment-type"/>
	       </xsl:attribute>
	       <xsl:apply-templates />
	   </div>
	</xsl:template>

	<xsl:template match="essay:p">
		<p>
			<xsl:apply-templates />
		</p>
	</xsl:template>

	<xsl:template match="essay:blockquote">
		<blockquote class="indented">
			<xsl:apply-templates select="node()" />
		</blockquote>
	</xsl:template>

	<xsl:template match="pres:bold">
		<span class="bold">
			<xsl:apply-templates select="node()" />
		</span>
	</xsl:template>

	<xsl:template match="pres:italics">
		<span class="italics">
			<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template match="pres:bold-italic">
		<span class="italics bold">
			<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template match="pres:big">
		<span class="bigLetters">
			<xsl:value-of select="." />
		</span>
	</xsl:template>

	<xsl:template match="pres:small">
		<span class="smallLetters">
			<xsl:value-of select="." />
		</span>
	</xsl:template>

	<xsl:template match="pres:small-caps">
		<span class="small-caps">
			<xsl:value-of select="." />
		</span>
	</xsl:template>

	<xsl:template match="pres:sub">
		<sub>
			<xsl:value-of select="." />
		</sub>
	</xsl:template>

	<xsl:template match="pres:sup">
		<sup>
			<xsl:value-of select="." />
		</sup>
	</xsl:template>

	<xsl:template match="pres:under-score">
		<u>
			<xsl:value-of select="." />
		</u>
	</xsl:template>

	<xsl:template match="pres:strike-over">
		<strike>
			<xsl:value-of select="." />
		</strike>
	</xsl:template>

	<xsl:template match="pres:horizontal-rule">
		<hr/>
	</xsl:template>

	<xsl:template match="pres:line-break">
		<br/>
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="pres:page-break">
		<span class="page-break-before">
			<xsl:value-of select="." />
		</span>
	</xsl:template>

	<xsl:template match="pres:a">
		<xsl:if test="normalize-space(.) != ''">
			<xsl:element name="a">
				<xsl:attribute name="name">
					<xsl:value-of select="@id" />
				</xsl:attribute>
				<xsl:value-of select="." />
			</xsl:element>
		</xsl:if>
	</xsl:template>

	<xsl:template match="essay:h1">
		<h1>
			<xsl:apply-templates />
		</h1>
	</xsl:template>

	<xsl:template match="essay:h2">
		<h2>
			<xsl:apply-templates />
		</h2>
	</xsl:template>

	<xsl:template match="essay:h3">
		<h3>
			<xsl:apply-templates />
		</h3>
	</xsl:template>

	<xsl:template match="//span[@class='hitHighlite']">
		<span class="hitHighlite">
			<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template match="verse:verse/verse:linegroup">
		<p class="linegroup">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="node()" />
		</p>
	</xsl:template>

	<xsl:template match="verse:line">
		<p class="line">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="node()" />
		</p>
	</xsl:template>

	<xsl:template match="verse:space">
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="essay:pre">
			<pre>
				<p>
					<xsl:value-of select="." />
				</p>
			</pre>
	</xsl:template>

	<xsl:template match="list:title">
		<p>
			<xsl:apply-templates />
		</p>
	</xsl:template>

	<xsl:template match="list:dl">
		<dl>
			<xsl:apply-templates select="node()" />
		</dl>
	</xsl:template>

	<xsl:template match="list:dt">
		<dt>
			<xsl:apply-templates select="node()" />
		</dt>
	</xsl:template>

	<xsl:template match="list:dd">
		<dd>
			<xsl:apply-templates select="node()" />
		</dd>
	</xsl:template>

	<xsl:template match="list:ol">
		<ol>
			<xsl:apply-templates select="node()" />
		</ol>
	</xsl:template>

	<xsl:template match="list:li">
		<li>
			<xsl:apply-templates select="node()" />
		</li>
	</xsl:template>

	<xsl:template match="list:ul">
		<ul>
			<xsl:apply-templates select="node()" />
		</ul>
	</xsl:template>

<!-- begin fields for table namespace -->
    <xsl:template match="table:table">
        <table class="bodyTextTable" cellspacing="0">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </table>
    </xsl:template>
    <xsl:template match="table:caption">
        <caption>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </caption>
    </xsl:template>
    <xsl:template match="table:col">
        <col>
            <xsl:copy-of select="@*"/>
        </col>
    </xsl:template>
    <xsl:template match="table:colgroup">
        <colgroup>
            <xsl:copy-of select="@*"/>
        </colgroup>
    </xsl:template>
    <xsl:template match="table:thead">
        <thead>
            <xsl:apply-templates select="node()"/>
        </thead>
    </xsl:template>
    <xsl:template match="table:tfoot">
        <tfoot>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </tfoot>
    </xsl:template>
    <xsl:template match="table:tbody">
        <tbody>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </tbody>
    </xsl:template>
    <xsl:template match="table:tr">
        <tr>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </tr>
    </xsl:template>
    <xsl:template match="table:th">
        <th>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </th>
    </xsl:template>
    <xsl:template match="table:td">
        <td>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </td>
    </xsl:template>
<!-- end fields for table namespace -->

</xsl:stylesheet>