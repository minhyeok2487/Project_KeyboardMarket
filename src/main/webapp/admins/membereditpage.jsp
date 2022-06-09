<%@page import="model.item.itemDTO"%>
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
			<h3 class="display-3">회원 정보 수정</h3>
		</div>
	</div>
	
	<div class="container">
		<a href="./MemberControl" class="btn btn-secondary">회원 목록으로</a>
		<form action="MemberEditReg" method="post">
			<input type="hidden" name="memberNo" value="${getMember.getMemberNo() }">
			<table class="table">
				<tr>
					<th>회원번호</th>
					<td>
						${getMember.getMemberNo() }
					</td>
				</tr>
				<tr>
					<th>회원아이디</th>
					<td>
						<input type="text" name="user_id" value="${getMember.getUser_id() }">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="text" name="user_pw" value="*******">
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>
						<input type="text" name="name" value="${getMember.getName() }">
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>
						${getMember.getBirthdate() }
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="text" name="gender" value="${getMember.getGender() }">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email" value="${getMember.getEmail() }">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="addr1" value="${getMember.getAddr1() }">
						<input type="text" name="addr2" value="${getMember.getAddr2() }">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="tel" value="${getMember.getTel() }">
					</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>
						${getMember.getReg_date() }
					</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						${getMember.getStatus() }
					</td>
				</tr>
				<tr>
					<td>
						<button class="btn btn-primary" type="submit">회원 정보 수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>