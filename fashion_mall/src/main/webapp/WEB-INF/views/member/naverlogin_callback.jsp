<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	<form action="/index" id="naverForm">
		<input type="hidden" name="userid" value="naver_id_login.getProfileData('email')"/>
	</form>
	
	<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("PvY7Q5AdyizFBp7QrLpB", "http://localhost:9090/index");
		
		alert(naver_id_login.oauthParams.access_token);
		alert(naver_id_login.getProfileData('email'));
		
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			// naver_id_login.getProfileData('프로필항목명');
			// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
		}
		
		//$("#naverForm").submit();
		
	</script>
	<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->
	</body>
</html>