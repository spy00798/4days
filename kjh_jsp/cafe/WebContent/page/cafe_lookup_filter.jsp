<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>판매현황</h3>
<form action="cafe_lookup_filter.jsp">
	<select name="p_category">
		<option value="SALELIST.SALENO">비번호</option>
		<option value="PRODUCT.PCODE">상품코드</option>
		<option value="SHOP.SCODE">매장코드</option>
		<option value="PRODUCT.NAME">상품명</option>
		<option value="SALELIST.AMOUNT">판매수량</option>
		<option value="PRODUCT.COST*SALELIST.AMOUNT">총 판매액</option>
	</select>
	<input type="text" name="pname">
	<input type="submit" value="찾기" onclick="submit_form()">
</form>
<table border="1">
	<tr>
		<td>비번호</td>
		<td>상품코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>총 판매액</td>
	</tr>
	<%
	String pname = request.getParameter("pname");
	String p_category = request.getParameter("p_category");
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	String query = "SELECT "+
	"SALELIST.SALENO, PRODUCT.PCODE, SALELIST.SALEDATE, SHOP.SCODE, PRODUCT.NAME, SALELIST.AMOUNT, PRODUCT.COST*SALELIST.AMOUNT "+
	"FROM "+
			"TBL_PRODUCT_01 PRODUCT, TBL_SHOP_01 SHOP, TBL_SALELIST_01 SALELIST "+
	"WHERE "+
					"SALELIST.SCODE = SHOP.SCODE AND "+
	"SALELIST.PCODE = PRODUCT.PCODE ";
	
	if(pname != null && pname.length() != 0 && p_category != null){
		query += String.format("AND %s = '%s'", p_category, pname);
	}
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
		
		
		%> 
			<tr>
				<td><%= rs.getInt(1)%></td>
				<td><%= rs.getString(2)%></td>
				<td><%= rs.getDate(3)%></td>
				<td><%= rs.getString(4)%></td>
				<td><%= rs.getString(5)%></td>
				<td><%= rs.getInt(6)%></td>
				<td><%=String.format("%,d", rs.getInt(7))%></td>
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