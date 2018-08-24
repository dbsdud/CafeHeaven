<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ordNo = (String) request.getAttribute("ordNo");
	String statNo = (String)request.getAttribute("statNo");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/bootstrap-3.3.2-dist/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$('#ordNoId').focus();
})
function submitBarcode(){
	var inputBarcode = $('#ordNoId');
	var ordNo = <%=ordNo%>;
	if(inputBarcode.val()!=ordNo){
		$('#label').text("주문정보가 일치하지 않습니다.");
		inputBarcode.val("");
		return false;
	} else {
		this.submit();
	}
}
</script>
</head>
<body style="text-align:center;">
	<form name="f" onsubmit="return submitBarcode();" action="barcodeProc.do" method="post">
		<input type="text" name="ordNo" id="ordNoId">
		<input type="hidden" name="statNo" value=<%=statNo %>>
	</form>
	<br>
	<br>
	<h3 id="label"></h3>
</body>
</html>