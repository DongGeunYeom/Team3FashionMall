/**
 *  list.jsp 스크립트
 */
$(function(){
	
	//사진 가져오기부터 해보자
	
	
	function searchImage(){
		let searchimg=$("#search-img");
		
	}
	
	
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
})











