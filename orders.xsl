<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ord="http://example.com/orders" xmlns:cust="http://example.com/customers" xmlns:prod="http://example.com/products">
<xsl:template match="/">
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
<xsl:for-each select="/orders/ord:order">
<table>
<tr>
<th>ORDER ID</th>
<th>DATE ORDERED</th>
<th>STATUS</th>
<th>NAME</th>
<th>EMAIL</th>
<th>CITY</th>
<th>STATE</th>
<th>STATUS MEANING</th>
</tr>
  <tr>
  <td><xsl:value-of select="@id"/></td>
  <td><xsl:value-of select="orderdate"></xsl:value-of></td>
  <td><xsl:value-of select="status"></xsl:value-of></td>
  <td><xsl:value-of select="cust:customer/cust:name"></xsl:value-of></td>
  <td><xsl:value-of select="cust:customer/cust:email"></xsl:value-of></td>
  <td><xsl:value-of select="cust:customer/cust:address/cust:city"></xsl:value-of></td>
  <td><xsl:value-of select="cust:customer/cust:address/cust:state"></xsl:value-of></td>
  <td>
  <xsl:choose>
  <xsl:when test="status = 'ON PROCESS'">Processing</xsl:when>
  <xsl:when test="status = 'DELIVERED'">Completed</xsl:when>
  <xsl:otherwise>Unknown Status</xsl:otherwise>
  </xsl:choose>
  </td>
  </tr>
<tr>
<th>ORDER ID</th>
<th>CUSTOMER</th>
<th>PRODUCT</th>
<th>CATEGORY</th>
<th>PRICE</th>
<th>QUANTITY</th>
<th>LINE TOTAL</th>
<th>STOCK AVAILABILITY</th>
</tr>
<xsl:for-each select="prod:products/prod:product">
<xsl:sort select="prod:price" data-type="number" order="descending"/>
 <xsl:variable name="lineTotal" select="prod:price * prod:quantity"/>

<tr>
<td><xsl:value-of select="../../@id"></xsl:value-of></td>
<td><xsl:value-of select="../../cust:customer/cust:name"></xsl:value-of></td>
<td><xsl:value-of select="prod:name"></xsl:value-of></td>
<td><xsl:value-of select="prod:category"></xsl:value-of></td>
<td><xsl:value-of select="prod:price"></xsl:value-of></td>
<td><xsl:value-of select="prod:quantity"></xsl:value-of></td>
<td><xsl:value-of select="$lineTotal"/></td>

<td>
<xsl:if test="prod:stock &gt; 10">
 <p>IN Stock</p>
</xsl:if>
<xsl:if test="prod:stock &lt;= 10">
 <p>Low Stock</p>
</xsl:if>
</td>
</tr>
</xsl:for-each>

    <!-- storing the calculated total  -->
    <xsl:variable name="subtotal">
     <xsl:call-template name="calculateSubtotal">
          <xsl:with-param name="products" select="prod:products/prod:product" />
     </xsl:call-template>
    </xsl:variable>
    <!-- Display subtotal -->
    <tr>
 <td colspan="6" ></td><td style="font-weight:bold">Subtotal:</td>
<td>
    <xsl:value-of select="$subtotal"/>
</td></tr>
    
    <xsl:variable name="discountPercent" select="10" />
    <xsl:variable name="discountAmount" select="number($subtotal) * $discountPercent div 100 " />
    <xsl:variable name="afterDiscount" select="number($subtotal) - $discountAmount" />
    <tr>
    <td colspan="6"></td><td style="font-weight:bold">After Discount:</td>
    <td>
        <xsl:value-of select="$afterDiscount"/>
    </td>
</tr>
    <xsl:variable name="taxPercent" select="18"/>
    <xsl:variable name="taxAmount" select="number($afterDiscount) * $taxPercent div 100"   />
    <xsl:variable name="aftertax" select="number($afterDiscount) + $taxAmount"/>
        <tr>
    <td colspan="6"></td><td style="font-weight:bold">After Tax:</td>
    <td>
        <xsl:value-of select="$aftertax"/>
    </td>
</tr>
    <xsl:variable name="shippingcharge" select="500"/>
    <xsl:variable name="grandTotal" select="$aftertax + $shippingcharge" />
    <tr><td colspan="6"></td><td style="color:red">
    GrandTotal:</td><td style="color:red"><xsl:value-of select="$grandTotal"/></td></tr>
   </table>
</xsl:for-each>

</body></html>
</xsl:template>



<xsl:template name="calculateSubtotal">
  <xsl:param name="products"/>
 <xsl:param name="total" select="0"/>
 <xsl:choose>
   <xsl:when test="$products">
   <xsl:call-template name="calculateSubtotal">

    <xsl:with-param name="products" select="$products[position()>1]"/>
    <xsl:with-param name="total" select="$total + ($products[1]/prod:price * $products[1]/prod:quantity)" />
  </xsl:call-template>
   </xsl:when>  
   <xsl:otherwise><xsl:value-of select="$total" /></xsl:otherwise>
 </xsl:choose>
</xsl:template>

</xsl:stylesheet>