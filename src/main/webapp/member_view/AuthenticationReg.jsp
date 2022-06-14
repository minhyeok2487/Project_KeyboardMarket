<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
<title>Insert title here</title>
</head>
<body>

<h2>코드는 대소문자를 정확하게 입력해주세요</h2>
<%-- <form action="AuthenticationReg?AuthenticationKey=${AuthenticationKey }&email=${email}" method="post"> --%>
<form action="AuthenticationReg" name="frm" method="post">
<input type="hidden" name="email" value="${email }" />
	<table border="">
		<tr>
			<td>코드 입력</td>
			<td><input type="text" id="AuthenticationUser"/></td>
		</tr>
		<tr>
			<td><input type="button" value="입력" onclick="javascript:checkCode()"/></td>
		</tr>
	</table>
</form>

<h1>
	<div>
	  <span>제한시간  :   </span><span id="timer"></span>
	</div>
</h1>

<script type="text/javascript">


	function $ComTimer(){
	    //prototype extend
	}
	
	$ComTimer.prototype = {
	    comSecond : ""
	    , fnCallback : function(){}
	    , timer : ""
	    , domId : ""
	    , fnTimer : function(){
	        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은 시간 계산
	        this.comSecond--;					// 1초씩 감소
	        console.log(m);
	        this.domId.innerText = m;
	        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
	            clearInterval(this.timer);		// 타이머 해제
	            alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.")
	            location.href = "<c:url value="./Login"/>";
	        }
	    }
	    ,fnStop : function(){
	        clearInterval(this.timer);
	    }
	}
	
	 var AuthTimer = new $ComTimer()
	
	  AuthTimer.comSecond = 180;
	  AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
	  AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
	  AuthTimer.domId = document.getElementById("timer");
	  
	  

</script>

<script type="text/javascript">
	function checkCode() {
		var AuthenticationKeyCheck = '${AuthenticationKey }';
		var AuthenticationUser = document.getElementById('AuthenticationUser').value;
		
		var form = document.frm;
		
		if(AuthenticationKeyCheck == AuthenticationUser){
			form.submit();
		}else{
			alert("코드가 틀립니다");
		}
	}

</script>

</body>
</html>