<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<script>
<!-- 게시판 유효성 -->
$(function name() {
	var ntTitle=$("input[name=ntTitle]");
	var ntCont=$("textarea[name=ntCont]");
	var ntReg=$("button[name=ntReg]");
	//질문에 답변이 달리면 질문 qagrpno는 1로 바뀜 그 이유는 답변 완료 되었는지 안되었는지
	var qaGrp=$("input[name=qaGrpNo]");
	$(ntReg).click(function(){
		if (ntTitle.val() == '') {
				alert('제목을 입력해주세요!');
				ntTitle.focus();
				return false;
			} else if (ntCont.val() == '') {
				alert('내용을 입력해주세요!');
				ntCont.focus();
				return false;
			} else {
				confirm('입력한 내용이 맞습니까');
			}
		});
	});
</script>
</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<div class="container">
		<div class="page-header">
			<h1>
				공지사항 등록 <small>CAFE HEAVEN</small>
			</h1>
		</div>
		<form class="form-horizontal" method="post"
			action="/notice/noticeRegProc.do?ntSort=nt&&qaGrpNo=0">
			<!-- 제목 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">제목</label>
				<div class="col-sm-6">
					<input class="form-control" name="ntTitle" type="text"
						placeholder="제목을 입력하세요.">
				</div>
			</div>
			<input type="hidden" name="ntWriter" value="<%=name%>" /> <input
				type="hidden" name="regNo" value="<%=userNo%>" />
			<!-- 글내용 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">내용</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="10" name="ntCont" style="resize:none;" placeholder="내용을 입력하세요."></textarea>
				</div>
			</div>
			<!--  하든으로 보낼것 -->
			<input type="hidden" name="qaGrpNo" value="0" />
			<!-- button -->
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-success" name="ntReg" type="submit" style="min-width:25%;">
						<i class="fa fa-check spaceLeft"></i>등록
					</button>
					<a href="/notice/communityTab.do" class="btn btn-danger" style="min-width:25%;">
						<i class="fa fa-times spaceLeft"></i>취소
					</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>