<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>글 수정 페이지</h2>

<form action="NoticeModifyReg" method="post">
<input type="hidden" name="noticeNo" value="${dto.noticeNo }"/>
<input type="hidden" name="pname" value="관리자" />
<table border="">
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" value="${dto.subject }" /></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" value="${dto.pname }" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" cols="30" rows="20">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td>파일</td>
			<td><input type="file" name="upfile" value="${dto.upfile }"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="reset" value="취소" />
				<input type="submit" value="수정" /></td>
		</tr>
	</table>
</form>