<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h1>공지사항 상세보기 부분~~</h1>

<table border="">
	<tr>
		<td>번호</td>
		<td>${dto.noticeNo + 1 }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${dto.subject }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${dto.pname }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><fmt:formatDate value="${dto.reg_date }"
				pattern="yyyy-MM-dd HH:mm" /></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${dto.hits }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${dto.content }</td>
	</tr>
	<tr>
		<td>파일</td>
		<td>${dto.upfile }</td>
	</tr>
</table>