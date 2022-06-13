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
<h1>인증 받을 이메일을 입력하세요</h1>


<form name = "checkForm" action="" method="post">
	<table border="">
		<tr>
			<td>이메일</td>
			<td><input type="email" name="email"/></td>
		</tr>
		<tr>
			<td><input type="button" value="인증 코드 보내기" onclick="javascript:checkLogin()"/></td>
		</tr>
		
		
	</table>
</form>




<script type="text/javascript">
			function checkLogin(){
				var form = document.checkForm;
				if(form.email.value == ""){
					alert("이메일을 입력해주세요");
					form.email.focus();
					return false;
				}else{
					var uid = document.getElementsByName('email')[0].value;
					var url = "Authentication?email=" + uid;
					location.href = url;
				}
			}

</script>

</body>
</html>