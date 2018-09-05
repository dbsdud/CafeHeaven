<%@page import="poly.dto.TmpDTO"%>
<%@page import="poly.dto.MenuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--[if IE 8 ]>
<html class="ie ie8" lang="en">
<![endif]-->
<!--[if (gte IE 9)|!(IE)]>
<html lang="en" class="no-js">
<![endif]-->
<%
	MenuDTO mDTO=(MenuDTO)request.getAttribute("mDTO");
	TmpDTO tDTO = (TmpDTO)request.getAttribute("tDTO");
%>
<html>
<head>

<title>CAFE HEAVEN - MENU</title>

<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<meta name="description" content="ConBiz - Responsive HTML5 Template">
<meta name="author" content="Grayrids">

<link rel="stylesheet" href="/assets/css/bootstrap.min.css"
	type="text/css" media="screen">

<link rel="stylesheet" href="/assets/fonts/font-awesome.min.css"
	type="text/css" media="screen">

<link rel="stylesheet" href="/assets/fonts/simple-line-icons.css"
	type="text/css" media="screen">

<link rel="stylesheet" href="/assets/fonts/flaticon.css" type="text/css"
	media="screen">

<link rel="stylesheet" type="text/css" href="/assets/css/settings.css"
	media="screen">

<link rel="stylesheet" type="text/css" href="/assets/css/main.css"
	media="screen">

<link rel="stylesheet" type="text/css" href="/assets/css/responsive.css"
	media="screen">

<link rel="stylesheet" type="text/css" href="/assets/css/animate.css"
	media="screen">

<link rel="stylesheet" type="text/css" href="/assets/css/slicknav.css"
	media="screen">

<link rel="stylesheet" type="text/css"
	href="/assets/css/colors/yellow.css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="/assets/css/colors/yellow.css" title="yellow" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/assets/css/colors/turquoise.css" title="turquoise" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/assets/css/colors/emerald.css" title="emerald" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/assets/css/colors/river.css" title="river" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/assets/css/colors/wisteria.css" title="wisteria" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/assets/css/colors/alizarin.css" title="alizarin" media="screen" />
