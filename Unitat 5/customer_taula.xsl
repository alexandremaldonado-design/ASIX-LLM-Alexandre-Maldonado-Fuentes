<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="UTF-8"/>

<xsl:template match="/">
    <html>
    <head>
        <title>Llista de Clients</title>
        <style>
            body { font-family: sans-serif; }
            h2 { color: #333; }
            table { border-collapse: collapse; width: 100%; }
            th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
            th { background-color: #f2f2f2; font-weight: bold; }
            tr:nth-child(even) { background-color: #f9f9f9; }
        </style>
    </head>
    <body>
        <h2>Llista de Clients</h2>
        <table>
            <thead>
                <tr>
                    <th>Número de Client</th>
                    <th>Nom del Client</th>
                    <th>Telèfon</th>
                    <th>Nom de Contacte</th>
                    <th>Cognom de Contacte</th>
                    <th>Adreça Línia 1</th>
                    <th>Adreça Línia 2</th>
                    <th>Ciutat</th>
                    <th>Estat</th>
                    <th>Codi Postal</th>
                    <th>País</th>
                    <th>Núm. Empleat</th>
                    <th>Límit de Crèdit</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="//customer"/>
            </tbody>
        </table>
    </body>
    </html>
</xsl:template>

<xsl:template match="customer">
    <tr>
        <td><xsl:value-of select="@customerNumber"/></td>
        <td><xsl:value-of select="customerName"/></td>
        <td><xsl:value-of select="phone"/></td>
        <td><xsl:value-of select="contact/contactFirstName"/></td>
        <td><xsl:value-of select="contact/contactLastName"/></td>
        <td><xsl:value-of select="adress/addressLine1"/></td>
        <td><xsl:value-of select="adress/addressLine2"/></td>
        <td><xsl:value-of select="adress/city"/></td>
        <td><xsl:value-of select="adress/state"/></td>
        <td><xsl:value-of select="adress/postalCode"/></td>
        <td><xsl:value-of select="adress/country"/></td>
        <td><xsl:value-of select="salesRepEmployeeNumber"/></td>
        <td><xsl:value-of select="creditLimit"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>