<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="106614683841-b0fm7tdjagom3j4vj67duv21ies8562h.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<%-- <%@ include file="/WEB-INF/view/template.jsp" %> --%>
<title>CAFEHEAVEN'S HOME</title>
</head>
<body>
	<%@ include file="mainCafeTop.jsp"%>
	<div id="outline_div" style="opacity: 1;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!--페이지-->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!--페이지-->
			<div class="carousel-inner">
				<!--슬라이드1-->
				<div class="item active">
					<img style="width: 100%; height: 840px;" src="/image/banner.jpg"
						alt="First slide">
				</div>
				<!--슬라이드1-->
				<!--슬라이드2-->
				<div class="item">
					<img style="width: 100%; height: 840px;" src="/image/cafeIN.jpg"
						data-src="" alt="Second slide">
				</div>
				<!--슬라이드2-->
				<!--슬라이드3-->
				<div class="item">
					<img style="width: 100%; height: 840px;" src="/image/cafeIN2.jpg"
						data-src="" alt="Third slide">
				</div>
				<!--슬라이드3-->
			</div>
		</div>
		<!-- 검색 부분 반응형 적용해야함 -->
		<div id="div_new"
			style="position: absolute; top: 100px; left: 48%; width: auto; margin-left: -276px; z-index: 1; text-align: center;">
			<img src="/image/logo.png" id="logo_img" alt="logo"
				style="margin-bottom: 30px;">
			<!-- ID가 null 이 아니면 로그인 성공 -->
			<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
			<script>
				function onSignIn(googleUser) {
					// Useful data for your client-side scripts:
					var profile = googleUser.getBasicProfile();
					console.log("ID: " + profile.getId()); // Don't send this directly to your server!
					console.log('Full Name: ' + profile.getName());
					console.log('Given Name: ' + profile.getGivenName());
					console.log('Family Name: ' + profile.getFamilyName());
					console.log("Image URL: " + profile.getImageUrl());
					console.log("Email: " + profile.getEmail());

					// The ID token you need to pass to your backend:
					var id_token = googleUser.getAuthResponse().id_token;
					console.log("ID Token: " + id_token);
				};
			</script>
			<a href="#" onclick="signOut();">Sign out</a>
			<script>
				function signOut(){
					var auth2 = gapi.auth2.getAuthInstance();
					auth2.signOut().then(function(){
						console.log('User signed out.');
					});
				}
			</script>
		</div>
	</div>
	<!-- git test -->
	<%@ include file="mainCafeBottom.jsp"%>
</body>
</html>