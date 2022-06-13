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

<form action="./LoginReg" name="frm" method="post">
	아이디<input type="text" name="member_id" />
	암호<input type="password" name="member_pw" />
	<input type="submit" value="로그인" />
</form>


<form action="" >
	<table border="">
		<tr>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="location.href='SignUp'">회원가입</button>
			</td>
			<td></td>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="location.href='SearchIDForm'">아이디 찾기</button>
			</td>
			<td></td>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="location.href='SearchPWForm'">비밀번호 찾기</button>
			</td>
			<td></td>

		</tr>
	</table>
</form>

<script type="text/javascript">

	function checkLogin() {
		// * : 0개 이상 반복되는지
		// $ : 그 패턴으로 끝이 나는지
		var spacing =  /\s/g; // 띄어쓰기 체크
		var newLine =  /\n/g; // 개행문자 체크 (제거로 만들자)
		var regExpId = /^[a-z|A-Z|0-9]+$/g; //id 체크 영문, 숫자만 가능
		var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/g; //최소 8자리, 최대 15자리. 최소 하나의 문자, 하나의 숫자, 하나의 특수문자
		
		var userId = form.member_id.value;
		var userPw = form.member_pw.value;

		if(userId == ""){
			alert("아이디를 입력하세요.");
		    form.
		    return false;
		}else if(spacing.test(userId)){
			alert("빈 칸이 없어야 합니다");
		    uid.focus();
		    return false;
		}
		
		if(user_pw == ""){
			alert("비밀번호를 입력하세요.");
		    uid.focus();
		    return false;
		}
	
	}

</script>
</body>
</html>