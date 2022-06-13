<%@page import="model.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
%>

<table class="table">
	<thead>
		<tr align="center" class="table-secondary">
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
	<c:when test="${process eq '답변' }">
	<c:forEach var="dto" items="${answer }" varStatus="no">
			<tr align="center">
				<td>${dto.qnaNo}</td>
				<td><a
					href="<c:url value="./QnaDetail?qnaNo=${dto.qnaNo }&page=${nowPage }"/>">${dto.subject }</a></td>
				<td>${dto.pname }</td>
				<td><fmt:formatDate value="${dto.reg_date }"
						pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</c:forEach>
	</c:when>
	<c:when test="${process eq '미답변' }">
	<c:forEach var="dto" items="${answer }" varStatus="no">
			<tr align="center">
				<td>${dto.qnaNo}</td>
				<td><a
					href="<c:url value="./QnaDetail?qnaNo=${dto.qnaNo }&page=${nowPage }"/>">${dto.subject }</a></td>
				<td>${dto.pname }</td>
				<td><fmt:formatDate value="${dto.reg_date }"
						pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${qnaDataTotal }" varStatus="no">
			<tr align="center">
				<td>${dto.qnaNo}</td>
				<td>
				<a href="<c:url value="./QnaDetail?qnaNo=${dto.qnaNo }&page=${nowPage }"/>">${dto.subject }</a>
				<%-- <c:forEach var="count" items="${count }" varStatus="no">[${count }]</c:forEach> --%>
				</td>
				<td>${dto.pname }</td>
				<td><fmt:formatDate value="${dto.reg_date }"
						pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>
<%
if (userStatus != null) {
	if (userStatus.equals("관리자")) {
%>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<a href="./QnaList">
		<button type="button" class="btn btn-outline-primary">전체</button>
	</a>
</div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<a href="../qna/QnaListSwitch?qnaStatus=답변">
		<button type="button" class="btn btn-outline-primary">답변완료</button>
	</a>
</div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<a href="../qna/QnaListSwitch?qnaStatus=미답변">
		<button type="button" class="btn btn-outline-primary">답변대기</button>
	</a>
</div>
<%
}
}
%>

<%
if (userStatus != null) {
	if (userStatus.equals("회원") || userStatus.equals("관리자")) {
%>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<a href="./qnaInsertpage">
		<button type="button" class="btn btn-outline-primary">글쓰기</button>
	</a>
</div>
<%
}
}
%>
<div align="center">
	<c:if test="${pageStart>1 }">
		<a href="<c:url value="/qna/QnaList?page=${pageStart-1 }"/>">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
		<c:choose>
			<c:when test="${nowPage==i }">
			[${i }]
			</c:when>
			<c:otherwise>
				<a href="<c:url value="/qna/QnaList?page=${i }"/>">${i }</a>
			</c:otherwise>

		</c:choose>

	</c:forEach>
	<c:if test="${pageEnd<pageTotal }">
		<a href="<c:url value="/qna/QnaList?page=${pageEnd+1 }"/>">[다음]</a>
	</c:if>
</div>
