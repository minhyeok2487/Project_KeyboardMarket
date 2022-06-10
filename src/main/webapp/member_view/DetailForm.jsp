<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.member.memberDTO"%>
<%	
	int memberNo;
	String name = "비회원";
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
		memberNo = dto.getMemberNo();
		name = dto.getName();
	} else {
		memberNo = 0;
	}
	pageContext.setAttribute("memberNo",memberNo);
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

<title>개인 정보</title>
</head>
<body>
<h1>개인 정보</h1>
<form action="ModifyForm" method="post">
	<input type="hidden" name="memberNo" value="${dto.memberNo }" />
	<table border="">
		<tr>
			<td>회원 번호</td><td>${dto.memberNo }</td>
		</tr>
		<tr>
			<td>아이디</td><td><input type="text" name="user_id" value="${dto.user_id }" /></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="text" name="user_pw" /></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" name="name" value="${dto.name }" /></td>
		</tr>
		<tr>
			<td>생일</td><td><fmt:formatDate value="${dto.birthdate }" pattern="yyyy-MM-dd"/></td>
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
			<td>이메일</td><td><input type="text" name="email" value="${dto.email }" /></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="addr1" value="${dto.addr1 }" /></td>
		</tr>
		<tr>
			<td>상세주소</td><td><input type="text" name="addr2" value="${dto.addr2 }" /></td>
		</tr>
		<tr>
			<td>전화 번호</td><td><input type="text" name="tel" value="${dto.tel }" /></td>
		</tr>
		<tr>
			<td>가입일</td><td><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td></td>
				<td colspan="2" align="center">
					<input type="reset" value="취소" />
					<input type="submit" value="수정" />
			</td>
		</tr>
	</table>
</form>

<form action="">
	<table border="">
		<tr>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="location.href='Withdrawal?memberNo=${dto.memberNo }'">회원 탈퇴</button>
			</td>
			<td></td>
		</tr>
	</table>
</form>


</body>
</html>