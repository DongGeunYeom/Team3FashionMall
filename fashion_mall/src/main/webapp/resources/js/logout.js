/**
 *  logout시 사용할 js
 */
$(function(){
	//로그아웃 버튼 클릭시 로그아웃 폼 전송
	$("#logout").click(function(e){
		e.preventDefault();
		$("#logoutForm").submit();
	})
	
	//마이 페이지로 가기
	$("#myinfo").click(function(e){
		e.preventDefault();
		alert("아직 안만듬");
	})
})
