/**
 * index.js
 */
$(function(){
	
	$(".display-4 em").click(function(){
		$.getJSON({
			url:'getAttachList',
			success:function(data){
				console.log(data);
				showUploadFile(data);
			}
		})
	})
	
	//인기순 리스트 정보를 얻기 위해 실행
	$.getJSON({
		url:'getAttachList',
		success:function(data){
			console.log(data);
			showUploadFile(data);
		}
	})
	
	//최신순 리스트 정보를 얻기 위해 실행
	$.getJSON({
		url:'getAttachList2',
		success:function(data){
			console.log(data);
			showUploadFile2(data);
		}
	})
	
	//인기순 리스트 가져오기 - 무조건 실행
	function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $("#productlist1");
		
		let str = "";
		
		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 3개까지만 보여주게끔 설정
			if (idx == 3){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			//get 방식으로 /display 실행
			//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
			//<a href="javascript:showImage('oriPath')">";
			//실질적으로 보여지는건 image, fileName
			str += "<div class='col-4 col-12-medium stretchRight'>";
			str += "<div class='card' style='width: 25rem;'>";
			str += "<a href='board/productDetail?bno="+obj.bno+"'>";
			str += "<img src='/displayindex?fileName="+fileCallPath+"' class='card-img-top' width='370' height='350'></a>"; // '/display?fileName="+fileCallPath+"' : return 값이 image 
			str += "<div class='card-body'>";		
			str += "<h4 class='card-title'>"+"Product Name : "+obj.p_name+"</h4>";
			str += "<h4 class='card-title'>"+"Product Type : "+obj.p_type+"</h4>";
			str += "<p class='cart-text'>"+obj.p_content+"</p>";
			str += "</div></div></div>";
				
			
		});
		console.log("업로드 파일 경로");
		console.log(str);
		$("#productlist1 .col-4").remove();
		uploadResult.append(str);
	}// showUploadFile 종료
	
	//최신순 리스트 가져오기 - 무조건 실행
	function showUploadFile2(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $(".reel");
		
		let str = "";
		
		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 3개까지만 보여주게끔 설정
			if (idx == 9){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			//get 방식으로 /display 실행
			//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
			//<a href="javascript:showImage('oriPath')">";
			//실질적으로 보여지는건 image, fileName	
			str += "<article class='tossing' style='padding-bottom:0px; border:solid 1px gray;'>";
			str += "<a href='board/productDetail?bno="+obj.bno+"'>";
			str += "<img src='/displayindex?fileName="+fileCallPath+"' width='320' height='270' alt=''></a>";
			str += "<header>";
			str += "<h3><a href='#'>"+obj.p_name+"</a></h3>";
			str += "</header>";
			str += "<p>"+obj.p_content+"</p>"
			str += "</article>";
			
		});
		console.log("업로드 파일 경로");
		console.log(str);
		uploadResult.append(str);
	}// showUploadFile2 종료
	
	//TOP버튼 클릭시 TOP중에 인기상품 3가지 추출
	$("#top").click(function(){
		
		$.getJSON({
		url:'getTopList',
		data:{
			p_type:'top'
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
			}
		})
		
		//인기순 리스트 가져오기 - 무조건 실행
		function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $("#productlist1");
		
		let str = "";	
		
		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 3개까지만 보여주게끔 설정
			if (idx == 3){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
		
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			//get 방식으로 /display 실행
			//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
			//<a href="javascript:showImage('oriPath')">";
			//실질적으로 보여지는건 image, fileName
			str += "<div class='col-4 col-12-medium pullDown'>";
			str += "<div class='card' style='width: 25rem;'>";
			str += "<a href='board/productDetail?bno="+obj.bno+"'>";
			str += "<img src='/displayindex?fileName="+fileCallPath+"' class='card-img-top' width='370' height='350'></a>"; // '/display?fileName="+fileCallPath+"' : return 값이 image 
			str += "<div class='card-body'>";		
			str += "<h4 class='card-title'>"+"Product Name : "+obj.p_name+"</h4>";
			str += "<h4 class='card-title'>"+"Product Type : "+obj.p_type+"</h4>";
			str += "<p class='cart-text'>"+obj.p_content+"</p>";
			str += "</div></div></div>";
				
			
			});
			console.log("업로드 파일 경로");
			console.log(str);
			$("#productlist1 .col-4").remove();
			uploadResult.append(str);
		}// showUploadFile 종료
	})//Top 버튼 클릭 시
	
	
	//Bottom버튼 클릭시 TOP중에 인기상품 3가지 추출
	$("#bottom").click(function(){
		
		$.getJSON({
		url:'getTopList',
		data:{
			p_type:'pants'
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
			}
		})
		
		//인기순 리스트 가져오기 - 무조건 실행
		function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $("#productlist1");
		
		let str = "";	
		
		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 3개까지만 보여주게끔 설정
			if (idx == 3){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			//get 방식으로 /display 실행
			//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
			//<a href="javascript:showImage('oriPath')">";
			//실질적으로 보여지는건 image, fileName
			str += "<div class='col-4 col-12-medium pullUp'>";
			str += "<div class='card' style='width: 25rem;'>";
			str += "<a href='board/productDetail?bno="+obj.bno+"'>";
			str += "<img src='/displayindex?fileName="+fileCallPath+"' class='card-img-top' width='370' height='350'></a>"; // '/display?fileName="+fileCallPath+"' : return 값이 image 
			str += "<div class='card-body'>";		
			str += "<h4 class='card-title'>"+"Product Name : "+obj.p_name+"</h4>";
			str += "<h4 class='card-title'>"+"Product Type : "+obj.p_type+"</h4>";
			str += "<p class='cart-text'>"+obj.p_content+"</p>";
			str += "</div></div></div>";
				
			
			});
			console.log("업로드 파일 경로");
			console.log(str);
			$("#productlist1 .col-4").remove();
			uploadResult.append(str);
		}// showUploadFile 종료
	})//Bottom 버튼 클릭 시
	
	
	//Shoes버튼 클릭시 TOP중에 인기상품 3가지 추출
	$("#shoes").click(function(){
		
		$.getJSON({
		url:'getTopList',
		data:{
			p_type:'shoes'
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
			}
		})
		
		//인기순 리스트 가져오기 - 무조건 실행
		function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $("#productlist1");
		
		let str = "";	
		
		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 3개까지만 보여주게끔 설정
			if (idx == 3){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			//get 방식으로 /display 실행
			//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
			//<a href="javascript:showImage('oriPath')">";
			//실질적으로 보여지는건 image, fileName
			str += "<div class='col-4 col-12-medium pullDown'>";
			str += "<div class='card' style='width: 25rem;'>";
			str += "<a href='board/productDetail?bno="+obj.bno+"'>";
			str += "<img src='/displayindex?fileName="+fileCallPath+"' class='card-img-top' width='370' height='350'></a>"; // '/display?fileName="+fileCallPath+"' : return 값이 image 
			str += "<div class='card-body'>";		
			str += "<h4 class='card-title'>"+"Product Name : "+obj.p_name+"</h4>";
			str += "<h4 class='card-title'>"+"Product Type : "+obj.p_type+"</h4>";
			str += "<p class='cart-text'>"+obj.p_content+"</p>";
			str += "</div></div></div>";
				
			
			});
			console.log("업로드 파일 경로");
			console.log(str);
			$("#productlist1 .col-4").remove();
			uploadResult.append(str);
		}// showUploadFile 종료
	})//Shoes 버튼 클릭 시
	
	//outer버튼 클릭시 TOP중에 인기상품 3가지 추출
	$("#outer").click(function(){
		
		$.getJSON({
		url:'getTopList',
		data:{
			p_type:'outer'
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
			}
		})
		
		//인기순 리스트 가져오기 - 무조건 실행
		function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $("#productlist1");
		
		let str = "";	
		
		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 3개까지만 보여주게끔 설정
			if (idx == 3){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			//get 방식으로 /display 실행
			//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
			//<a href="javascript:showImage('oriPath')">";
			//실질적으로 보여지는건 image, fileName
			str += "<div class='col-4 col-12-medium pullUp'>";
			str += "<div class='card' style='width: 25rem;'>";
			str += "<a href='board/productDetail?bno="+obj.bno+"'>";
			str += "<img src='/displayindex?fileName="+fileCallPath+"' class='card-img-top' width='370' height='350'></a>"; // '/display?fileName="+fileCallPath+"' : return 값이 image 
			str += "<div class='card-body'>";		
			str += "<h4 class='card-title'>"+"Product Name : "+obj.p_name+"</h4>";
			str += "<h4 class='card-title'>"+"Product Type : "+obj.p_type+"</h4>";
			str += "<p class='cart-text'>"+obj.p_content+"</p>";
			str += "</div></div></div>";
				
			
			});
			console.log("업로드 파일 경로");
			console.log(str);
			$("#productlist1 .col-4").remove();
			uploadResult.append(str);
		}// showUploadFile 종료
	})//outer 버튼 클릭 시
	
	//stuff버튼 클릭시 TOP중에 인기상품 3가지 추출
	$("#stuff").click(function(){
		
		$.getJSON({
		url:'getTopList',
		data:{
			p_type:'stuff'
		},
		success:function(data){
			console.log(data);
			showUploadFile(data);
			}
		})
		
		//인기순 리스트 가져오기 - 무조건 실행
		function showUploadFile(result){
		//업로드 결과 영역 가져오기
		let uploadResult = $("#productlist1");
		
		let str = "";	
		
		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 3개까지만 보여주게끔 설정
			if (idx == 3){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			//get 방식으로 /display 실행
			//직접 경로를 안넣는 이유 : uuid가 랜덤이고 아직 파일에 제대로 생성되지 않았기 때문?!?
			//<a href="javascript:showImage('oriPath')">";
			//실질적으로 보여지는건 image, fileName
			str += "<div class='col-4 col-12-medium stretchRight'>";
			str += "<div class='card' style='width: 25rem;'>";
			str += "<a href='board/productDetail?bno="+obj.bno+"'>";
			str += "<img src='/displayindex?fileName="+fileCallPath+"' class='card-img-top' width='370' height='350'></a>"; // '/display?fileName="+fileCallPath+"' : return 값이 image 
			str += "<div class='card-body'>";		
			str += "<h4 class='card-title'>"+"Product Name : "+obj.p_name+"</h4>";
			str += "<h4 class='card-title'>"+"Product Type : "+obj.p_type+"</h4>";
			str += "<p class='cart-text'>"+obj.p_content+"</p>";
			str += "</div></div></div>";
				
			
			});
			console.log("업로드 파일 경로");
			console.log(str);
			$("#productlist1 .col-4").remove();
			uploadResult.append(str);
		}// showUploadFile 종료
	})//outer 버튼 클릭 시
	
	
	
})




