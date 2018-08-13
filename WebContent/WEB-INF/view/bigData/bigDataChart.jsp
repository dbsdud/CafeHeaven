<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	//나중에 커피메뉴 에 대한 판매량 불러오면됨
	//지금은 예제로 배열을 임의로 생성해서 만들어놓음
	// 성별 (남/여)
	window.onload = function() {
		var date = ['8월 10일', '8월 11일', '8월 12일', '8월 13일', '8월 14일','8월 15일','8월 16일'];
		var maleAmount = [15,11,12,11,13,16,5];
		var femaleAmount = [18,20,15,17,17,19,7];
		var ctx = document.getElementById('genderChart').getContext('2d');
		
		var genderChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : date,
				datasets : [{
					label : '남성',
					data : maleAmount,
					backgroundColor : 'rgba(255, 206, 86, 0.2)',
					borderColor : 'rgba(255, 206, 86, 1)',
					fill : false,
				} , {
					label : '여성',
					data : femaleAmount,
					backgroundColor : 'rgba(255, 99, 132, 0.2)',
					borderColor : 'rgba(255,99,132,1)',
					fill : false,
				}]
			}
		})
	}
	
	// 연령별(10/20/30/40/50 이상)
	/* window.onload = function() {
		var ageTypeGroup = ['10대', '20대', '30대', '40대','50대 이상'];
		var teenAmount = 4;
		var twentyAmount = 25;
		var thirtyAmount = 21;
		var fortyAmount = 13;
		var fiftyAmount = 3;
		var ctx = document.getElementById('ageTypeGroupChart').getContext('2d');
		var ageTypeGroupChart = new Chart(ctx, {
			type : 'polarArea',
			data : {
				labels : ageTypeGroup,
				datasets : [{
					label : '10대',
					datasets : 'teenAmount',
					backgroundColor : 'rgba(255, 206, 86, 0.2)',
					borderColor : 'rgba(255, 206, 86, 1)',
				}, {
					label : '20대',
					datasets : 'twentyAmount',
					backgroundColor : 'rgba(255, 99, 132, 0.2)',
					borderColor : 'rgba(255, 99, 132, 1)',
				}, {
					label : '30대',
					datasets : 'thirtyAmount',
					backgroundColor : 'rgba(54, 162, 235, 0.2)',
					borderColor : 'rgba(54, 162, 235, 1)',
				}, {
					label : '40대',
					datasets : 'fortyAmount',
					backgroundColor : 'rgba(75, 192, 192, 0.2)',
					borderColor : 'rgba(75, 192, 192, 1)',
				}, {
					label : '50대 이상',
					datasets : 'fiftyAmount',
					backgroundColor : 'rgba(153, 102, 255, 0.2)',
					borderColor : 'rgba(153, 102, 255, 1)',
				}]
			}
		})
	} */
			

	/* window.onload = function(){
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
		}); */

	//////////////////////////////////////
	/* var menuName = [ "아메리카노", "카페라떼", "카라멜마끼아또", "카푸치노", "민트초코", "복숭아아이스티" ];
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

	};  */

	////////////////////////////고객성향분석
</script>