<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
</head>
<body>
	<button onclick="requestPay()">결제하기</button>

	<script>
		function requestPay() {
			IMP.init('imp49092937');
			IMP.request_pay({ // param
				pg : "kakaopay.TC0ONETIME",
				pay_method : "card",
				merchant_uid : "iamport_test_id",//가맹점 주문번호(아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
				name : "상품명",
				amount : 1,//금액
				buyer_email : "gildong@gmail.com",
				buyer_name : "홍길동",
				buyer_tel : "010-4242-4242",
				buyer_addr : "서울특별시 강남구 신사동",
				buyer_postcode : "01181"
			}, function(rsp) { // callback
				if (rsp.success) {
					// 결제 성공 시 로직
					alert("완료");
				} else {
					// 결제 실패 시 로직,
					alert("실패");
				}
			});
		}
	</script>
</body>