<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
<title>취소 승인 란</title>
</head>
<body>
<h1>취소 승인</h1>

<h3>회원 정보</h3>
<form action="">
	<table border="">
		<tr>
			<td>회원 번호</td>
			<td>${userData.memberNo }</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${userData.user_id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${userData.name }</td>
		</tr>
		<tr>
			<td>생일</td>
			<td><fmt:formatDate value="${userData.birthdate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<c:choose>
				<c:when test="${userData.gender eq 'm' }">
					<td>남성</td>
				</c:when>
				<c:when test="${userData.gender eq 'f' }">
					<td>여성</td>
				</c:when>
			</c:choose>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${userData.email }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${userData.addr1 }</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${userData.addr2 }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${userData.tel }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><fmt:formatDate value="${userData.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
</form>

<h3>상품 정보</h3>

<form action="">
	<table border="">
		<tr>
			<td>상품 일련번호</td>
			<td>${itemData.itemNo }</td>
		</tr>
		<tr>
			<td>상품 이름</td>
			<td>${itemData.item_name }</td>
		</tr>
		<tr>
			<td>제조사</td>
			<td>${itemData.manufacture }</td>
		</tr>
		<tr>
			<td>분류</td>
			<td>${itemData.category }</td>
		</tr>
		<tr>
			<td>스위치</td>
			<td>${itemData.switchs }</td>
		</tr>

		<tr>
			<td>상품 스펙</td>
			<td>${itemData.spec }</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${itemData.price }</td>
		</tr>
		<tr>
			<td>재고수량</td>
			<td>${itemData.stock }</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><fmt:formatDate value="${userData.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>주문수</td>
			<td>${itemData.item_sold }</td>
		</tr>
	</table>
</form>

<h3>주문 정보</h3>
<form action="">
	<table border="">
		<tr>
			<td>주문 일련번호</td>
			<td>${orderData.orderNo }</td>
		</tr>
		<tr>
			<td>주문번호</td>
			<td>${orderData.ordered_num }</td>
		</tr>
		<tr>
			<td>주문일</td>
			<td><fmt:formatDate value="${orderData.ordered_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>분류</td>
			<td>${orderData.category }</td>
		</tr>
		<tr>
			<td>스위치</td>
			<td>${orderData.switchs }</td>
		</tr>
		<tr>
			<td>주문수량</td>
			<td>${orderData.select_count }</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${orderData.item_name }</td>
		</tr>
		<tr>
			<td>제조사</td>
			<td>${orderData.manufacture }</td>
		</tr>
		<tr>
			<td>상품스펙</td>
			<td>${orderData.spec }</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${orderData.price }</td>
		</tr>
		<tr>
			<td>상품 등록일</td>
			<td><fmt:formatDate value="${orderData.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>주문 회원 번호</td>
			<td>${orderData.memberNo }</td>
		</tr>
		<tr>
			<td>주문 회원 이름</td>
			<td>${orderData.name }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${orderData.addr1 }</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${orderData.addr2 }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${orderData.tel }</td>
		</tr>
		<tr>
			<td>배송상태</td>
			<td>${orderData.status }</td>
		</tr>
		<tr>
			<td>환불신청</td>
			<td>${orderData.refund }</td>
		</tr>
		<tr>
			<td>환불신청일시</td>
			<td><fmt:formatDate value="${orderData.refund_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
</form>

<form action="">
	<table border="">
		<tr>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick='location.href="../admin/AdminRefund?ordered_num=${oNum }&orderNo=${oNo }";'>승인</button>
			</td>
			<td></td>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick='location.href="../admin/AdminRefund?ordered_num=${oNum }&orderNo=${oNo }";'>거절</button>
			</td>
			<td></td>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick='location.href="../admin/AdminRefund?ordered_num=${oNum }&orderNo=${oNo }";'>뒤로</button>
			</td>
		</tr>
	</table>
</form>

<script>
  function cancelPay() {
    jQuery.ajax({
      "url": "", // "{환불요청을 받을 서비스 URL}"예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": ${orderDto.ordered_num }, // "{결제건의 주문번호}" 예: ORD20180131-0000011
        "cancel_request_amount": 100, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
 //       "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
 //       "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
 //       "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
    		}),
      "dataType": "json"
    }).done(function(result) { // 환불 성공시 로직 
      alert("환불 성공");
    }).fail(function(error) { // 환불 실패시 로직
      alert("환불 실패");
    });
  }
</script>


</body>
</html>