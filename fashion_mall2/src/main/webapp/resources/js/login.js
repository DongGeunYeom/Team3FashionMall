/**
 *  login.jsp에서 사용할 js
 */
$(function(){
	
	$("#findid").click(function(){
		// 아이디 찾기로 이동
		$(".form-signin").attr("action","/findid");
		location.href="/findid";
	})
	
	$("#findpwd").click(function(){
		// 비밀번호 찾기로 이동
		$(".form-signin").attr("action","/findpwd");
		location.href="/findpwd";
	})
	
	
})
