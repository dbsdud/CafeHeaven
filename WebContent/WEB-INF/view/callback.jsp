<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>네이버로그인</title>
</head>
<body>
<!-- 1. LoginWithNaverId Javascript SDK -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- 2. LoginWithNaverId Javascript 설정 정보 및 초기화 -->
<script>
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "y_E6NvLYCg6NAypDWcMn",
		callbackUrl : "http://localhost:8080/home.do",
		isPopup : false,
		callbackHandle : true
	});
	/* 3. 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();
	/* 4. Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function(){
		naverLogin.getLoginStatus(function (status){
			if(status){
				/* 5. 필수적으로 받아야하는 프로필 정보가 있다면 callback 처리 시점에 체크 */
				var naverEmail = naverLogin.user.getEmail();
				var naverName = naverLogin.user.getNickName();
				var birthday = naverLogin.user.getBirthday();
				var naverId = naverLogin.user.getId();
				var age = naverLogin.user.getAge();
				if(naverEmail == undefined || naverEmail == null){
					alert("이메일은 필수정보입니다. 정보제공에 동의해주세요.");
					/* 5-1. 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동 */
					naverLogin.reprompt();
					return;
				}
				window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/home.do");
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
</script>
 <%-- <%
    String clientId = "y_E6NvLYCg6NAypDWcMn";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "AP6n5wIn4d";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/home.do", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %> --%>
  </body>
</html>