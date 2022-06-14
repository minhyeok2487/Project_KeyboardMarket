<%@page import="model.item.itemDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
<title>관리자 페이지</title>
</head>
<body>
	<jsp:include page="../Admintop.jsp" >
		<jsp:param name="URL" value="member"/>
	</jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3">회원 정보 수정</h3>
		</div>
	</div>
	
	<div class="container">
		<a href="./MemberControl" class="btn btn-secondary">회원 목록으로</a>
		<form action="MemberEditReg" method="post">
			<input type="hidden" name="user_id" value="${getMember.getUser_id() }" />
			<input type="hidden" name="email" value="${getMember.getEmail() }" />
			<input type="hidden" name="reg_date" value="${getMember.getReg_date() }" />
			<input type="hidden" name="memberNo" value="${getMember.getMemberNo() }">
			<table class="table">
				<tr>
					<th>회원번호</th>
					<td>
						${getMember.getMemberNo() }
					</td>
				</tr>
				<tr>
					<th>회원아이디</th>
					<td>
						${getMember.getUser_id() }
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>
						<input type="text" name="name" value="${getMember.getName() }">
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>
					<input type="date" name="birthdate" value="<fmt:formatDate value="${getMember.birthdate }" pattern="yyyy-MM-dd"/>" id="currentDate" />
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<c:choose>
						<c:when test="${getMember.getGender() eq 'm'}">
							<input type='radio' name='gender' value='m' checked="checked"/>남성
							<input type='radio' name='gender' value='f' />여성
						</c:when>
						<c:when test="${getMember.getGender() eq 'f'}">
							<input type='radio' name='gender' value='m' />남성
							<input type='radio' name='gender' value='f' checked="checked" />여성
						</c:when>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email" value="${getMember.getEmail() }">
					</td>
				</tr>
				<tr>
					<th>주소</th>
						<td>
							<input id="member_post"  name="zip_code" type="text" value="${getMember.zip_code }" placeholder="주소 입력" readonly onclick="findAddr()">
							<input id="member_addr" name="addr1" type="text" value="${getMember.addr1 }" placeholder="Address" readonly> <br>
							<input type="text" name="addr2" value="${getMember.addr2 }" placeholder="상세 주소">
						</td>
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
						<c:if test="${getMember.tel1 eq tt}">
							<c:set  var="ss" value="selected" />
						</c:if>
						
						<option value="${tt }" ${ss }>${tt }</option>
							
					</c:forTokens>
					</select>
					</td>
					<td><input type="text" name="tel2" value="${getMember.tel2 }" placeholder="예)1234"/></td>
					<td><input type="text" name="tel3" value="${getMember.tel3 }" placeholder="예)1234"/></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>
					<fmt:formatDate value="${getMember.getReg_date() }" pattern="yyyy-MM-dd HH:mm:ss"/>
						
					</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
					<c:choose>
						<c:when test="${getMember.getStatus()  eq '관리자'}">
							<input type='radio' name='status' value='관리자' checked="checked"/>관리자
							<input type='radio' name='status' value='회원' />회원
							<input type='radio' name='status' value='정지' />정지
							<input type='radio' name='status' value='탈퇴' />탈퇴
						</c:when>
						<c:when test="${getMember.getStatus()  eq '회원'}">
							<input type='radio' name='status' value='관리자' />관리자
							<input type='radio' name='status' value='회원' checked="checked"/>회원
							<input type='radio' name='status' value='정지' />정지
							<input type='radio' name='status' value='탈퇴' />탈퇴
						</c:when>
						<c:when test="${getMember.getStatus()  eq '정지'}">
							<input type='radio' name='status' value='관리자' />관리자
							<input type='radio' name='status' value='회원' />회원
							<input type='radio' name='status' value='정지' checked="checked"/>정지
							<input type='radio' name='status' value='탈퇴' />탈퇴
						</c:when>	
						<c:when test="${getMember.getStatus()  eq '탈퇴'}">
							<input type='radio' name='status' value='관리자' />관리자
							<input type='radio' name='status' value='회원' />회원
							<input type='radio' name='status' value='정지'/>정지
							<input type='radio' name='status' value='탈퇴'  checked="checked"/>탈퇴
						</c:when>						
					</c:choose>
					</td>
				</tr>
				<tr>
					<td>
						<button class="btn btn-primary" type="submit">회원 정보 수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

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