<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>
<h1>주문내역</h1>


<table border="">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<c:forEach var="dto" items="${mainData }" varStatus="no">
	<tr>
		<td>${start+no.index+1 }</td>
		<td>
		<a href="<c:url value="/board/Detail?id=${dto.id }&page=${nowPage }" />">${dto.title }</a>
		</td>
		<td>${dto.pname }</td>
		<td>
		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd HH:mm"/>
		</td>
		<td>${dto.cnt }</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5" align="center">
		<c:if test="${pageStart > 1 }">
			<a href="<c:url value="/board/List?page=${pageStart-1 }" />">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
			<c:choose>
				<c:when test="${nowPage==i }">
					[${i }]
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/board/List?page=${i }" />">${i }</a>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
		
		<c:if test="${pageEnd<pageTotal }">
			<a href="<c:url value="/board/List?page=${pageEnd+1 }" />">[다음]</a>
		</c:if>
		</td>
	</tr>
</table>


</body>
</html>