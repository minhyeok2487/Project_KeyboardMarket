<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Insert title here</title>
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
				<td>${dto.noticeNo + 1}</td>
				<td><a
					href="<c:url value="NoticeDetail?noticeNo=${dto.noticeNo }"/>">${dto.subject }</a></td>
				<td>${dto.pname }</td>
				<td><fmt:formatDate value="${dto.reg_date }"
						pattern="yyyy-MM-dd HH:mm" /></td>
				<td>${dto.hits }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="right"><a href="NoticeInsertReg">글쓰기</a></td>
		</tr>
	</table>
		<tr>
			<td colspan="5" align="center">[이전] 1 2 3 4 5 [다음]</td>
		</tr>
		<c:url value=""/>
</body>
</html>