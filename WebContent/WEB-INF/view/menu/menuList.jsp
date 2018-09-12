<%@page import="poly.dto.TmpDTO"%>
<%@page import="poly.dto.MenuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	MenuDTO mDTO=(MenuDTO)request.getAttribute("mDTO");
	TmpDTO tDTO = (TmpDTO)request.getAttribute("tDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAFE HEAVEN - MENU</title>
<script src="/assets/js/jquery-min.js"></script>
<%@ include file="/WEB-INF/view/mainCss.jsp"%>
<!-- mainJs -->
<%@ include file="/WEB-INF/view/mainJs.jsp"%>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<!-- menu Ajax Start!! -->
<script>
function userMenuList(menuCgNo){
	var orderUserNo=$('#orderUserNo').val();
	$.ajax({
		url:"/menu/userMenuList.do",
		type:"POST",
		data:{
			'menuCgNo':menuCgNo
		},
		success:function(data){
			var contents="";
			// 사용자 메누 조회 글
			var caList = data.caList;
			var mList = data.mList;
			
			for(var i=0; i<caList.length; i++){
				var caListImg = caList[i].menuNo;
				var menuListImg = mList[i].menuNo;
				
				if(orderUserNo==""){
					contents+="<div class='col-md-3 col-lg-3 col-sm-6 col-xs-12 all "+mList[i].menuCgNo+"' style='display: inline-block;'>";
					contents+="<div class='product'>";
					contents+="<div class='post-featured'>";
					contents+="<img src='/uploadImg/"+caList[i].cafeImg+"'>";
					contents+="<div class='esg-overlay'>";
					contents+="<div class='icon'>";
					contents+="<a href='#' data-toggle='modal' data-target='#menu-dt' class='lightbox'>";
					contents+="<i class='icon-magnifier' onclick='getUserMenuDetail(&#39;"+mList[i].menuNo+"&#39;)'>";
					contents+="</i>";
					contents+="</a>";
					contents+="</div>";
					contents+="</div>";
					contents+="</div>";
					contents+="<div class='post-content'><h4>"+mList[i].menuName+"</h4>";
					contents+="<div class='product-price'><span class='amount'>"+mList[i].menuPrice+"원</span></div>";
					contents+="<a href='#' onclick='doOrder(&#39;loginplz&#39;);' class='btn btn-cart'><i class='icon-basket'></i>주문하기</a>";
					contents+="</div>";
					contents+="</div>";
					contents+="</div>";
					
					contents+="<input type='hidden' value='"+data.mList[i].menuNo+"' />";
				}else{
					contents+="<div class='col-md-3 col-lg-3 col-sm-6 col-xs-12 all "+mList[i].menuCgNo+"' style='display: inline-block;'>";
					contents+="<div class='product'>";
					contents+="<div class='post-featured'>";
					contents+="<img src='/uploadImg/"+caList[i].cafeImg+"')'>";
					contents+="<div class='esg-overlay'>";
					contents+="<div class='icon'>";
					contents+="<a href='#' data-toggle='modal' data-target='#menu-dt' class='lightbox'>";
					contents+="<i class='icon-magnifier' onclick='getUserMenuDetail(&#39;"+mList[i].menuNo+"&#39;)'>";
					contents+="</i>";
					contents+="</a>";
					contents+="</div>";
					contents+="</div>";
					contents+="</div>";
					contents+="<div class='post-content'><h4>"+mList[i].menuName+"</h4>";
					contents+="<div class='product-price'><span class='amount'>"+mList[i].menuPrice+"원</span></div>";
					contents+="<a onclick='doOrder('suc');' href='/order/orderDirect.do?menuNo="+mList[i].menuNo+"&userNo="+orderUserNo+"' class='btn btn-cart'><i class='icon-basket'></i>주문하기</a>";
					contents+="</div>";
					contents+="</div>";
					contents+="</div>";
					
					contents+="<input type='hidden' value='"+data.mList[i].menuNo+"' />";
				}
			}
			$('#userMenuList').html(contents);
		},
		error:function(error){
			alert(error);
		}
	});
}
function getUserMenuDetail(menuNo){
	$.ajax({
		url:"/menu/getUserMenuDetail.do",
		type:"POST",
		data:{
			'menuNo':menuNo
		},
		success:function(data){
			console.log(data);
			var img="";
			var contents="";
			
			img+="<div style='float:left; height:100%'>";
			img+="<img src='/uploadImg/"+data.caDTO.cafeImg+"' style='width:100%; height:100%; object-fit:contain'>";
			img+="</div>";
			
			contents += "<div>제품명<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuName+"' readonly /></div>";
			contents += "<div>가격<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuPrice+"' readonly /></div>";
			contents += "<div>제공량<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuAmount+"' readonly /></div>";
			contents += "<div>소개<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuIntro+"' readonly /></div>";
			
			contents += "<input type='hidden' value'"+data.mDTO.menuNo+"' />";
			contents += "<input type='hidden' value'"+data.mDTO.menuCgNo+"' />";
			contents += "<input type='hidden' value'"+data.mDTO.menuPrice+"' />";
			contents += "<input type='hidden' value'"+data.mDTO.menuName+"' />";
			contents += "<input type='hidden' value'"+data.mDTO.regDate+"' />";
			$('#userMenuListModalImg').html(img);
			$('#userMenuListModal').html(contents);
		},
		error:function(error){
			alert(error);
		}
	});
}
/* 로그인 요구 */
function doOrder(str){
	if(str=="loginplz"){
		alert("로그인이 필요합니다.");
		$('input[name==null]').focus();
		return false;
	}else{
		return true;
	}
}
</script>
<!-- menu Ajax End!! -->
</head>
<body>
	<div id="container">
		<%@ include file="/WEB-INF/view/mainHeader.jsp"%>
		<input type="hidden" id="orderMenuUserNo" value="<%= userNo %>" />
		<section id="content">
			<div class="container-fullscreen">
				<div class="container">
					<!-- 메뉴 분류 탭 시작 -->
					<div class="row">
						<div class="controls text-center">
							<!-- <a href="#" class="filter active" id="myLink" data-filter="all" onclick="userMenuList('all');">전체</a>
							<a href="#" class="filter" data-filter=".recommend" onclick="userMenuList('recommend');">추천</a> -->
							<a href="#" class="filter" id="myLink" data-filter=".drink"	onclick="userMenuList('drink');">음료</a> 
							<a href="#"	class="filter" data-filter=".dessert" onclick="userMenuList('dessert');">디저트</a> 
							<a href="#"	class="filter" data-filter=".others" onclick="userMenuList('others');">그 외</a>
						</div>

						<!-- 메뉴 분류 탭 끝 -->
						<div id="userMenuList">

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- footer -->
		<%@ include file="/WEB-INF/view/mainFooter.jsp"%>
	</div>
	<div class="modal fade" id="menu-dt">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">CAFE HEAVEN</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!--  이미지 경로 나중에 바꿀거임 -->
				<div class="modal-body">
					<!--  modal의 50%은 사진  -->
					<!-- 나중에 db로 정보 받아오기 이미지나-->
					<div id="userMenuListModalImg" style="float: left; width: 50%; height:250px; padding-left: 4px; padding-right: 4px;">
						
					</div>
					<div id="userMenuListModal" style="float: right; width: 50%; height: 250px; padding-left: 4px; padding-right: 4px;">
						
					</div>
					<div class="modal-footer" style="clear: both;">
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
					<input type="hidden" id="orderUserNo" value="<%=userNo %>" />
				</div>
			</div>
		</div>
	</div>
<script>
	function openMenu(evt, menuName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("menu");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(
					" w3-dark-grey", "");
		}
		document.getElementById(menuName).style.display = "block";
		evt.currentTarget.firstElementChild.className += " w3-dark-grey";
	}
	document.getElementById("myLink").click();
</script>

</body>
</html>