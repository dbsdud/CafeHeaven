<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<script>
	//나중에 커피메뉴 에 대한 판매량 불러오면됨
	//지금은 예제로 배열을 임의로 생성해서 만들어놓음

	window.onload = function() {
		var menuName = [ "아메리카노", "카페라떼", "카라멜마끼아또", "카푸치노", "민트초코", "복숭아아이스티" ];
		var amount = [ 10, 5, 15, 8, 11, 20 ];
		var ctx = document.getElementById("menuChart").getContext('2d');

		var menuChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : menuName,//커피 메뉴명
				datasets : [ {
					label : 'CAFE HEAVEN 메뉴별 판매량',
					data : amount,//각 메뉴에 맞는 판매량
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {

				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});

		//////////////////////////////////////
		var menuName = [ "아메리카노", "카페라떼", "카라멜마끼아또", "카푸치노", "민트초코", "복숭아아이스티" ];
		var amount = [ 10, 5, 15, 8, 11, 20 ];
		var ctx = document.getElementById("menuChart2").getContext('2d');

		var menuChart2 = new Chart(ctx, {
			type : 'horizontalBar',
			data : {
				labels : menuName,//커피 메뉴명
				datasets : [ {
					label : 'CAFE HEAVEN 메뉴별 판매량',
					data : amount,//각 메뉴에 맞는 판매량
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {

				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : false
						}
					} ]
				}
			}
		});

	};

	////////////////////////////고객성향분석
</script>

<!-- <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=hUJpPzowuJvtFyET1F1m&submodules=geocoder"></script> -->

</head>
<body>
<%@  include file="/WEB-INF/view/mainCafeTop.jsp"%> <!-- 경로 바꿔야될거같음  -->


	<div class="container">
		<!-- 상단 -->

		<div class="page-header">
			<h1>
				CAFE HEAVEN&nbsp;&nbsp;&nbsp;<small>빅데이터 분석</small>
			</h1>
		</div>
		<ul class="nav nav-tabs">
			<li class="active hd-font" style="width: 33%;"><a
				data-toggle="tab" href="#bd-menu1" aria-expanded="true">상권밀집도</a></li>
			<!-- class= active 활성화된탭 -->
			<li style="width: 34%;" class="hd-font"><a data-toggle="tab"
				href="#bd-menu2" aria-expanded="false">고객성향분석</a></li>
			<li style="width: 33%;" class="hd-font"><a data-toggle="tab"
				href="#bd-menu3" aria-expanded="false">매출관리</a></li>
		</ul>
		<!--  차트 -->
		<div class="tab-content">
			<!--  매출관리 //여기다가 카페 주소 객체화시켜서 받으면됨-->
			<div id="bd-menu1" class="tab-pane in active">



				<div id="map" style="width: 100%; height: 400px;"></div>
				<script src="http://dmaps.daum.net/map_js_init/v3.js"
					type="text/javascript"></script>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=357c311513069e6c005e66ee1fa8dcce&libraries=LIBRARY"></script>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=357c311513069e6c005e66ee1fa8dcce&libraries=services,clusterer,drawing"></script>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=357c311513069e6c005e66ee1fa8dcce&libraries=services"></script>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=357c311513069e6c005e66ee1fa8dcce"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center : new daum.maps.LatLng(37.5500854, 126.8329565),
						level : 3
					};

					var map = new daum.maps.Map(container, options);
				</script>



				<!-- 지역 분석 목록리스트 -->
				<!-- 지역별 선택ㄷ -->
				<h2>지역별로 선택해서 상권밀집도 보는것 만들기</h2>






			</div>
			<!--  고객성향분석 -->
			<div id="bd-menu2" class="tab-pane">
				<div class="chart-container ">
					<canvas id="menuChart2"></canvas>
				</div>
			</div>
			<div id="bd-menu3" class="tab-pane">
				<div class="chart-container">
					<canvas id="menuChart"></canvas>
				</div>
			</div>
		</div>
	</div>



</body>
</html>