<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 페이지</title>
</head>
<body>
<h1>주문 상세 페이지</h1>

<table border="">
	<tr>
		<td>일련번호</td><td>${dto.itemNo }</td>
	</tr>
	<tr>
		<td>제품명</td><td>${dto.item_name }</td>
	</tr>
	<tr>
		<td>제조사</td><td>${dto.manufacture }</td>
	</tr>
	<tr>
		<td>분류</td><td>${dto.category }</td>
	</tr>
	<tr>
		<td>스위치</td><td>${dto.switchs }</td>
	</tr>
	<tr>
		<td>상품스펙</td><td>${dto.spec }</td>
	</tr>
	<tr>
		<td>주문 갯수</td><td>${orderDto.select_count }</td>
	</tr>
	<tr>
		<td>가격</td><td>${dto.price }</td>
	</tr>
	<tr>
		<td>배송 상황</td><td>${orderDto.status }</td>
	</tr>
	<tr>
		<td>이미지 1</td><td></td>
	</tr>
	<tr>
		<td>주문일</td><td>
		<fmt:formatDate value="${orderDto.ordered_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
<%-- 	<tr>
		<td colspan="2" align="right">
			<a href="<c:url value="/board/List?page=${nowPage }" />">목록으로</a>
			<a href="<c:url value="/board/ModifyForm?id=${dto.id }&page=${nowPage }" />">환불</a>
		</td>
	</tr> --%>



</body>
</html>