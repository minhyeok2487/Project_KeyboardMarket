<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h1>고객센터 수정페이지</h1>

<form action="./QnaModifyReg" method="post">
	<input type="hidden" name="qnaNo" value="${dto.qnaNo }" /> <input
		type="hidden" name="pname" value="관리자" />

	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">번호</label> <input
			type="text" class="form-control" id="exampleFormControlInput1"
			value="${dto.qnaNo + 1 }" disabled="disabled">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label> <input
			type="text" class="form-control" id="exampleFormControlInput1"
			value="${dto.subject }" name="subject">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">작성자</label> <input
			type="text" class="form-control" id="exampleFormControlInput1"
			value="${dto.pname }" disabled="disabled">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1"
			rows="3" name="content">${dto.content }</textarea>
	</div>
	<tr>
		<td align="right"><button type="submit"
				class="btn btn-outline-primary">수정하기</button></td>
		<td align="right"><button type="reset"
				class="btn btn-outline-primary">초기화</button></td>
	</tr>
</form>