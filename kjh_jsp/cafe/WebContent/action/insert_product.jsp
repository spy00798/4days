<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String pcode = request.getParameter("pcode");
String pname = request.getParameter("pname");
String cost = request.getParameter("cost");

try {


	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	String query = "INSERT INTO TBL_PRODUCT_01(PCODE, NAME, COST) " +
	"VALUES ('%s', '%s', '%s')";
	ResultSet rs = stmt.executeQuery(String.format(query, pcode, pname, cost));
	stmt.close();
	con.close();
	
	con.commit();
} catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=cafe_lookup");
%>