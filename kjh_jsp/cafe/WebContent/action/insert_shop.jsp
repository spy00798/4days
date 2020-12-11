<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String scode = request.getParameter("scode");
String shop_name = request.getParameter("shop_name");

try {


	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	String query = "INSERT INTO TBL_SHOP_01(SCODE, SNAME) " +
	"VALUES ('%s', '%s')";
	ResultSet rs = stmt.executeQuery(String.format(query, scode, shop_name));
	stmt.close();
	con.close();
	
	con.commit();
} catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=cafe_lookup");
%>