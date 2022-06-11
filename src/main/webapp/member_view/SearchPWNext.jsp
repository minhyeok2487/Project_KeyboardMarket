<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>인증 받을 이메일을 입력하세요</h1>


<h2><%=session.getAttribute("userID") %> 님 아이디 확인되었습니다</h2>

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
					joinMember();
				}
			}


            function joinMember(){
            	var uid = document.getElementsByName('email')[0].value;
            	var url = "Authentication?email=" + uid;
               window.open(url, "인증하기", "width=640, height=400")
            }
</script>	

</body>
</html>