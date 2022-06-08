<%@page import="model.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.member.memberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

Object dataList = new NoticeDAO().list(0, 5);
request.setAttribute("noticeMainData", dataList);
%>
<title>메인페이지</title>
</head>
<body>
	<hr>
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
					<c:forEach var="dto" items="${noticeMainData }" varStatus="no">
							<tr align="center">
								<td><a href="../NoticeDetail?noticeNo=${dto.noticeNo }">${dto.subject }</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<img
					src="/Project_KeyboardMarket/src/main/webapp/source/MMMR3KH.jpeg"
					class="img-fluid rounded" alt="이미지썸네일01">
			</div>
			<div class="col-6">
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/Project_KeyboardMarket/src/main/webapp/source/1_1.jpg"
								class="d-block w-100 rounded" alt="키보드이미지01">
						</div>
						<div class="carousel-item">
							<img src="/Project_KeyboardMarket/src/main/webapp/source/2_1.jpg"
								class="d-block w-100 rounded" alt="키보드이미지02">
						</div>
						<div class="carousel-item">
							<img src="/Project_KeyboardMarket/src/main/webapp/source/3_1.jpg"
								class="d-block w-100 rounded" alt="키보드이미지03">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col">
				<img src="/Project_KeyboardMarket/src/main/webapp/source/10_1.jpg"
					class="img-fluid rounded" alt="이미지썸네일01"> <img
					src="/Project_KeyboardMarket/src/main/webapp/source/10_2.jpg"
					class="img-fluid rounded" alt="이미지썸네일02">
			</div>
		</div>
	</div>
	<hr>
</body>
</html>