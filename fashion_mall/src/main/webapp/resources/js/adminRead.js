/**
 *  read.jsp 스크립트
 */
$(function(){
	//operForm 가져오기
	let operForm = $("#operForm");
	
	//list버튼 클릭시 /admin/admin_list이동
	$(".btn-info").click(function(){
		
		// operForm bno 태그 제거
		operForm.find("input[name='p_code']").remove();
		// operForm action 수정
		operForm.attr("action","/admin/admin_list");
		// operForm 보내기
		operForm.submit();
	})
	
	//modify 버튼 클릭시 operForm이동
	$(".btn-default").click(function(){
		operForm.attr("action","/admin/admin_modify");
		operForm.submit();
	})
	
	//-------------------------------------------------
	
	//read.jsp(실험)
	//게시물 아래 게시물 리스트에서 다른 게시물로 클릭시
	let readForm = $("#readForm");
	
	$(".move").click(function(e){
		e.preventDefault();
		
		//a가 가지고 있는 href가지고 오기
		let href = $(this).attr('href');
		
		//actionForm안에 bno태그를 추가하기(값을 href가 가지고 있는 값으로)
		//read에서 뒤로가기를 누르면 남아있는 bno를 계속 추가되는 것을 방지하기 위해 구문을 나눔
		if(readForm.find("[name='p_code']").length!=0){			
			readForm.find("[name='p_code']").val(href);
		}else{
			readForm.append("<input type='hidden' name ='p_code' value = '"+href+"'>");		
		}
		
		//actionForm action변경 => /board/read
		readForm.attr("action","/admin/admin_read");
		
		//actionForm 보내기
		readForm.submit();
	})
	//게시물에서 보여주는 리스트에서 다른 게시물로 넘어가는 form

	// ----------------------------------------
	
	//첨부파일 가져오기 - 무조건 실행
	$.getJSON({
		url:'getAttachList',
		data:{
			bno:bno,
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
		}
	})


	//-------------------------------
	//첨부파일 가져오기 - 무조건 실행
	function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $(".uploadResult ul");
		
		let str = "";
		
		$(result).each(function(idx, obj){
			// obj : attachList
			
			if(obj.fileType){ //이미지 파일
			
				//썸네일 이미지 보여주기
				//썸네일 이미지 경로
				let fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
				
				//원본파일 이미지 경로
				let oriPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
				
				// \\를 /로 바꾸어서 저장
				oriPath = oriPath.replace(new RegExp(/\\/g),"/");
				
				//get 방식으로 /display 실행
				//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
				//<a href="javascript:showImage('oriPath')">";
				//실질적으로 보여지는건 image, fileName
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";			
				str += "<img src='/display?fileName="+fileCallPath+"'></a>"; // '/display?fileName="+fileCallPath+"' : return 값이 image 
				str += "<div>"+obj.fileName;
				str += "</div></li>";
				
			}else{ //txt파일
			
				// 다운로드 경로
				let fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str += "<a href='/download?fileName="+fileCallPath+"'>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "<div>"+obj.fileName;
				str += "</div></li>";
				
			}
		});
		console.log("업로드 파일 경로");
		console.log(str);
		uploadResult.append(str);
	}// showUploadFile 종료
	
	
	
	
})









