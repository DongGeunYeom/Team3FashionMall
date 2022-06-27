/**
 *  logout 사용시 사용할 js
 */
$(function(){
	//로그아웃 버튼 클릭시 로그아웃 폼 전송
	$("#logout").click(function(e){
		e.preventDefault();
		$("#logoutForm").submit();
	})
	
})