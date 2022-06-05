<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int memberNo = (int)request.getAttribute("memberNo");
	int itemNo = (int)request.getAttribute("itemNo");
%>

<form name="frm" action="../cart/Cartview?" method="post">
	<input type="hidden" name="reg" value="removeItem" /> 
	<input type="hidden" name="memberNo" value="${memberNo }" />
	<input type="hidden" name="itemNo" value="${itemNo }" />
</form>

<script>
	document.frm.submit();
</script>