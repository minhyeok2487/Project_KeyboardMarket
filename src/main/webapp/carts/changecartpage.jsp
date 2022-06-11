<%@page import="java.util.Arrays"%>
<%@page import="model.cart.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
pageContext.setAttribute("memberNo", memberNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<%
	
%>
<title>장바구니</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h5 class="display-3">수량변경</h5>
		</div>
	</div>
	<div class="container">
		<div style="padding-top: 50px">
			<form action="./ChangeCartReg?" method="get">
				<input type="hidden" name="itemNo" value="${cartdto.getItemNo() }">
				<input type="hidden" name="memberNo" value="${cartdto.getMemberNo() }">
				<table class="table">
					<tr>
						<th></th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>재고</th>
						<th>바꿀수량</th>
					</tr>
					<tr>
						<td><img
							src="<c:url value="/source/${cartdto.getItem_img1() }"/>" alt=""
							width=150 height=150 /></td>
						<td>${cartdto.getItem_name() }</td>
						<td>${cartdto.getPrice() }</td>
						<td>${cartdto.getSelected_count() }</td>
						<td>${cartdto.getStock() }</td>
						<td><select onchange="showValue(this.value)"
							class="form-select" aria-label="Default select example">
								<c:forEach var="i" begin="1" end="${cartdto.getStock() }">
									<option value="${i }">${i }</option>
								</c:forEach></select>
							<input type="hidden" id="count" name="count" value=1 />
						</td>
					</tr>
				</table>
				<input type="submit" class="btn btn-outline-success" value="수량변경">
			</form>
		</div>
	</div>
	<script>
		var showValue = function(value) {
			document.getElementById("count").value = value;
		}
	</script>
</body>
</html>