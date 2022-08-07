/**
 *  list.jsp 스크립트
 */
$(function(){
	

	//첨부파일 가져오기 - 무조건 실행
	//bno 안 넘겨주고 그냥 모든 리스트 다 가져오기
	/*$.getJSON({
		url:'getSearchAttachList',
		data:{p_code:pcode},
		success:function(data){
			console.log('성공?'+data);
			showUploadFile(data);
		}
	})*/
	$(function(){
		let p_codeAll=[];
		let pcodeAll = document.querySelectorAll(".pcode");
		console.log("매번 p_code를 보내냐?222222"+pcodeAll);
		
	/*	 pcodeAll.len.forEach(element => {
	           console.log(element);
			p_codeAll=element.value;
	     });*/

		for (var i = 0; i < pcodeAll.length; i++) {
		  p_codeAll[i] = pcodeAll[i].value;  // Calling myNodeList.item(i) isn't necessary in JavaScript
		}
		
		console.log("뭔가 되긴 하는거임?");
		console.log(p_codeAll);
		
		for (var i = 0; i < p_codeAll.length; i++) {
			$.ajax({
					url:'getSearchAttachList',
					dataType:'json',
					data:{p_code:p_codeAll[i]},
					success:function(data){
						console.log('성공?'+p_codeAll[i]);
						console.log(data);
						showUploadFile(data);
					}
				})
		  
		}
		
		
		
	})
	
	
	
/*	$.ajax({
				url:'getSearchAttachList',
				dataType:'json',
				data:{p_code:element},
				success:function(data){
					console.log('성공?');
					console.log(data);
					showUploadFile(data);
				}
			})
				*/
       
	
	
/*	pcodeAll.forEach(element => {
            
			$.ajax({
				url:'getSearchAttachList',
				dataType:'json',
				data:{p_code:element},
				success:function(data){
					console.log('성공?');
					console.log(data);
					showUploadFile(data);
				}
			})
				
        });*/
	
	
	
	// p_code 여기다 받아서 하고  스크립트 자체를 c:if로 돌려서 해주기
	
	//페이지 이동 버튼 클릭 활성화
	let actionForm = $("#actionForm");
	
	$(".paginate_button a").click(function(e){
		//e.preventDefault(); // a 속성 중지
		
		//p_code가 있는 경우 제거
		actionForm.find("[name='p_code']").remove();
		
		//action수정
		actionForm.attr("action","/board/search/productDetail");
		
		//사용자가 선택한 페이지 번호 가져오기
		let pageNum = $(this).attr('href');
		
		//가져온 번호를 actionForm 안의 pageNum값으로 대체
		actionForm.find("[name='pageNum']").val(pageNum);
		//actionForm.find("[name='cate']").val(cate);
		
		//actionForm 보내기
		actionForm.submit();
		
	})//paginate_button 종료

	//페이지 목록 개수가 클릭
	$(".form-control").change(function(){
		
		//actionForm 안의 amount값을 변경하기
		actionForm.find("[name='amount']").val($(this).val());
		//actionForm 보내기
		actionForm.submit();
	})
	
	//타이틀 클릭시
	$(".search33").click(function(e){
		e.preventDefault(); // a태그 기능 중지
		//history.replaceState({}, null, location.pathname);
		//a가 가지고 있는 href가지고 오기
		let href = $(this).attr('href');
		alert(href);
		//actionForm안에 bno태그를 추가하기(값을 href가 가지고 있는 값으로)
		//read에서 뒤로가기를 누르면 남아있는 bno를 계속 추가되는 것을 방지하기 위해 구문을 나눔
		if(actionForm.find("[name='bno']").length!=0){			
			actionForm.find("[name='bno']").val(href);
		}else{
			actionForm.append("<input type='hidden' name ='bno' value = '"+href+"'>");		
		}
		
		//actionForm action변경 => /board/read
		//여기 변경 해줘야됨
//************************************************************* */		
		actionForm.attr("action","/productDetail");
		
		//actionForm 보내기
		actionForm.submit();
		
	})
	
	//검색 버튼 클릭시
	$(".btn-default").click(function(e){
		
		//submit기능 중지
		e.preventDefault();
		
		let searchForm = $("#searchForm");
		
		//type아무것도 선택이 되지 않으면 경고 메세지 주기
		if(searchForm.find("select[name='type']").val() == ''){
			alert("검색 기준을 선택해 주세요");
			return;
		}
		
		//keyword값이 없으면 경고 메세지 주기
		let keyword = $("[name='keyword']").val();
		if(keyword == ''){
			alert("검색 키워드를 입력해 주세요");
			return;
		}
		
		//검색 폼 안에 pageNum은 1로 변경
		//searchForm.find("input[name='pageNum']").val("1");
		$("input[name='pageNum']").val("1");
		
		//검색 폼 전송
		searchForm.submit();
	})
	
	function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $(".productImg");
		
		let str = "";
		
		$(result).each(function(idx,obj){
				var ImgClass="productImg"
			
				//썸네일 이미지 보여주기
				
				//썸네일 이미지 경로 
				console.log("업로드 패스가 어떻게 들어가는데?");
				let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			    //원본파일 이미지 경로
                let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			    oriPath = oriPath.replace(new RegExp(/\\/g),"/");		
				str += "<img src='/displayindex?fileName="+fileCallPath+"' width='230px'>";
			
			ImgClass+=obj.p_code;
			console.log("어떻게불러와지냐아"+ImgClass);
			console.log(str);
			append_to_div(ImgClass,str,obj.p_code);
			
		});		
		
		console.log("업로드 파일 경로");
		console.log(str);
		
		uploadResult.append(str);
	}//showUploadFile 종료
	
	
	//div에다 html 추가하는 함수
	function append_to_div(div_name, data,p_code){
			//document.querySelectorAll(".pcode").innerHTML += data;
            document.getElementById(div_name).innerHTML += data;
        	
	}

              
			
			
			
			
			
			
/*			 <div class="part">
			 <input type="hidden" value="${dto.p_code}" id="pcode"/>
			 
			 <a href="/board/productDetail?bno=${dto.bno}">
			 	<img src="" alt="" />
			 </a>	
			 
			 <div id="productImg"></div>
			 	<div class="text1">${dto.p_name}</div>
			 	<div class="text2">${dto.p_price}</div>
			 	<c:if test="${dto.p_disprice == 0}">
				 	<div class="text3">번호: ${dto.p_code}</div>	 	
			 	</c:if>
			 </div>*/
			
	
	
	
            append_to_div("productImg",str);	
})











