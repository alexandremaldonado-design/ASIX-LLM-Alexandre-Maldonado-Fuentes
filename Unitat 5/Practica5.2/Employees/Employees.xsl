<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version ="1.0">
  <xsl:template match="/">
  

   <xsl:element name="Employees">
      <xsl:for-each select="DATA/ROW">
        <xsl:element name="Employee">
          <xsl:attribute name="employeeNumber"><xsl:value-of select="employeeNumber"/></xsl:attribute>
          <xsl:element name="lastName"><xsl:value-of select="lastName"/></xsl:element>
          <xsl:element name="firstName"><xsl:value-of select="firstName"/></xsl:element>
          <xsl:element name="email"><xsl:value-of select="email"/></xsl:element>
          <xsl:if test="reportsTo != 'NULL'">
            <xsl:element name="reportsTo"><xsl:value-of select="reportsTo"/></xsl:element>
          </xsl:if>
          <xsl:element name="jobTitle"><xsl:value-of select="jobTitle"/></xsl:element>
          <xsl:element name="Office">
            <xsl:attribute name="ofCode"><xsl:value-of select="ofCode"/></xsl:attribute>
            <xsl:element name="City"><xsl:value-of select="ofCity"/></xsl:element>
            <xsl:element name="Phone"><xsl:value-of select="ofPhone"/></xsl:element>
            <xsl:element name="AddressLine1"><xsl:value-of select="ofAdd1"/></xsl:element>
            <xsl:if test="ofAdd2 != 'NULL'">
              <xsl:element name="AddressLine2"><xsl:value-of select="ofAdd2"/></xsl:element>
            </xsl:if>
            <xsl:element name="State"><xsl:value-of select="ofState"/></xsl:element>
            <xsl:element name="Country"><xsl:value-of select="ofCountry"/></xsl:element>
            <xsl:element name="PostalCode"><xsl:value-of select="ofPostalCode"/></xsl:element>
            <xsl:element name="Territory"><xsl:value-of select="ofTerritory"/></xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:for-each>
   </xsl:element>
  </xsl:template>
</xsl:stylesheet>