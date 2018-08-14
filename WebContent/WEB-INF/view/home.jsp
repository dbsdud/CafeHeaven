<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<title>Insert title here</title>
<style>
body {
	background-image: url("/image/main_cafe.jpg");
	background-repeat: repeat-x;
	width: 100%;
	height: auto;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
}

@media only screen and (min-device-width: 400px) {
	body {
		background-image: url("/image/main_cafe.jpg");
		background-repeat: repeat-x;
		width: auto;
		height: auto;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
	}
}
</style>
</head>
<body>
	<%@ include file="mainCafeTop.jsp" %>
	<%@ include file="mainCafeBottom.jsp" %>
</body>
</html>