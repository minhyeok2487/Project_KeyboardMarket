<%@page import="model.item.itemDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
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
	int memberNo;
	String name = "비회원";
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
		memberNo = dto.getMemberNo();
		name = dto.getName();
	} else {
		memberNo = 0;
	}
	pageContext.setAttribute("memberNo",memberNo);
%>
<title>관리자 페이지</title>
</head>
<body>
	<jsp:include page="../Admintop.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3">상품 입고</h3>
		</div>
	</div>
	
	<div class="container">
		<a href="./ItemControl" class="btn btn-secondary">상품 목록으로</a>
		<form action="./ItemAddStockReg?" method="post">
			<input type="hidden" name="itemNo" value="${getItem.getItemNo() }">
			<table class="table">
				<tr>
					<th></th>
					<td><img
						src="<c:url value="/source/${getItem.getItem_img1() }"/>" alt=""
						width=400 height=400 /></td>
				</tr>
				<tr>
					<th>상품</th>
					<td>${getItem.getItem_name() }</td>

				</tr>
				<tr>
					<th>가격</th>
					<td>${getItem.getPrice() }</td>
				</tr>
				<tr>
					<th>재고</th>
					<td>${getItem.getStock() }</td>
				</tr>
				<tr>
					<th>입고</th>
					<td>
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea" name="count"></textarea>
							<label for="floatingTextarea">입고수량 입력</label>
						</div>
						<p>
							<a href="#"><button class="btn btn-primary" type="submit">상품
									입고</button></a>
						</p>
					</td>
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