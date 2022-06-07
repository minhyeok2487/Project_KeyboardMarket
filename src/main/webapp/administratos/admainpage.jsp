<%@page import="java.util.Arrays"%>
<%@page import="model.cart.CartDTO"%>
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
<%
String memberNo = "1";
%>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="../top.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a
						href="./DeleteCart?memberNo=<%=memberNo%>"
						class="btn btn-danger">장바구니 비우기</a></td>
					<td align="right"><a href="javascript:goOrder();" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<form name="frm" action="../cart/OrderCart?" method="get">
			<table class="table">
				<tr>
					<th></th>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				
				<%
				int sum = 0;
				ArrayList<CartDTO> cartList = (ArrayList<CartDTO>) request.getAttribute("cartList");
				if (cartList == null) {
					cartList = new ArrayList<CartDTO>();
				}
				System.out.println(cartList.size());
				for (int i = 0; i < cartList.size(); i++) { // 상품 리스트 하나씩 출력하기
					CartDTO item = cartList.get(i);
					int total = item.getPrice() * item.getSelected_count();
					sum = sum + total;
				%>
				<c:set var="imgthumb" value="<%=item.getItem_img1()%>"/>
				<tr>
					<td><img
							src="<c:url value="/source/${imgthumb }"/>" alt=""
							width=150 height=150 />
					</td>
					<td name="Item_name"><%=item.getItem_name()%></td>
					<td><%=item.getPrice()%></td>
					<td name="Selected_count"><%=item.getSelected_count()%></td>
					<td><%=total%></td>
					<td><a href="./RemoveItem?itemNo=<%=item.getItemNo() %>&memberNo=<%=memberNo%>">삭제</a></td>
				</tr>
				<%
				}
				%>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			</form>
			<a href="../itemPages/itemList#" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
		function goOrder(){
			document.frm.submit();
		}
	</script>
</body>
</html>