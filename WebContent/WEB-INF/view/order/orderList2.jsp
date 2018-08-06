<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="poly.dto.OrderDTO" %>
<% List<OrderDTO> oList = (List<OrderDTO>)request.getAttribute("oList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script>
	$(function(){
		
	})
</script>
</head>
<body>
	<!-- 상단 -->
	<%@ include file = "/WEB-INF/view/mainCafeTop.jsp" %>
</body>
</html>