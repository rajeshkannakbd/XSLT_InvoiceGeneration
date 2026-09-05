<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes"/>
 <xsl:template match="/">
    <xsl:text>Employee Payroll Report
    </xsl:text>
    <xsl:text>=======================</xsl:text>
    <xsl:text>
     </xsl:text>
    <xsl:for-each select="employees/employee">
    <xsl:text>Employee ID: </xsl:text>
     <xsl:value-of select="@id"></xsl:value-of>
     <xsl:text>
     </xsl:text>
     <xsl:text>Name: </xsl:text>
     <xsl:value-of select="name"></xsl:value-of>
     <xsl:text>
     </xsl:text>
     <xsl:text>Role: </xsl:text>
     <xsl:value-of select="role"></xsl:value-of>
     <xsl:text>
     </xsl:text>
     <xsl:text>Designation: </xsl:text>
     <xsl:value-of select="Designation"></xsl:value-of>
     <xsl:text>
     </xsl:text>
     <xsl:text>Salary: </xsl:text>
     <xsl:value-of select="salary"></xsl:value-of>
     <xsl:text>
     </xsl:text>
     <xsl:text>
     </xsl:text>

    </xsl:for-each>

 </xsl:template>

</xsl:stylesheet>