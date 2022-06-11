<%@page import="model.comment.CommentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.comment.CommentDTO"%>
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
pageContext.setAttribute("memberNo", memberNo);

Object dataList = new CommentDAO().list();

request.setAttribute("commentDataList", dataList);
%>
<h1>고객센터 상세보기 부분~~</h1>

<div class="mb-3">
	<label for="exampleFormControlInput1" class="form-label">번호</label> <input
		type="text" class="form-control" id="exampleFormControlInput1"
		value="${dto.qnaNo}" disabled="disabled">
</div>
<div class="mb-3">
	<label for="exampleFormControlInput1" class="form-label">제목</label> <input
		type="text" class="form-control" id="exampleFormControlInput1"
		value="${dto.subject }" disabled="disabled">
</div>
<div class="mb-3">
	<label for="exampleFormControlInput1" class="form-label">작성자</label> <input
		type="text" class="form-control" id="exampleFormControlInput1"
		value="${dto.pname }" disabled="disabled">
</div>
<div class="mb-3">
	<label for="exampleFormControlInput1" class="form-label">작성일</label> <input
		type="text" class="form-control" id="exampleFormControlInput1"
		value="<fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd HH:mm" />"
		disabled="disabled">
</div>
<div class="mb-3">
	<label for="exampleFormControlTextarea1" class="form-label">내용</label>
	<textarea class="form-control" id="exampleFormControlTextarea1"
		rows="3" disabled="disabled">${dto.content }</textarea>
</div>

<c:if test="${inUser != null && inUser.user_id == dto.user_id }">

	<div align="right">
		<a href="./QnaModifyForm?qnaNo=${dto.qnaNo }"><button
				type="submit" class="btn btn-outline-primary">수정하기</button></a>
	</div>
</c:if>

<%
if (userStatus != null) {
	if (userStatus.equals("관리자")) {
%>
<div align="right">
	<a href="../comment/commentInsertpage"><button type="button"
			class="btn btn-outline-primary">답변하기</button></a>
</div>
<%
}
}
%>
<hr>

<div class="container">
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">댓글</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<table class="table">
						<c:forEach var="dto" items="${commentDataList }" varStatus="no">
							<tr align="center">
								<td>${dto.commentNo}</td>
								<td><a
									href="<c:url value="./CommentDetail?commentNo=${dto.commentNo }"/>">${dto.subject }</a></td>
								<td>${dto.pname }</td>
								<td><fmt:formatDate value="${dto.reg_date }"
										pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>