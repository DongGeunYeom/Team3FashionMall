/**
 * product_register.jsp 스크립트 
 */
$(function(){
	
	$(":submit").click(function(e){
		e.preventDefault();
		
		let str = "";
		// li 태그정보 수집하기
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
			
			str += "<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";
		})
		console.log("form 태그 삽입 전");
		console.log(str);
		
		$("form").append(str).submit();
	})
	
	// x 버튼 클릭시 첨부 파일 삭제
	$(".uploadResult").on("click","button",function(){
		// button 태그의 data- 속성 가져오기
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		
		// button 태그의 li 태그 가져오기
		let targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/deleteFile',
			data:{
				fileName:targetFile,
				type:type
			},
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			type:'post',
			success:function(result){
				console.log(result);
				$(":file").val("");
				// li 태그 제거
				targetLi.remove();	
			}
		})
	})	// 삭제 메소드 종료
	
	// 파일 등록 메소드
	$("__").on("click", function(){
		console.log("ajax 파일 업로드 호출");
		
		// 상품 객체 생성
		let formData = new FormData();
		
		// 첨부파일 목록 가져오기
		let inputFile = $("[name='uploadFile']");
		console.log(inputFile);
		
		let files = inputFile[0].files;

		// 폼 객체에 첨부파일들 추가
		for(let i=0;i<files.length;i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile",files[i])
		}
	
		$.ajax({
			url:'/uploadAjax',
			type:'post',
			processData:false,
			contentType:false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:formData,
			dataType:'json',
			success:function(result){
				console.log(result);
				$(":file").val("");
				showUploadFile(result);
			}	
		})
		
	}) // 파일 등록 메소드 종료
	
	
	
	//이미지 종료 메소드
	$("bigPictureWrapper").on("click",function(){
		$("bigPicture").animate({width:'0',height:'0'},1000);
		
		setTimeout(function(){
			$("__").hide();
		},1000);
	}) // 메소드 종료
	
})


// 첨부파일 확장자 및 사이즈 확인
function checkExtension(fileName, fileSize){
	// 확장자 1.jpg
	let regex = new RegExp("(.*?)\.(png||gif||jpg||txt)$");
	// 파일 크기
	let maxSize = 3145728; // 3MB
	
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	
	if(fileSize > maxSize){
		alert("해당 파일은 사이즈를 초과합니다.");
		return false;
	}
	return true;
}

function showUploadFile(result){
	// 업로드 결과 영역 가져오기
	let uploadResult = $("__");
		
	let str ="";
		
	$(result).each(function(idx, obj){
			// 썸네일 이미지 경로
			let fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
			// 원본파일 이미지 경로
			let oriPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
				
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
			str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";
			str += "<img src ='/display?fileName="+fileCallPath+"'></a>";
			str += "<div>"+obj.fileName;
			str += " <button type='button' class='btn btn-warning btn-circle' data-file='"+fileCallPath+"' data-type='image'>";
			str += "<i class='fa fa-times'></i></button>";
			str += "</div></li>";
	})
	console.log("업로드 파일 경로");
	console.log(str);
	uploadResult.append(str);
} // showUploadFile 종료

function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%',height:'100%'},1000);
}
