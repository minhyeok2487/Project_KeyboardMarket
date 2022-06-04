<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<td>${no.index }</td>
			<td>${dto.subject }</td>
			<td>관리자</td>
			<td>2022-06-04 00:00</td>
			<td>123123</td>
		</tr>

	</c:forEach>
</table>