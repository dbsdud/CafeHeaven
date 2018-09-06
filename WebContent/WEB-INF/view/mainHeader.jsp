<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 하기 위해 컨트롤러에서 모델에 저장된 데이터를 받아옴 -->

<%
	String email = CmmUtil.nvl((String) session.getAttribute("email")); //형변환 해줘야됨 오브젝트로 넘어오기 떄문에 형변환 해주고 널값이 넘어오면 오류 같은거 발생하기 때문에 미리만든메소드를 이용해 널값을 공백으로 바꿈 
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String userNo = CmmUtil.nvl((String) session.getAttribute("userNo"));
%>


<!-- 로그인 css -->
<style>
/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: http://creative-tim.com
 * 
 */

/*  Shake animation  */
@charset "UTF-8";

.animated {
	-webkit-animation-duration: 1s;
	-moz-animation-duration: 1s;
	-o-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	-moz-animation-fill-mode: both;
	-o-animation-fill-mode: both;
	animation-fill-mode: both;
}

.animated.hinges {
	-webkit-animation-duration: 2s;
	-moz-animation-duration: 2s;
	-o-animation-duration: 2s;
	animation-duration: 2s;
}

.animated.slow {
	-webkit-animation-duration: 3s;
	-moz-animation-duration: 3s;
	-o-animation-duration: 3s;
	animation-duration: 3s;
}

.animated.snail {
	-webkit-animation-duration: 4s;
	-moz-animation-duration: 4s;
	-o-animation-duration: 4s;
	animation-duration: 4s;
}

@
-webkit-keyframes shake { 0%, 100% {
	-webkit-transform: translateX(0);
}

10%,
30%,
50%,
70%,
90%
{
-webkit-transform
:
 
translateX
(-10px);
}
20%,
40%,
60%,
80%
{
-webkit-transform
:
 
translateX
(10px);
}
}
@
-moz-keyframes shake { 0%, 100% {
	-moz-transform: translateX(0);
}

10%,
30%,
50%,
70%,
90%
{
-moz-transform
:
 
translateX
(-10px);
}
20%,
40%,
60%,
80%
{
-moz-transform
:
 
translateX
(10px);
}
}
@
-o-keyframes shake { 0%, 100% {
	-o-transform: translateX(0);
}

10%,
30%,
50%,
70%,
90%
{
-o-transform
:
 
translateX
(-10px);
}
20%,
40%,
60%,
80%
{
-o-transform
:
 
translateX
(10px);
}
}
@
keyframes shake { 0%, 100% {
	transform: translateX(0);
}

10%,
30%,
50%,
70%,
90%
{
transform
:
 
translateX
(-10px);
}
20%,
40%,
60%,
80%
{
transform
:
 
translateX
(10px);
}
}
.shake {
	-webkit-animation-name: shake;
	-moz-animation-name: shake;
	-o-animation-name: shake;
	animation-name: shake;
}

.login .modal-dialog {
	width: 350px;
}

.login .modal-footer {
	border-top: 0;
	margin-top: 0px;
	padding: 10px 20px 20px;
}

.login .modal-header {
	border: 0 none;
	padding: 15px 15px 15px;
	/*     padding: 11px 15px; */
}

.login .modal-body {
	/*     background-color: #eeeeee; */
	
}

.login .division {
	float: none;
	margin: 0 auto 18px;
	overflow: hidden;
	position: relative;
	text-align: center;
	width: 100%;
}

.login .division .line {
	border-top: 1px solid #DFDFDF;
	position: absolute;
	top: 10px;
	width: 34%;
}

.login .division .line.l {
	left: 0;
}

.login .division .line.r {
	right: 0;
}

.login .division span {
	color: #424242;
	font-size: 17px;
}

.login .box .social {
	float: none;
	margin: 0 auto 30px;
	text-align: center;
}

.login .social .circle {
	background-color: #EEEEEE;
	color: #FFFFFF;
	border-radius: 100px;
	display: inline-block;
	margin: 0 17px;
	padding: 15px;
}

.login .social .circle .fa {
	font-size: 16px;
}

.login .social .facebook {
	background-color: #455CA8;
	color: #FFFFFF;
}

