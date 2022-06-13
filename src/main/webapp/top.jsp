<%@page import="javax.websocket.Session"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	pageContext.setAttribute("memberNo",memberNo);
%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="topmenu">
	<div class="container-fluid">
		<a class="navbar-brand" href="../mainpage/MainService">키보드 마켓</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="../notice/NoticeList">공지사항</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="../item/itemList">스마트 검색</a></li>
				<li class="nav-item">
					<%
						if(memberNo != 0){
					%> 
						<a class="nav-link active" aria-current="page"
					href="../cart/Cartview?reg=view&memberNo=${memberNo }">장바구니</a>
					<%		
						} else {
					%> 
						<a class="nav-link active" aria-current="page" href="../member/Login">장바구니</a>
					<%		
					}
					%> 
				</li>

						<%
          		if(dto != null){ %>
         			<c:set var="userName" value="<%=dto.getName() %>"/>
					<li><a class="dropdown-item" href="../member/Detail">회원 정보 보기</a></li>
					<li><a class="dropdown-item" href="../member/Logout">로그 아웃</a></li>
					<li><a class="dropdown-item" href="../member/Order">주문 내역 확인</a></li>
					<li><h3>${userName } 님 어서오세요!</h3></li>
					<%}else{ %>
					<li><a class="dropdown-item" href="../member/Login">로그인</a></li>
					<li><a class="dropdown-item" href="../member/SignUp">회원가입</a></li>
					<%} %>
<!-- 					</ul></li> -->
				<%
			if(userStatus != null){
				if(userStatus.equals("관리자")){
		%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="../admin/Adminmain">관리자 페이지</a></li>
				<%}}%>
			</ul>
			<form action="../item/SearchItem?" method="get" class="d-flex">
				<input class="form-control me-2" type="search" placeholder="제품 검색"
					aria-label="Search" name="itemname">
				<button class="btn btn-outline-success" type="submit">검색</button>
			</form>
		</div>
	</div>
</nav>
