<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="windowClose()">

<script type="text/javascript">
function windowClose(){
	//팝업창에서 부모창을 다른페이지로 이동합니다.
	window.opener.location.href= "./Login";
	self.close();
}
</script>


</body>
</html>