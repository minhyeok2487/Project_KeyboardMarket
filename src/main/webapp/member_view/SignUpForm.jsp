<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>회원 가입</title>
</head>
<body>
<h1>회원 가입</h1>
<form action="SignUpReg?email=${email }" name="frm" method="post">
	<table border="" width="500">
		<tr>
			<td>아이디</td><td><input colspan="2" type="text" name="user_id" placeholder="한글 제외"/></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="password" name="user_pw" placeholder="영문과 숫자 혼용"/></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" name="name" placeholder="홍길동"/></td>
		</tr>
		<tr>
			<td>생일</td><td><input type="date" name="birthdate" id="currentDate" /></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type='radio' name='gender' value='m' checked="checked"/>남성
				<input type='radio' name='gender' value='f' />여성
  			</td>
		</tr>
		<tr>
			<td>이메일</td><td>${email }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input id="member_post"  name="zip_code" type="text" placeholder="주소 입력" readonly onclick="findAddr()">
				<input id="member_addr" name="addr1" type="text" placeholder="Address" readonly> <br>
				<input type="text" name="addr2" placeholder="상세 주소">
			</td>
		</tr>
		<tr>
			<td>전화 번호</td><td><input type="text" name="tel" placeholder="예)01012341234"/></td>
		</tr>
		
		<tr>
			<td></td>
				<td colspan="2" align="center">
					<input type="reset" value="취소" />
					<input type="submit" value="가입" />
			</td>
		</tr>
	</table>
</form>



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