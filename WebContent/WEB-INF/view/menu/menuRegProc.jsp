<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ----------------메뉴 등록 모달 --- db를 전달해야되기 때문에 data-dismiss 를 쓸수없다.------------------- -->
<!--  메뉴 미리보기 스크립트 -->
<%@ include file="menuScript.jsp"%>
<div class="modal fade" id="menu-rg">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">CAFE HEAVEN
					<button type="button" class="close" data-dismiss="modal" style="margin:auto;">×</button>
				</h4>
			</div>
			<!-- 메뉴등록 폼 양식 -->
			<form action="/menu/menuRegProc.do" name="menuRegProc"
				enctype="multipart/form-data" method="post" id="uploadForm">
				<!--  이미지 경로 나중에 바꿀거임 -->
				<div style="float: left; width: 50%; height: 250px;">
					<img id="preview" src="/image/preview.png" style="width: 100%; height: 100%; padding: 4px;">
					<br>
					<div style="padding:4px;">
						<input id="getfile" name="prdtimg" type="file" accept="/image/*" style="margin:auto;" />
					</div>
					<br>
					<!-- name 이 prdtimg 로 묶어 컨트롤러에 변수를 보내주기 위함   accept 이미지속성을 허용 한다 라는 뜻 -->
				</div>
				<!--  이미지 올리는 버튼 -->
				<div>
					커피명:<input type="text" name="menuName" style="width: 45%"
						class="form-control" />
				</div>
				<!-- value 값으로 전에 있던 값 가져오면됨 -->
				<div>
					총제공량:<input type="text" name="menuAmount" style="width: 45%"
						class="form-control" placeholder="숫자로만 기입해주세요." />
				</div>
				<div>
					가격:<input type="text" name="menuPrice" style="width: 45%"
						class="form-control" placeholder="숫자로만 기입해주세요." />
				</div>
				<div>
					내용:<input type="text" name="menuIntro" style="width: 45%"
						class="form-control" placeholder="내용을 입력해주세요" />
				</div>
				<!-- 이 -->
				<div>
					메뉴 카테고리 : <select name="menuCgNo" style="width: 45%"
						class="form-control">
						<option value='drink'>음료</option>
						<option value='dessert'>디저트</option>
						<option value='others'>그외</option>
					</select>
				</div>
				<br>
				<div class="modal-footer" style="clear: both; text-align:center;">
					<button type="submit" class="btn btn-success" style="width:48%;"><i class="fa fa-check spaceLeft"></i>등록</button>
					<button type="button" class="btn btn-danger" style="width:48%;" data-dismiss="modal"><i class="fa fa-times spaceLeft"></i>닫기</button>
				</div>
			</form>
			<!--  메뉴등록끝 -->
		</div>
	</div>
</div>
