<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h3>상품별 판매액</h3>
<table border="1">
	<tr>
		<td>상품코드</td>
		<td>상품 명</td>
		<td>상품별 판매액</td>
	</tr>
	<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	String query = "SELECT "+
	"PRODUCT.PCODE, PRODUCT.NAME, sum(PRODUCT.COST*SALELIST.AMOUNT) "+
	"FROM "+
			"TBL_PRODUCT_01 PRODUCT, TBL_SALELIST_01 SALELIST "+
	"WHERE "+
	"SALELIST.PCODE = PRODUCT.PCODE "+
					"GROUP BY "+
			"PRODUCT.PCODE, PRODUCT.NAME "+
					"ORDER BY "+
					"PRODUCT.PCODE asc";
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