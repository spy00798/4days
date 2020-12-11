<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	<section>
		<%
			String section = request.getParameter("section") != null ? request.getParameter("section") : "";
			
			switch(section){
			case"coffee_create":
				%><%@ include file="page/coffee_create.jsp" %><%
				break;
			case"cafe_lookup":
				%><%@ include file="page/cafe_lookup.jsp" %><%
				break;
			case"cafe_lookup_by_shop":
				%><%@ include file="page/cafe_lookup_by_shop.jsp" %><%
				break;
			case"cafe_lookup_by_coffee":
				%><%@ include file="page/cafe_lookup_by_coffee.jsp" %><%
				break;
			default:
				%><%@ include file="static/index.jsp" %><%
			}
		
		%>
	</section>
	<%@ include file="static/footer.jsp" %>
</body>
</html>