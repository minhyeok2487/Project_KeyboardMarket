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
    <a class="navbar-brand" href="/Project_KeyboardMarket">키보드 마켓</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../notice/NoticeList">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../item/itemList">스마트 검색</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../cart/Cartview?reg=view">장바구니</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            회원관리
          </a>
          <ul id="topmenu_list" class="dropdown-menu" aria-labelledby="navbarDropdown" >
          	<%
          		if(user.getAttribute("inUser") == null){ %>
	              <li><a class="dropdown-item" href="../member/Login">LOGIN</a></li>
	              <li><a class="dropdown-item" href="../member/Join">JOIN</a></li>
	              <li><a class="dropdown-item" href="../member/SignUp">SignUp</a></li>
             	<%}else{ %>
	              <li><a class="dropdown-item" href="../member/Detail">Detail</a></li>
	              <li><a class="dropdown-item" href="../member/Logout">Logout</a></li>
	              <li><a class="dropdown-item" href="../member/Order">Order</a></li>
				<%} %>
          </ul>
        </li>
        <%
			if(userStatus != null){
				if(userStatus.equals("관리자")){
		%>
		<li class="nav-item">
          	<a class="nav-link active" aria-current="page" href="../admin/Adminmain">관리자 페이지</a>
        </li>
		<%}}%>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

