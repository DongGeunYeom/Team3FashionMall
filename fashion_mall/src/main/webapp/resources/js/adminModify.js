/**
 * modify.jsp 스크립트
 */
$(function(){
	//operForm 가져오기
	let operForm = $("#operForm");
	console.log(operForm);
	$("#modify").click(function(e){
		e.preventDefault(); //submit 막기
		
		//현재 눌러진 버튼의 data- 값을 가져오기
		let oper = $(this).data("oper");
		/*alert(oper);*/
		if(oper == "modify"){
			
			operForm = $("[role='form']");
			//첨부파일 목록을 가져간다 
			let str = "";
		
		//li 태그 정보 수집하기
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
			
			str += "<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].uploadpath' value='"+job.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].filename' value='"+job.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].filetype' value='"+job.data("type")+"'>";
		})
		
		console.log("form 태그 삽입 전");
		console.log(str);
		
		operForm.append(str);
			
			
		}else if(oper == "remove"){
			operForm.attr('action','/admin/admin_remove');
		}else if(oper == "list"){
			operForm.find("[name='bno']").remove();
			operForm.attr('action','/admin/admin_list');
		}
		
		operForm.submit();
		
	})
	
	
	//첨부파일 -------------------------------------------------------------
	
	//첨부파일 가져오기 - 무조건 실행
/*	$.getJSON({
		url:'getAttachList',
		data:{
			bno:bno
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
		}
	})*/
	
	
	//
	
	// x 버튼 클릭시 화면에서만 삭제
	// 파일 최종삭제는 modify 버튼을 누른뒤에 해야 함
	$(".uploadResult").on("click","button",function(){

		//span 태그가 속해있는 li 태그 가져오기
		let targetLi = $(this).closest("li");
		
		if(confirm('정말 파일을 삭제하시겠습니까?')){
			//li 태그 제거
			targetLi.remove();
		}
		
	})
	
	
	
})