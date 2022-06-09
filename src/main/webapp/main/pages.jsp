<%@page import="model.item.itemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.member.memberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	HttpSession user = request.getSession();
String userStatus = null;
memberDTO dto = (memberDTO) user.getAttribute("inUser");
if (dto != null) {
	userStatus = dto.getStatus();
}

NoticeDAO dao = new NoticeDAO();
Object dataList = dao.list(0, 5);

request.setAttribute("noticeMainList", dataList);
%>
<title>메인페이지</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<table class="table table-success table-striped">
					<thead>
						<tr align="center">
							<th colspan="5">주요 공지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${noticeMainList }" varStatus="no">
							<tr align="center">
								<td><a
									href="../notice/NoticeDetail?noticeNo=${dto.noticeNo }">${dto.subject }</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h2>!!M.T.S 추천상품!!</h2>
				<div id="carouselExampleDark" class="carousel carousel-dark slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<%
						ArrayList<itemDTO> GList = (ArrayList<itemDTO>) request.getAttribute("GList");
						for(int i=0; i<GList.size();i++){
							if(i==0){
					%>
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<%
							} else {
								pageContext.setAttribute("i",i);
					%>
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="${i }" aria-label="Slide ${i+1 }"></button>
						<%
							}
						}
					%>
					</div>
					<div class="carousel-inner">
					<%
						for(int i=0; i<GList.size();i++){
							pageContext.setAttribute("img",GList.get(i).getItem_img1());
							pageContext.setAttribute("itemNo",GList.get(i).getItemNo());
							pageContext.setAttribute("itemName",GList.get(i).getItem_name());
							if(i==0){
					%>
						<div class="carousel-item active" data-bs-interval="10000">
							<a href="../item/itemdetail?id=${itemNo}">
							<img src="<c:url value="/source/${img }"/>" class="d-block w-100"
								alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>${itemName}</h5>
							</div>
							</a>
						</div>
					<%
							} else {
								
					%>
						<div class="carousel-item" data-bs-interval="2000">
							<a href="../item/itemdetail?id=${itemNo}">
							<img src="<c:url value="/source/${img }"/>" class="d-block w-100"
								alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>${itemName}</h5>
							</div>
							</a>
						</div>
					<%
							}
						}
					%>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col">
				<h2>!!M.T.S 신상품!!</h2>
				<div id="carouselExampleDark" class="carousel carousel-dark slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<%
						ArrayList<itemDTO> NList = (ArrayList<itemDTO>) request.getAttribute("NList");
						for(int i=0; i<NList.size();i++){
							if(i==0){
					%>
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<%
							} else {
								pageContext.setAttribute("i",i);
					%>
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="${i }" aria-label="Slide ${i+1 }"></button>
						<%
							}
						}
					%>
					</div>
					<div class="carousel-inner">
					<%
						for(int i=0; i<NList.size();i++){
							pageContext.setAttribute("img",NList.get(i).getItem_img1());
							pageContext.setAttribute("itemNo",NList.get(i).getItemNo());
							pageContext.setAttribute("itemName",NList.get(i).getItem_name());
							if(i==0){
					%>
						<div class="carousel-item active" data-bs-interval="10000">
							<a href="../item/itemdetail?id=${itemNo}">
							<img src="<c:url value="/source/${img }"/>" class="d-block w-100"
								alt="...">
							<div class="carousel-caption d-none d-md-block">
							<h5>${itemName}</h5>
							</div>
							</a>
						</div>
					<%
							} else {
								
					%>
						<div class="carousel-item" data-bs-interval="2000">
							<a href="../item/itemdetail?id=${itemNo}">
							<img src="<c:url value="/source/${img }"/>" class="d-block w-100"
								alt="...">
							<div class="carousel-caption d-none d-md-block">
							<h5>${itemName}</h5>
							</div>
							</a>
						</div>
					<%
							}
						}
					%>
					</div>
					
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			
		</div>

	</div>
</body>
</html>

