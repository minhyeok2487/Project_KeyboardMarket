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

<script>
  function cancelPay() {
    jQuery.ajax({
      "url": "{환불요청을 받을 서비스 URL}", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "{결제건의 주문번호}", // 예: ORD20180131-0000011
        "cancel_request_amount": 2000, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
        "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
        "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
        "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
      }),
      "dataType": "json"
    });
  }
</script>

</body>
</html>