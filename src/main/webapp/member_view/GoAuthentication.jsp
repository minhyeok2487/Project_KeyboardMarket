<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" onsubmit="gogo()" ></form>

<script>
	function gogo(){
			var uid = ${email};
			var url = "Authentication?email=" + uid;
			location.href = url;
	}

</script>

</body>
</html>