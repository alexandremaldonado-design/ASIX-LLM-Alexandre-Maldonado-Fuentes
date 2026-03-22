<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version ="1.0">
  <xsl:template match="/">
  
     <xsl:element name="Payments">
      <xsl:for-each select="DATA/ROW">
        <xls:element name="Check">
          <xsl:attribute name="number"><xsl:value-of select="checkNumber"></xsl:value-of></xsl:attribute>
          <xls:element name="customer">
            <xsl:attribute name="xustomerNumber"><xsl:value-of select="customerNumber"></xsl:value-of></xsl:attribute>
            <xsl:element name="address">
              <xsl:element name="addressLine1"><xsl:value-of select="addressLine1"></xsl:value-of></xsl:element>
              <xsl:element name="addressLine2"><xsl:value-of select="addressLine2"></xsl:value-of></xsl:element>
              <xsl:element name="city"><xsl:value-of select="city"></xsl:value-of>
                <xsl:attribute name="country"><xsl:value-of select="country"></xsl:value-of></xsl:attribute>
              </xsl:element>
            </xsl:element>
            <xsl:element name="salesRepEmployeeNumber"><xsl:value-of select="salesRepEmployeeNumber"></xsl:value-of></xsl:element>
            <xsl:element name="creditLimit"><xsl:value-of select="creditLimit"></xsl:value-of></xsl:element>
          </xls:element>
          <xsl:element name="date"><xsl:value-of select="paymentDate"></xsl:value-of></xsl:element>
          <xls:element name="amount"><xsl:value-of select="amount"></xsl:value-of></xls:element>
        </xls:element>
      </xsl:for-each>
   </xsl:element>
  </xsl:template>
</xsl:stylesheet>