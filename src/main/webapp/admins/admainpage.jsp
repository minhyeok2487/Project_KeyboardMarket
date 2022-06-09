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
	<jsp:include page="../Admintop.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=new Date()%>
				관리자 페이지
			</h1>
			<h2 class="display-3">이번달 수입 : ${total }원</h2>
		</div>
	</div>
	<div class="container">
		<div class="accordion" id="accordionPanelsStayOpenExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
						aria-controls="panelsStayOpen-collapseOne">최근 일주일 주문 ${mainList.size() }건</button>
				</h2>
				<div id="panelsStayOpen-collapseOne"
					class="accordion-collapse collapse show"
					aria-labelledby="panelsStayOpen-headingOne">
					<div class="accordion-body">
						<table class="table">
							<tr>
								<th></th>
								<th>주문번호</th>
								<th>주문자 이름</th>
								<th>주문날짜</th>
								<th>총 가격</th>
								<th>총 수량</th>
								<th>처리</th>
								<th>상세보기</th>
							</tr>
							<%
							ArrayList<OrderDTO> mainList = (ArrayList<OrderDTO>) request.getAttribute("mainList");
							for (int i = 0; i < mainList.size(); i++) { // 상품 리스트 하나씩 출력하기
								OrderDTO item = mainList.get(i);
							%>
							<tr>
								<td></td>
								<td><%=item.getOrdered_num()%></td>
								<td><%=item.getName()%></td>
								<td><%=item.getOrdered_date() %></td>
								<td><%=item.getPrice() %></td>
								<td><%=item.getSelect_count() %></td>
								<td><%=item.getStatus() %></td>
								<td>
								<button type="button"
								class="btn btn-outline-primary" onclick='location.href="../item/itemList";'>상세보기</button>
								</td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
						aria-controls="panelsStayOpen-collapseTwo">배송 해야할 것 ${mainorderinglist.size() }건</button>
				</h2>
				<div id="panelsStayOpen-collapseTwo"
					class="accordion-collapse collapse"
					aria-labelledby="panelsStayOpen-headingTwo">
					<div class="accordion-body">
						<table class="table">
							<tr>
								<th></th>
								<th>주문번호</th>
								<th>주문자 이름</th>
								<th>주문날짜</th>
								<th>총 가격</th>
								<th>총 수량</th>
								<th>처리</th>
								<th>상세보기</th>
							</tr>
							<%
							ArrayList<OrderDTO> mainorderinglist = (ArrayList<OrderDTO>) request.getAttribute("mainorderinglist");
							for (int i = 0; i < mainorderinglist.size(); i++) { // 상품 리스트 하나씩 출력하기
								OrderDTO item = mainorderinglist.get(i);
							%>
							<tr>
								<td></td>
								<td><%=item.getOrdered_num()%></td>
								<td><%=item.getName()%></td>
								<td><%=item.getOrdered_date() %></td>
								<td><%=item.getPrice() %></td>
								<td><%=item.getSelect_count() %></td>
								<td><%=item.getStatus() %></td>
								<td>
								<button type="button"
								class="btn btn-outline-primary" onclick='location.href="../item/itemList";'>상세보기</button>
								</td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseThree"
						aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">환불,반품,교환
						??건</button>
				</h2>
				<div id="panelsStayOpen-collapseThree"
					class="accordion-collapse collapse"
					aria-labelledby="panelsStayOpen-headingThree">
					<div class="accordion-body">
						<table class="table">
							<tr>
								<th></th>
								<th>상품</th>
								<th>가격</th>
								<th>수량</th>
								<th>소계</th>
								<th>비고</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>