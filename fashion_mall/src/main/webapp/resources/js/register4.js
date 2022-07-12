/**
 *  register 2(아이디 중복확인) + register 3(메일 인증) 합쳐보기
 *  (가입완료 버튼 클릭 시 실행되는 액션 합침)
 */

$(function() {
	
	// ------------------------------------------register2 시작
	$("#checkId").click(function() {
		
		
		var userid = $("#user_id").val();	// id 값이 "userid"인 입력란의 값을 저장
					
		
		var idCheckResult1 = $('#id_check');	
		
		
					
					
			$.ajax({
				url:'/member/idCheck',	// Controller 에서 요청받을 주소
				type:'post',	// post 방식으로 전달
				data:{user_id:userid},
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
//				success:function(cnt) {	// 컨트롤러에서 넘어온 cnt 값을 받는다.
//					if(cnt == 0) {	// cnt 가 1이 아니면(=0일 경우) -> 사용가능한 아이디
//						$('.id_ok').css("display", "inline-block");
//						$('.id_already').css("display", "none");
//					} else {	// cnt 가 1일 경우 -> 이미 존재하는 아이디
//						$('.id_already').css("display", "inline-block");
//						$('.id_ok').css("display", "none");
//						alert('아이디를 다시 입력해주세요');
//						$('#userid').val('');
//					}
//				},
				
				success:function(cnt) {	// 컨트롤러에서 넘어온 cnt 값을 받는다.
					if(cnt == 0) {	// cnt 가 1이 아니면(=0일 경우) -> 사용가능한 아이디
						// $('.id_ok').css("display", "inline-block");
						// $('.id_already').css("display", "none");
						
						idCheckResult1.html('사용 가능한 아이디입니다.');
						idCheckResult1.attr('class', 'id_ok');
						
						
						
						
					} else {	
						// cnt 가 1일 경우 -> 이미 존재하는 아이디
						// $('.id_already').css("display", "inline-block");
						// $('.id_ok').css("display", "none");
						// alert('아이디를 다시 입력해주세요');
						// $('#userid').val('');
						
						idCheckResult1.html('이미 사용되고 있는 아이디입니다.');
						idCheckResult1.attr('class', 'id_already');
						alert('아이디를 다시 입력해주세요');
						$('#userid').val('');
						
					}
				},
				
				error: function() {
					alert("에러입니다.");
				},				
			});
			
			
			if(userid == '') {
				alert('아이디를 입력해주세요');
				
				idCheckResult1.html('');
			}
						
						
	});
	
	
	
	// ------------------------------------------register2 끝
	
	// ------------------------------------------register3 시작
	
	//Controller 로 부터 전달받은 인증번호를 뷰에 저장하는 코드.
	//사용자가 입력한 인증번호와 비교할 수 있도록 하기위해서.
	var code = "";		// 이메일 인증번호 저장를 저장하기 위해서 선언.
	
	/* 인증번호 이메일 전송 */
	$("#mail_check_button").click(function(e){
	 e.preventDefault();
		
	 var email = $("#email").val();        // 입력한 이메일
	 var checkBox = $(".mail_check_input");        // 인증번호 입력란
	 var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
	 
	console.log('사용자가 입력한 이메일 : ' + email);

	 $.ajax({
	     
	     type:"GET",
	     url:"mailCheck?email=" + email,
			success:function(data){
				
		         //console.log("data : " + data);	// 데이터 controller로 정상적으로 반환받았는지 확인하기 위한 코드. 정상적으로 들어왔는지 확인 후 지워주기
		        code = data;
		         
				if(email == '') {
					alert('이메일을 입력해주세요');
					
				} else {
					alert('인증메일이 발송되었습니다.');
					checkBox.attr("disabled",false);	// 이메일 인증 입력란 (.mail_check_input)이 입력가능하도록 속성 변경
					boxWrap.attr("id", "mail_check_input_box_true");	// 이메일 인증 번호 입력란의 색상이 변경되도록 id 속성 변경
				}
	
			}		
			
			
	             
	 });
	 
	});
	
	
	
	// var inputCode = $(".mail_check_input").val();        // 입력코드    

	
	/* 인증번호 비교 */
	
	//해당 메소드는 인증번호 입력란에 데이터를 입력한 뒤 마우스로 다른 곳을 클릭 시에 실행됨.
	$(".mail_check_input").blur(function(e){
		e.preventDefault();
			
	 	var checkResult = $("#mail_check_input_box_warn");    // 비교 결과   
	
		var inputCode = $(".mail_check_input").val();        // 입력코드    
	
	 
	 	// inputCode : 사용자 입력 번호 / code : 이메일로 전송된 인증번호
	 	if(inputCode == code){                            // 일치할 경우
	     checkResult.html("인증번호가 일치합니다.");
	     checkResult.attr("class", "correct");        
	 	} else {                                            // 일치하지 않을 경우
		     checkResult.html("인증번호를 다시 확인해주세요.");
		     checkResult.attr("class", "incorrect");
		} 
		
		
		
		
		// inputCode, code 갖고 오는지 확인
		console.log('사용자가 입력한 인증번호(inputCode) : ' + inputCode );
		console.log('발급된 인증번호(code) : ' + code );
		
	});
	
	
	
	
	
	
	// 왜 안돼..........
	// 가입 완료 버튼(#regist_submit) 클릭시 실행
	$('#regist_submit').click(function(e) {
		
		e.preventDefault();
		
		var inputCode = $(".mail_check_input").val();        // 입력코드    
		
		const idCheckResult2 = $('#id_check').html();			

		const checkResult2 = $("#mail_check_input_box_warn").html();
		
	 	if(inputCode != code){                            // 일치X
			alert('인증번호를 확인해 주세요.');
	 	}
	
		// 값 넘어오는지 확인용
		console.log('-----------------------------------')
		console.log('메일 인증 확인')
		console.log('code : ' + code)
		console.log('inputCode : ' + inputCode );
		console.log('checkResult2 값 : ' + checkResult2);
		// 확인용
		console.log('-----------------------------------')
		console.log('아이디 중복 확인')
		console.log('idCheckResult2 값 : ' + idCheckResult2);
		console.log('');
		
		if(inputCode == code && idCheckResult2 == '사용 가능한 아이디입니다.') {
			$('#regist').submit();
		}
		
//		if(checkResult2 == '인증번호가 일치합니다.' && idCheckResult2 == '사용 가능한 아이디입니다.'){
//			$('#regist').submit();
//		} 

		if(idCheckResult2 == '이미 사용되고 있는 아이디입니다.') {
			alert('이미 사용되고 있는 아이디입니다. 다른 아이디를 입력해주세요.')
			
		} else if(idCheckResult2 == '') {
			alert('아이디 중복 확인을 해주세요.');		
			
		} 
		
		if(checkResult2 == '') {
			alert('이메일로 본인 인증을 해주세요');		// 인증번호 입력란에 아무것도 입력하지 않으면 alert창 띄워주기
		
		}  

		
		
		
		


	});	
	
	
	
	
	
	// ------------------------------------------register3 끝
	
	
	
	
	
})


