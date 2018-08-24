<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
	canvas11 {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>

	<!-- <button id="randomizeData">Randomize Data</button> -->
	<script>
		var chartData = {
			labels: ['아메리카노', '에스프레소', '카페라떼', '더치커피', '바닐라라떼', '아이스티', '카푸치노', '카페모카', '카라멜마끼아또'],
			datasets: [{
				type: 'line',
				label: '매출(만원)',
				borderColor: window.chartColors.black,
				borderWidth: 2,
				fill: false,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				type: 'bar',
				label: '판매량',
				backgroundColor: window.chartColors.blue,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				],
				borderColor: 'white',
				borderWidth: 2
			}, 
				
			]
		};
		
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

			/* 고객성향분석  */
			 //성별 (남/여)///성별 만 했음

			var ctx1 = document.getElementById('canvas11').getContext('2d');
			window.myMixedChart = new Chart(ctx1, {
				type: 'bar',
				data: chartData11,
				options: {
					responsive: true,
					title: {
						display: true,
						text: '매출관리'
					},
					tooltips: {
						mode: 'index',
						intersect: true
					}
				}
			});
	
		
			
			var ctx2 = document.getElementById('canvas22').getContext('2d');
			window.myMixedChart = new Chart(ctx2, {
				type: 'bar',
				data: chartData22,
				options: {
					responsive: true,
					title: {
						display: true,
						text: '매출관리'
					},
					tooltips: {
						mode: 'index',
						intersect: true
					}
				}
			});
			
			
			var ctx3 = document.getElementById('canvas33').getContext('2d');
			window.myMixedChart = new Chart(ctx3, {
				type: 'bar',
				data: chartData33,
				options: {
					responsive: true,
					title: {
						display: true,
						text: '매출관리'
					},
					tooltips: {
						mode: 'index',
						intersect: true
					}
				}
			});
		};
			
		
	
		  document.getElementById('randomizeData11').addEventListener('change', function() {
			chartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});
			window.myMixedChart.update();
		}); 
		///////////////////////
	
		document.getElementById('randomizeData22').addEventListener('change', myFunction);

		chartData.datasets.forEach(function(dataset) {
			dataset.data = dataset.data.map(function() {
				return randomScalingFactor();
			});
		});
		window.myMixedChart.update();
		/////////////
		document.getElementById('randomizeData33').addEventListener('change', myFunction);

		chartData.datasets.forEach(function(dataset) {
			dataset.data = dataset.data.map(function() {
				return randomScalingFactor();
			});
		});
		window.myMixedChart.update();
	
	
	
		
		

	
	
		
</script>




<!-- month -->
<style>
canvas22 {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>

<!-- <button id="randomizeData2">Randomize Data</button> -->
<script>
	var chartData11 = {
		labels: ['아메리카노', '에스프레소', '카페라떼', '더치커피', '바닐라라떼', '아이스티', '카푸치노', '카페모카', '카라멜마끼아또'],
		datasets: [{
			type: 'line',
			label: '매출',
			borderColor: window.chartColors.black,
			borderWidth: 2,
			fill: false,
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			]
		}, {
			type: 'bar',
			label: '판매량',
			backgroundColor: window.chartColors.blue,
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			],
			borderColor: 'white',
			borderWidth: 2
		}, 
			
		]
	};
	</script>
<script>
	var chartData22 = {
		labels: ['아메리카노', '에스프레소', '카페라떼', '더치커피', '바닐라라떼', '아이스티', '카푸치노', '카페모카', '카라멜마끼아또'],
		datasets: [{
			type: 'line',
			label: '매출',
			borderColor: window.chartColors.black,
			borderWidth: 2,
			fill: false,
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			]
		}, {
			type: 'bar',
			label: '판매량',
			backgroundColor: window.chartColors.blue,
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			],
			borderColor: 'white',
			borderWidth: 2
		}, 
			
		]
	};
	</script>
	
	
	
	<!-- year -->
	<style>
	canvas33 {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>

	<!-- <button id="randomizeData2">Randomize Data</button> -->
	
	
	
	<script>
		var chartData33 = {
			labels: ['아메리카노', '에스프레소', '카페라떼', '더치커피', '바닐라라떼', '아이스티', '카푸치노', '카페모카', '카라멜마끼아또'],
			datasets: [{
				type: 'line',
				label: '매출',
				borderColor: window.chartColors.black,
				borderWidth: 2,
				fill: false,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				type: 'bar',
				label: '판매량',
				backgroundColor: window.chartColors.blue,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				],
				borderColor: 'white',
				borderWidth: 2
			}, 
				
			]
		};
		
		/* 매출관리 버튼 함수 */
		
		
		$(function(){
			$('#day34').show();
			$('#month34').hide();
			$('#year34').hide();
			$('#day1').click(function(){
				$('#day34').show();
				$('#month34').hide();
				$('#year34').hide();
			});
			$('#month1').click(function(){
				$('#day34').hide();
				$('#month34').show();
				$('#year34').hide();
			});
			$('#year1').click(function(){
				$('#day34').hide();
				$('#month34').hide();
				$('#year34').show();
			
		});
		})
	
					
			function start(){
			      document.getElementById("randomizeData11").addEventListener("change", randomizeData11, false);
			      }

			function randomizeData11(){
				return randomScalingFactor();
			}

			window.myMixedChart.update();
			</script>
			
			
			

