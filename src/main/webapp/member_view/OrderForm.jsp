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

<form method="post">
	<table border="2">
		<tr>
			<td>번호</td>
			<td>상품명</td>
			<td>주문상태</td>
			<td>주문일</td>
		</tr>
		<c:forEach var="dto" items="${mainData }" varStatus="no">
		<tr>
			<td>${total-no.index }</td>
			<td>
			<a href="<c:url value="/member/OrderDetail?orderNo=${dto.orderNo }&page=${nowPage }" />">${dto.item_name }</a>
			</td>
			<td>${dto.status }</td>
			<td>
			<fmt:formatDate value="${dto.ordered_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="4" align="center">
			<c:if test="${pageStart > 1 }">
				<a href="<c:url value="/member_view/OrderForm?page=${pageStart-1 }" />">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage==i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/member_view/OrderForm?page=${i }" />">${i }</a>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:if test="${pageEnd<pageTotal }">
				<a href="<c:url value="/member_view/OrderForm?page=${pageEnd+1 }" />">[다음]</a>
			</c:if>
			</td>
		</tr>
	</table>
</form>

</body>
</html>