<!--[if IE 8]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

	<div id="container">

		<header id="header-wrap" class="site-header clearfix">

			<div class="navbar navbar-default navbar-top" role="navigation"
				data-spy="affix" data-offset-top="50">
				<div class="container">

					<div class="navbar-header">

						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> 
							<span class="icon-bar"></span> 
							<span class="icon-bar"></span> 
							<span class="icon-bar"></span>
						</button>

						<div class="logo-wrapper">
							<a class="navbar-brand" href="index.html"> 
								<img src="/assets/img/logo.png" alt="ConBiz">
							</a>
						</div>
					</div>

					<div class="navbar-collapse collapse">

						<div class="search-side">
							<a class="show-search"> 
								<i class="icon-magnifier"></i>
							</a>
						</div>

						<form class="full-search">
							<div class="container">
								<div class="row">
									<input class="form-control" type="text" placeholder="Search...">
									<a class="close-search"> 
										<span class="fa fa-times fa-2x"></span>
									</a>
								</div>
							</div>
						</form>


						<ul class="nav navbar-nav navbar-right">
							<li><a href="index.html"> Home </a>
								<ul class="dropdown">
									<li><a href="index-02.html"> Home 2 </a></li>
									<li><a href="index-03.html"> Home 3 </a></li>
									<li><a href="index-04.html"> Home 4 </a></li>
									<li><a href="index-05.html"> Home 5 </a></li>
								</ul></li>
							<li><a href="features.html"> Features </a></li>
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
							<li><a href="services.html"> Services </a>
								<ul class="dropdown">
									<li><a href="services.html"> All Services </a></li>
									<li><a href="services1.html"> Services Layout 01 </a></li>
									<li><a href="services2.html"> Services Layout 02 </a></li>
								</ul></li>
							<li><a href="projects.html"> Projects </a>
								<ul class="dropdown">
									<li><a href="projects.html"> Projects layout 1 - Full
											Width </a></li>
									<li><a href="projects-2.html"> Projects layout 2 -
											Boxed 1 </a></li>
									<li><a href="projects-3.html"> Projects layout 3 -
											Boxed 3 </a></li>
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
							<li><a class="active" href="shop.html">Shop</a></li>
							<li><a href="contact.html"> Contact </a></li>
						</ul>

					</div>
				</div>

				<ul class="wpb-mobile-menu">
					<li><a href="index.html"> Home </a>
						<ul class="dropdown">
							<li><a href="index-02.html"> Home 2 </a></li>
							<li><a href="index-03.html"> Home 3 </a></li>
							<li><a href="index-04.html"> Home 4 </a></li>
							<li><a href="index-05.html"> Home 5 </a></li>
						</ul></li>
					<li><a href="features.html"> Features </a></li>
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
							<li><a class="active" href="single-post.html"> Single
									Post </a></li>
						</ul></li>
					<li><a href="shop.html">Shop</a></li>
					<li><a href="contact.html"> Contact </a></li>
				</ul>

			</div>

		</header>


		<div class="page-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="entry-title">
							<span>Our</span> Store
						</h2>
						<div class="breadcrumb">
							<span>You are here:</span> <a href="#">Home</a> <span
								class="crumbs-spacer"><i class="fa fa-angle-double-right"></i></span>
							<span class="current">Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>


		<section id="content">

			<div class="container-fullscreen">
				<div class="container">
					<div class="row">

						<div class="controls text-center">
							<a class="filter active" data-filter="all">전체</a>
							<a class="filter" data-filter=".recommend">추천</a> 
							<a class="filter" data-filter=".drink">음료</a> 
							<a class="filter" data-filter=".dessert">디저트</a> 
							<a class="filter" data-filter=".etc">그 외</a>
						</div>

						<div id="products">
							<div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix buildings school">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img1.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img1.png" class="lightbox">
													<i class="icon-magnifier"></i>
												</a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Hammer Drill</h4>
										<div class="product-price">
											<span class="amount">$199.00</span>
										</div>
										<a href="#" class="btn btn-cart">
											<i class="icon-basket"></i>
											Add to cart
										</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix buildings hospital">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img2.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img2.png" class="lightbox"><i
													class="icon-magnifier"></i></a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Brick Trowel</h4>
										<div class="product-price">
											<span class="amount">$39.00</span>
										</div>
										<a href="#" class="btn btn-cart"><i class="icon-basket"></i>
											Add to cart</a>
									</div>
								</div>
							</div>
							<div
								class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix buildings mall">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img3.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img3.png" class="lightbox"><i
													class="icon-magnifier"></i></a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Concrete Grinders</h4>
										<div class="product-price">
											<span class="amount">$199.00</span>
										</div>
										<a href="#" class="btn btn-cart"><i class="icon-basket"></i>
											Add to cart</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix school">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img4.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img4.png" class="lightbox"><i
													class="icon-magnifier"></i></a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Laser Levels</h4>
										<div class="product-price">
											<span class="amount">$89.00</span>
										</div>
										<a href="#" class="btn btn-cart"><i class="icon-basket"></i>
											Add to cart</a>
									</div>
								</div>
							</div>
							<div
								class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix buildings school">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img5.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img5.png" class="lightbox"><i
													class="icon-magnifier"></i></a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Cleaning Machines</h4>
										<div class="product-price">
											<span class="amount">$179.00</span>
										</div>
										<a href="#" class="btn btn-cart"><i class="icon-basket"></i>
											Add to cart</a>
									</div>
								</div>
							</div>
							<div
								class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix buildings mall">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img6.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img6.png" class="lightbox"><i
													class="icon-magnifier"></i></a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Gaulk Guns</h4>
										<div class="product-price">
											<span class="amount">$49.00</span>
										</div>
										<a href="#" class="btn btn-cart"><i class="icon-basket"></i>
											Add to cart</a>
									</div>
								</div>
							</div>
							<div
								class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix buildings mall">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img7.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img7.png" class="lightbox"><i
													class="icon-magnifier"></i></a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Concrete Saws</h4>
										<div class="product-price">
											<span class="amount">$749.00</span>
										</div>
										<a href="#" class="btn btn-cart"><i class="icon-basket"></i>
											Add to cart</a>
									</div>
								</div>
							</div>
							<div
								class="col-md-3 col-lg-3 col-sm-6 col-xs-12 mix buildings mall">
								<div class="product">
									<div class="post-featured">
										<img src="/assets/img/shop/img8.png" alt="">
										<div class="esg-overlay">
											<div class="icon">
												<a href="/assets/img/shop/img8.png" class="lightbox"><i
													class="icon-magnifier"></i></a>
											</div>
										</div>
									</div>
									<div class="post-content">
										<h4>Cement Mixers</h4>
										<div class="product-price">
											<span class="amount">$229.00</span>
										</div>
										<a href="#" class="btn btn-cart"><i class="icon-basket"></i>
											Add to cart</a>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</section>


		<footer>
			<div class="container">
				<div class="row footer-widgets">

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="footer-widget contact-widget">
							<h4>
								<img src="assets/img/footer-logo.png" class="img-responsive"
									alt="Footer Logo" />
							</h4>
							<p>There are many variations of passages of lorem Ipsum
								available, but the majority have suffered alteration in some
								forem there are many varations</p>
						</div>
					</div>


					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="footer-widget flickr-widget">
							<h4>Latest Work</h4>
							<ul class="flickr-list">
								<li><a href="/assets/img/work/img-1.jpg" class="lightbox">
										<img alt="" src="/assets/img/work/img-1.jpg">
								</a></li>
								<li><a href="/assets/img/work/img-2.jpg" class="lightbox">
										<img alt="" src="/assets/img/work/img-2.jpg">
								</a></li>
								<li><a href="/assets/img/work/img-3.jpg" class="lightbox">
										<img alt="" src="/assets/img/work/img-3.jpg">
								</a></li>
								<li><a href="/assets/img/work/img-4.jpg" class="lightbox">
										<img alt="" src="/assets/img/work/img-4.jpg">
								</a></li>
								<li><a href="/assets/img/work/img-5.jpg" class="lightbox">
										<img alt="" src="/assets/img/work/img-5.jpg">
								</a></li>
								<li><a href="/assets/img/work/img-6.jpg" class="lightbox">
										<img alt="" src="/assets/img/work/img-6.jpg">
								</a></li>
							</ul>
						</div>
					</div>


					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="footer-widget">
							<h4>ConBiz Office</h4>
							<ul class="address">
								<li><a href="#"><i class="fa fa-map-marker"></i> 1600
										Grant Ave, Dhaka NJ 07078</a></li>
								<li><a href="#"><i class="fa fa-phone"></i> (123)
										2014-040 43,(732)506-3420</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> <span
										class="__cf_email__"
										data-cfemail="2c45424a436c4b5e4d554b5e45485f024f4341">[email&#160;protected]</span></a>
								</li>
								<li><a href="#"><i class="fa fa-fax"></i> FAX:(123)
										123-4567</a></li>
							</ul>
						</div>
					</div>


					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="footer-widget hours-widget">
							<h4>Business Hours</h4>
							<div class="contact-info">
								<p>Our support available to help you 24 hours a day, seven
									days a week.</p>
								<ul class="hours">
									<li>Monday-Friday: <span>9am to 5pm</span></li>
									<li>Saturday: <span>10am to 3pm</span></li>
									<li>Sunday: <span>Closed</span></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

			</div>
		</footer>


		<div class="copyright-section">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<p>
							Copyright &copy; 2015 ConBiz - Designed & Developed by <a
								href="http://graygrids.com"> GrayGrids </a>
						</p>
					</div>
				</div>

			</div>
		</div>

	</div>


	<a href="#" class="back-to-top"> <i class="fa fa-angle-up"></i>
	</a>

	<div id="loader">
		<div class="square-spin">
			<div></div>
		</div>
	</div>

	<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script type="text/javascript" src="/assets/js/jquery-min.js"></script>
	<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="/assets/js/modernizrr.js"></script>
	<script type="text/javascript" src="/assets/js/nivo-lightbox.min.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.mixitup.min.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.appear.js"></script>
	<script type="text/javascript" src="/assets/js/count-to.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.parallax.js"></script>
	<script type="text/javascript" src="/assets/js/smooth-scroll.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.slicknav.js"></script>
	<script type="text/javascript" src="/assets/js/main.js"></script>

	<script src="/assets/js/jquery.themepunch.revolution.min.js"></script>
	<script src="/assets/js/jquery.themepunch.tools.min.js"></script>
</body>
</html>
