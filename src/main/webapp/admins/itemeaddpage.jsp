<%@page import="model.item.itemDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<%@page import="model.member.memberDTO"%>
<%
	HttpSession user = request.getSession();
String userStatus = null;
memberDTO dto = (memberDTO) user.getAttribute("inUser");
if (dto != null) {
	userStatus = dto.getStatus();
}
%>
<title>관리자 페이지</title>
</head>
<body>
	<c:url value="/source/MMMR3KH.jpeg"/>
	<jsp:include page="../Admintop.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3">상품 추가</h3>
		</div>
	</div>

	<div class="container">
		<a href="./ItemControl" class="btn btn-secondary">상품 목록으로</a>
		
		<form action="./AddItemReg" method="post"
			enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>상품명</th>
					<td><input type="text" name="item_name"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><input type="text" name="manufacture"></td>
				</tr>
				<tr>
					<th>종류</th>
					<td><input type="text" name="category"></td>
				</tr>
				<tr>
					<th>스위치</th>
					<td><input type="text" name="switchs"></td>
				</tr>
				<tr>
					<th>스펙</th>
					<td><input type="text" name="spec"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<th>재고</th>
					<td><input type="text" name="stock"></td>
				</tr>
				<tr>
					<th>메인 이미지 파일</th>
					<td><input type="file" name="item_img1"></td>
				</tr>
				<tr>
					<th>상품 정보 이미지 파일</th>
					<td><input type="file" name="item_img2"></td>
				</tr>
				<tr>
					<td><button class="btn btn-primary"
								type="submit">상품 추가</button></td>
				</tr>
			</table>
		</form>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>