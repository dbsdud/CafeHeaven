<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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