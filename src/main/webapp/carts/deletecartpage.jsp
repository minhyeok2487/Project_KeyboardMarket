<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.member.memberDTO"%>
<%	
	HttpSession user = request.getSession();
	String userStatus = null;
	memberDTO dto = (memberDTO) user.getAttribute("inUser");
	if (dto != null) {
		userStatus = dto.getStatus();
	}
%> 
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