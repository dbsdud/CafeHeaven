<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--컨트롤러에서 모델에 저장된 데이터를 받기위해 선언 애트리뷰트안에 있는것이 키값  -->
<% List<NoticeDTO> nList= (List<NoticeDTO>)request.getAttribute("nList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<%@ include file="userListScript.jsp" %>
<script>

	$(function(){
		
		//선택할 option들
		var notice = $('select[name=notice]');
		var qna = $('select[name=qna]');
		var review = $('select[name=review]');
		
		notice.change(function(){
			var noticeWrite=$('select[name=notice] option:selected');
			
		});
		
</script>

</head>
<body>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>
<div class="container">

		<div class="us-list-top hd-font" id="list">
			<!--  리스트를 꺼내기위한 -->
			<div id="myTable">
				<select name="notice">
					<option value="notice" id="notice">공지사항</option>
					<option value="qna" id="qna">Q&A</option>
					<option value="review" id="review">리뷰</option>
				</select>	
			</div>
			
			<table border="1px">
				<tr>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/mainCafeBottom.jsp" %>
			
</body>
</html>