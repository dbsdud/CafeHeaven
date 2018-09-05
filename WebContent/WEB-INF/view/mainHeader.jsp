<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = CmmUtil.nvl((String) session.getAttribute("email")); //형변환 해줘야됨 오브젝트로 넘어오기 떄문에 형변환 해주고 널값이 넘어오면 오류 같은거 발생하기 때문에 미리만든메소드를 이용해 널값을 공백으로 바꿈 
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String userNo = CmmUtil.nvl((String) session.getAttribute("userNo"));
	String naverEmail = CmmUtil.nvl((String)session.getAttribute("naverEmail"));
%>
<!-- 결제 정보 추가해야함 -->

<!-- 결제정보 끝 -->
<script>
	function logout(){
		alert("로그아웃 하였습니다.")
		location.href = "/user/logout.do"
	}
</script>
<header id="header-wrap" class="site-header clearfix">
	<!-- if 로그인이 되면 환영합니다. -->
	<%@if(!"".equals(email)) {%>
	<div class="top-bar hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-md-7 col-sm-9">

					<ul class="contact-details">
						<li>
							<a href="#"> 
								<i class="icon-envelope"> </i> 
								<span class="__cf_email__" data-cfemail="395c54585055795c41585449555c175a5654"><%= name + "님 환영합니다." %></span>
							</a>
						</li>
						<li>
							<a href="#"> 
								<i class="icon-call-out"> </i> 
								Call Us:(123) 456- 789
							</a>
						</li>
						<li>
							<a href="#"> 
								<i class="icon-clock"> </i> 
								Sun-Sat <span class="timing">(9am-5pm)</span>
							</a>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<%@} %>
	<!-- if 로그인이 되면 환영합니다. 끝 -->
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
					<a class="navbar-brand" href="index.html"> <img
						src="assets/img/cafeheavenlogo.png" alt="CafeHeaven">
					</a>
				</div>
			</div>

			<div class="navbar-collapse collapse">

				<div class="search-side">
					<a class="show-search"> <i class="icon-magnifier"></i>
					</a>
				</div>

				<form class="full-search">
					<div class="container">
						<div class="row">
							<input class="form-control" type="text" placeholder="Search...">
							<a class="close-search"> <span class="fa fa-times fa-2x">
							</span>
							</a>
						</div>
					</div>
				</form>


				<ul class="nav navbar-nav navbar-right">
					<li><a class="active" href="index.html"> Home </a></li>


					<li><a href="services.html">Services</a>
						<ul class="dropdown">
							<li><a href="services.html"> All Services </a></li>
							<li><a href="services1.html"> Services Layout 01 </a></li>
							<li><a href="services2.html"> Services Layout 02 </a></li>
						</ul></li>
					<li><a href="projects.html"> Projects </a>
						<ul class="dropdown">
							<li><a href="projects.html"> Projects layout 1 - Full
									Width </a></li>
							<li><a href="projects-2.html"> Projects layout 2 - Boxed
									1 </a></li>
							<li><a href="projects-3.html"> Projects layout 3 - Boxed
									3 </a></li>
							<li><a href="single-project.html"> Single Project </a></li>
						</ul></li>
					<li><a href="blog.html"> Blog </a>
						<ul class="dropdown">
							<li><a href="blog.html"> Blog - Right sidebar </a></li>
							<li><a href="blog-left-sidebar.html"> Blog - Left
									Sidebar </a></li>
							<li><a href="blog-full-width.html">Blog - Full Width</a></li>
							<li><a href="single-post.html"> Single Post </a></li>
						</ul></li>
					<li><a href="shop.html">메뉴</a></li>
					<li><a href="contact.html"> 카페정보 </a></li>
				</ul>

			</div>
		</div>

		<ul class="wpb-mobile-menu">
			<li><a class="active" href="index.do"> Home </a>
				<ul class="dropdown">
					<li><a href="index-02.html"> Home 2 </a></li>
					<li><a href="index-03.html"> Home 3 </a></li>
					<li><a href="index-04.html"> Home 4 </a></li>
					<li><a href="index-05.html"> Home 5 </a></li>
				</ul></li>

			<li><a href="#"> Company </a>
				<ul class="dropdown">
					<li><a href="about.html"> About Us </a></li>
					<li><a href="certifications.html"> Certifications </a></li>
					<li><a href="company-history.html"> Company History </a></li>
					<li><a href="partners.html"> Our Partners </a></li>
					<li><a href="team.html"> Our Team </a></li>
					<li><a href="careers.html"> Careers </a></li>
					<li><a href="Pricing.html"> Pricing </a></li>
					<li><a href="faq.html"> FAQ </a></li>
					<li><a href="404.html"> 404 </a></li>
				</ul></li>
			<li><a href="services.html">Services</a>
				<ul class="dropdown">
					<li><a href="services.html"> All Services </a></li>
					<li><a href="services1.html"> Services Layout 01 </a></li>
					<li><a href="services2.html"> Services Layout 02 </a></li>
				</ul></li>
			<li><a href="projects.html"> Projects </a>
				<ul class="dropdown">
					<li><a href="projects.html"> Projects layout 1 - Full
							Width </a></li>
					<li><a href="projects-2.html"> Projects layout 2 - Boxed 1
					</a></li>
					<li><a href="projects-3.html"> Projects layout 3 - Boxed 3
					</a></li>
					<li><a href="single-project.html"> Single Project </a></li>
				</ul></li>
			<li><a href="blog.html"> Blog </a>
				<ul class="dropdown">
					<li><a href="blog.html"> Blog - Right sidebar </a></li>
					<li><a href="blog-left-sidebar.html"> Blog - Left Sidebar
					</a></li>
					<li><a href="blog-full-width.html">Blog - Full Width</a></li>
					<li><a href="single-post.html"> Single Post </a></li>
				</ul></li>
			<li><a href="/menu/menu.do">메뉴</a></li>
			<li><a href="contact.html"> 카페 정보 </a></li>
		</ul>

	</div>

	<div class="clearfix"></div>
</header>