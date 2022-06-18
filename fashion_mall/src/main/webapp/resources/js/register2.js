/**
 * regist.jsp 폼 유효성 검증
 * jquery validation plug-in 사용
 */

/**
$("#dupId").click(function(){
	alert('아이디 중복 확인');
});
 */

// 중복확인 버튼 클릭 시 아이디 중복 체크
// regist3.js에서 문법 수정본

$(function() {
	
	$("#checkId").click(function() {
		
		var userid = $("#user_id").val();	// id 값이 "userid"인 입력란의 값을 저장
					
			$.ajax({
				url:'/member/idCheck',	// Controller 에서 요청받을 주소
				type:'post',	// post 방식으로 전달
				data:{user_id:userid},
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success:function(cnt) {	// 컨트롤러에서 넘어온 cnt 값을 받는다.
					if(cnt == 0) {	// cnt 가 1이 아니면(=0일 경우) -> 사용가능한 아이디
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
					} else {	// cnt 가 1일 경우 -> 이미 존재하는 아이디
						$('.id_already').css("display", "inline-block");
						$('.id_ok').css("display", "none");
						alert('아이디를 다시 입력해주세요');
						$('#userid').val('');
					}
				},
				error: function() {
					alert("에러입니다.");
				},				
			});			
	})
})