<script>


$(function() {

	now();

	salesQuarter();

	salesYear();

	salesDay();

	salesMonth();

	$('#chy-yearLeft').click(function() {

		$('#chy-years').text(parseInt($('#chy-years').text()) - 1);

		salesYear();

		return false;

	})

	$('#chy-yearRight').click(function() {

		$('#chy-years').text(parseInt($('#chy-years').text()) + 1);

		salesYear();

		return false;

	})

	$('#chy-countLeft').click(function() {

		if ($('#chy-count').text() != "1")

			$('#chy-count').text(parseInt($('#chy-count').text()) - 1);

		salesQuarter();

		return false;

	})

	$('#chy-countRight').click(function() {

		if ($('#chy-count').text() != "4")

			$('#chy-count').text(parseInt($('#chy-count').text()) + 1);

		salesQuarter();

		return false;

	})

	$('#chy-monthLeft').click(function() {

		if ($('#chy-month').text() != "1")

			$('#chy-month').text(parseInt($('#chy-month').text()) - 1);

		salesMonth();

		return false;

	})

	$('#chy-monthRight').click(function() {

		if ($('#chy-month').text() != "12")

			$('#chy-month').text(parseInt($('#chy-month').text()) + 1);

		salesMonth();

		return false;

	})



	$('#datepicker1').on("change",function(){

		var day = $('#datepicker1').val();

		salesDay();

	})

	$('#moveSelect').on("change", function(){

		location.href = "/basketAnalysis.do";

	})

})



function now(){

	var now = new Date();

    var year= now.getFullYear();

    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);

    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

	var today = year + '-' + mon + '-' + day;

	

	$('#datepicker1').val(today);

	$('#chy-month').text(mon);

}



function salesDay(){

	$('#dayBody').html("<canvas id='myChart'></canvas>");

	var date = $('#datepicker1').val();

	var ctx = $('#myChart').get(0).getContext('2d');

	$.ajax({

		url : 'salesDay.do',

		method : 'post',

		data : {'date' : date},

		success : function(data){

			var arr = new Array();

			var arr1 = new Array();

			var arr2 = new Array();	

			var arr3 = new Array();

			$.each(data, function(key, value){

				arr.push(value.parents_name);

				arr1.push(value.category_name);

				arr2.push(eval(value.sum/10000));

				arr3.push(value.count);

			});

			if(data.length!=0){

				var mixedChart = new Chart(ctx, {

					  type: 'bar',

					  data: {

					    datasets: [{

					          label: '갯수',

					          data: arr3,

					            backgroundColor: 'rgb(23, 119, 203)',

					            borderColor: 'rgb(23, 119, 203)',

					            borderWidth : 1

					        }, {

					          label: '매출(만원)',

					          data: arr2,

					          type: 'line',

					          backgroundColor: false

					        }],

					    labels: arr

					  },

					  options: {

	                        responsive: true,

					    	maintainAspectRatio: false,

					        scales: {

					            yAxes: [{

					                ticks: {

					                    beginAtZero:true 

					                }

					            }]

					        }

					    }

				}

			);

			tbodyDate(arr, arr2);

			}else{

				$('#dayBody').html("<canvas id='myChart'></canvas>");

				$('#thead-date').html("");

				$('#tbody-date').html("");

				$('#tbody1-date').html("");



			}

		}

	});

};



