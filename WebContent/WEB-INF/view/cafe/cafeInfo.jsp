<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<div class="container">
		<!-- 상단 -->

		<div class="page-header">
			<h1>
				카페정보&nbsp;&nbsp;&nbsp;<small>CAFE HEAVEN</small>
			</h1>
		</div>
		<!-- 네이버 지도 -->
		<div id="map" style="width: 100%; height: 400px;">
			<script>
						var map = new naver.maps.Map('map');
						var myaddress = '가좌로2길';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)///여기다가 카페 주소 객체화시켜서 받으면됨
						naver.maps.Service
								.geocode(
										{
											address : myaddress
										},
										function(status, response) {
											if (status !== naver.maps.Service.Status.OK) {
												return alert(myaddress
														+ '의 검색 결과가 없거나 기타 네트워크 에러');
											}
											var result = response.result;
											// 검색 결과 갯수: result.total
											// 첫번째 결과 결과 주소: result.items[0].address
											// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
											var myaddr = new naver.maps.Point(
													result.items[0].point.x,
													result.items[0].point.y);
											map.setCenter(myaddr); // 검색된 좌표로 지도 이동
											// 마커 표시
											var marker = new naver.maps.Marker(
													{
														position : myaddr,
														map : map
													});
											// 마커 클릭 이벤트 처리
											naver.maps.Event
													.addListener(
															marker,
															"click",
															function(e) {
																if (infowindow
																		.getMap()) {
																	infowindow
																			.close();
																} else {
																	infowindow
																			.open(
																					map,
																					marker);
																}
															});
											// 마크 클릭시 인포윈도우 오픈
											var infowindow = new naver.maps.InfoWindow(
													{
														content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
													});
										});
					</script>
		</div>
		<!--  지도끝 -->
		<!--  본문 카페정보 상단 -->

		<div class="page-header">
			<div class="col-sm-6">
				<h2>
					<small>CAFE HEAVEN</small>
				</h2>
			</div>
			<div class="col-sm-6">
				<h2>
					<small>CAFE HEAVEN</small>
				</h2>
			</div>
			<div class="col-sm-6">
				<h2>
					<small>CAFE HEAVEN</small>
				</h2>
			</div>
			<div class="col-sm-6">
				<h2>
					<small>CAFE HEAVEN</small>
				</h2>
			</div>

		</div>
	</div>
	<div class="container">
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
					<img src="image/cafeOUT.jpg" style="width: 100%; height: 300px"
						class="img-thumbnail" alt="First slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 1</h1>
							<p>텍스트 1</p>
						</div>
					</div>
				</div>
				<!--슬라이드1-->

				<!--슬라이드2-->
				<div class="item">
					<img src="image/cafeIN.jpg" style="width: 100%; height: 300px"
						class="img-thumbnail" data-src="" alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 2</h1>
							<p>텍스트 2</p>
						</div>
					</div>
				</div>
				<!--슬라이드2-->

				<!--슬라이드3-->
				<div class="item">
					<img src="image/cafeIN2.jpg" style="width: 100%; height: 300px"
						class="img-thumbnail" data-src="" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 3</h1>
							<p>텍스트 3</p>
						</div>
					</div>
				</div>
				<!--슬라이드3-->
			</div>

			<!--이전, 다음 버튼-->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
				class="glyphicon glyphicon-chevron-left"></span></a> <a
				class="right carousel-control" href="#myCarousel" data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>

	</div>


	<!-- --- -->

</body>
</html>