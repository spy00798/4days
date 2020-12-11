<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>오디션 등록</h3>

<form action="../cafe/action/insert_coffee.jsp" name="action_form">
	<table border="1">
		<tr>
			<td>비번호</td>
			<td><input type="text" name="saleno"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><select name="pcode">
				<option value="0">상품코드 선택</option>
				<%
 		try {
 			Class.forName("oracle.jdbc.OracleDriver");
 			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
 			
 			Statement stmt = con.createStatement();
 			
 			String query = "SELECT PCODE, NAME FROM TBL_PRODUCT_01";
 			ResultSet rs = stmt.executeQuery(query);
 			while (rs.next()) {
 				%> 
 					<option value="<%=rs.getString(1)%>"><%=String.format("[%s] %s", rs.getString(1), rs.getString(2)) %></option>
 				<%
 			}
 			stmt.close();
 			con.close();
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 				%>
			</select></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td>
				<input type="date" name="sale_date">
			</td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td>
				<select name="scode">
					<option value="0">매장코드 선택</option>
				<%
 		try {
 			Class.forName("oracle.jdbc.OracleDriver");
 			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
 			
 			Statement stmt = con.createStatement();
 			
 			String query = "SELECT SCODE, SNAME FROM TBL_SHOP_01";
 			ResultSet rs = stmt.executeQuery(query);
 			while (rs.next()) {
 				%> 
 					<option value="<%=rs.getString(1)%>"><%=String.format("[%s] %s", rs.getString(1), rs.getString(2)) %></option>
 				<%
 			}
 			stmt.close();
 			con.close();
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td>
				<input type="number" name="amount">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	
	</table>
</form>
<script>
function submit_form() {
	if (document.action_form.saleno.value === "") {
		alert("비번호가 입력되지 않았습니다!");
		document.action_form.saleno.focus();
		return;
	}
	if (document.action_form.pcode.value <= 0) {
		alert("상품코드가 입력되지 않았습니다!");
		document.action_form.pcode.focus();
		return;
	}
	if (document.action_form.sale_date.value === "") {
		alert("판매날짜가 입력되지 않았습니다!");
		document.action_form.sale_date.focus();
		return;
	}
	if (document.action_form.scode.value === "") {
		alert("성별이 입력되지 않았습니다!");
		document.action_form.scode.focus();
		return;
	}
	if (document.action_form.amount.value === "") {
		alert("판매수량이 입력되지 않았습니다!");
		document.action_form.amount.focus();
		return;
	}
	
	alert("판매정보가 정상적으로 등록되었습니다!");
	document.action_form.submit();
}

function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.action_form.reset();
}
</script>