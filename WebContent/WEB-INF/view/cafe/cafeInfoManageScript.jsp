<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
<!--카페 정보 이미지 미리 보기 3장 -->
$(document).ready(function(){ 
	
	function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#curImg1").attr('src', e.target.result);
			}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#preImg1").change(function() {
			readURL(this);
		});
	
});
$(document).ready(function(){ 
	
	function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#curImg2").attr('src', e.target.result);
					
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#preImg2").change(function() {
			readURL2(this);
		});
});

$(document).ready(function(){ 
	
	function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#curImg3").attr('src', e.target.result);
				
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#preImg3").change(function() {
			readURL3(this);
		});
});

</script>
