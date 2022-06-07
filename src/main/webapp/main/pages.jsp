<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.member.memberDTO"%>
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
						<tr>
							<td colspan="5" align="center">주요 공지</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5" align="center">공지사항입니다아~~~(1)</td>
						</tr>
						<tr>
							<td colspan="5" align="center">공지사항입니다아~~~(2)</td>
						</tr>
						<tr>
							<td colspan="5" align="center">공지사항입니다아~~~(3)</td>
						</tr>
						<tr>
							<td colspan="5" align="center">공지사항입니다아~~~(4)</td>
						</tr>
						<tr>
							<td colspan="5" align="center">공지사항입니다아~~~(5)</td>
						</tr>
					</tbody>
				</table>
				<img src="source/MMMR3KH.jpeg" class="img-fluid rounded" alt="이미지썸네일01">
			</div>
			<div class="col-6">
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="source/1_1.jpg" class="d-block w-100 rounded"
								alt="키보드이미지01">
						</div>
						<div class="carousel-item">
							<img src="source/2_1.jpg" class="d-block w-100 rounded"
								alt="키보드이미지02">
						</div>
						<div class="carousel-item">
							<img src="source/3_1.jpg" class="d-block w-100 rounded"
								alt="키보드이미지03">
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
			<img src="source/1_thumb.jpg" class="img-fluid rounded" alt="이미지썸네일01">
			<img src="source/2_thumb.jpg" class="img-fluid rounded" alt="이미지썸네일02">
			<img src="source/3_thumb.jpg" class="img-fluid rounded" alt="이미지썸네일03">
			</div>
		</div>
	</div>
	<hr>
</body>
</html>