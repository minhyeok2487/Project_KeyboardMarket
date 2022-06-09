<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h1>고객센터 상세보기 부분~~</h1>

<div class="mb-3">
	<label for="exampleFormControlInput1" class="form-label">번호</label> <input
		type="text" class="form-control" id="exampleFormControlInput1"
		value="${dto.qnaNo + 1 }" disabled="disabled">
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
<tr>

	<td align="right"><a href="./QnaModifyForm?qnaNo=${dto.qnaNo }"><button
				type="submit" class="btn btn-outline-primary">수정하기</button></a></td>
</tr>