<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
 window.onload = function () {

	 var ctx = document.getElementById("sales").getContext("2d");
	    var line = ctx.setLineDash([5, 15]);

	    var gradient = ctx.createLinearGradient(0, 0, 0, 300);
	    gradient.addColorStop(0, 'rgba(40,175,250,.25)');
	    gradient.addColorStop(1, 'rgba(40,175,250,0)');

	    var data = {
	        labels: ["January", "February", "March", "April", "May", "June", "July"],
	        datasets: [
	            {
	                label: "My First dataset",
	                pointDot : false,
	                fillColor: gradient,
	                strokeColor: "#28AFFA",
	                pointColor: "#19283F",
	                pointStrokeColor: "#28AFFA",
	                pointHighlightFill: "#19283F",
	                pointHighlightStroke: "#28AFFA",
	                data: [65, 59, 80, 81, 56, null, null]
	            },
	            {
	                label: "My Second dataset",
	                fillColor: "rgba(0,0,0,0)",
	                strokeColor: "rgba(255,255,255,.39)",
	                pointColor: "#19283F",
	                pointStrokeColor: "rgba(255,255,255,.39)",
	                pointHighlightFill: "#19283F",
	                pointHighlightStroke: "#28AFFA",
	                data: [null, null, null, null, 56, 27, 90]
	            }
	        ]
	    };

	    var options = {};

	    var myLineChart = new Chart(ctx).Line(data, options);
	    console.log(myLineChart);
 }

 
    </script>