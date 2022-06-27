/**
 * admin regist 유효성 검사
 */
$(function() {
	$("#regist").validate({
		rules: {
			p_name:{
				required: true,
			},
			p_type:{
				required: true,
			},
			p_price : {
				required: true,
				validPrice : true,
			},
			p_content : {
				required: true,
			},
			
		},	// rules 끝
		
		// 규칙이 맞지 않을 경우 보여줄 메세지 작성
		messages : {
			p_name:{
				required: "상품 이름은 필수 입력 요소입니다.",
			},
			p_type:{
				required: "카테고리는 필수 입력 요소입니다.",
			},
			p_price : {
				required: "상품 가격은 필수 입력 요소입니다.",
			},
			p_content : {
				required: "상품 설명은 필수 입력 요소입니다.",
			},
			
		},	// messages 끝
		
    errorPlacement:function(error,element){
   		$(element).closest("form")
                  .find("small[id='"+ element.attr('id') +"']")
                  .append(error);	
		}
	});
});


$.validator.addMethod(
	"validPrice",
	function (data) {
		const regPrice = /^[0-9]+$/;
		return regPrice.test(data);
	},
	"상품 가격은 숫자만 입력 가능합니다."
);


$.validator.addMethod(
	"validAmount",
	function (data) {
		const regAmount = /^[0-9]+$/;
		return regAmount.test(data);
	},
	"상품 가격은 숫자만 입력 가능합니다."
);



