<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보</title>
</head>
<body>
<h1>개인 정보</h1>
<form action="ModifyForm" method="post">
<<<<<<< Updated upstream
	<input type="hidden" name="memberNo" value="${dto.memberNo }" />
=======
	<input type="hidden" name="id" value="${dto.memberNo }" />
>>>>>>> Stashed changes
	<table border="">
		<tr>
			<td>회원 번호</td>
			<td>${dto.memberNo }</td>
		</tr>
		<tr>
<<<<<<< Updated upstream
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
=======
			<td>아이디</td>
			<td><input type="text" name="user_id" value="${dto.user_id }" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="user_pw" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="${dto.name }" /></td>
		</tr>
		<tr>
			<td>생일</td>
			<td><fmt:formatDate value="${dto.birthdate }" pattern="yyyy-MM-dd"/></td>
>>>>>>> Stashed changes
		</tr>
		<tr>
			<td>성별</td>
			<td>${dto.gender }</td>
		</tr>
		<tr>
<<<<<<< Updated upstream
			<td>이메일</td><td><input type="text" name="email" value="${dto.email }" /></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="addr1" value="${dto.addr1 }" /></td>
		</tr>
		<tr>
			<td>배송주소</td><td><input type="text" name="addr2" value="${dto.addr2 }" /></td>
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
=======
			<td>이메일</td>
			<td><input type="text" name="email" value="${dto.email }" /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr1" value="${dto.addr1 }" /></td>
		</tr>
		<tr>
			<td>배송주소</td>
			<td><input type="text" name="addr2" value="${dto.addr2 }" /></td>
		</tr>
		<tr>
			<td>전화 번호</td>
			<td><input type="text" name="tel" value="${dto.tel }" /></td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
 		<tr>
			<td colspan="2" align="right">
				<input type="reset" value="취소" />
				<input type="submit" value="수정" />
>>>>>>> Stashed changes
			</td>
		</tr>
	</table>
</form>


</body>
</html>