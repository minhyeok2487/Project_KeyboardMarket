<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호</title>
</head>
<body>

<h1>새로운 비밀번호를 입력하세요</h1>

<form name="updatePW" action="javascript:checkPWPW()" method="post">
	<table border="">
		<tr>
			<td>새 비밀번호</td>
			<td><input type="password" name="user_pw"/></td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td><input type="password" name="user_pw2"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="새 비밀번호 입력"  /></td>
		</tr>
	</table>
</form>


<script type="text/javascript">
			function checkPWPW(){
				var form = document.updatePW;
				if(form.user_pw.value == ""){
					alert("비밀번호를 입력해주세요");
					form.user_pw.focus();
				}else if(form.user_pw2.value == ""){
					alert("비밀번호 확인을 입력해주세요");
					form.user_pw2.focus();
				}else{
					if(form.user_pw.value != form.user_pw2.value){
						alert("비밀번호가 다릅니다. 다시 입력해주세요");
					}else{
						gogoUrl();
					}	
				}
			}
			
			function gogoUrl(){
				var url = "./UpdateNewPW?user_pw="+form.user_pw.value;
				location.href = url;
			}
</script>	



</body>
</html>