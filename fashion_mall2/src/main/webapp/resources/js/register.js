/**
 * register.jsp 폼 유효성 검증
 * jquery validation plug-in 사용
 */
$(function () {
	
//중복아이디 체크시 보내야하는 토큰 및 헤더 정보
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

  $("#regist").validate({
    //rules 정하기-유효성 검증 규칙 지정
    //폼 요소 이름 사용
    rules: {
      userid: {
        required: true,
        validId: true,
        remote:{ //ajax코드를 불러옴
        	url : '/checkId',
        	type : 'post',
			//post전송하기전에 security때문에 토큰과 헤더를 보내줘야 한다.
			beforeSend: function(xhr){
        		xhr.setRequestHeader(header, token);
    		},
        	data:{
        		userid:function(){
        			return $("#userid").val();
           }
          }
         }
      },
      password: {
        required: true,
        validPwd: true,
      },
      confirm_password: {
        required: true,
        validPwd: true,
        equalTo: "#password", // 현재 요소가 어떤 요소랑 값이 같아야 하는가?(아이디 사용)
      },
	  name :{
		required: true,
	  },
	  personnum1:{
		required: true,
		validnum1: true,
	  },
	  personnum2:{
		required: true,
		validnum2: true,
	  },
	  phonenum:{
		required: true,
	  }
    }, //rules 종료

    //규칙이 맞지않을 경우 보여줄 메세지 작성
    messages: {
      userid: {
        required: "아이디는 필수 입력 요소입니다.",
		remote: "이 아이디는 사용 중입니다."
      },
	  phonenum: {
        required: "핸드폰번호는 필수 입력 요소입니다.",
      },
      password: {
        required: "비밀번호는 필수 입력 요소입니다.",
      },
      confirm_password: {
        required: "비밀번호는 필수 입력 요소입니다.",
        equalTo: "이전 비밀번호와 다릅니다.",
      },
      name: {
        required: "이름은 필수 입력 요소입니다.",
      },	
	  personnum1: {
        required: "주민등록번호는 필수 입력 요소입니다.",
      },
	  personnum2: {
        required: "주민등록번호는 필수 입력 요소입니다.",
      },
    },

	errorPlacement:function(error, element){
		$(element).closest("form") //가장 가까운 상위태그(form)찾아
				  .find("small[id='"+element.attr('id')+"']")
				  .append(error);	
	}
  });
});

$.validator.addMethod(
  "validId",
  function (data) {
    const regId = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{6,12}$/;
    return regId.test(data);
  },
  "아이디는 영문자,숫자의 조합으로 6~12자리로 만들어야 합니다."
);

$.validator.addMethod(
  "validPwd",
  function (data) {
    const regPwd =
      /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,15}$/; //(조건)[포함되어야하는 것]
    return regPwd.test(data);
  },
  "비밀번호는 영문자,숫자,특수문자의 조합으로 8~15자리로 만들어야 합니다."
);

"주민등록번호 정규 표현식"
$.validator.addMethod(
  "validnum1",
  function (data) {
    const regNum1 =
      /^(?=.*[0-9])[0-9]{6}$/; //(조건)[포함되어야하는 것]
    return regNum1.test(data);
  },
  "주민등록번호 앞자리는 숫자 6자리 이어야 합니다."
);

"주민등록번호 정규 표현식"
$.validator.addMethod(
  "validnum2",
  function (data) {
    const regNum2 =
      /^(?=.*[0-9])[0-9]{7}$/; //(조건)[포함되어야하는 것]
    return regNum2.test(data);
  },
  "주민등록번호 뒷자리는 숫자 7자리 이어야 합니다."
);



