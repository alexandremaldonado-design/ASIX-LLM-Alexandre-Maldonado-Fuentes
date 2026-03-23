<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version ="1.0">
  <xsl:template match="/">
  
   <xsl:element name="Payments">
      <xsl:for-each select="DATA/ROW">
        <xsl:element name="Check">
          <xsl:attribute name="number"><xsl:value-of select="checkNumber"/></xsl:attribute>
          <xsl:element name="customer">
            <xsl:attribute name="customerNumber"><xsl:value-of select="customerNumber"/></xsl:attribute>
            <xsl:element name="address">
              <xsl:element name="addressLine1"><xsl:value-of select="addressLine1"/></xsl:element>
              <xsl:if test="addressLine2 != 'NULL'">
                <xsl:element name="addressLine2"><xsl:value-of select="addressLine2"/></xsl:element>
              </xsl:if>
              <xsl:element name="city">
                <xsl:attribute name="country"><xsl:value-of select="country"/></xsl:attribute>
                <xsl:value-of select="city"/>
              </xsl:element>
            </xsl:element>
            <xsl:element name="salesRepEmployeeNumber"><xsl:value-of select="salesRepEmployeeNumber"/></xsl:element>
            <xsl:element name="creditLimit"><xsl:value-of select="creditLimit"/></xsl:element>
          </xsl:element>
          <xsl:element name="date"><xsl:value-of select="paymentDate"/></xsl:element>
          <xsl:element name="amount"><xsl:value-of select="amount"/></xsl:element>
        </xsl:element>
      </xsl:for-each>
   </xsl:element>
  </xsl:template>
</xsl:stylesheet>