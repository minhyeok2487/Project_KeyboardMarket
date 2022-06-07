<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<h1>회원 가입</h1>
<form action="SignUpReg" method="post">
	<table border="">
		<tr>
			<td>아이디</td><td><input type="text" name="user_id" /></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="text" name="user_pw" /></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td>생일</td><td><input type="text" name="birthdate" /></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type='radio' name='gender' value='m' checked="checked"/>남성
				<input type='radio' name='gender' value='f' />여성
  			</td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="addr1" /></td>
		</tr>
		<tr>
			<td>배송주소</td><td><input type="text" name="addr2" /></td>
		</tr>
		<tr>
			<td>전화 번호</td><td><input type="text" name="tel" /></td>
		</tr>
		
		<tr>
			<td></td>
				<td colspan="2" align="center">
					<input type="reset" value="취소" />
					<input type="submit" value="가입" />
			</td>
		</tr>
	</table>
</form>


</body>
</html>