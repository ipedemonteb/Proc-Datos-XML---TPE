<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsd">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
    
            <xsl:apply-templates select="season_data/error"/>
        
            <xsl:apply-templates select="season_data/season"/>
       
        
    </xsl:template>
    
    <xsl:template match="error">
        <xsl:value-of select="."/>
        <xsl:text>&#10;&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="season">
        <xsl:text># Season: </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>&#10;&#10;</xsl:text>
        
        <xsl:apply-templates select="competition"/>
        <xsl:apply-templates select="date"/>
        <xsl:apply-templates select="../stages/stage"/>
        <xsl:apply-templates select="../competitors"/>
    </xsl:template>

    <xsl:template match="competition">
        <xsl:text>### Competition: </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <xsl:text>Gender = '</xsl:text>
        <xsl:value-of select="gender"/>
        <xsl:text>'&#10;&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="date">
        <xsl:text>#### Year </xsl:text>
        <xsl:value-of select="year"/>
        <xsl:text>. From </xsl:text>
        <xsl:value-of select="start"/>
        <xsl:text> to </xsl:text>
        <xsl:value-of select="end"/>
        <xsl:text>&#10;&#10;---</xsl:text>
    </xsl:template>

    <xsl:template match="stage">
        <xsl:text>&#10;---</xsl:text>
        <xsl:text>&#10;#### </xsl:text>
        <xsl:value-of select="@phase"/>
        <xsl:text>. From </xsl:text>
        <xsl:value-of select="@start_date"/>
        <xsl:text> to </xsl:text>
        <xsl:value-of select="@end_date"/>
        <xsl:text>&#10;&#10;---</xsl:text>

        <xsl:apply-templates select="groups/group/competitor"/>
    </xsl:template>

    <xsl:template match="competitors">
        <xsl:text>&#10;---</xsl:text>
        <xsl:text>&#10;#### Competitors&#10;</xsl:text>


        <xsl:for-each select="./competitor">
            <xsl:text>&#10;#### </xsl:text>
            <xsl:value-of select="name"/>

            <xsl:text>&#10;##### Players&#10;</xsl:text>

            <xsl:text>| Name | Type | Date Of Birth | Nationality | Events Played |&#10;</xsl:text>
            <xsl:text>|------|------|--------------|-------------|--------------|&#10;</xsl:text>
            <xsl:for-each select="./players/player">
                <xsl:sort select="./events_played" order="descending" data-type="number"/>
                <xsl:text>| </xsl:text>
                <xsl:value-of select="name"/>
                <xsl:text> | </xsl:text>
                <xsl:value-of select="type"/>
                <xsl:text> | </xsl:text>
                <xsl:value-of select="date_of_birth"/>
                <xsl:text> | </xsl:text>
                <xsl:value-of select="nationality"/>
                <xsl:text> | </xsl:text>
                <xsl:value-of select="events_played"/>
                <xsl:text> |&#10;</xsl:text>
            </xsl:for-each>
        </xsl:for-each>


    </xsl:template>




    <xsl:template match="competitor">
        <xsl:text>&#10;- </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="abbreviation"/>
        <xsl:text>)</xsl:text>
    </xsl:template>


</xsl:stylesheet>
