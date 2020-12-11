<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%
String saleno = request.getParameter("saleno");
String pcode = request.getParameter("pcode");
String sale_date = request.getParameter("sale_date");
String scode = request.getParameter("scode");
int amount = Integer.parseInt(request.getParameter("amount"));

try {


	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	String query = "INSERT INTO TBL_SALELIST_01(SALENO, PCODE, SALEDATE, SCODE, AMOUNT) " +
	"VALUES ('%s', '%s', '%s', '%s', '%d')";
	ResultSet rs = stmt.executeQuery(String.format(query, saleno, pcode, sale_date, scode, amount));
	stmt.close();
	con.close();
} catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=cafe_lookup");
%>