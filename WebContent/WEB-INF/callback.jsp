<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 자바스크립트 sdk -->
<script type="text/javascript" src="http://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
/* var naverLogin =new naver.LoginWithNaverId(
		{
			clientId:"NAbtPlaYLslbKm5G1uiA",
			callbackUrl:"http://localhost:8080/home.do",
			isPopup: false,
			callbackHandle: true
		}
	)
	
	//설정 정보를 초기화 하고 연동을 준비
	naverLogin.init()
	
	//콜백의 처리,정상적으로 콜백처리가 완료될경우 메인페이지로 리다이렉트 또는 팝업 클로즈
	
window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					//(5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 
					var email = naverLogin.user.getEmail();
				
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						 //(5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함
						naverLogin.reprompt();
						return;
					}

					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/home.do");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
		 */
		 
	
		 
		 
		 

</script>

</body>
</html>