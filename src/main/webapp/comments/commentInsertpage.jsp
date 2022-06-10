
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<h2>댓글 작성페이지</h2>

<form action="./CommentInsertReg" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="user_id" value="${dto.user_id }" />
	<input type="hidden" name="pname" value="<%=name %>" />

	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label> <input
			type="text" class="form-control" id="exampleFormControlInput1"
			placeholder="제목을 입력하세요." name="subject">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">작성자</label> <input
			type="text" class="form-control" id="exampleFormControlInput1"
			value="<%=name %>" disabled="disabled">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1"
			rows="3" placeholder="내용을 입력하세요." name="comment"></textarea>
	</div>
		<div align="right"><button type="submit"
				class="btn btn-outline-primary">작성하기</button></div>
		<div align="right"><button type="reset"
				class="btn btn-outline-primary">초기화</button></div>
</form>