<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<td></td>
		</tr>
		<tr>
			<td>상품 이름</td>
			<td></td>
		</tr>
		<tr>
			<td>제조사</td>
			<td></td>
		</tr>
		<tr>
			<td>분류</td>
			<td></td>
		</tr>
		<tr>
			<td>연결방식</td>
			<td></td>
		</tr>
		<tr>
			<td>스위치</td>
			<td></td>
		</tr>
		<tr>
			<td>상품 스펙</td>
			<td></td>
		</tr>
		<tr>
			<td>가격</td>
			<td></td>
		</tr>
		<tr>
			<td>재고수량</td>
			<td></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td></td>
		</tr>
		<tr>
			<td>주문수</td>
			<td></td>
		</tr>
	</table>
</form>




</body>
</html>