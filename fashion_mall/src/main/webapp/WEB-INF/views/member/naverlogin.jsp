<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		</head>
		<body>
		<!-- 네이버 로그인 버튼 노출 영역 -->
		<div id="naver_id_login"></div>
		<!-- //네이버 로그인 버튼 노출 영역 -->
		
		
		<!-- 네이버아디디로로그인 초기화 Script -->
		<script type="text/javascript">
			var naver_id_login = new naver_id_login("PvY7Q5AdyizFBp7QrLpB", "http://localhost:9090/member/naverlogin_callback");
			var state = naver_id_login.getUniqState();
			naver_id_login.setButton("white", 2,40);
			naver_id_login.setDomain(".service.com");
			naver_id_login.setState(state);
			naver_id_login.setPopup();
			naver_id_login.init_naver_id_login();
		</script>
		<!-- // 네이버 로그인 초기화 Script -->
		
	</body>
</html>