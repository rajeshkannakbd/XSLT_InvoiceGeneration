<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:emp="http://example.com/1999/employees" >
  <xsl:key name="departmentkey" match="emp:employee" use="department"></xsl:key>
  <xsl:template match="/">
  <html>
  <head>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
    <body>
    <h3 style="margin-bottom: -18px;">Employee Summary:</h3>
    <table>
    <tr>
    <th>Employee ID</th>
    <th>Name</th>
    <th>Department</th>
    <th>Designation</th>
    <th>Salary</th>
    <th>Classification</th>
    <th>Experience</th>
    <th>Experience Classification</th>
    <th>City</th>
    <th>Employment Status</th>
    </tr>
      <xsl:for-each select="employees/emp:employee" >
      <xsl:sort select="salary" order="descending" data-type="number" />
         <tr>
        <td><xsl:value-of select="@id"></xsl:value-of></td>
        <td><xsl:value-of select="name"></xsl:value-of></td>
        <td><xsl:value-of select="department"></xsl:value-of></td>
        <td><xsl:value-of select="designation"></xsl:value-of></td>
        <td><xsl:value-of select="salary"></xsl:value-of></td>
        <td><xsl:choose>
        <xsl:when test="salary >= 80000 ">High</xsl:when>
        <xsl:when test="salary >= 50000">Medium</xsl:when>
        <xsl:otherwise>Low</xsl:otherwise>
        </xsl:choose></td>
        <td><xsl:value-of select="experience"></xsl:value-of></td>
        <td>
        <xsl:choose>
        <xsl:when test="experience >= 5">Senior</xsl:when>
        <xsl:when test="experience >=2">Mid-Level</xsl:when>
        <xsl:otherwise>Junior</xsl:otherwise>
        </xsl:choose>
        </td>
        <td><xsl:value-of select="city"></xsl:value-of></td>
        <td><xsl:value-of select="employmentStatus"></xsl:value-of></td>
         </tr>
      </xsl:for-each>
    </table>
    <h3 style="margin-bottom:-18px;">Department Summary:</h3>
    <table>
    <tr>
    <th>Department Name</th>
    <th>Number of Employees</th>
    <th>Total salary</th>
    <th>Average Salary</th>
    </tr>
    <xsl:for-each select="employees/emp:employee[generate-id() = generate-id(key('departmentkey', department)[1])]">
    <tr>
      <td><xsl:value-of select="department"></xsl:value-of></td> 
      <td><xsl:value-of select="count(key('departmentkey', department))"></xsl:value-of></td>
      <td><xsl:value-of select="sum(key('departmentkey', department)/salary)"></xsl:value-of></td>
      <td><xsl:value-of select="sum(key('departmentkey', department)/salary) div count(key('departmentkey', department)) "></xsl:value-of></td>
      </tr>      
    </xsl:for-each>
    </table>
    <h3 >Company Summary:</h3>
    <div style="display:flex; justify-content:space-around; padding:10px; font-weight:bold; outline:1px solid black; padding:2px; margin:2px;">
    <h4 style="border-right:2px solid black; padding-right:30px;">Total Number Of Employees:  <xsl:value-of select="count(employees/emp:employee)"></xsl:value-of></h4>
    <h4 style="border-right:2px solid black; padding-right:30px;">Total salary:  <xsl:value-of select="sum(employees/emp:employee/salary)"></xsl:value-of></h4>
    <h4 style="border-right:2px solid black; padding-right:30px;">
    <xsl:for-each select="employees/emp:employee">
    <xsl:sort select="salary" order="descending" data-type="number"></xsl:sort>
    <xsl:if test="position() = 1">
    Highest Salary:<xsl:value-of select="salary"></xsl:value-of>
    </xsl:if>
    </xsl:for-each>
    </h4>
    <h4 style="border-right:2px solid black; padding-right:30px;">
    <xsl:for-each select="employees/emp:employee">
    <xsl:sort select="salary" data-type="number"></xsl:sort>
    <xsl:if test="position() = 1">
    Lowest Salary:<xsl:value-of select="salary"></xsl:value-of>
    </xsl:if>
    </xsl:for-each>
    </h4>
    <h4>Average Salary:  <xsl:value-of select="sum(employees/emp:employee/salary) div count(employees/emp:employee)"></xsl:value-of></h4>
    </div>
    <div style="display:flex; justify-content:space-around;">
    <div >
    <h3>Active Profiles</h3>
      <table>
      <tr>
      <th>Name</th>
      <th>Department</th>
      <th>Designation</th>
      <th>Salary</th>
      </tr>
      
      <xsl:for-each select="employees/emp:employee[employmentStatus = 'Active']">
      <tr>
        <td><xsl:value-of select="name"></xsl:value-of></td>
        <td><xsl:value-of select="department"></xsl:value-of></td>
        <td><xsl:value-of select="designation"></xsl:value-of></td>
        <td><xsl:value-of select="salary"></xsl:value-of></td>
      </tr>
      </xsl:for-each>
      </table>
      </div>
      <div>
      <h3>Highest Salary Employees</h3>
       <table>
      <tr>
      <th>Employee ID</th>
      <th>Name</th>
      <th>Department</th>
      <th>Salary</th>
      <th>Experience</th>
      </tr>
      
      
      <xsl:for-each select="employees/emp:employee">
      
      <xsl:sort select="salary" order="descending" data-type="number" />
      <tr>
       <xsl:if test="salary >= 80000 ">
        <td><xsl:value-of select="@id"></xsl:value-of></td>
        <td><xsl:value-of select="name"></xsl:value-of></td>
        <td><xsl:value-of select="department"></xsl:value-of></td>
        <td><xsl:value-of select="salary"></xsl:value-of></td>
        <td><xsl:value-of select="experience"></xsl:value-of></td>
    </xsl:if>
    </tr>
      </xsl:for-each>
      
      
      </table> 
      </div>
    </div>
    </body>
  
  </html>
  
  </xsl:template>

</xsl:stylesheet>