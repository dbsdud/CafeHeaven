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
<title>Insert title here</title>
<script src="/assets/js/jquery-min.js"></script>

<%@ include file="/WEB-INF/view/mainCss.jsp"%>
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
					contents+="<div class='col-md-3 col-lg-3 col-sm-6 col-xs-12 all "+mList[i].menuCgNo+"'>";
					contents+="<div class='product'>";
					contents+="<div class='post-featured'>";
					contents+="<a href='#' data-toggle='modal' data-target='#menu-dt'>";
					contents+="<img src='/uploadImg/"+caList[i].cafeImg+"' onclick='getUserMenuDetail('"+mList[i].menuNo+"')'>";
					contents+="</a>";
					contents+="<h5>"+mList[i].menuName+"</h5>";
					contents+="<p>"+mList[i].menuPrice+"원</p>";
					contents+="<div>";
					contents+="<a onclick='doOrder('loginplz');' class='btn'>주문하기</a>";
					contents+="</div>";
					contents+="</div>";
					contents+="</div>";
					contents+="</div>";
					
					contents+="<input type='hidden' value='"+data.mList[i].menuNo+"' />";
				}else{
					contents+="<div class='col-md-3 col-lg-3 col-sm-6 col-xs-12 all "+mList[i].menuCgNo+"'>";
					contents+="<div class='product'>";
					contents+="<div class='post-featured'>";
					contents+="<a href='#' data-toggle='modal' data-target='#menu-dt'>";
					contents+="<img src='/uploadImg/"+caList[i].cafeImg+"' onclick='getUserMenuDetail('"+mList[i].menuNo+"')'>";
					contents+="</a>";
					contents+="<h5>"+mList[i].menuName+"</h5>";
					contents+="<p>"+mList[i].menuPrice+"원</p>";
					contents+="<div>";
					contents+="<a onclick='doOrder('suc');' href='/order/orderDirect.do?menuNo="+mList[i].menuNo+"&userNo="+orderUserNo+"' class='btn'>주문하기</a>";
					contents+="</div>";
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
			img+="<img src='/uploadImg/"+data.caDTO.cafeOmg+"' style='width:100%; height:100%; object-fit:contain'>";
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
							<a href="#" class="filter active" data-filter="all">전체</a>
							<a href="#" class="filter" data-filter=".recommend">추천</a>
							<a href="#" class="filter" data-filter=".drink" onclick="userMenuList('drink');">음료</a>
							<a href="#" class="filter" data-filter=".dessert" onclick="userMenuList('dessert');">디저트</a>
							<a href="#" class="filter" data-filter=".others" onclick="userMenuList('others');">그 외</a>
						</div>
					</div>
					<!-- 메뉴 분류 탭 끝 -->
					<div id="userMenuList">
					<!-- <div style="text-align: center; margin-left: auto; margin-right: auto;" id="#">
					
					</div> -->
					</div>
				</div>
			</div>
		</section>
		<!-- footer -->
		<%@ include file="/WEB-INF/view/mainFooter.jsp"%>
	</div>
		<!-- mainJs -->
<%@ include file="/WEB-INF/view/mainJs.jsp"%>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
</body>
</html>