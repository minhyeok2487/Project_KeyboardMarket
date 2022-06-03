<%@page import="model.member.memberDAO"%>
<%@page import="model.member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="model.member.memberDTO" />
<jsp:setProperty property="*" name="dto"/>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	memberDTO mmm = new memberDAO().memberLogin(dto);
	System.out.println("logReg:"+mmm);
	String msg="로그인 실패";
	
	if(mmm != null){
		msg = "로그인 성공";
		
		session.setAttribute("inUser", mmm);
	}
%>


<script>
	alert("<%=msg%>");
	location.href = "main.jsp";
</script>


</body>
</html>