.login .social .google {
	background-color: #F74933;
}

.login .social .github {
	background-color: #403A3A;
}

.login .facebook:hover {
	background-color: #6E83CD;
}

.login .google:hover {
	background-color: #FF7566;
}

.login .github:hover {
	background-color: #4D4D4d;;
}

.login .forgot {
	color: #797979;
	margin-left: 0;
	overflow: hidden;
	text-align: center;
	width: 100%;
}

.login .btn-login, .registerBox .btn-register {
	background-color: #00BBFF;
	border-color: #00BBFF;
	border-width: 0;
	color: #FFFFFF;
	display: block;
	margin: 0 auto;
	padding: 15px 50px;
	text-transform: uppercase;
	width: 100%;
}

.login .btn-login:hover, .registerBox .btn-register:hover {
	background-color: #00A4E4;
	color: #FFFFFF;
}

.login .form-control {
	border-radius: 3px;
	background-color: rgba(0, 0, 0, 0.09);
	box-shadow: 0 1px 0px 0px rgba(0, 0, 0, 0.09) inset;
	color: #FFFFFF;
}

.login .form-control:hover {
	background-color: rgba(0, 0, 0, .16);
}

.login .form-control:focus {
	box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.04) inset;
	background-color: rgba(0, 0, 0, 0.23);
	color: #FFFFFF;
}

.login .box .form input[type="text"], .login .box .form input[type="password"]
	{
	border-radius: 3px;
	border: none;
	color: #333333;
	font-size: 16px;
	height: 46px;
	margin-bottom: 5px;
	padding: 13px 12px;
	width: 100%;
}

@media ( max-width :400px) {
	.login .modal-dialog {
		width: 100%;
	}
}

.big-login, .big-register {
	background-color: #ffffff;
	color: #FFFFFF;
	border-radius: 7px;
	border-width: 2px;
	font-size: 14px;
	font-style: normal;
	font-weight: 200;
	padding: 16px 60px;
	text-transform: uppercase;
	transition: all 0.3s ease 0s;
}

.big-login:hover {
	background-color: #00A4E4;
	color: #FFFFFF;
}

.big-register {
	background-color: rgba(0, 0, 0, .0);
	color: #00bbff;
	border-color: #00bbff;
}

.big-register:hover {
	border-color: #00A4E4;
	color: #00A4E4;
}
</style>
<!--  -->
<!--  로그인 스크립트 -->
<script>


function login(){	
	 openLoginModal();   
	};


	/*
	 *
	 * login-register modal
	 * Autor: Creative Tim
	 * Web-autor: creative.tim
	 * Web script: http://creative-tim.com
	 * 
	 */
	
	function showLoginForm(){
	    $('#loginModal .registerBox').fadeOut('fast',function(){
	        $('.loginBox').fadeIn('fast');
	        $('.register-footer').fadeOut('fast',function(){
	            $('.login-footer').fadeIn('fast');    
	        });
	        
	        $('.modal-title').html('Login with');
	    });       
	     $('.error').removeClass('alert alert-danger').html(''); 
	}

	function openLoginModal(){
	    showLoginForm();
	    setTimeout(function(){
	        $('#loginModal').modal('show');    
	    }, 230);
	    
	}


	function shakeModal(){
	    $('#loginModal .modal-dialog').addClass('shake');
	             $('.error').addClass('alert alert-danger').html("Invalid email/password combination");
	             $('input[type="password"]').val('');
	             setTimeout( function(){ 
	                $('#loginModal .modal-dialog').removeClass('shake'); 
	    }, 1000 ); 
	}


</script>
<!--  -->
<script>
	function logout() {
		alert("로그아웃 하셨습니다.")
		location.href = "/user/logout.do"
	}
	 // 이부분은 a태그 비활성화
	
		 $("#aUnbind").unbind("click");
	

</script>


