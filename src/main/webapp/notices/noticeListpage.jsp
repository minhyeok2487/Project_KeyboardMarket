<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table">
	<thead>
		<tr align="center" class="table-secondary">
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${noticeData }" varStatus="no">
			<tr align="center">
				<td>${dto.noticeNo + 1}</td>
				<td><a
					href="<c:url value="./NoticeDetail?noticeNo=${dto.noticeNo }"/>">${dto.subject }</a></td>
				<td>${dto.pname }</td>
				<td><fmt:formatDate value="${dto.reg_date }"
						pattern="yyyy-MM-dd HH:mm" /></td>
				<td>${dto.hits }</td>
			</tr>
		</c:forEach>
	</tbody>
	<tr>
		<td colspan="5" align="right"><a href="./noticeInsertpage"><button type="button" class="btn btn-outline-primary">글쓰기</button></a></td>
	</tr>
</table>