function tbodyDate(dt, dt1){

	var day = $('#datepicker1').val();

	var contents = "<div class='chy-TableCell'>품목</div>";

	var contents1 = "<div class='chy-TableCell'>매출</div>";

	var thead = "<div class='chy-TableCell' id='thead_date'>"+day.substring(5,day.length)+"</div>"

	for(var i =0; i<3;i++){

		if(dt[i]!=null){

			contents += "<div class='chy-TableCell'>";

			contents += dt[i];

			contents += "</div>";

			contents1 += "<div class='chy-TableCell'>";

			contents1 += dt1[i];

			contents1 += "만원</div>";

		}else{

			contents += "<div class='chy-TableCell'>";

			contents += "없음";

			contents += "</div>";

			contents1 += "<div class='chy-TableCell'>";

			contents1 += "없음";

			contents1 += "</div>";

		}

		thead += "<div class='chy-TableCell'>"+(i+1)+"위</div>"

	};

	$('#thead-date').html(thead);

	$('#tbody-date').html(contents);

	$('#tbody-date1').html(contents1);

};



function salesQuarter(){

	$('#qtBody').html("<canvas id='quarterChart'></canvas>");

	var quarter = $('#chy-count').text();

	var ctx1 = $('#quarterChart').get(0).getContext('2d');

	$.ajax({

		url : 'salesQuarter.do',

		method : 'post',

		data : {'quarter' : quarter},

		success : function(data){

			var arr = new Array();

			var arr1 = new Array();

			var arr2 = new Array();	

			var arr3 = new Array();

			$.each(data, function(key, value){

				arr.push(value.parents_name);

				arr1.push(value.category_name);

				arr2.push(eval(value.sum/10000));

				arr3.push(value.count);

			});

			if(data.length!=0){

				var mixedChart = new Chart(ctx1, {

					  type: 'bar',

					  data: {

					    datasets: [{

					          label: '갯수',

					          data: arr3,

					            backgroundColor: 'rgb(23, 119, 203)',

					            borderColor: 'rgb(23, 119, 203)',

					            borderWidth : 1

					        }, {

					          label: '매출(만원)',

					          data: arr2,

					          type: 'line',

					          backgroundColor: false

					        }],

					    labels: arr

					  },

					  options: {

	                        responsive: true,

					    	maintainAspectRatio: false,

					        scales: {

					            yAxes: [{

					                ticks: {

					                    beginAtZero:true 

					                }

					            }]

					        }

					    }

				}

			);

			tbodyQuarter(arr, arr2);

			}else{

				$('#qtBody').html("<canvas id='quarterChart'></canvas>");

				$('#thead-quarter').html("");

				$('#tbody-quarter').html("");

				$('#tbody-quarter1').html("");

			}

		}

	});

};

function tbodyQuarter(dt, dt1){

	var quarter = $('#chy-count').text();

	var thead = "<div class='chy-TableCell' id='thead_quarter'>"+quarter+"분기</div>"

	var contents = "<div class='chy-TableCell'>품목</div>"

	var contents1 = "<div class='chy-TableCell'>매출</div>"

		for(var i =0; i<3;i++){

			if(dt[i]!=null){

				contents += "<div class='chy-TableCell'>";

				contents += dt[i];

				contents += "</div>";

				contents1 += "<div class='chy-TableCell'>";

				contents1 += dt1[i];

				contents1 += "만원</div>";

			}else{

				contents += "<div class='chy-TableCell'>";

				contents += "없음";

				contents += "</div>";

				contents1 += "<div class='chy-TableCell'>";

				contents1 += "없음";

				contents1 += "</div>";

			}

			thead += "<div class='chy-TableCell'>"+(i+1)+"위</div>"

		}

		$('#thead-quarter').html(thead);

		$('#tbody-quarter').html(contents);

		$('#tbody-quarter1').html(contents1);



}



function salesYear(){

	$('#yrBody').html("<canvas id='yearChart'></canvas>");

	var year = $('#chy-years').text();

	var ctx2 = $('#yearChart').get(0).getContext('2d');

	$.ajax({

		url : 'salesYear.do',

		method : 'post',

		data : {'year' : year},

		success : function(data){

			var arr = new Array();

			var arr1 = new Array();

			var arr2 = new Array();	

			var arr3 = new Array();

			$.each(data, function(key, value){

				arr.push(value.parents_name);

				arr1.push(value.category_name);

				arr2.push(eval(value.sum/10000));

				arr3.push(value.count);

			});

			if(data.length!=0){

				var mixedChart = new Chart(ctx2, {

					  type: 'bar',

					  data: {

					    datasets: [{

					          label: '갯수',

					          data: arr3,

					            backgroundColor: 'rgb(23, 119, 203)',

					            borderColor: 'rgb(23, 119, 203)',

					            borderWidth : 1

					        }, {

					          label: '매출(만원)',

					          data: arr2,

					          type: 'line',

					          backgroundColor: false

					        }],

					    labels: arr

					  },

					  options: {

	                        responsive: true,

					    	maintainAspectRatio: false,

					        scales: {

					            yAxes: [{

					                ticks: {

					                    beginAtZero:true 

					                }

					            }]

					        }

					    }

				}

			);

			tbodyYear(arr, arr2);

			}else{

				$('#yrBody').html("<canvas id='yearChart'></canvas>");

				$('#thead-year').html("");

				$('#tbody-year').html("");

				$('#tbody-year1').html("");

			}

		}

	});

};

