<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>매장별 판매액</h3>
<table border="1">
	<tr>
		<td>매장코드</td>
		<td>매장 명</td>
		<td>매장별 판매액</td>
	</tr>
	<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	String query = "SELECT "+
	"SHOP.SCODE, SHOP.SNAME, sum(PRODUCT.COST*SALELIST.AMOUNT) "+
	"FROM "+
			"TBL_PRODUCT_01 PRODUCT, TBL_SHOP_01 SHOP, TBL_SALELIST_01 SALELIST "+
	"WHERE "+
					"SALELIST.SCODE = SHOP.SCODE AND "+
	"SALELIST.PCODE = PRODUCT.PCODE "+
					"GROUP BY "+
			"SHOP.SCODE, SHOP.SNAME "+
					"ORDER BY "+
					"SHOP.SCODE asc";
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
		
		
		%> 
			<tr>
				<td><%= rs.getString(1)%></td>
				<td><%= rs.getString(2)%></td>
				<td><%=String.format("%,d", rs.getInt(3))%></td>
			</tr>
		
		<%
	
	}
	stmt.close();
	con.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>
</table>