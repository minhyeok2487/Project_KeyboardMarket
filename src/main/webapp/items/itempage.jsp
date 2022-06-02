<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../top.jsp" />
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>스마트 검색</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row" style="text-align: center;">제조사</th>
					<c:forEach var="name" items="${manufactor }" varStatus="i">
						<td><input type="checkbox" name="manufactor" value="${name}"
							onclick='getCheckboxValue(event)'> ${name}</td>
					</c:forEach>
					<td></td>
				</tr>
				<tr>
					<th scope="row" style="text-align: center;">종류</th>
					<c:forEach var="name" items="${type }" varStatus="i">
						<td><input type="checkbox" name="type" value="${name}"
							onclick='getCheckboxValue(event)'> ${name}</td>
					</c:forEach>
				</tr>
				<tr>
					<th scope="row" style="text-align: center;">스위치</th>
					<c:forEach var="name" items="${sw }" varStatus="i">
						<td><input type="checkbox" name="sw" value="${name}"
							onclick='getCheckboxValue(event)'> ${name}</td>
					</c:forEach>
				</tr>
				<tr>
					<th scope="row" style="text-align: center;">가격대</th>
					<td colspan="4">
						<button type="button" id="pricebtn"
							class="btn btn-outline-dark active">전체</button> <c:forEach
							var="name" items="${priceLange }" varStatus="i">
							<button type="button" id="pricebtn" class="btn btn-outline-dark">${name}</button>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th style="text-align: center;">스마트필터</th>
					<td colspan="4" id="res"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container">
		<div class="table-striped">
			<table class="table">
				<c:forEach var="name" items="${dto }" varStatus="i">
					<tr>
						<th><img
							src="<c:url value="/source/${name.item_imgthumb }"/>" alt=""
							width=150 height=150 /></th>
						<td>
							<p>[상품번호:${name.itemNo }]</p>
							<p>[${name.manufacture}] ${name.item_name}</p>
						</td>
						<td>
							<p>${name.price}원</p>
							<p>[재고:${name.stock }]</p>
						</td>
					</tr>
					<tr>
						<th><img
							src="<c:url value="/source/${name.item_imgthumb }"/>" alt=""
							width=150 height=150 /></th>
						<td>
							<p>[상품번호:${name.itemNo }]</p>
							<p>[${name.manufacture}] ${name.item_name}</p>
						</td>
						<td>
							<p>${name.price}원</p>
							<p>[재고:${name.stock }]</p>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
	<script>
		var mflist = [];
		var typelist = [];
		var swlist = [];
		var result = "";
		function getCheckboxValue(event) {
			if (event.target.checked) {
				if (event.target.name === "manufactor") {
					mflist.push(event.target.value);
				}
				if (event.target.name === "type") {
					typelist.push(event.target.value);
				}
				if (event.target.name === "sw") {
					swlist.push(event.target.value);
				}
			} else {
				if (event.target.name === "manufactor") {
					for (var i = 0; i < mflist.length; i++) {
						if (mflist[i] === event.target.value) {
							mflist.splice(i, 1);
							i--;
						}
					}
				}
				if (event.target.name === "type") {
					for (var i = 0; i < typelist.length; i++) {
						if (typelist[i] === event.target.value) {
							typelist.splice(i, 1);
							i--;
						}
					}
				}
				if (event.target.name === "sw") {
					for (var i = 0; i < swlist.length; i++) {
						if (swlist[i] === event.target.value) {
							swlist.splice(i, 1);
							i--;
						}
					}
				}
			}
			var result = "";
			mflist.forEach(function(item, index, array) {
				result += item + ", ";
			});
			typelist.forEach(function(item, index, array) {
				result += item + ", ";
			});
			swlist.forEach(function(item, index, array) {
				result += item + ", ";
			});
			document.getElementById('res').innerText = result;
		}
	</script>
</body>
</html>