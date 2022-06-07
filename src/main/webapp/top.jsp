<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" >
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/Project_KeyboardMarket">키보드 마켓</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="notice/NoticeList">공지사항</a>
        </li>
        <li class="nav-item">
          <a href="/Project_KeyboardMarket/itemPages/itemList#">스마트 검색</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="cart/Cartview?reg=view">장바구니</a>
        </li>
      </ul>
       <nav id="topmenu">
          <ul id="topmenu_list">
          	<%
          		HttpSession user = request.getSession();
          		if(user.getAttribute("inUser") == null){ %>
	              <li><a href="member/Login">LOGIN</a></li>
	              <li><a href="member/Join">JOIN</a></li>
	              <li><a href="member/SignUp">SignUp</a></li>
             	<%}else{ %>
	              <li><a href="member/Detail">Detail</a></li>
	              <li><a href="member/Logout">Logout</a></li>
				<%} %>

          </ul>
        </nav>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>