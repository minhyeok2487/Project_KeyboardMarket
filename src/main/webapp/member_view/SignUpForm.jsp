<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.member.memberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUpForm.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

<title>회원 가입</title>
</head>
<body>
<body class="text-center">
<main class="form-signin">
<form  action="SignUpReg?email=${email }" name="frm" method="post" >
<h1 class="h3 mb-3 fw-normal">회원 가입</h1>
	<div class="form-floating">
    <input type="text" name="user_id" class="form-control" id="id" placeholder="아이디">
       <label for="id">아이디</label>
    </div>
    <div class="form-floating">
	    <input type="password" name="user_pw" class="form-control" id="pwd" placeholder="비밀번호">
	    <label for="pwd">비밀번호</label>
	</div>
	<div class="form-floating">
       <input type="text" name="name" class="form-control" id="name" placeholder="이름">
       <label for="name">이름</label>
    </div>
	<div class="form-floating">
		<input type="date" name="birthdate" class="form-control" id="currentDate" placeholder="생일">
       	<label for="birthdate">생일</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="m" checked>
	  <label class="form-check-label" for="inlineRadio1">남성</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="f">
	  <label class="form-check-label" for="inlineRadio2">여성</label>
	</div>
	
	<div class="form-floating">
		<input type="text" name="email" value='${email }' class="form-control" id="email" placeholder="이름" readonly>
    		<label for="email">이메일</label>
	</div>
	
	<div class="form-floating">
		<input type="text" name="zip_code" class="form-control" id="member_post" placeholder="주소 입력" readonly onclick="findAddr()">
		<label for="addr">우편번호(클릭)</label>
	</div>
	<div class="form-floating">
		<input type="text" name="addr1" class="form-control" id="member_addr" placeholder="주소 입력" readonly onclick="findAddr()">
		<label for="addr">주소</label>
	</div>
	<div class="form-floating">
		<input type="text" name="addr2" class="form-control"  placeholder="상세 주소" >
		<label for="addr">상세주소</label>
	</div>
	<div class="container" >
		<div class="row" >
			<div class="col">
				<select class="form-control" name = "tel1" id="tel1" display="inline-block">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>	
					<option value="019">019</option>
				</select>
			</div>
			<div class="col">
				<input type="text" class="form-control" id="tel2" name="tel2" placeholder="예)1234" />
			</div>
			<div class="col">
				<input type="text" class="form-control" name="tel3" id="tel3" placeholder="예)1234" />
			</div>
		</div>
	</div>
	<button class="w-100 btn btn-lg btn-primary" type="submit" >회원가입</button>
</form>

</main>


<script>
  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

  function findAddr(){
  	new daum.Postcode({
          oncomplete: function(data) {
          	
          	console.log(data);
          	
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
              // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var roadAddr = data.roadAddress; // 도로명 주소 변수
              var jibunAddr = data.jibunAddress; // 지번 주소 변수
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('member_post').value = data.zonecode;
              if(roadAddr !== ''){
                  document.getElementById("member_addr").value = roadAddr;
              } 
              else if(jibunAddr !== ''){
                  document.getElementById("member_addr").value = jibunAddr;
              }
          }
      }).open();
  }
  
  function checkform() {
		if ( document.frm.name.value == "") {
			alert("이름을 입력해주세요")
			document.frm.name.select();
		}
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>