function tbodyYear(dt, dt1){

	var year = $('#chy-years').text();

	var thead = "<div class='chy-TableCell' id='thead_year'>"+year+"</div>"

	var contents = "<div class='chy-TableCell'>품목</div>"

	var contents1 = "<div class='chy-TableCell'>매출</div>"

		for(var i =0; i<3;i++){

			if(dt[i]!=null){

				contents += "<div class='chy-TableCell'>";

				contents += dt[i];

				contents += "</div>";

				contents1 += "<div class='chy-TableCell'>";

				contents1 += dt1[i];

				contents1 += "만원</div>";

			}else{

				contents += "<div class='chy-TableCell'>";

				contents += "없음";

				contents += "</div>";

				contents1 += "<div class='chy-TableCell'>";

				contents1 += "없음";

				contents1 += "</div>";

			}

			thead += "<div class='chy-TableCell'>"+(i+1)+"위</div>"

		}

		$('#thead-year').html(thead);

		$('#tbody-year').html(contents);

		$('#tbody-year1').html(contents1);

}





function salesMonth(){

	$('#monthBody').html("<canvas id='monthChart'></canvas>");

	var now = new Date();

    var year= now.getFullYear();

    var mon = $('#chy-month').text()>9 ? ''+ $('#chy-month').text() : '0'+$('#chy-month').text();

	var month = year +'-'+ mon;

	var ctx2 = $('#monthChart').get(0).getContext('2d');

	$.ajax({

		url : 'salesMonth.do',

		method : 'post',

		data : {'month' : month},

		success : function(data){

			var arr = new Array();

			var arr1 = new Array();

			var arr2 = new Array();	

			var arr3 = new Array();

			$.each(data, function(key, value){

				arr.push(value.parents_name);

				arr1.push(value.category_name);

				arr2.push(eval(value.sum/10000));

				arr3.push(value.count);

			});

			if(data.length!=0){

				var mixedChart = new Chart(ctx2, {

					  type: 'bar',

					  data: {

					    datasets: [{

					          label:'갯수',

					          data: arr3,

					            backgroundColor: 'rgb(23, 119, 203)',

					            borderColor: 'rgb(23, 119, 203)',

					            borderWidth : 1

					        }, {

					          label: '매출(만원)',

					          data: arr2,

					          type: 'line',

					          backgroundColor: false

					        }],

					    labels: arr

					  },

					  options: {

	                        responsive: true,

					    	maintainAspectRatio: false,

					        scales: {

					            yAxes: [{

					                ticks: {

					                    beginAtZero:true 

					                }

					            }]

					        }

					    }

				}

			);

			tbodyMonth(arr, arr2);

			}else{

				$('#monthBody').html("<canvas id='monthChart'></canvas>");

				$('#thead-month').html("");

				$('#tbody-month').html("");

				$('#tbody-month1').html("");

			}

		}

	});

};

function tbodyMonth(dt, dt1){

	var month = $('#chy-month').text()+'월';

	var thead = "<div class='chy-TableCell' id='thead_month'>"+month+"</div>"

	var contents = "<div class='chy-TableCell'>품목</div>"

	var contents1 = "<div class='chy-TableCell'>매출</div>"

		for(var i =0; i<3;i++){

			if(dt[i]!=null){

				contents += "<div class='chy-TableCell'>";

				contents += dt[i];

				contents += "</div>";

				contents1 += "<div class='chy-TableCell'>";

				contents1 += dt1[i];

				contents1 += "만원</div>";

			}else{

				contents += "<div class='chy-TableCell'>";

				contents += "없음";

				contents += "</div>";

				contents1 += "<div class='chy-TableCell'>";

				contents1 += "없음";

				contents1 += "</div>";

			}

			thead += "<div class='chy-TableCell'>"+(i+1)+"위</div>"

		}

		$('#thead-month').html(thead);

		$('#tbody-month').html(contents);

		$('#tbody-month1').html(contents1);

		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
		  showDivs(slideIndex += n);
		}

		function showDivs(n) {
		  var i;
		  var x = document.getElementsByClassName("slideTextm");
		  if (n > x.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = x.length}
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";  
		  }
		  x[slideIndex-1].style.display = "block";  
		}
	

}
</script>