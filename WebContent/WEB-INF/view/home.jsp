
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
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
		<div id="div_new" style="position: absolute; top: 100px; left: 48%; width: auto; margin-left: -276px; z-index: 1; text-align: center;">
			<img src="/image/logo.png" id="logo_img" alt="logo"	style="margin-bottom: 30px;">
			<!-- 로그인 창 -->
			<!-- ID가 null 이 아니면 로그인 성공 -->
			<% if(email.equals("")){ %>
			<form action="/user/loginProc.do" method="post">
				<div class="form-group">
					<input type="text" name="email" class="form-control" placeholder="ID">
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control" placeholder="Password">
				</div>
				<input type="submit" class="btn btn-primary" value="로그인" />
				<a href="/user/userFind.do"class="btn btn-success">ID/PW찾기</a>
				<a href="/user/userReg.do" class="btn btn-success">회원가입</a>
			</form>
			<div id="naverIdLogin"></div>
			<script>
				var naverLogin = new naver.LoginWithNaverId({
					clientId : "y_E6NvLYCg6NAypDWcMn",
					callbackUrl : "http://localhost:8080/callback.do",
					isPopup : false,
					loginButton : {
						color : "green",
						type : 3,
						height : 60
					}
				});
				naverLogin.init();
				naverLogin.getLoginStatus(function(status) {
					if (status) {
						var email = naverLogin.user.getEmail();
						var birthday = naverLogin.user.getBirthday();
						var age = naverLogin.user.getAge();
						var gender = naverLogin.user.getGender();
						var name = naverLogin.user.getName();
						console.log("email : " + email);
						console.log("birthday(MM-DD) : " + birthday);
						console.log("age" + age);
						console.log("gender : " + gender);
						console.log("name : " + name);
					} else {
						console.log("토큰불량")
					}
				});
			</script>
			<%} else { %>
			
			<a href="/user/userMypage.do?userNo=<%=userNo%>" class="btn btn-info">마이페이지</a> 
			<a href="/tmpBasket/tmpBasketList.do?userNo=<%=userNo%>">
				<button class="btn btn-warning">장바구니</button>
			</a>
			<%}	%>
		</div>
	</div>
	<!-- git test -->
	<%@ include file="mainCafeBottom.jsp"%>
</body>
</html>