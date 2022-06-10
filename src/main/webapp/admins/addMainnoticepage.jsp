<%@page import="model.notice.NoticeDTO"%>
<%@page import="model.item.itemDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<%@page import="model.member.memberDTO"%>
<%
int memberNo;
String name = "비회원";
HttpSession user = request.getSession();
String userStatus = null;
memberDTO dto = (memberDTO) user.getAttribute("inUser");
if (dto != null) {
	userStatus = dto.getStatus();
	memberNo = dto.getMemberNo();
	name = dto.getName();
} else {
	memberNo = 0;
}
pageContext.setAttribute("memberNo", memberNo);
%>
<title>관리자 페이지</title>
</head>
<body>
	<jsp:include page="../Admintop.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">메인페이지 공지 추가</h1>
		</div>
	</div>

	<div class="container">
		<table class="table">
			<tr>
				<th></th>
				<th>공지사항 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			<%
			ArrayList<NoticeDTO> AllNoticeList = (ArrayList<NoticeDTO>) request.getAttribute("AllNoticeList");
			for (int i = 0; i < AllNoticeList.size(); i++) {
				NoticeDTO item = AllNoticeList.get(i);
			%>
			<input type="hidden" name="noticeNo" value="<%=item.getNoticeNo()%>">
			<tr>
				<td></td>
				<td><%=item.getNoticeNo()%></td>
				<td><%=item.getSubject()%></td>
				<td><%=item.getPname()%></td>
				<td><%=item.getReg_date()%></td>
				<td>
					<p>
						<a
							href="./AddMainNoticeReg?noticeNo=<%=item.getNoticeNo()%>"><button
								class="btn btn-primary" type="button">주요 공지 추가</button></a>
					</p>
				</td>
			</tr>
			<%
			}
			%>

		</table>

	</div>
</body>
</html>