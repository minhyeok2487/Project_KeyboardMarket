<%@page import="javax.websocket.Session"%>
<%@page import="model.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
	}
%>    
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" >
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="topmenu">
  <div class="container-fluid">
  	<a class="navbar-brand" href="./Adminmain">관리자 페이지</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./MemberControl">회원관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./ItemControl">상품관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">고객센터</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./NoticeControl">공지사항 관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./MainControl">메인페이지 관리</a>
        </li>
      </ul>
    </div>
  </div>
</nav>