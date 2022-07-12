/**
 * regist.jsp 폼 유효성 검증
 * jquery validation plug-in 사용
 */



$(function () {	
  $("#regist").validate({
    //rules 정하기-유효성 검증 규칙 지정
    //폼 요소 이름 사용
    rules: {
      user_id: {
        required: true,
        validId: true,
      },
      password: {
        required: true,
        validPwd: true,
      },
      confirm_password: {
        required: true,
        validPwd: true,
        equalTo: "#password", //현재 요소가 어떤 요소랑 값이 같아야 하는가?(아이디 사용)
      },
      phone_num: {
        required: true,
		validPhone : true,
      },
	  name:{
		required: true,
		validName : true,
	  },
     email : {
        required: true,
      },
	 email_check : {
        required: true,
	  },
      address : {
        required: false,
      },
	  aggrement : {
        required: true,
      },

    }, //rules 종료

    //규칙이 맞지 않을 경우 보여줄 메세지 작성
    messages: {
      user_id: {
        required: "아이디는 필수 입력 요소입니다.",
      },
      password: {
        required: "비밀번호는 필수 입력 요소입니다.",
      },
      confirm_password: {
        required: "비밀번호는 필수 입력 요소입니다.",
        equalTo: "이전 비밀번호와 다릅니다.",
      },
      phone_num: {
        required: "핸드폰 번호는 필수 입력 요소입니다.",
      },
      email: {
        required: "이메일은 필수 입력 요소입니다.",
        email: "이메일 형식을 확인해 주세요",
      },
	  email_check: {
        required: "이메일 인증번호는 필수 입력 요소입니다.",
	  },
      name: {
        required: "이름은 필수 입력 요소입니다.",
      },
      aggrement : {
        required:  "이용약관에 동의해주세요.",
      },
	
    },

    errorPlacement:function(error,element){
   		$(element).closest("form")
                  .find("small[id='"+ element.attr('id') +"']")
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
  "아이디는 영문자,숫자의 조합으로 6~12자리로 만들어야 합니다"
);

$.validator.addMethod(
  "validPwd",
  function (data) {
    const regPwd =
      /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,15}$/;
    return regPwd.test(data);
  },
  "비밀번호는 영문자,숫자,특수문자의 조합으로 8~15자리로 만들어야 합니다"
);

$.validator.addMethod(
  "validPhone",
  function (data) {
    const regPhone =
      /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
    return regPhone.test(data);
  },
  "전화번호는 숫자만 입력 가능합니다."
);

$.validator.addMethod(
  "validName",
  function (data) {
    const regName =
      /^[가-힣a-zA-Z]+$/;
    return regName.test(data);
  },
  "이름은 한글 또는 영문만 가능합니다."
);



 

 


// 주민번호
/**
/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/


      /d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])/;

 */
