/**
 * findid.jsp 에서 사용
 */
$(function(){

	console.log($('#userEmail1').val());

	//메일 인증
	$('#mail-Check-Btn').click(function() {
		
		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type:'get',
			url : 'mailCheck1?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code = data;
				alert('인증번호가 전송되었습니다.');
			},
		}); // end ajax
		
	}); // end send eamil
	// 메일 인증
	
	// 인증번호가 왔을 시
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('O');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('X');
			$resultMsg.css('color','red');
		}
		
	});
	// 인증번호가 왔을 시
	
	// 가입버튼 클릭시 인증번호가 같을 때 와 다를때
	$("#find").click(function(e){
		e.preventDefault();
		
		const $resultMsg = $('#mail-check-warn').html();
		
		if($resultMsg == 'O'){
			$("#findinfo").submit();
		}else if($resultMsg == ''){
			//나중에 빈칸인건 register1.js에 유효성 검증으로 넘겨줘도 됨 
			alert('본인 인증을 해주세요.');
		}else{
			alert('인증번호를 확인해 주세요.');
		}
	});
	// 가입버튼 클릭시 인증번호가 같을 때 와 다를때 끝	
		
})