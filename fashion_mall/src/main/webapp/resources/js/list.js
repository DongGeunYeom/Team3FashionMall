/**
 * list.jsp 스크립트
 */
$(function(){
	// regBtn 클릭시 /board/register 로 움직이기
	$("#regBtn").click(function(){
		location.href = "/board/register";
	})
	
	// 게시물 등록 시 모달 창 띄우기
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result){
		if(result==''||history.state){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("게시물 "+result+" 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show"); // 'hide'
	}//checkModal 종료
	
	// pagination 페이지 이동 버튼 클릭
	let actionForm = $("#actionForm");
	$(".paginate_button a").click(function(e){
		e.preventDefault(); // a 속성 중지
		
		//bno가 있는 경우 제거
		actionForm.find("[name='bno']").remove();
		
		// action 수정
		actionForm.attr("action","/board/list");
		
		// 사용자가 선택한 페이지 번호 가져오기
		let pageNum = $(this).attr('href');
		
		// 가져온 번호를 actionForm 안의 pageNum 값으로 대체
		actionForm.find("[name='pageNum']").val(pageNum);
		
		// actionForm 보내기
		actionForm.submit();
		
	})//paginate_button 종료
	
	// 페이지 목록 개수 클릭
	$(".form-control").change(function(){
		// actionForm 안의 amount 값을 변경하기
		actionForm.find("[name='amount']").val($(this).val());
		
		// actionForm 보내기
		actionForm.submit();
	})
	
	// 타이틀 클릭시
	$(".move").click(function(e){
		e.preventDefault(); // a 태그 기능 중지
		
		// a 가 가지고 있는 href 가져오기
		let href = $(this).attr("href");
		
		// actionForm 안에 bno 태그를 추가하기(값은 href가 가지고 있는 값으로)
		// 내용 보기에 들어갔을 때 사용자가 리스트 버튼이 아닌 뒤로 가기 버튼을 눌러서
		// 목록으로 돌아올 때 bno가 계속 추가되는 것 방지
		if(actionForm.find("[name='bno']").length!=0){
			actionForm.find("[name='bno']").val(href);
		}else{
			actionForm.append("<input type='hidden' name='bno' value='"+href+"'/>");
		}
		// actionForm action 변경(/board/read)
		actionForm.attr("action","/board/read");
		
		// actionForm 보내기
		actionForm.submit();
	})
	
	// 검색버튼 클릭시
	let searchForm = $("#searchForm");
	$(".btn-default").click(function(e){
		// submit 기능 중지
		e.preventDefault();
		
		// type 아무 것도 선택이 되지 않으면 경고 메시지 주기
		if(searchForm.find("select[name='type']").val() == ''){
			alert("검색 조건이 없습니다.");
			return false;
		}
		// keyword 값이 없으면 경고 메시지 주기
		if(searchForm.find("input[name='keyword']").val() == ''){
			alert("검색어가 없습니다.");
			return false;
		}		
		// 검색폼 안의 pageNum은 1로 변경
		searchForm.find("input[name='pageNum']").val("1");
		
		// 검색폼 전송
		searchForm.submit();
	})
	
})