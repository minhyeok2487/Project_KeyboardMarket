<%@page import="model.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%	
	int memberNo;
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
		memberNo = dto.getMemberNo();
	} else {
		memberNo = 0;
	}
	pageContext.setAttribute("memberNo",memberNo);
%>

<h1>댓글 수정페이지</h1>
<script>
function checkEmpty() {
	var form = document.commentModify;
	if (form.subject.value == "") {
		alert("제목을 입력하세요.");
		form.subject.focus();
		return false;
	} else if (form.comment.value == ""){
		alert("내용을 입력하세요.");
		form.comment.focus();
		return false;
		}
	form.submit();
	}
</script>

<form action="./CommentModifyReg" method="post" name="commentModify">
	<input type="hidden" name="commentNo" value="${dto.commentNo }" />
	<input type="hidden" name="pname" value="${dto.pname }" />
	<input type="hidden" name="user_id" value="${dto.user_id }" />

	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">번호</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.commentNo}" disabled="disabled">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.subject }" name="subject">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">작성자</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" value="${dto.pname }" disabled="disabled">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment">${dto.comment }</textarea>
	</div>
		<div align="right"><button type="button" class="btn btn-outline-primary" onclick="checkEmpty()">수정하기</button></div>
		<div align="right"><button type="reset" class="btn btn-outline-primary">초기화</button></div>
</form>