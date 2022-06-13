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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>개인 정보</title>
</head>
<body>
<h1>개인 정보</h1>
<form action="ModifyForm" method="post">
	<input type="hidden" name="memberNo" value="${dto.memberNo }" />
	<input type="hidden" name="user_id" value="${dto.user_id }" />
	<input type="hidden" name="email" value="${dto.email }" />
	<input type="hidden" name="reg_date" value="${dto.reg_date }" />
	<table border="">
		<tr>
			<td>회원 번호</td><td>${dto.memberNo }</td>
		</tr>
		<tr>
			<td>아이디</td><td>${dto.user_id }</td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="text" name="user_pw" /></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" name="name" value="${dto.name }" /></td>
		</tr>
		<tr>
			<td>생일</td>
			<td><input type="date" name="birthdate" value="<fmt:formatDate value="${dto.birthdate }" pattern="yyyy-MM-dd"/>" id="currentDate" /></td>
		</tr>
		<tr>
			<td>성별</td>
			<c:choose>
				<c:when test="${dto.gender eq 'm' }">
					<td>남성</td>
				</c:when>
				<c:when test="${dto.gender eq 'f' }">
					<td>여성</td>
				</c:when>
			</c:choose>
		</tr>
		<tr>
			<td>이메일</td><td>${dto.email }</td>
		</tr>
		<tr>
		<td>주소</td>
			<td>
				<input id="member_post"  name="zip_code" type="text" value="${dto.zip_code }" placeholder="주소 입력" readonly onclick="findAddr()">
				<input id="member_addr" name="addr1" type="text" value="${dto.addr1 }" placeholder="Address" readonly> <br>
				<input type="text" name="addr2" value="${dto.addr2 }" placeholder="상세 주소">
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">전화 번호</td>
			<td></td>
		</tr>
		
		<tr>
 			<td>
				<select name = "tel1">
				<c:forTokens items="010,011,016,017,019"  delims="," var="tt">
					<c:set  var="ss" value="" />
					<c:if test="${dto.tel1 eq tt}">
						<c:set  var="ss" value="selected" />
					</c:if>
					
					<option value="${tt }" ${ss }>${tt }</option>
						
				</c:forTokens>
				</select>
			</td>

			<td><input type="text" name="tel2" value="${dto.tel2 }" placeholder="예)1234"/></td>
			<td><input type="text" name="tel3" value="${dto.tel3 }" placeholder="예)1234"/></td>
		</tr>
		
		<tr>
			<td>가입일</td><td><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td></td>
				<td colspan="2" align="center">
					<input type="reset" value="취소" />
					<input type="submit" value="수정" />
			</td>
		</tr>
	</table>
</form>


<form action="">
	<table border="">
		<tr>
			<td>
				<button type="button"
				class="btn btn-outline-primary" onclick="location.href='Withdrawal?memberNo=${dto.memberNo }'">회원 탈퇴</button>
			</td>
			<td></td>
		</tr>
	</table>
</form>

<script type="text/javascript">
	
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


</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</body>
</html>