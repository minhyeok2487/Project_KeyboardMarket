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
HttpSession user = request.getSession();
String userStatus = null;
memberDTO dto = (memberDTO) user.getAttribute("inUser");
if (dto != null) {
	userStatus = dto.getStatus();
}
%>
<title>관리자 페이지</title>
</head>
<body>
	<jsp:include page="../Admintop.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 관리</h1>
		</div>
	</div>
	
	<div class="container">
		<table class="table">
			<tr>
				<th>회원 번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>성별</th>
				<th>이메일</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>등록일</th>
				<th>상태</th>
				<th>비고</th>
			</tr>

			<%
			ArrayList<memberDTO> memberList = (ArrayList<memberDTO>) request.getAttribute("memberList");
			for (int i = 0; i < memberList.size(); i++) { 
				memberDTO item = memberList.get(i);
				pageContext.setAttribute("memberNo",item.getMemberNo());
			%>
			<tr>
				<td><%=item.getMemberNo() %></td>
				<td><%=item.getUser_id()%></td>
				<td><%=item.getName()%></td>
				<td><%=item.getBirthdate()%></td>
				<td><%=item.getGender() %></td>
				<td><%=item.getEmail()%></td>
				<%
					if(item.getAddr1()!=null && item.getAddr2()!=null){
				%>
					<td><%=item.getAddr1()%> <%=item.getAddr2() %></td>
				<%		
					} else {
				%>
					<td>주소미입력</td>
				<%	
					}
				%>
				
				<td><%=item.getTel()%></td>
				<td><%=item.getReg_date()%></td>
				<td><%=item.getStatus()%></td>
				<td>
					<p><a href="./MemberEdit?&memberNo=${memberNo }"><button class="btn btn-dark" type="button">사용자 정보 수정</button></a></p>
					<%
						if(item.getStatus().equals("정지")){
					%>
						<p><a href="./MemberStatusChange?status=회원&memberNo=${memberNo }"><button class="btn btn-success" type="button">정지 해제</button></a></p>
					<%			
						} else {
					%>
						<p><a href="./MemberStatusChange?status=정지&memberNo=${memberNo }"><button class="btn btn-danger" type="button">사용자 정지</button></a></p>
					<%
						}
					%>
					<p><a href="./SearchMemberInfo?&memberNo=${memberNo }"><button class="btn btn-info" type="button">조회</button></a></p>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>