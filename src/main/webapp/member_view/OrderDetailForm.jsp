<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
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
	<c:if test="${refund !=null }">
		<tr>
			<td>환불상태</td><td>${refund }</td>
		</tr>
	</c:if>
	<c:if test="${refund_date != null }">
		<tr>
			<td>환불날짜</td><td>${refund_date }</td>
		</tr>
	</c:if>
	<tr>
		<td>이미지 1</td><td></td>
	</tr>
	<tr>
		<td>주문일</td><td>
		<fmt:formatDate value="${orderDto.ordered_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
 	<tr>
		<td colspan="2" align="right">
			<a href="<c:url value="/member/Order?page=${nowPage }" />">목록으로</a>
			<c:choose>
				<c:when test="${orderDto.status eq '주문완료'  }">
					<a href="<c:url value="/member/Refund?orderNo=${orderDto.orderNo }&status=${orderDto.status }&ordered_num=${orderDto.ordered_num }&page=${nowPage }" />">취소신청</a>
				</c:when>
				<c:when test="${orderDto.status eq '배송중'  }">
					<a href="<c:url value="/admin/Refund?orderNo=${orderDto.orderNo }&status=${orderDto.status }&ordered_num=${orderDto.ordered_num }&page=${nowPage }" />">환불신청</a>
				</c:when>
				<c:when test="${orderDto.status eq '배송완료'  }">
					<a href="<c:url value="/admin/Refund?orderNo=${orderDto.orderNo }&status=${orderDto.status }&ordered_num=${orderDto.ordered_num }&page=${nowPage }" />">반품신청</a>
				</c:when>
			</c:choose>
		</td>
	</tr>

</body>
</html>