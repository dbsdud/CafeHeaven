<!--  orderList by.황윤영
 최신화 : 20180726 -->
<%@page import="poly.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<OrderDTO> oList = (List<OrderDTO>)request.getAttribute("oList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<%@ include file="orderListScript.jsp" %>
<title>CAFEHEAVEN - 주문목록</title>
<script>
$(function(){
	timer = setInterval( function () {
		$.ajax ({
			url : "adminOrderInterval.do",  
			success : function (data) {
				console.log(data);
				var count = Object.keys(data).length;
				if(count != 0){
				var contents = "";
					$.each(data, function(key, value){
						var checkTimeOver = value.ord_remainTime.split(':');
						var remainMin = Number(checkTimeOver[1]);
						if(value.ord_stat == 1){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.menu_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ord_no + ",2);\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
							
						}else if(value.ord_stat == 2){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ord_no +",3)\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else{
							contents += "<tr align=center bgcolor=\"#9FF781\">";
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ord_no + ",4)\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}
					})
				}else{
					$('#interval').html('');
				}
			},
			error:function(error){
				alert(error);
			}
		});
	}, 5000);
})

	function barcodeProc(ordNo, statNo) {
		var barcodePage = "barcodePage.do?ordNo=" + ordNo + "&statNo=" + statNo;
		var popOption = "width=370, height=360,resizable=no, scrollbars=no, status=no;";
		window.open(barcodePage, "", popOption);
	}
function orderProc(ordNo, statNo){
	$.ajax ({
		url : "adminOrderProc.do",
		type : "post",
		data : {
			'ordNo' : ordNo,
			'statNo' : statNo
		},
		success : function (data) {
			var count = Object.keys(data).length;
			if(count != 0){
				var contents = "";
				$.each(data, function(key, value){
					var checkTimeOver = value.ord_remainTime.split(':');
					var remainMin = Number(checkTimeOver[1]);
					if(value.ord_stat == 1){
						if(remainMin <= 0){
							contents += "<tr align=center bgcolor=\"#F5A9A9\">";
						}else{
							contents += "<tr align=center>"
						}
						contents += "<td>" + value.ord_no + "</td>";
						contents += "<td>" + value.user_name + "</td>";
						contents += "<td>" + value.prdt_name + "</td>";
						contents += "<td>" + value.ord_amnt + "</td>";
						contents += "<td>" + value.usr_rcv_time + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
						}
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ord_no + ",2);\">접수하기</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
						contents += "<td>" + value.prdt_price + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
						
					}else if(value.ord_stat == 2){
						if(remainMin <= 0){
							contents += "<tr align=center bgcolor=\"#F5A9A9\">";
						}else{
							contents += "<tr align=center>"
						}
						contents += "<td>" + value.ord_no + "</td>";
						contents += "<td>" + value.user_name + "</td>";
						contents += "<td>" + value.prdt_name + "</td>";
						contents += "<td>" + value.ord_amnt + "</td>";
						contents += "<td>" + value.usr_rcv_time + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
						}
						contents += "<td>접수 완료</td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ord_no +",3)\">조리 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
						contents += "<td>" + value.prdt_price + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
					}else{
						contents += "<tr align=center bgcolor=\"#9FF781\">";
						contents += "<td>" + value.ord_no + "</td>";
						contents += "<td>" + value.user_name + "</td>";
						contents += "<td>" + value.prdt_name + "</td>";
						contents += "<td>" + value.ord_amnt + "</td>";
						contents += "<td>" + value.usr_rcv_time + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
						}
						contents += "<td>접수 완료</td>";
						contents += "<td>조리 완료</td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ord_no + ",4)\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
						contents += "<td>" + value.prdt_price + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
					}
					
					
				})
			}else{
				$('#interval').html('');
			}
		},
		error:function(error){
			alert(error);
		}
	});
}
function takeFirst(){
	 alert("접수를 먼저 해야 가능합니다.");
	 return;
}
function cookFirst(){
	alert("조리완료를 먼저 해야 가능합니다.");
	return;
} 
function orderCancel(ordNo, statNo){
	if(confirm("주문을 취소하시겠습니까?")){
		<%-- var f = document.getElementById('frmPayment');
		if(payTp == "p"){
			payTp = "PHON";
		}else{
			payTp = "CARD"
		}
		f.TRAN_TYPE.value=payTp;
		f.TID.value=tid;
		f.CANCEL_ID.value='<%=CmmUtil.nvl((String)session.getAttribute("ss_user_email"))%>';
		f.CANCEL_CAUSE.value="non";
		f.submit(); --%>
		console.log("cancel");
		$.ajax ({
			url : "adminOrderCancel.do",
			type : "post",
			data : {
				'ordNo' : ordNo,
				'statNo' : statNo
			},
			success : function (data) {
				var count = Object.keys(data).length;
				if(count != 0){
					var contents = "";
					$.each(data, function(key, value){
						var checkTimeOver = value.ord_remainTime.split(':');
						var remainMin = Number(checkTimeOver[1]);
						if(value.ord_stat == 1){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ord_no + ",2);\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
							
						}else if(value.ord_stat == 2){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ord_no +",3)\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else{
							contents += "<tr align=center bgcolor=\"#9FF781\">";
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ord_no + ",4)\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}
						
						
					})
				}else{
					$('#interval').html('');
				}
			},
			error:function(error){
				alert(error);
			}
		});
	}
}
</script>
</head>
<body>
	<!-- 상단 -->
	<%@ include file = "/WEB-INF/view/mainCafeTop.jsp" %>
	<!-- 본문제목 -->
	<input type="hidden" id="adminUserNo" value="<%= userNo %>" />
	<input type="hidden" id="adminUserName" value="<%= name %>" />
	<input type="hidden" id="adminUserEmail" value="<%= email %>" />
	<div class="container">
		<div class="page-header">
			<h1>주문 목록&nbsp;&nbsp;&nbsp;<small>CAFE HEAVEN</small></h1>
		</div>
		<!-- 본문 리스트 상단-->
		<div class="us-list-top hd-font">
			<div><input id="allCheck" type="checkbox" /></div>
			<div>주문메뉴</div>
			<div>주문시간</div>
			<div>고객명</div>
			<div>완료여부</div>
		</div>
		<div id="myTable">
		<!-- 본문 리스트 내용 -->
			<% for (int i = 0; i < oList.size(); i++) {%>
			<div class="us-list hd-font">
				<!-- 주문번호 -->
				<div><%=oList.get(i).getOrdInfoNo() %></div>
				<!-- 주문메뉴 -->
				<div><%-- <%=oList.get(i).getMenuName() %> --%></div>
				<!-- 주문시간 -->
				<div><%=oList.get(i).getOrdDtDate() %></div>
				<!-- 고객명 -->
				<div><%-- <%=oList.get(i).getName() %> --%></div>
				<!-- 완료버튼 -->
				<div><a href="#" class="btn btn-primary">완료</a></div><!-- 버튼을 누르면 고객에게 알람 전송, 상품완료 텍스트로 변경 -->
			</div>
			<br>
			<% } %>
		<!-- 본문 리스트 검색 -->
			<input class="form-control" id="myInput" type="text" placeholder="Search..">
				<a href="#" id="load-list" style="width: 100%" class="btn btn-primary">더보기</a>
				<br><br>
		</div>
	</div>
</body>
</html>