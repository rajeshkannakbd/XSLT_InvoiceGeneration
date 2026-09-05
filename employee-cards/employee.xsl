<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
      <html>
        <head>
        <title>Employee Card</title>
        <script src="https://cdn.tailwindcss.com"></script>
        </head>
        <body>
        
          <h1 class="text-3xl font-bold text-blue-600 p-10 mx-auto">Employee Profiles</h1>
         
          <div class="grid grid-cols-3 gap-6 mx-10">
           <xsl:for-each select="employees/employee">
           <div class=" border-2 p-4 shadow rounded-lg">
            <div class="flex flex-col ">
            <center><img src="../assets/generic-faceless-male-avatar-profile-picture-in-simple-design-for-website-or-app-vector.jpg" alt="" class="h-32 w-32"/></center>
            <p class="bg-blue-400 p-4 border rounded-full text-center">Employee ID :<span class=" p-4 text-white text-xl"><xsl:value-of select="@id"></xsl:value-of></span></p>
            </div>
                  <div class="p-3 text-md font-bold text-gray-500 " >
                     <p>Name:</p>
                     <p class="text-lg text-black mb-4 mx-4"><xsl:value-of select="name"></xsl:value-of></p>
                     <p>Role:</p>
                     <p class="text-lg text-black mb-4 mx-4"><xsl:value-of select="role"></xsl:value-of></p>
                     <p>Designation:</p>
                     <p class="text-lg text-black mb-4 mx-4"><xsl:value-of select="Designation"></xsl:value-of></p>
                     <p>Salary:</p>
                     <p class="text-lg text-black mb-4 mx-4"><xsl:value-of select="salary"></xsl:value-of></p>
                 </div>
             </div> 
             </xsl:for-each>
            </div>
            
        </body>
      
      </html>

    </xsl:template>

</xsl:stylesheet>