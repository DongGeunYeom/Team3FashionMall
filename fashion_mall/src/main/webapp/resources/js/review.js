/**
 *  read2.jsp review 부분 
 */ 
 
// ajax 모듈
let reviewService = (function(){

	function reviewRegister(param, callback){
		console.log('reviewRegister 메소드 실행');
		$.ajax({
			url:'/board/reviewRegister',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(param),
			success:function(result){
				if(callback){
					callback(result);
				} 
			}
		})
	}; // reviewRegister 종료
	
	function reviewAttachRegister(param, callback){
		console.log('reviewAttachRegister메소드 실행');
		$.ajax({
			url:'/board/reviewAttachRegister',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(param),
			success:function(result){	
				if(callback){
					callback(result);
				}
			}
		})	
	}; //reviewAttachRegister 종료
	
	function reviewGetList(param, callback){
		let bno = $('#bno').val();
		let rvpage = param.rvpage;
		console.log('reviewGetList 메소드 실행 '+bno+" "+rvpage);
		$.getJSON({
			url:'/board/rvpages/'+bno+'/'+rvpage,
			success:function(result){
				if(callback){
					console.log(result)
					callback(result.rvCnt, result.reviewlist);
				}
			}
		})
	};// reviewGetList 종료
	
	function reviewGetDetail(rno, callback){
		console.log('reviewGetDetail 메소드 실행');
		$.getJSON({
			url:'/board/'+rno,
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	}; // reviewGetDetail 종료
	
	function getAttachList(rno, callback){
		console.log('getAttachList 메소드 실행');
		$.getJSON({
			url:'getAttachList',
			data:{
				rno:rno
			},
			success:function(result){
				if(callback){
					callback(result);
				}
			}	
		}) // 가져오기 종료
	};
	
	function reviewModify(param, callback){
		console.log('reviewModify 메소드 실행');
		$.ajax({
			url:'/board/reviewModify/'+param.rno,
			type:'put',
			contentType:'application/json',
			data:JSON.stringify(param),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	}; // reviewModify 종료
	
	function reviewDelete(param ,callback){
		console.log('reviewDelete 메소드 실행');
		$.ajax({
			url:'/board/reviewDelete/'+param.rno,
			type:'delete',
			contentType:'application/json',
			data:JSON.stringify(param),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	}; // remove 종료
	
	return {
		reviewRegister:reviewRegister,
		reviewAttachRegister:reviewAttachRegister,
		reviewGetList:reviewGetList,
		reviewGetDetail:reviewGetDetail,
		getAttachList:getAttachList,
		reviewModify:reviewModify,
		reviewDelete:reviewDelete,
	};
	
})();

function fn_Review(){
	if(user_id.value == ""){
		alert('로그인 한 후에 이용 가능합니다.');
		return;
	};
	
	$('#rno').val("");
	$("#r_title").val("");
	$("#r_content").val("");
	$("#ruser_id").val(user_id);
	$('.uploadResult ul li').remove();

	$("#addAttach").show();
	$("#modalReviewInsertBtn").show();
	$('#modalReviewConfirmBtn').hide();
	$("#modalReviewModifyBtn").hide();
	$("#modalReviewDeleteBtn").hide();
	$(".review_fn").hide();	

	$("#r_title").attr("readonly", false);
	$("#r_content").attr("readonly", false);
	$("#reviewModal").fadeIn();
};

// 업로드 결과 영역 가져오기
function showUploadFile(result){
	let uploadResult = $(".uploadResult ul");
		
	let str ="";
		
	$(result).each(function(idx, obj){
		// 썸네일 이미지 보여주기
		// 썸네일 이미지 경로
		let fileCallPath = encodeURIComponent(obj.r_uploadpath+"\\s_"+obj.r_uuid+"_"+obj.r_filename);
		// 원본파일 이미지 경로
		let oriPath = obj.r_uploadpath+"\\"+obj.r_uuid+"_"+obj.r_filename;
		oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
		str += "<li data-path='"+obj.r_uploadpath+"' data-uuid='"+obj.r_uuid+"' data-filename='"+obj.r_filename+"'>";
		str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";
		str += "<img src ='/display?fileName="+fileCallPath+"'></a>";
		str += "<div class='hideimages' >"+obj.r_filename;
		str += " <button type='button' class='btn btn-warning btn-circle' data-file='"+fileCallPath+"' data-type='image'>";
		str += "<i class='fa fa-times'></i></button>";
		str += "</div></li>";
	});
	
	console.log("업로드 파일 경로");
	console.log(str);
	uploadResult.append(str);
}; // showUploadFile 종료

function showLargeUploadFile(result){
	let uploadResult = $(".review_fn ul");
		
	let str ="";
		
	$(result).each(function(idx, obj){
		// 썸네일 이미지 보여주기
		// 썸네일 이미지 경로
		let fileCallPath = encodeURIComponent(obj.r_uploadpath+"\\s_"+obj.r_uuid+"_"+obj.r_filename);
		// 원본파일 이미지 경로
		let oriPath = obj.r_uploadpath+"\\"+obj.r_uuid+"_"+obj.r_filename;
		oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
		str += "<li data-path='"+obj.r_uploadpath+"' data-uuid='"+obj.r_uuid+"' data-filename='"+obj.r_filename+"'>";
		str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";
		str += "<img src='/display?fileName="+fileCallPath+"'></a>";
		str += "<div class='hideimages' style='display:none;'>"+obj.r_filename;
		str += " <button type='button' class='btn btn-warning btn-circle' data-file='"+fileCallPath+"' data-type='image'>";
		str += "<i class='fa fa-times'></i></button>";
		str += "</div></li>";
	});
	uploadResult.append(str);
}; // showLargeUploadFile 종료

// 이미지 보여주기
function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%',height:'100%'},1000);
};

// 페이지 로딩 시 스크립트 
$(function(){
	
	// 토크나이저
	var token = $("input[name='_csrf']").val();
    var header = "X-CSRF-TOKEN";
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
	
	// 상품문의 페이지 영역
	let pageFooter2 = $("#reviewPage");
	
	// 현재 페이지 정보
	let rvpageNum = 1;
	
	// 댓글 전체 가져오기 호출
	reviewShowList(1);
    
    function reviewShowList(rvpage){
	
		// page : page||1 => page 변수값이 들어오면 사용하고 안들어오면 1
		reviewService.reviewGetList({bno:bno, rvpage:rvpage||1},function(total,list){
			if(list){
				let body2 = $("#reviewList");
				let str = "";
				body2.empty();
				
				// 새 리뷰글 등록 시
				if(rvpage == -1){
					console.log("새 리뷰글 등록 확인"+rvpage);
					rvpageNum = Math.ceil(total/10.0);
					reviewShowList(rvpageNum);
					return;
				}
			
				$(list).each(function(idx, item){
					let date = qnaService.displayTime(item.reg_date);
					str += " <tr data-rno='"+item.rno+"' > "
						+  " <td class='td1'>"+item.rno+"</td> "
						+  " <td class='td2'>"+item.r_title+"</td> "
						+  " <td class='td1'>"+item.user_id+"</td> "
						+  " <td class='td1'>"+date+"</td> "
						+  " </tr> "
				})
				body2.append(str);		
				showReviewPage(total);	
			} else {
				var str = "<tr>" + "<td colspan='5' align='center'>조회된 결과가 없습니다.</td>"
				+ "</tr>";
				body2.append(str);
			}
		});		
	}; // reviewShowList 종료
	
	// 문의글 페이지 나누기
	// 제일 처음 쓴 문의글이 먼저 보이는 상황
	function showReviewPage(total){
		let endPage = Math.ceil(rvpageNum/10.0)*10;
		let startPage = endPage - 9;
		let prev = (startPage != 1);
		let next = false;
		
		if(endPage * 10 >= total) {
			endPage = Math.ceil(total/10.0);
		}
		
		if(endPage * 10 < total){
			next = true;
		}
		
		let str = '<ul class="pagination pull-right">';
		if(prev){
			str += '<li class="paginate_button previous">';	
			str += '<a href="'+(startPage-1)+'">Previous</a></li>';
		}
		
		for(let i=startPage; i<=endPage; i++){
			let active = rvpageNum==i? 'active':'';
			str += '<li class="paginate_button '+active+'">';
			str += '<a href="'+i+'       ">'+i+'</a></li>';
			
		}
		if(next){
			str += '<li class="paginate_button next">';
			str += '<a href="'+(endPage+1)+'">Next</a></li>';
		}
		str += '</ul>';
		
		pageFooter2.html(str);
	} // 문의글 페이지 나누기 종료
	
	// 댓글 페이지 나누기 클릭 시
	pageFooter2.on("click","li a",function(e){
		e.preventDefault();
		
		rvpageNum = $(this).attr("href");
		reviewShowList(rvpageNum);
	}) // 페이지 나누기 종료 
	
	// 리뷰 페이지 rno 넘기기
	$("#reviewList").on("click","tr",function(){
		let rno = $(this).data("rno");
		console.log("rno 확인 "+rno);
		$(".hideimages").show();
		$("#rno").val(rno);
		$(".review_fn ul li").remove();
		$("#modalReviewInsertBtn").hide();
		$("#modalReviewModifyBtn").show();
		$("#modalReviewDeleteBtn").show();
		
		reviewService.reviewGetDetail(rno, function(data){
			if(data){
				reviewService.getAttachList(data.rno, function(result){
					console.log("첨부파일 객체 값 추적");
					if(result.length >= 1){
						$('#imagelabel').show();
						showLargeUploadFile(result);
					} else{
						$('#imagelabel').hide();
					}
				});
				console.log(data);
				$("#addAttach").hide();
				$(".review_fn").show();
				$("#r_title").val(data.r_title);
				$("#r_content").val(data.r_content);
				$("#ruser_id").val(user_id);
				$("#r_title").attr("readonly", true);
				$("#r_content").attr("readonly", true);
				$("#reviewModal").fadeIn();
					
			}else{
				alert('리뷰 조회를 실패하였습니다.');
			}	
		})
		 
	}); // rno 넘기고 상품 읽기 끝
	
	// 리뷰 작성 모달
	$("#modalReviewInsertBtn").click(function(){
			
			let bno = $("#bno").val();
			let r_title = $('#r_title').val();
			let r_content = $('#r_content').val();
			
			if(user_id.value == ""){
				alert('로그인 한 후에 이용 가능합니다.');
				return;
			};

			// 첨부파일 배열화
			const attachList = new Array();
			
			// li 태그정보 수집하기
			$(".uploadResult ul li").each(function(idx,obj){
				var jsonObj	= new Object();
				var job = $(obj);
				jsonObj.r_uuid = job.data("uuid");
				jsonObj.r_uploadpath = job.data("path");
				jsonObj.r_filename = job.data("filename");
				jsonObj = JSON.stringify(jsonObj);
				attachList.push(JSON.parse(jsonObj));
			})
	
			let param ={
				bno : bno,
				user_id : user_id,
				r_title : r_title,
				r_content :r_content,
				attachList : attachList
			};

		reviewService.reviewRegister(param, function(result){
			if(result){
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>리뷰 글 등록이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#r_title").val("");
				$("#r_content").val("");
			} else {
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>리뷰 글 등록을 실패하였습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#r_title").val("");
				$("#r_content").val("");
			}
			reviewShowList(1);
		})
		$(".hideimages").hide();
		$("#reviewModal").fadeOut();
	}); // 리뷰 등록 종료
	
	$("#modalReviewDeleteBtn").click(function(){
		let rno = $('#rno').val();
		console.log(user_id);
		let param = {
			rno:rno,
			user_id:user_id,
		};
		
		reviewService.reviewDelete(param, function(result){
			if(result){
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>리뷰 글 삭제가 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#r_title").val("");
				$("#r_content").val("");
			}else{
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>리뷰 글 삭제를 실패하였습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#r_title").val("");
				$("#r_content").val("");
			}
		})	
		$("#reviewModal").fadeOut();
		reviewShowList(1);
	}); // 리뷰 삭제 종료
	
	// 리뷰 수정 누를 시 빈칸 만들기
	$('#modalReviewModifyBtn').click(function(){
		$("#reviewModal").fadeOut();
		$("#reviewModal").fadeIn();
		
		$('#modalReviewModifyBtn').hide();
		
		$("#addAttach").show();
		$('#modalReviewConfirmBtn').show();
		$(".hideimages").show();

		$("#r_title").val("");
		$("#r_content").val("");
		$("#r_title").attr("readonly", false);
		$("#r_content").attr("readonly", false);
	});
	
	$('#modalReviewConfirmBtn').click(function(){
		let rno = $("#rno").val();
		
		// 첨부파일 배열화
		const attachList = new Array();
		// li 태그정보 수집하기
		$(".uploadResult ul li").each(function(idx,obj){
			var jsonObj	= new Object();
			var job = $(obj);
			jsonObj.r_uuid = job.data("uuid");
			jsonObj.r_uploadpath = job.data("path");
			jsonObj.r_filename = job.data("filename");
			jsonObj = JSON.stringify(jsonObj);
			attachList.push(JSON.parse(jsonObj));
		});
		console.log("리뷰 보내기 삽입 전");
		console.log(attachList);
		
		let r_title = $('#r_title').val();
		let r_content = $('#r_content').val();
		console.log("리뷰 글 수정 전 밸류 추적 "+bno+" "+r_content);
		
			if(user_id.value == ""){
				alert('로그인 한 후에 이용 가능합니다.');
				return;
			};
		
		let param ={
			rno : rno,
			user_id : user_id,
			r_title : r_title,
			r_content :r_content,
			attachList : attachList
		};
		
		reviewService.reviewModify(param, function(result){
			if(result){
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>리뷰 글 수정이 완료되었습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#r_title").val("");
				$("#r_content").val("");
			}else{
				$("#chkModal").fadeIn();
				$("#checkmsg2").remove();
				str1 = "<h3 id='checkmsg2'>리뷰 글 수정을 실패하였습니다.</h3>";
				$("#chkModalBody").html(str1);
				$("#r_title").val("");
				$("#r_content").val("");
			}
		})
		$('#modalReviewConfirmBtn').hide();
		$('#modalReviewModifyBtn').show();
		$("#reviewModal").fadeOut();
		reviewShowList(1);
	}); // 리뷰 수정 종료


	$("#modalCancleBtn").click(function(){
		$("#reviewModal").fadeOut();
	}); // 리뷰 모달 종료
	
	// x 버튼 클릭시 첨부 파일 삭제
	$(".uploadResult").on("click","button",function(){
		// button 태그의 data- 속성 가져오기
		let targetFile = $(this).data("file");
		
		// button 태그의 li 태그 가져오기
		let targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/deleteFile2',
			data:{
				fileName:targetFile,
			},
			type:'post',
			success:function(result){
				console.log(result);
				$(":file").val("");
				// li 태그 제거
				targetLi.remove();	
			}
		})
	});	// 삭제 메소드 종료
	
	// x 버튼 클릭시 첨부 파일 삭제2
	$(".review_fn").on("click","button",function(){
		// button 태그의 data- 속성 가져오기
		let targetFile = $(this).data("file");
		
		// button 태그의 li 태그 가져오기
		let targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/deleteFile2',
			data:{
				fileName:targetFile,
			},
			type:'post',
			success:function(result){
				console.log(result);
				$(":file").val("");
				// li 태그 제거
				targetLi.remove();	
			}
		})
	});	// 삭제 메소드 종료
	
})




