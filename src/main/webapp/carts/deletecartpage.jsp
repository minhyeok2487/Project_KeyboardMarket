<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	int memberNo = (int)request.getAttribute("memberNo");
%>

<form name="frm" action="../cart/Cartview?" method="post">
	<input type="hidden" name="reg" value="delCart" /> 
	<input type="hidden" name="memberNo" value="${memberNo }" />
</form>

<script>
	alert("<%=msg %>");
	document.frm.submit();
</script>