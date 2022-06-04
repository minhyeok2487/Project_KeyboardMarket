<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<h1>공지사항이다아~~~~~</h1>
	<table border="">
		<tr align="center">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<c:forEach var="dto" items="${noticeData }" varStatus="no">
			<tr>
				<td>${no.index + 1 }</td>
				<td><a href="<c:url value="noticeDetail?id=${dto.noticeNo }"/>">${dto.subject }</a></td>
				<td>관리자</td>
				<td><fmt:formatDate value="${dto.reg_date }"
						pattern="yyyy-MM-dd HH:mm" /></td>
				<td>${dto.hits }</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>