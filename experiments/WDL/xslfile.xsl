<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2>Tickets</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">ID</th>
      <th style="text-align:left">traino</th>
      <th style="text-align:left">nameofperson</th>
      <th style="text-align:left">amount</th>
      <th style="text-align:left">to</th>
      <th style="text-align:left">from</th>
      <th style="text-align:left">trainname</th>
    </tr>
    <xsl:for-each select="railwayreservation/tickets/ticket">
    <tr>
      <td><xsl:value-of select="id"/></td>
      <td><xsl:value-of select="trainno"/></td>
      <td><xsl:value-of select="nameofperson"/></td>
      <td><xsl:value-of select="amount"/></td>
      <td><xsl:value-of select="to"/></td>
      <td><xsl:value-of select="from"/></td>
      <td><xsl:value-of select="trainname"/></td>

    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

