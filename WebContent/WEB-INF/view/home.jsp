<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAFE HEAVEN</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="ConBiz - Responsive HTML5 Template">
<meta name="author" content="Grayrids">
<script type="text/javascript" src="/assets/js/jquery-min.js"></script>
<script src="/bootstrap-3.3.2-dist/js/jquery.form.min.js"></script>
<%@ include file="mainCss.jsp" %>
<%@ include file="cssjs.jsp" %>
</head>
<body>
<div id="container">
 <%@ include file="mainHeader.jsp" %>
<%@ include file="mainSlider.jsp"%>

<div class="boxed">
<div class="container">
<div class="row">
<div class="col-md-8 col-sm-8">
<h3>CAFE HEAVEN 매장 위치를 확인하세요!</h3>
</div>
<div class="col-md-4 col-sm-4">
<a href="#" class="btn btn-border">매장 위치 확인 하러가기</a>
</div>
</div>
</div>
</div>



<div id="counter" class="section">
<div class="container">
<div class="row">
<div class="col-xs-4 col-sm-4 col-md-4">
<div class="counter-item left-line">
<div class="icon">
<i class="icon-check">
</i>
</div>
<h5>
주문 완료
</h5>
<hr>
<div class="timer" data-to="180" data-speed="5000">
</div>
</div>
</div>

<div class="col-xs-4 col-sm-4 col-md-4">
<div class="counter-item">
<div class="icon">
<i class="icon-trophy">
</i>
</div>
<h5>
메뉴 수
</h5>
<hr>
<div class="timer" data-to="29" data-speed="5000">
</div>
</div>
</div>
<div class="col-xs-4 col-sm-4 col-md-4">
<div class="counter-item">
<div class="icon">
<i class="icon-heart">
</i>
</div>
<h5>
회원 수
</h5>
<hr>
<div class="timer" data-to="149" data-speed="5000">
</div>
</div>
</div>
</div>
</div>
</div>

<div class="client section">
<div class="container">

<div class="heading">
<div class="section-title">CO&<span>WORK</span></div>

</div>


<p class="description text-center">
아래는 CAFE HEAVEN과 협력하고 있는 업체입니다.
</p>
<div class="row">
<div id="client-logo" class="touch-carousel">
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-01.png" alt="" />
</a>
</div>
</div>
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-02.png" alt="" />
</a>
 </div>
</div>
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-03.png" alt="" />
</a>
</div>
</div>
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-04.png" alt="" />
</a>
</div>
</div>
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-05.png" alt="" />
</a>
</div>
</div>
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-06.png" alt="" />
</a>
</div>
</div>
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-07.png" alt="" />
</a>
</div>
</div>
<div class="client-logo item">
<div class="client-item">
<a href="#">
<img src="assets/img/clients/logo-08.png" alt="" />
</a>
</div>
</div>
</div>
</div>
</div>
</div>

<!-- footer -->
<%@ include file="mainFooter.jsp" %>


<div class="copyright-section">
<div class="container">
<div class="row">
<div class="col-sm-12">
<p>
Copyright &copy; 2018 CafeHeaven - Designed & Developed by 
<a href="http://graygrids.com">
SuperDeveloper
</a>
</p>
</div>
</div>

</div>
</div>

</div>


<a href="#" class="back-to-top">
<i class="fa fa-angle-up"></i>
</a>

<div id="loader">
<div class="square-spin">
<div></div>
</div>
</div>

<!-- js 위치 -->
<%@ include file="mainJs.jsp" %>

</body>
</html>