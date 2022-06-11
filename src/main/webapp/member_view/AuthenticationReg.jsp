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

<h2>코드는 대소문자를 정확하게 입력해주세요</h2>
<form action="AuthenticationReg?AuthenticationKey=${AuthenticationKey }&email=${email}" method="post">

	<table border="">
		<tr>
			<td>코드 입력</td>
			<td><input type="text" name="AuthenticationUser"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="입력" /></td>
		</tr>
	</table>
</form>



</body>
</html>