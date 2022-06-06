<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>공지사항 작성페이지</h2>

<form action="NoticeInsertReg" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="pname" value="관리자" />
	<table border="">
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" placeholder="제목을 입력하세요." /></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" value="관리자" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" cols="30" rows="20"
					placeholder="내용을 입력하세요."></textarea></td>
		</tr>
		<tr>
			<td>파일</td>
			<td><input type="file" name="upfile"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="reset" value="취소" />
				<input type="submit" value="작성" /></td>
		</tr>
	</table>
</form>