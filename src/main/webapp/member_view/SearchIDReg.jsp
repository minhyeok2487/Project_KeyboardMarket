<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
<title>아이디 찾기 결과</title>
</head>
<body>

<h3> 
	아이디 찾기 결과 <br>
	당신의 아이디는 <br>

</h3>


<h1>
	${userID }
</h1>



<form action="">
	<table border="">
		<tr>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="location.href='Login'">로그인으로 돌아가기</button>
			</td>
			<td></td>
		</tr>
	</table>
</form>


</body>
</html>