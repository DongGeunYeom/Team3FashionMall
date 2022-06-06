/**
 * read.jsp 스크립트
 */
$(function(){
	
	let operForm = $("#operForm");
	
	// list 버튼 클릭시 /board/list 로 이동
	$(".btn-info").click(function(){
		// operForm bno 태그 제거하기
		operForm.find("input[name='bno']").remove();
		
		// operForm action 수정
		operForm.attr("action", "/board/list");
		
		// operForm 보내기
		operForm.submit();
	})
		
	// modify 버튼 클릭시 operForm 이동
	$(".btn-default").click(function(){
		operForm.submit();
	})
	
	// 첨부파일 스크립트 -----------------------------------------
	
	// 첨부파일 가져오기 - 무조건 실행
	$.getJSON({
		url:'getAttachList',
		data:{
			bno:bno
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
		}	
	}) // 가져오기 종료
	
	function showUploadFile(result){
		// 업로드 결과 영역 가져오기
		let uploadResult = $(".uploadResult ul");
		
		let str ="";
		
		$(result).each(function(idx, obj){
			
			if(obj.fileType){ // 이미지 파일
				// 썸네일 이미지 보여주기
				// 썸네일 이미지 경로
				let fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
				// 원본파일 이미지 경로
				let oriPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
				oriPath = oriPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";
				str += "<img src ='/display?fileName="+fileCallPath+"'></a>";
				str += "<div>"+obj.fileName;
				str += "</div></li>";
			}else{ // txt 파일
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
	} // showUploadFile 종료
})