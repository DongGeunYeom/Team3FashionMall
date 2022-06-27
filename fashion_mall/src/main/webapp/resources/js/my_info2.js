/**
 *  myinfo_access.jsp에서 사용할 js
 */
$(function(){
	
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
	
	//기본으로 보여지는 비동기식 마이페이지
	$("#list-home-list").click(function(e){
		e.preventDefault();
				
		// 아이디를 가지고 db를 실행한 후 데이터를 받아서 아래 함수 실행
		$.getJSON({
			url:'getMyinfo',
			data :{
				user_id : user_id,
			},
			success:function(data){
				console.log(data);
				showMyinfo(data);
			}
		})			
	})
	
	//내정보 버튼 클릭시 본인의 정보 가져오기(비동기식)
	function showMyinfo(result){
		
		let contents1 = $(".input-form-background");
		
		contents1.remove();
		
		let str2 = "";
		
		$(result).each(function(idx, obj){
			
			if (idx == 1){
				return false;
			}
			
			//데이터는 ajax으로 데이터를 받아와서 넣어주면 될거같음
			str2 += "<div class='input-form-background row'>";
	        str2 += "<div class='input-form col-md-12 mx-auto' style='padding:40px;'>";
			str2 += "<div class='tab-content contents1' id='nav-tabContent'>";
			str2 += "<h3 class='mb-3' align='center'>";
			str2 += "회원 정보";
			str2 += "</h3>";
			str2 += "<form action='/myinfo' method='post' id='info_Form'>";
	 		str2 += "<div class='row'>";
			str2 += "<div class='col-md-3 mb-4'>";
			str2 += "<label style='margin-bottom: 3px;'>"+"이름"+"</label>";
			str2 += "<input type='text' class='form-control' id='name' name='name' value='"+obj.name+"' readonly='readonly' style='border:solid 1px gray;'>";
			str2 += "</div></div>";
	 		str2 += "<label for='' style='margin-bottom: 3px;'>"+"아이디"+"</label>";
	        str2 += "<div class='row'>";
	        str2 += "<div class='col-md-3 mb-4' style='flaot:flex; '>";
		    str2 += "<input type='text' class='form-control' name='user_id' id='user_id' placeholder='' value='"+obj.user_id+"' readonly='readonly' style='border:solid 1px gray;'/>";
		   	str2 += "</div></div>";
	        str2 += "<div class='row'>";
	        str2 += "<div class='col-md-4 mb-4'>";
	        str2 += "<label for='tel' style='margin-bottom: 3px;'>"+"전화번호"+"</label>";
	        str2 += "<input type='text' class='form-control' id='phone_num' name='phone_num' value='"+obj.phone_num+"' readonly='readonly' style='border:solid 1px gray;'/>";
	        str2 += "</div></div>";        
			str2 += "<div class='row'>";
	        str2 += "<div class='col-md-5 mb-4'>";
	        str2 += "<label for='email' style='margin-bottom: 3px;'>"+"이메일"+"</label>";
	        str2 += "<input type='email' class='form-control' id='email' name='email' value='"+obj.email+"' readonly='readonly' style='border:solid 1px gray;'/>";
	        str2 += "</div></div>";
	        str2 += "<div class='row'>";
		    str2 += "<div class='col-md-8 mb-4'>";
		    str2 += "<label for='address' style='margin-bottom: 3px;'>"+"주소"+"</label>";
		    str2 += "<input type='text' class='form-control' id='address' name='address' value='"+obj.address+"' readonly='readonly' style='border:solid 1px gray;'/>";
		 	str2 +=	"</div></div>";
	        str2 += "<div class='row'>";
		    str2 += "<div class='col-md-8 mb-4'>";
		    str2 += "<label for='regdate' style='margin-bottom: 3px;'>"+"회원가입 날짜"+"</label>";
		    str2 += "<input type='text' class='form-control' id='regdate' name='regdate' value='"+obj.reg_date+"' readonly='readonly' style='border:solid 1px gray;'/>";
		    str2 += "</div></div>"; 
	        str2 += "<input type='hidden' name='user_id' value='${MemberDto.user_id}' />";
			str2 += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }' />";
			str2 += "</form>";
			str2 += "<div class='d-flex justify-content-center'>";
			str2 +=	"<button type='button' class='btn btn-danger' id='top' style='margin-top: 10px; width: 150px; height: 50px'>"+"회원 탈퇴"+"</button>";
			str2 += "</div>";
			str2 += "</div></div></div>";
			
		});
		
		$(".col-8").append(str2);
		
	}
	//내 정보 새로 비동기식으로 보여주기
	
	//인풋 폼 영역 가져오기
	let myinfo = $(".col-8");
	
	//영역에 있는 중간에 있는 회원탈퇴 버튼 클릭 시
	myinfo.on("click",".input-form-background .input-form .d-flex .btn-danger",function(e){
		e.preventDefault();
		
		if(!confirm("정말 탈퇴하시겠습니까?")){
			return false;
		}

		let contents1 = $(".input-form-background");
		
		contents1.remove();

		let str2 = "";
		
		str2 += "<div class='input-form-background row'>";
	    str2 += "<div class='input-form col-md-12 mx-auto' style='padding:40px;'>";
		str2 += "<div class='tab-content contents1' id='nav-tabContent'>";
		str2 += "<h3 class='mb-3' align='center'>";
		str2 += "회원 탈퇴";
		str2 += "</h3>";
		str2 += "<h5 align='center' style='margin-bottom:20px; border-bottom: 20px;'><small style='font-size:15px;'>"+"회원가입시 입력한 아이디와 비밀번호를 입력해 주세요."+"</small></h5>";
		str2 += "<form action='' method='post' id='find'>";
		str2 += "<div class='form-group row justify-content-center'>";
	    str2 += "<label for='user_id' class='col-sm-3 col-form-label'>"+"아이디"+"</label>";
	    str2 += "<div class='col-sm-6'>";
	    str2 += "<input type='text' name='user_id' id='user_id' class='form-control' placeholder='아이디를 입력하세요' style='border:solid 1px gray;'/>";
		str2 += "<small id='user_id' class='text-info'></small>";
	    str2 += "</div></div>"; 
		str2 += "<div class='form-group row justify-content-center'>";
	    str2 += "<label for='password' class='col-sm-3 col-form-label'>"+"비밀번호"+"</label>";
	    str2 += "<div class='col-sm-6'>";
	    str2 += "<input type='password' name='password' id='password' class='form-control' placeholder='비밀번호를 입력하세요' style='border:solid 1px gray;'/>";
	    str2 += "<small id='password' class='text-info'></small>";
	    str2 += "</div></div>";     
		str2 += "<div class='form-group row justify-content-center'>";
		str2 += "<div class='col-sm-3'>";
		str2 += "<button class='btn btn-outline-danger' type='submit' style='margin-right:15px;'>"+"회원 탈퇴"+"</button>";
		str2 += "<button class='btn btn-outline-secondary' type='reset' style='margin-left:15px;'>"+"취소"+"</button>";
		str2 += "</div></div>";
		str2 += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }' />";
		str2 += "</form></div></div></div>";
		
		$(".col-8").append(str2);
	})// 회원탈퇴 폼 보여주기
	
	// 아이디와 비밀번호를 받고 회원탈퇴 클릭시
	myinfo.on("click",".input-form-background .input-form #find .form-group .col-sm-3 .btn-outline-danger",function(e){
		e.preventDefault();
		
		let user_id = $(".col-8 .input-form-background .input-form #find .form-group #user_id").val();
		console.log(user_id);
		let password = $(".col-8 .input-form-background .input-form #find .form-group #password").val();
		console.log(password);
		
		$.getJSON({
			url:'deleteMyinfo',
			data :{
				user_id : user_id,
				password : password,
			},
			success:function(data){
				console.log(data);
				if(data){
					showIndex();
				}else{
					//아이디는 맞지만 비밀번호가 다를경우
					alert("아이디와 비밀번호가 다릅니다.");
				}
			},
			error : function(){
				alert("아이디와 비밀번호가 다릅니다.");
			}
		})
	
	})// 진짜 회원 탈퇴
	
	//회원탈퇴 완료 메세지
	function showIndex(){
		alert("회원 탈퇴가 완료되었습니다.");
		
		location.href="/index";
	}//회원탈퇴 완료 메세지
		
	//지금 비밀번호 정보 수정화면 보여주기
	$("#list-profile-list").click(function(e){
		e.preventDefault();
		
		let contents1 = $(".input-form-background");
		
		contents1.remove();
		
		let str2 = "";
		
		str2 += "<div class='input-form-background row'>";
        str2 += "<div class='input-form col-md-12 mx-auto' style='padding:40px;'>";
		str2 += "<div class='tab-content contents1' id='nav-tabContent'>";
		str2 += "<h3 align='center' style='margin :20px;'><em>"+"비밀번호를 입력해 주세요"+"</em></h3>";
		str2 += "<div class='d-flex justify-content-center'>";
		str2 += "<form class='form-inline' method='post' action='' id='readForm' >";
	    str2 += "<div class='form-group'>";
	    str2 += "<input type='password' name='password' id='inputPassword6' class='form-control mx-sm-3' aria-describedby='passwordHelpInline' style='border:solid 1px gray;'/>";
	    str2 += "<input type='hidden' name='user_id' value='${user_id}'/>";
	    str2 += "<input type='hidden' name='${_csrf.parameterName' value='${_csrf.token }' />";
		str2 +=	"<button type='submit' id='my_info' class='btn btn-outline-dark'>"+"확인"+"</button>";
	    str2 += "</div></form></div>";
		str2 += "</div></div></div>";
		
		$(".col-8").append(str2);

	})//비밀번호 확인 하는창 보여주기

	//회원정보 수정을 위해 비밀번호 확인하는 창
	myinfo.on("click",".input-form-background .input-form .d-flex #readForm .form-group #my_info",function(e){
		e.preventDefault();
		
		let password = $(".input-form-background .input-form .d-flex #readForm .form-group .mx-sm-3").val();
		console.log(password);
		
		$.getJSON({
			url:'pwdmodifyTest',
			data :{
				password : password,
			},
			success:function(data){
				console.log(data);
				if(data){
					showModify();
				}else{
					//아이디는 맞지만 비밀번호가 다를경우
					alert("비밀번호가 맞지 않습니다.");
				}
			},
			error : function(){
				alert("비밀번호가 맞지 않습니다.");
			}
		})
	})// 회원 정보 수정을 위해 비밀번호를 확인하는 창
	
	//비밀번호가 맞다면 수정창으로 
	function showModify(){
		
		let contents1 = $(".input-form-background");
		
		contents1.remove();
		
		let str2 = "";
		
		str2 += "<div class='input-form-background row'>";
		str2 += "<div class='input-form col-md-12 mx-auto' style='padding:40px;'>";
		str2 += "<form action='' method='post' class='form-signin' id='find'>";
		str2 += "<div class='form-group row justify-content-center'>";
	    str2 += "<label for='password' class='col-sm-3 col-form-label'>"+"새로운 비밀번호"+"</label>";
	    str2 += "<div class='col-sm-6'>";
	    str2 += "<input type='password' name='password' id='password' class='form-control' placeholder='비밀번호를 입력하세요' style='border:solid 1px gray;'/>";
	    str2 += "<small id='password' class='text-info'></small>";
	    str2 += "</div></div>";
		str2 += "<div class='form-group row justify-content-center'>";
	    str2 += "<label for='confirm_password' class='col-sm-3 col-form-label'>"+"확인 비밀번호"+"</label>";
	    str2 += "<div class='col-sm-6'>";
        str2 += "<input type='password' name='confirm_password' id='confirm_password' class='form-control' placeholder='비밀번호를 입력하세요' style='border:solid 1px gray;'/>";
		str2 += "<small id='confirm_password' class='text-info'></small>";
        str2 += "</div></div>";           
		str2 += "<div class='form-group row justify-content-center'>";
		str2 += "<div class='col-sm-3'>";
		str2 += "<button class='btn btn-outline-secondary' type='submit' id='findpwd'>"+"비밀번호 수정"+"</button>";
		str2 += "</div></div>";
		str2 += "<input type='hidden' name='user_id' id='user_id' value='${user_id}'/>";
		str2 += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }' />";
		str2 += "</form></div></div>";
		
		$(".col-8").append(str2);
		
	}//비밀번호가 맞다면 수정창으로
	
	//비밀번호 수정
    myinfo.on("click",".input-form-background .input-form #find .form-group .col-sm-3 #findpwd",function(e){
		e.preventDefault();
		
		let password = $(".input-form-background .input-form #find .form-group .col-sm-6 #password").val();
		console.log(password);
		
		let c_password = $(".input-form-background .input-form #find .form-group .col-sm-6 #confirm_password").val();
		console.log(c_password);

		if (password == c_password){
			$.getJSON({
				url:'myInfoPwdModify',
				data :{
					password : password,
				},
				success:function(data){
					console.log(data);
					//비밀번호 수정이 완료되면 다시 내 비밀번호 확인창으로
					alert("비밀번호 수정이 완료되었습니다.");
					pwdmodifyTest();
				}
			})
		}else{
			alert("비밀번호와 확인 비밀번호가 맞지 않습니다.");
		}
		

	})// 회원 정보 수정에서 비밀번호 수정
	
	//다시 비밀번호창 보여주기 함수
	function pwdmodifyTest(){
		
		let contents1 = $(".input-form-background");
		
		contents1.remove();
		
		let str2 = "";
		
		str2 += "<div class='input-form-background row'>";
        str2 += "<div class='input-form col-md-12 mx-auto' style='padding:40px;'>";
		str2 += "<div class='tab-content contents1' id='nav-tabContent'>";
		str2 += "<h3 align='center' style='margin :2px;'><em>"+"비밀번호를 입력해 주세요"+"</em></h3>";
		str2 += "<div class='d-flex justify-content-center'>";
		str2 += "<form class='form-inline' method='post' action='' id='readForm' >";
	    str2 += "<div class='form-group'>";
	    str2 += "<input type='password' name='password' id='inputPassword6' class='form-control mx-sm-3' aria-describedby='passwordHelpInline' style='border:solid 1px gray;'/>";
	    str2 += "<input type='hidden' name='user_id' value='${user_id}'/>";
	    str2 += "<input type='hidden' name='${_csrf.parameterName' value='${_csrf.token }' />";
		str2 +=	"<button type='submit' id='my_info' class='btn btn-outline-dark'>"+"확인"+"</button>";
	    str2 += "</div></form></div>";
		str2 += "</div></div></div>";
		
		$(".col-8").append(str2);
		
	}//비밀번호 수정이 완료되면 다시 비밀번호를 테스트하는 창 보여주기
	
	//최근 주문 리스트
	$("#list-messages-list").click(function(e){
		e.preventDefault();
				
		//일단은 인기 리스트 가져오기(나중에 주문리스트로 바꿔줘야함) -> user_id(principal.getName())로 가져오기
		$.getJSON({
			url:'/order/myorderList',
			data:{
				user_id : user_id
			},
			success:function(data){
				console.log(data);
				if (data == ""){
					showOrderList();
				}else{
					
					showOrderFile(data);
				}
			}
		})
			
	})// 일단은 주문 리스트 보여주기
	
	//주문 리스트가 없을때 그냥 화면만 보여주기
	function showOrderList(){
		
		let contents1 = $(".input-form-background");
		
		contents1.remove();
		
		let str2 = "";
		
		str2 += "<div class='input-form-background row'>";
   		str2 += "<div class='input-form col-md-12 mx-auto'style='padding:40px;'>";
		str2 += "<div class='tab-content contents1' id='nav-tabContent'>";
		str2 += "<div class='justify-content-center'>";
		str2 += "<ul class='list-unstyled'>";
		str2 += "<h1 align='center' style='font-size: 25px;'>"+"주문 리스트"+"</h1>";
		str2 += "<h5 align='center' style='margin-bottom:20px; border-bottom: 20px;'><small style='font-size:15px;'>"+"최근 7일이내에 주문한 상품 리스트입니다."+"</small></h5>";
	
		$(".col-8").append(str2);
	}
	
	//오더 목록으로 보여주기(주문 리스트는 일주일 이내의 것만 가져옴)
	function showOrderFile(result){
		
		let contents1 = $(".input-form-background");
		
		contents1.remove();
		
		let str2 = "";
		
		str2 += "<div class='input-form-background row'>";
   		str2 += "<div class='input-form col-md-12 mx-auto' style='padding:40px;'>";
		str2 += "<div class='tab-content contents1' id='nav-tabContent'>";
		str2 += "<div class='justify-content-center'>";
		str2 += "<ul class='list-unstyled'>";
		str2 += "<h1 align='center' style='font-size: 25px;'>"+"주문 리스트"+"</h1>";
		str2 += "<h5 align='center' style='margin-bottom:20px; border-bottom: 20px;'><small style='font-size:15px;'>"+"최근 7일이내에 주문한 상품 리스트입니다."+"</small></h5>";

		$(result).each(function(idx, obj){
			// obj : attachList
			// 이미지 경로
			
			// 일단은 3개까지만 보여주게끔 설정
			if (idx == 5){
				return false
			}
			
			let fileCallPath =  encodeURIComponent(obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename);			
			
			//원본파일 이미지 경로
            let oriPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename;
			
			//                             └\\를 /로 바꾸어서 저장
			oriPath = oriPath.replace(new RegExp(/\\/g),"/");
			
			str2 += "<li class='media' style='border:solid 2px lightgray; margin-bottom: 5px; padding: 7px;'>";
			str2 += "<a href=\"javascript:showImage(\'"+oriPath+"\')\" >";
			str2 += "<img src='/display?fileName="+fileCallPath+"' class='mr-3' alt='...' style='width: 80px; height: 80px;'></a>";
			str2 += "<div class='media-body'>";
			str2 += "<h5 class='mt-0 mb-1'>"+"Product Name"+" : "+obj.p_name+"</h5>";
			str2 += "<small style='font-size:19px; color:black;'>"+"Color"+" : "+obj.po_color+",  "+"</small>";
			str2 += "<small style='font-size:19px; color:black;'>"+"Size"+" : "+obj.po_size+",  "+"</small>";
			str2 += "<small style='font-size:19px; color:black;'>"+"Price"+" : "+obj.p_price+",  "+"</small>";
			str2 += "<small style='font-size:19px; color:black;'>"+"Amount"+" : "+obj.p_amount+",  "+"</small>";
			str2 += "<small style='font-size:19px; color:black;'>"+"Order Date"+" : "+obj.oreg_date+"</small>";
			str2 += "</div></li>";			
			str2 += "</ul></div>";
			str2 += "</div></div></div>";
				
			//최초 1회는 인풋폼 안에 넣기
			if(idx == 0){
				$(".col-8").append(str2);
			}else{
			//최초 1회를 제외하고는 인풋폼안에 리스트 아래에다가 넣어주기
				$(".input-form-background .input-form .justify-content-center .list-unstyled").append(str2);
			}
			str2 = "";
		});
	}// showOrderFile 종료
	
	
	
})
