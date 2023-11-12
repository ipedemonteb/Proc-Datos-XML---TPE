<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" encoding="utf-8" omit-xml-declaration="yes"/>
    <xsl:template match="//season_data">
        <xsl:element name="{local-name()}"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">../schemas/season_data.xsd</xsl:attribute>
            <xsl:copy-of select="node()"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>