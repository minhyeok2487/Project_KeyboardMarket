<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보</title>
</head>
<body>
<h1>개인 정보</h1>

<table border="">
	<tr>
		<td>회원 번호</td><td>${dto.memberNo }</td>
	</tr>
	<tr>
		<td>아이디</td><td>${dto.user_id }</td>
	</tr>
	<tr>
		<td>비밀번호</td><td></td>
	</tr>
	<tr>
		<td>이름</td><td>${dto.name }</td>
	</tr>
	<tr>
		<td>생일</td><td>${dto.birthdate }</td>
	</tr>
	<tr>
		<td>성별</td><td>${dto.gender }</td>
	</tr>
	<tr>
		<td>이메일</td><td>${dto.email }</td>
	</tr>
	<tr>
		<td>주소</td><td>${dto.addr1 }</td>
	</tr>
	<tr>
		<td>배송주소</td><td>${dto.addr2 }</td>
	</tr>
	<tr>
		<td>전화 번호</td><td>${dto.tel }</td>
	</tr>
	<tr>
		<td>가입일</td><td>${dto.reg_date }</td>
	</tr>
</table>


</body>
</html>