/**
 *  read2.jsp 파일 업로드 스크립트
 */
$(function(){
	$(":file").change(function(){
		console.log("ajax 파일 업로드 호출");
		
		// 폼 객체 생성
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
			url:'/uploadAjax2',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			processData:false,
			contentType:false,
			data:formData,
			dataType:'json',
			success:function(result){
				console.log(result);
				$(":file").val("");
				showUploadFile(result);
			}
			
		})
	}) // uploadBtn 종료
		
	//이미지 종료 메소드
	$(".bigPictureWrapper").on("click",function(){
		$(".bigPicture").animate({width:'0',height:'0'},1000);
		
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
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
