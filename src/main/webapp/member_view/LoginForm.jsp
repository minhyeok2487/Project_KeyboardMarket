<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.member.memberDTO"%>
<%	
	int memberNo;
	String name = "비회원";
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
		memberNo = dto.getMemberNo();
		name = dto.getName();
	} else {
		memberNo = 0;
	}
	pageContext.setAttribute("memberNo",memberNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>로그인</title>
</head>
<body>
<h1>로그인</h1>

<form action="./LoginReg" method="post">
	아이디<input type="text" name="member_id" />
	암호<input type="password" name="member_pw" />
	<input type="submit" value="로그인" />
</form>


<form action="">
	<table border="">
		<tr>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="location.href='SearchIDForm'">아이디 찾기</button>
			</td>
			<td></td>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="">비밀번호 찾기</button>
			</td>
			<td></td>
		</tr>
	</table>
</form>




</body>
</html>