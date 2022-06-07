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
	request.setCharacterEncoding("UTF-8");
%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>주문페이지</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문내역서 작성</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="#" class="btn btn-danger">장바구니
							돌아가기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
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
				<c:set var="imgthumb" value="<%=item.getItem_img1()%>" />
				<tr>
					<td><img src="<c:url value="/source/${imgthumb }"/>" alt=""
						width=150 height=150 /></td>
					<td><%=item.getItem_name()%></td>
					<td><%=item.getPrice()%></td>
					<td><%=item.getSelected_count()%></td>
					<td><%=total%></td>
					<td><a
						href="./RemoveItem?itemNo=<%=item.getItemNo()%>&memberNo=<%=memberNo%>">삭제</a></td>
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
		</div>
		<hr>
	</div>

	<div class="container">
		<form name="frm" action="../cart/OrderEnd" method="post">
			<input type="hidden" name="memberNo" value="${memberNo.memberNo }">
			<input type="hidden" id="ordered_num" name="ordered_num">
			<div class="form-group row">
				<label class="col-sm-2">주문자 이름</label>
				<div class="col-sm-3">${memberNo.name }</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주문자 전화번호</label>
				<div class="col-sm-3">${memberNo.tel }</div>
			</div>
			<div>
				<label class="col-sm-2">주문자 주소</label><br> 
				<input type="text" id="sample4_postcode" disabled="disabled" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
				<input type="text" id="sample4_roadAddress" disabled="disabled" name="addr1" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" disabled="disabled" placeholder="지번주소"><br>
				<input type="text" id="sample4_detailAddress" name="addr2" placeholder="상세주소 입력"> 
				<input type="text" id="sample4_extraAddress" disabled="disabled" placeholder="참고항목">
			</div>
		</form>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10 ">
				<a href="./cart.jsp?memberNo=<%=request.getParameter("memberNo")%>"
					class="btn btn-secondary" role="button">이전</a>
				<button onclick="requestPay()" class="btn btn_primary">결제하기</button>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"
					role="button">취소</a>
			</div>
		</div>

	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}
						}
					}).open({
						autoClose: true
					});
		}
		
	</script>
	<script>
		Date.prototype.YYYYMMDDHHMMSS = function(){
			var yyyy = this.getFullYear().toString();
			var MM = pad(this.getMonth() + 1,2);
			var dd = pad(this.getDate() + 2);
			var hh = pad(this.getHours() + 2);
			var mm = pad(this.getMinutes() + 2);
			var ss = pad(this.getSeconds() + 2);
			return yyyy + MM + dd + hh + mm + ss;
		}
		
		function pad(number, length){
			var str = ''+ number;
			while(str.length < length){
				str = '0' + str;
			}
			return str;
		}
		
	
		function requestPay() {
			var nowDate = new Date();
			var order_num = "MTS"+ nowDate.YYYYMMDDHHMMSS();
			if(document.getElementById('sample4_postcode').value != ""
					& document.getElementById('sample4_detailAddress').value != ""){
				IMP.init('imp49092937');
				IMP.request_pay({ // param
						pg : "inicis",
						pay_method : "card",
						merchant_uid : order_num,//주문번호
						name : "상품명",
						amount : 100,//금액 일단 고정
						buyer_email : "gildong@gmail.com",
						buyer_name : "홍길동",
						buyer_tel : "010-4242-4242",
						buyer_addr : document.getElementById("sample4_roadAddress").value,
						buyer_postcode : "01181"
					}, function(rsp) { // callback
						if (rsp.success) {
							// 결제 성공 시 로직
							document.getElementById("ordered_num").value = order_num;
							document.frm.submit();
							
						} else {
							//결제 실패 시 로직,
							alert("실패");
							document.getElementById("ordered_num").value = order_num;
							document.frm.submit();
						}
					});
			} else {
				alert("우편번호를 입력해주십시오");
			}
			
		}
	</script>

</body>
</html>