<header id="header-wrap" class="site-header clearfix">
		<div class="navbar navbar-default navbar-top" role="navigation"
			data-spy="affix" data-offset-top="50">
			<div class="container">

				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<div class="logo-wrapper">
						<a class="navbar-brand" href="/home.do"> <img
							src="/assets/img/cafeheavenlogo.png" alt="CafeHeaven">
						</a>
					</div>


				</div>

				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a class="active" href="/home.do"> Home </a></li>
						<li><a href="/menu/menuList.do">메뉴</a></li>
						<li><a href="/notice/communityTab.do">커뮤니티</a></li>
						<li><a href="/cafe/cafeInfo.do?cafeNo=1"> 카페정보 </a></li>
						<!-- 관리자 -->
						<% if ("1".equals(userNo)) {%>
						<li><a> 관리자 </a>
							<ul class="dropdown">
								<li><a href="projects.html"> 메뉴 관리 </a></li>
								<li><a href="projects-2.html"> 카페 관리 </a></li>
								<li><a href="projects-3.html"> 회원 관리 </a></li>
								<li><a href="/bigData/bigData.do"> 빅데이터 관리 </a></li>
							</ul></li>
						<%} %>
						<% if ("".equals(email)) {%>
						<li><a class="btn big-login" data-toggle="modal"
							href="javascript:login()" onclick="openLoginModal();">Log in</a></li>
						<li><a href="/user/userReg.do">Sign Up</a></li>
						<%} else { %>
						<li><a id="aUnbind"><%=name+" 님 환영합니다." %></a></li>
						<li><a onclick="logout();"><img
								src="/assets/img/logout.png"
								style="width: 50px; height: auto; cursor: pointer;" /></a></li>
						<li><a href="/user/userMypage.do?userNo=<%=userNo%>"
							class="btn"><img src="/assets/img/mypage.png"
								style="width: 50px; height: auto" /></a></li>
						<li><a href="/tmpBasket/tmpBasketList.do?userNo=<%=userNo%>"
							class="btn"><img src="/assets/img/basket.png"
								style="width: 50px; height: auto" /></a></li>
						<%} %>
					</ul>
				</div>
			</div>

			<!-- 로그인  -->

			<div class="container">


				<div class="modal fade login" id="loginModal">
					<div class="modal-dialog login animated">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title">Login with</h4>
							</div>
							<div class="modal-body">
								<div class="box">
									<div class="content">
										<div class="social">
											<a class="circle github" href="/auth/github"> <i
												class="fa fa-github fa-fw"></i>
											</a> <a id="google_login" class="circle google"
												href="/auth/google_oauth2"> <i
												class="fa fa-google-plus fa-fw"></i>
											</a> <a id="facebook_login" class="circle facebook"
												href="/auth/facebook"> <i class="fa fa-facebook fa-fw"></i>
											</a>
										</div>
										<div class="division">
											<div class="line l"></div>
											<span>or</span>
											<div class="line r"></div>
										</div>
										<div class="error"></div>
										<!-- 로그인 -->

										<div class="form loginBox">
											<form method="post" action="/user/loginProc.do"
												accept-charset="UTF-8">
												<input class="form-control" type="text" placeholder="Email"
													name="email"> <input class="form-control"
													type="password" placeholder="Password" name="password">
												<input type="submit" class="btn btn-primary" value="로그인" />
											</form>
										</div>

									</div>
								</div>

							</div>
							<div class="modal-footer">
								<div class="forgot login-footer">
									<span>Looking to <a
										href="javascript: showRegisterForm();">create an account</a> ?
									</span>
								</div>
								<div class="forgot register-footer" style="display: none">
									<span>Already have an account?</span> <a
										href="javascript: showLoginForm();">Login</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!--  -->


			<ul class="wpb-mobile-menu">
				<li><a class="active" href="index.html"> Home </a></li>
				<li><a href="/menu/menulist.do">메뉴</a></li>
				<li><a href="/notice/communityTab.do">커뮤니티</a></li>
				<li><a href="contact.html"> 카페 정보 </a></li>
				<li><a href="projects.html"> 관리자 </a>
					<ul class="dropdown">
						<li><a href="projects.html"> 메뉴 관리 </a></li>
						<li><a href="projects-2.html"> 카페 관리 </a></li>
						<li><a href="projects-3.html"> 회원 관리 </a></li>
						<li><a href="single-project.html"> 빅데이터 관리 </a></li>
					</ul></li>
			</ul>

		</div>
		<div class="clearfix"></div>
</header>