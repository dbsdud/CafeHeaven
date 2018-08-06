<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link rel="stylesheet" href="/bootstrap-3.3.2-dist/css/cafe.css">
<div class="footer">
	<div class="container">
		<footer>
			<div class="footMenuWrap">
				<ul>
					<li><a href="#">주요정보고시사항</a></li>
					<li><a href="#">오시는길</a></li>
					<li><a href="#">개인정보 취급방침</a></li>
				</ul>
			</div>
			<p class="copy">
				<small>CAFEHEAVEN, [07684] 서울시 강서구 우장산로10길 112(우장산동 산60-1)</small><br>
				<small>Copyright (C) 2018 cafeheaven.co.kr. All rights reserved</small>
			</p>
			
			<div class="familyWrap">
				<section>
					<h2><button type="button" class="btnFamily">FAMILY MAP</button></h2>
					<div class="familyArea">
						<div class="container">
							<dl class="etc">
								<dt>기타</dt>
								<dd><a href="#" target="_blank" title="새창">참조사이트1</a></dd>
                                <dd><a href="#" target="_blank" title="새창">참조사이트2</a></dd>
                                <dd><a href="#" target="_blank" title="새창">참조사이트3</a></dd>
                                <dd><a href="#" target="_blank" title="새창">참조사이트4</a></dd> 
							</dl>
						</div>
					</div>
				</section>
			</div>
		</footer>
	</div>
</div>
<script>
$('.btnFamily').on('click', function() {
	$('.familyWrap').toggleClass('active');
})
</script>