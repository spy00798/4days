<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="../action/insert_product.jsp" method="post">
	<table border="1">
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<td>상품이름</td>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="number" name="cost"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="상품 입력하기">
			</td>
		</tr>
	</table>
</form>