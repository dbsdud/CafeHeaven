<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ordNo=(String)request.getAttribute("ordNo");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function closeWin(time){
	setTimeOut("window.close()",time);
}
</script>
</head>
<body onLoad="closeWin('3000')">
	주문번호 <b><%=ordNo %></b> 처리 완료
	<br>
	3초후 닫힙니다.
</body>
</html>