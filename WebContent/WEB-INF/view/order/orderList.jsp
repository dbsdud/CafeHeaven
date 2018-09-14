<!--  orderList by.황윤영
 최신화 : 20180726 -->
<%@page import="poly.dto.TotalOrderDTO"%>
<%@page import="poly.dto.OrderInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<TotalOrderDTO> tList = (List<TotalOrderDTO>)request.getAttribute("TotalOrderList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<%@ include file="orderListScript.jsp" %>
<title>CAFEHEAVEN - 주문목록</title>
<script src="/assets/js/jquery-min.js"></script>
<%@ include file="/WEB-INF/view/mainCss.jsp"%>
<!-- mainJs -->
<%@ include file="/WEB-INF/view/mainJs.jsp"%>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<script>
$(function(){
	timer = setInterval( function () {
		$.ajax ({
			url : "orderInterval.do",  
			success : function (data) {
				console.log(data);
				var count = Object.keys(data).length;
				if(count != 0){
				var contents = "";
					$.each(data, function(key, value){
						var checkTimeOver = value.ordRemainTime.split(':');
						var remainMin = Number(checkTimeOver[1]);
						if(value.ordStat == 1){
							if(remainMin <= 0){
								contents += "<tr class='talign' style='background-color:#F5A9A9'>";
							}else{
								contents += "<tr class='talign'>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ordInfoNo + ",2);\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
							
						}else if(value.ordStat == 2){
							if(remainMin <= 0){
								contents += "<tr class='talign' style='background-color:#F5A9A9'>";
							}else{
								contents += "<tr class='talign'>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ordInfoNo +",3)\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else{
							contents += "<tr class='talign' style='background-color:#9FF781'>";
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ordInfoNo + ",4)\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
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
	}, 100000);
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
					var checkTimeOver = value.ordRemainTime.split(':');
					var remainMin = Number(checkTimeOver[1]);
					if(value.ordStat == 1){
						if(remainMin <= 0){
							contents += "<tr class='talign' style='background-color:#F5A9A9'>";
						}else{
							contents += "<tr class='talign'>"
						}
						contents += "<td>" + value.ordInfoNo + "</td>";
						contents += "<td>" + value.userName + "</td>";
						contents += "<td>" + value.menuName + "</td>";
						contents += "<td>" + value.ordAmnt + "</td>";
						contents += "<td>" + value.usrRcvTime + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
						}
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ordInfoNo + ",2);\">접수하기</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
						contents += "<td>" + value.menuPrice + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
						
					}else if(value.ordStat == 2){
						if(remainMin <= 0){
							contents += "<tr class='talign' style='background-color:#F5A9A9'>";
						}else{
							contents += "<tr class='talign'>"
						}
						contents += "<td>" + value.ordInfoNo + "</td>";
						contents += "<td>" + value.userName + "</td>";
						contents += "<td>" + value.menuName + "</td>";
						contents += "<td>" + value.ordAmnt + "</td>";
						contents += "<td>" + value.usrRcvTime + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
						}
						contents += "<td>접수 완료</td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ordInfoNo +",3)\">조리 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
						contents += "<td>" + value.menuPrice + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
					}else{
						contents += "<tr class='talign' style='background-color:#9FF781'>";
						contents += "<td>" + value.ordInfoNo + "</td>";
						contents += "<td>" + value.userName + "</td>";
						contents += "<td>" + value.menuName + "</td>";
						contents += "<td>" + value.ordAmnt + "</td>";
						contents += "<td>" + value.usrRcvTime + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
						}
						contents += "<td>접수 완료</td>";
						contents += "<td>조리 완료</td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ordInfoNo + ",4)\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
						contents += "<td>" + value.menuPrice + "</td>";
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
						var checkTimeOver = value.ordRemainTime.split(':');
						var remainMin = Number(checkTimeOver[1]);
						if(value.ord_stat == 1){
							if(remainMin <= 0){
								contents += "<tr class='talign' style='background-color:#F5A9A9'>";
							}else{
								contents += "<tr class='talign'>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ordInfoNo + ",2);\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else if(value.ordStat == 2){
							if(remainMin <= 0){
								contents += "<tr class='talign' style='background-color:#F5A9A9'>";
							}else{
								contents += "<tr class='talign'>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ordInfoNo +",3)\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else{
							contents += "<tr class='talign' style='background-color:#9FF781'>";
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ordInfoNo + ",4)\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
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
<script>
	$(document).ready(function() {
		$('#myTable').DataTable();
	});
	<!--삭제-->
	function deleteMenu(menuNo) {
		alert("메뉴를 삭제했습니다.");
		alert(menuNo)
		location.href = "/menu/menuDeleteProc.do?menuNo=" + menuNo;
	}
</script>
<!--  메뉴 테이블 리스트 -->
<!--  css 글자중앙 -->
<style>
.talign {
	text-align: center;
}
</style>
</head>
<body>
<!-- 상단 -->
	<div id="container">
		<%@ include file="/WEB-INF/view/mainHeader.jsp"%>
		<input type="hidden" id="adminUserNo" value="<%=userNo%>" />
		<input type="hidden" id="adminUserName" value="<%=name%>" />
		<input type="hidden" id="adminUserEmail" value="<%=email%>" />
		<section id="content">
			<div class="container-fullscreen">
				<div class="container">
					<div class="row">
						<div class="controls text-center">
							<div class="page-header">
								<h1>
									주문 목록&nbsp;&nbsp;&nbsp;<small>CAFE HEAVEN</small>
								</h1>
							</div>
						</div>
						<table id="myTable" class="table-hover menuTable" style="font-size:10pt;">
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문자</th>
									<th>상품명</th>
									<th>수량</th>
									<th>수령 시간</th>
									<th>남은 시간</th>
									<th>접수 여부</th>
									<th>조리 여부</th>
									<th>수령 여부</th>
									<th>취소 여부</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody id="interval">
								<% for(TotalOrderDTO tDTO : tList){ 
										String ordStat = CmmUtil.nvl(tDTO.getOrdStat());
										String[] arr = CmmUtil.nvl(tDTO.getOrdRemainTime()).split(":");
										int remainMin = Integer.parseInt(arr[1]);
										if(remainMin<0 && !(tDTO.getOrdStat().equals("3"))){
								%>
									<tr style="background-color: #F5A9A9">
									<%
										}else if(tDTO.getOrdStat().equals("3")){
									%>
									<tr class="talign" style="background-color: #9FF781">
									<%
										}else{
									%>
									<tr>
									<%
										}
									%>
										<td class="talign"><%=CmmUtil.nvl(tDTO.getOrdInfoNo()) %></td>
										<td class="talign"><%=CmmUtil.nvl(tDTO.getUserName()) %></td>
										<td class="talign"><%=CmmUtil.nvl(tDTO.getMenuName()) %></td>
										<td class="talign"><%=CmmUtil.nvl(tDTO.getOrdAmnt()) %></td>
										<td class="talign"><%=CmmUtil.nvl(tDTO.getUsrRcvTime()) %></td>
									<%
										if(remainMin<0){
									%>
									<td class="talign" id="<%=CmmUtil.nvl(tDTO.getOrdInfoNo()) %>"><b>TimeOver</b></td>
									<%
										}else{
									%>
									<td class="talign" id="<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>"><%=CmmUtil.nvl(tDTO.getOrdRemainTime()) %></td>
									<%
										}
									%>
									<%if(ordStat.equals("1")){ %>
									<td class="talign">
										<div>
											<button class="btn btn-primary btn-sm" onclick="orderProc('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>', 2);">접수하기</button>
										</div>
									</td>
									<td class="talign">
										<div>
											<a href="#"><button class="btn btn-success btn-sm" onclick="takeFirst();">조리 완료</button></a>
										</div>
									</td>
									<td class="talign">
										<div>
											<button class="btn btn-warning btn-sm" onclick="cookFirst();">수령 완료</button>
										</div>
									</td>
									<td class="talign">
										<div>
											<button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>', 5);">취소하기</button>
										</div>
									</td>
									<%}else if(ordStat.equals("2")){ %>
									<td class="talign">
										접수 완료
									</td>
									<td class="talign">
										<div>
											<button class="btn btn-success btn-sm" onclick="orderProc('<%=CmmUtil.nvl(tDTO.getOrdInfoNo()) %>',3);">조리 완료</button>
										</div>
									</td>
									<td class="talign">
										<div class="btn-group">
											<button class="btn btn-warning btn-sm" onclick="cookFirst();">수령 완료</button>
										</div>
									</td>
									<td class="talign">
										<div>
											<button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>','5');">취소하기</button>
										</div>
									</td>
									<%}else{ %>
									<td class="talign">
										접수 완료
									</td>
									<td class="talign">
										조리 완료
									</td>
									<td class="talign">
										<div>
											<button class="btn btn-warning btn-sm" onclick="barcodeProc('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>',4);">수령 완료</button>
										</div>
									</td>
									<td class="talign">
										<div>
											<button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>','5');">취소하기</button>
										</div>
									</td>
									<%} %>
									<td class="talign"><%=CmmUtil.nvl(tDTO.getMenuPrice()) %></td>
								</tr>
							<%} %>
							</tbody>
						</table>
					</div>
					<form method="post" name="frmPayment" id="frmPayment" style="display:none;" action="https://pg.paynuri.com/paymentgateway/cancelPayment.do" accept-charset="euc-kr" target="_self">
						<input type="hidden" id="STOREID" name="STOREID" value="1500000088">
						<input type="hidden" id="TRAN_TYPE" name="TRAN_TYPE">
						<input type="hidden" id="KIND" name="KIND" value="0420">
						<input type="hidden" id="TID" name="TID">
						<input type="hidden" id="CANCEL_ID" name="CANCEL_ID">
						<input type="hidden" id="CANCEL_CAUSE" name="CANCEL_CAUSE">
					</form>
				</div>
			</div>
		</section>		
		<!-- footer -->
		<%@ include file="/WEB-INF/view/mainFooter.jsp"%>
	</div>
</body>
</html>