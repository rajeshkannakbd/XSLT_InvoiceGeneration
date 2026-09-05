<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>
 <xsl:template match="/">
   <payroll>
      <xsl:for-each select="employees/employee">
        <employee>
         <employeeId>
          <xsl:value-of select="@id"></xsl:value-of>
          </employeeId>
          <employeeName>
           <xsl:value-of select="name"></xsl:value-of>
          </employeeName>
          <basicSalary>
           <xsl:value-of select="salary"></xsl:value-of>
          </basicSalary>
          <xsl:variable name="allowance" select="salary * 10 div 100"></xsl:variable>
          <allowance>
           <xsl:value-of select="$allowance"></xsl:value-of>
          </allowance>
          <grossSalary>
           <xsl:value-of select="salary + $allowance"></xsl:value-of>
          </grossSalary>
        </employee>
      </xsl:for-each>
   </payroll>
 
 </xsl:template>

</xsl:stylesheet>