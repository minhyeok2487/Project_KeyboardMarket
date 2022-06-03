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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../top.jsp" />
	<div class="container">
		<div class="table-striped">
			<table class="table">
				<tr>
					<td><img src="<c:url value="/source/${dto.getItem_img1() }"/>" alt="" 
						width=300 height=300/></td>
					<td>
						<p>[상품번호 : ${dto.getItemNo() }]</p>
						<p>[상품명 : ${dto.getItem_name() }]</p>
						<p>[제조사 : ${dto.getManufacture() }]</p>
						<p>[종류 : ${dto.getCategory() }]</p>
						<p>[스위치 : ${dto.getSwitchs() }]</p>
						<p>[스펙 : ${dto.getSpec() }]</p>
						<p>[등록일 : ${dto.getReg_date() }]</p>
						<p>[가격 : ${dto.getPrice() }]</p>
						<p>[재고 : ${dto.getStock() }]</p>
					</td>
				</tr>
				<tr>
					<td colspan="2"><img src="<c:url value="/source/${dto.getItem_img2() }"/>" alt="" /></td>
				</tr>
			</table>
		</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
</body>
</html>