<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<%@ include file="cafeInfoManageScript.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>

	<div class="container">
		<div class="page-header">
			<h1>
				카페정보관리 <small>CAFE HEAVEN</small>
			</h1>
		</div>
		<!-- 카페 정보 -->
		<form name="cafeInfo" method="get" Enctype="multipart/form-data"
			action="" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-3 control-label">카페명</label>
				<div class="col-sm-6">
					<input class="form-control" id="cafeName" type="text"
						placeholder="카페명">
				</div>
			</div>

			<div class="form-group">
				<!--  주소 입력란 -->
				<label class="col-sm-3 control-label">주소</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" id="cafeaAddress"
							placeholder="*주소 찾기"> <span class="input-group-btn">
							<input type="button" class="btn btn-success" value="주소찾기" />
						</span>
					</div>
				</div>
			</div>
			<!-- 전화번호 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">전화번호</label>
				<!-- 숫자만 입력하게 하면됨 -->
				<div class="col-sm-6">
					<input class="form-control" id="telNum" type="tel"
						placeholder="전화번호입력">
				</div>
			</div>
			<!-- 영업시간  -->
			<div class="form-group">
				<label class="col-sm-3 control-label">영업일</label>
				<div class="col-sm-6">
					<select class="form-control">
						<option>*영업요일</option>
						<option>월~금</option>
						<option>월~토</option>
						<option>연중무휴</option>
						<option>공휴일 및 주 1회 휴무</option>
						<!--  이걸 선택하면 텍스트 창 나오게 -->
					</select>
				</div>
			</div>
			<!-- 카페소개글 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">카페 소개</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="10"></textarea>
				</div>
			</div>

			<!-- 영업시간 오픈 클로즈시간 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">영업시간</label>
				<div class="col-sm-6">
					<p class="col-sm-2">OPEN</p>
					<input class="col-sm-4"
						style="border: 1px solid #ccc; border-radius: 4px;"
						id="cafeOpenTime" type="time">
					<p class="col-sm-2">CLOSE</p>
					<input class="col-sm-4"
						style="border: 1px solid #ccc; border-radius: 4px;"
						id="cafeCloseTime" type="time">
				</div>
			</div>
			<!-- 이미지 수정 -->
			<div
				style="padding-left: 100px; padding-right: 100px; padding-top: 50px">
				<h3>
					카페 이미지 <small>CAFE HEAVEN</small>
				</h3>
				<div style="border-bottom: 1px solid #eee;"></div>

				<div>
					<!-- 카페 외부 -->

					<div
						style="padding-bottom: x; width: 70%; height: 300px; margin: 0 auto">
						<img id="curImg1" class="img-thumbnail" src="image/cafeIN.jpg"
							style="width: 100%; height: 300px;" />
					</div>

					<div>
						<input id="preImg1" type="file" /> 
					</div>
					<!-- 카페 내부1 -->

					<div
						style="padding-bottom: 20px; width: 70%; height: 300px; margin: 0 auto">
						<img id="curImg2" class="img-thumbnail" src="image/cafeIN2.jpg"
							style="width: 100%; height: 300px;" />
					</div>

				<!-- 	<div>
						<input id="preImg2" type="file" />

					</div>
					카페 내부2

					<div
						style="padding-bottom: 20px; width: 70%; height: 300px; margin: 0 auto">

						<img id="curImg3" src="image/cafeOUT.jpg" class="img-thumbnail"
							style="width: 100%; height: 300px;" class="img-thumbnail" />

					</div>
					<div>
						<input id="preImg3" type="file" /> <a href="#"
							class="btn btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;&nbsp;</a>

					</div> -->
				</div>
			</div>
		</form>
	</div>


	<!--  수정 취소 버튼  하나라도  이미지 업로드가 안되면 바로  -->
				<div style="padding-top: 40px"><center> <a href="#" class="btn btn-success">수정</a><a href="#" class="btn btn-danger">취소</a></center></div>
		
			
		
	
</body>
</html>