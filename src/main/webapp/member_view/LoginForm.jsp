<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.member.memberDTO"%>
<%	
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h1>로그인</h1>

<form action="./LoginReg" method="post">
	아이디<input type="text" name="member_id" />
	암호<input type="password" name="member_pw" />
	<input type="submit" value="로그인" />
</form>


</body>
</html>