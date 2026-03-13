<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="UTF-8"/>

<xsl:template match="/">
    <html>
    <head>
        <title>Llista d'Empleats</title>
        <style>
            body { font-family: sans-serif; }
            h2 { color: #333; }
            h3 { color: blue; font-size: 1.4em; }
            .nom-empleat { font-size: 18px; }
            .camp-negreta { font-weight: bold; }
            .dades-oficina { font-style: italic; color: red; }
            ul { list-style-type: disc; }
            ul ul { list-style-type: circle; margin-left: 20px; }
        </style>
    </head>
    <body>
        <h2>Llista d'empleats</h2>
        <xsl:apply-templates select="//employee">
            <xsl:sort select="firstName"/>
        </xsl:apply-templates>
    </body>
    </html>
</xsl:template>

<xsl:template match="employee">
    <h3>Empleat amb id <xsl:value-of select="@employeeNumber"/></h3>
    <ul>
        <li><span class="camp-negreta">Nom:</span> <span class="nom-empleat"><xsl:value-of select="firstName"/> <xsl:value-of select="lastName"/></span></li>
        <li><span class="camp-negreta">Correu:</span> <xsl:value-of select="email"/></li>
        <li><span class="camp-negreta">Id del seu superior:</span> <xsl:value-of select="reportsTo"/></li>
        <li><span class="camp-negreta">Posició:</span> <xsl:value-of select="jobTitle"/></li>
        <li><span class="camp-negreta">Oficina amb codi:</span> <xsl:value-of select="office/@ofCode"/>
            <ul class="dades-oficina">
                <li><span class="camp-negreta">Telèfon:</span> <xsl:value-of select="office/Phone"/></li>
                <li><span class="camp-negreta">Adreça:</span> <xsl:value-of select="office/AddressLine1"/>, <xsl:value-of select="office/AddressLine2"/></li>
                <li><span class="camp-negreta">Estat:</span> <xsl:value-of select="office/State"/></li>
                <li><span class="camp-negreta">País:</span> <xsl:value-of select="office/Country"/></li>
                <li><span class="camp-negreta">Codi Postal:</span> <xsl:value-of select="office/PostalCode"/></li>
                <li><span class="camp-negreta">Territori:</span> <xsl:value-of select="office/Territory"/></li>
            </ul>
        </li>
    </ul>
</xsl:template>

</xsl:stylesheet>