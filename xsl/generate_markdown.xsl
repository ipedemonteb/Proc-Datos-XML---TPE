<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsd">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates select="season_data/season"/>
    </xsl:template>

    <xsl:template match="season">
        <!-- Level 1 header for season name -->
        <xsl:text># Season: </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <!-- Apply templates for competition -->
        <xsl:apply-templates select="competition"/>
        <!-- Apply templates for date -->
        <xsl:apply-templates select="date"/>

        <!-- Apply templates for stages -->
        <xsl:apply-templates select="../stages/stage"/>
        <xsl:apply-templates select="../competitors"/>
    </xsl:template>

    <xsl:template match="competition">
        <!-- Level 3 header for competition name -->
        <xsl:text>### Competition: </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <!-- Paragraph for gender -->
        <xsl:text>Gender = '</xsl:text>
        <xsl:value-of select="gender"/>
        <xsl:text>'&#10;&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="date">
        <!-- Level 4 header for year and dates -->
        <xsl:text>#### Year </xsl:text>
        <xsl:value-of select="year"/>
        <xsl:text>. From </xsl:text>
        <xsl:value-of select="start"/>
        <xsl:text> to </xsl:text>
        <xsl:value-of select="end"/>
        <xsl:text>&#10;&#10;---</xsl:text>
    </xsl:template>

    <xsl:template match="stage">
        <!-- Dividing line -->
        <xsl:text>&#10;---</xsl:text>
        <!-- Level 4 header for stage details -->
        <xsl:text>&#10;#### </xsl:text>
        <xsl:value-of select="@phase"/>
        <xsl:text>. From </xsl:text>
        <xsl:value-of select="@start_date"/>
        <xsl:text> to </xsl:text>
        <xsl:value-of select="@end_date"/>
        <xsl:text>&#10;&#10;---</xsl:text>

        <!-- Apply templates for group details -->
        <xsl:apply-templates select="groups/group/competitor"/>
    </xsl:template>

    <xsl:template match="competitors">
        <!-- Dividing line -->
        <xsl:text>&#10;---</xsl:text>
        <!-- Level 4 header for competitors -->
        <xsl:text>&#10;#### Competitors&#10;</xsl:text>

        <!-- Apply templates for competitor details -->

        <xsl:for-each select="./competitor">
            <!-- Level 4 header for competitor name -->
            <xsl:text>&#10;#### </xsl:text>
            <xsl:value-of select="name"/>

            <!-- Level 5 header for Players -->
            <xsl:text>&#10;##### Players&#10;</xsl:text>

            <!-- Table for players -->
            <xsl:text>| Name | Type | Date Of Birth | Nationality | Events Played |&#10;</xsl:text>
            <xsl:text>|------|------|--------------|-------------|--------------|&#10;</xsl:text>
            <xsl:for-each select="./players/player">
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
        <!-- List of competitors -->
        <xsl:text>&#10;- </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="abbreviation"/>
        <xsl:text>)</xsl:text>
    </xsl:template>

    <!-- Add more templates to match other elements as necessary -->

</xsl:stylesheet>
