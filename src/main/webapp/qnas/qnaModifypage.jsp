<%@page import="model.order.OrderDAO"%>
<%@page import="model.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%	
	int memberNo;
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
		memberNo = dto.getMemberNo();
	} else {
		memberNo = 0;
	}
	pageContext.setAttribute("memberNo",memberNo);
	
	ArrayList<OrderDTO> totalOrderList = new ArrayList<OrderDTO>();

	ArrayList<OrderDTO> orderList = new OrderDAO().SearchMemberNolist("주문완료", memberNo);
	for (int i = 0; i < orderList.size(); i++){
		totalOrderList.add(orderList.get(i));
	}

	ArrayList<OrderDTO> deliveryList = new OrderDAO().SearchMemberNolist("배송중", memberNo);
	for (int i = 0; i < deliveryList.size(); i++){
		totalOrderList.add(deliveryList.get(i));
	}

	ArrayList<OrderDTO> deliveryComList = new OrderDAO().SearchMemberNolist("배송완료", memberNo);
	for (int i = 0; i < deliveryComList.size(); i++){
		totalOrderList.add(deliveryComList.get(i));
	}
%>

<h1>고객센터 수정페이지</h1>
<script>
function checkEmpty() {
	var form = document.qnaModify;
	if (form.subject.value == "") {
		alert("제목을 입력하세요.");
		form.subject.focus();
		return false;
	} else if (form.content.value == ""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
		}
	form.submit();
	}
</script>

<form action="./QnaModifyReg" method="post" name="qnaModify">
	<input type="hidden" name="qnaNo" value="${dto.qnaNo }" />
	<input type="hidden" name="pname" value="${dto.pname }" />
	<input type="hidden" name="user_id" value="${dto.user_id }" />

	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">번호</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.qnaNo}" disabled="disabled">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.subject }" name="subject">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">작성자</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.pname }" disabled="disabled">
	</div>
	<%
	if(totalOrderList.size() > 0){
	%>
	<label for="exampleFormControlInput1" class="form-label">주문번호</label>
	<div class="dropdown">
		<select class="btn btn-secondary dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" name="select_orderNum">
		<%
		String ordered_num = null;
		String itemName = null;
		for (int i = 0; i < totalOrderList.size(); i++){
			ordered_num = totalOrderList.get(i).getOrdered_num();
			itemName = totalOrderList.get(i).getItem_name();
			%>
			<option value="<%=ordered_num %>"> <%=ordered_num %> - <%=itemName %> </option>
		<%
		}
		%>
		</select>
	</div>
		<%
		}
		%>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content">${dto.content }</textarea>
	</div>
		<div align="right"><button type="button" class="btn btn-outline-primary" onclick="checkEmpty()">수정하기</button></div>
		<div align="right"><button type="reset" class="btn btn-outline-primary">초기화</button></div>
</form>