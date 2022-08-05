<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
    
    <!-- 아임포트 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    
    <!-- validation 사용자 작성 코드 삽입-->
    <script src="/resources/js/register1.js"></script>
    <!--     
    <script src="/resources/js/register2.js"></script>
     -->
    
    <!-- 이메일 인증 관련 자바 스크립트 
	<script src="/resources/js/register3.js"></script> -->
	
	
	<script src="/resources/js/register4.js"></script>



<!-- //regist14.jsp 에서 oninput을 버튼에 onclick으로 변경한 jsp 파일 + register5.js 포함 -->
<!-- regist15.jsp 에서 스크립트 조정본 -->
  <style>
    body {
      min-height: 100vh;
  	  background-color: #f5f5f5;
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    
    .id_ok {
    	color : #008000;
    	/* display : none;		색깔 지정해두고 none 으로 숨겨놓는 것. */
    }
    
    .id_already {
    	color : #6A82FB;
    	/* display: none; */
    }
    
    
 	/* 인증 메일 발송 관련 css */
	#mail_check_input_box_false{
	    background-color:#ebebe4;
	}
	 
	#mail_check_input_box_true{
	    background-color:white;
	}
     
    .correct{
    	color : green;
	}
	.incorrect{
	    color : red;
	}
    
  </style>
  
</head>

<body style="background-color: #f5f5f5">
  <div class="container">
  <br>
  <br>
  	<div style='text-align:center'>
	  <a href='/'>
	    <img class="mb-4" src="/resources/images/logo_01.png" alt="" width="200">
	  </a>
	</div>	  
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
 		<form id="regist" method="post" action="/member/regist">
 			
 		  <!-- 이름 -->
          <div class="row">
          	<div class="col-md-3 mb-4">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="name" name="name" required autofocus>
				<small id="name" class="text-info"></small>
			</div>
		  </div>	
 		  
 			<!-- 아이디 -->
          <label for="">아이디</label>
          <div class="row">
          	<div class="col-md-4 mb-4" style="flaot:flex; ">
	        	<input
		          type="text"
		          class="form-control"
		          name="user_id"
		          id="user_id"
		          placeholder="아이디를 입력하세요."
		          autofocus
		        />
	            <small id="userid" class="text-info"></small>
	        </div>
          	<div class="col-md-3 mb-4 ">
	        	<button type="button" name="checkId" id="checkId" class="btn btn-danger btn-md btn-block">중복 확인</button>
	        </div>
	        <!-- 
	        	<span class="id_ok">사용 가능한 아이디입니다.</span>
	        	<span class="id_already">이미 사용되고 있는 아이디입니다.</span>
	         -->	
	        	<span id="id_check"></span>
	        	
	        <!-- 
	        <div class="invalid-feedback">
             	아이디를 입력해주세요.
            </div> -->
          </div> 
          
          
          <!-- 비밀번호 -->
          <div class="row">
	          <div class="col-md-6 mb-3">
	           	<label>비밀번호</label>
	            <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요." value="" required>
	            <small id="password" class="text-info"></small>
			</div>
          </div>
          
          <div class="row">
	          <div class="col-md-6 mb-3">
	            <label for="confirm_password">비밀번호 확인</label>
	            <input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="비밀번호를 다시 입력하세요." value="" required>
	            <small id="confirm_password" class="text-info"></small>
	          </div>
          </div>
          
          <div class="row">
          	<div class="col-md-6 mb-4">
          		<label for="phone_num">전화번호</label>
          		<input type="text" class="form-control" id="phone_num" name="phone_num" placeholder="ex) 010-1234-1234" required/>
          		<small id="phone_num" class="text-info"></small>
          	</div>
          </div>        
          
          
			
			
			<!-- 주민등록번호 -->
<!--         	<label for="">주민등록번호</label>
			<div class="row">
          		<div class="col-md-5 mb-4">
          			<input type="text" class="form-control" id="person_num1" name="person_num1" required />
					<small id="person_num1" class="text-info"></small>
          		</div>
          		<strong style="font-size: 23px">-</strong>
          		<div class="col-md-5 mb-4">
          			<input type="password" class="form-control" id="person_num2" name="person_num2" required />
          			<small id="person_num2" class="text-info"></small>
          		</div>
			</div> -->
			          
			<!-- 이메일 -->
		<!-- <div class="row">
          <div class="col-md-8 mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="email@example.com">
            <small id="email" class="text-info"></small>
          </div>
        </div> -->
        <!--  
		<label for="email">이메일</label>
        <div class="row">
        	<div class="col-md-8 mb-3">
	            <div class="form-group email-form">
					 <div class="input-group">
						<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
						<select class="form-control" name="userEmail2" id="userEmail2" >
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@hanmail.com</option>
						 <option>@yahoo.co.kr</option>
						</select>
						<small id="userEmail1" class="text-info"></small>
					</div> 
				</div>
			</div>
			<div class="col-md-4 mb-3">  
				<div class="input-group-addon">
					<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
				</div>
			</div>
			<div class="col-md-8 mb-3">
					<div class="mail-check-box">
					<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
					<span id="mail-check-warn"></span>
				</div>
			</div>
		-->
		
		
		 <!-- 이메일 -->
        <div class="mail_wrap">
	         <label for="email">이메일</label>
	          <div class="row mail_input_box">
	          	<div class="col-md-4 mb-4">
		        	<input type="email" class="form-control mail_input" id="email" name="email" placeholder="email@example.com">
	            	<small id="email" class="text-info"></small>
		        </div>
	          	<div class="col-md-3 mb-4">
		        	<button type="button" id="mail_check_button" class="btn btn-info btn-md btn-block">인증번호 전송</button>
		        </div>
	          </div> 
	           <div class="row mail_check_wrap">
		          <div class="col-md-4 mb-4 mail_check_input_box" id="mail_check_input_box_false" >
			        <input type="text" class="form-control mail_check_input" name="email_check" id="email_check" disabled="disabled" required>
		            <small id="email_check" class="text-info"></small>
			      </div> 
			      <div class="clearfix"></div>
	              <span id="mail_check_input_box_warn"></span>
			  </div>    
		  </div>  		  
		  
		

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="서울특별시 강남구">
            <small id="address" class="text-info"></small>
          </div>

		

		<div class="row" style="border: solid 1px lightgray;">
		<div class="mb-3">


          
          <!-- 이용약관 -->
        <div class="custom-control">       
			<label for="terms">이용약관</label>
			<div style="height:100px; overflow:auto">
			  <p>
			  개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.

- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
네이버에서 제공하는 위치기반 서비스에 대해서는 '네이버 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.

2. 수집한 개인정보의 이용
네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.

이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
- 부정 가입 및 이용 방지
부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
- QR코드 복구 요청 대응
QR코드 등록 정보:삭제 시점으로부터6개월 보관
- 스마트플레이스 분쟁 조정 및 고객문의 대응
휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
- 네이버 플러스 멤버십 서비스 혜택 중복 제공 방지
암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
- 지식iN eXpert 재가입 신청 및 부정 이용 방지
eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자문서 및 전자거래 기본법
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
- 전자서명 인증 업무
인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관
- 통신비밀보호법
로그인 기록: 3개월

참고로 네이버는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.

4. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
			  </p>
			  
			</div>
		</div>  
		</div>
		</div>
          
          
          <hr class="mb-4">
          
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" name="aggrement" required autofocus>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
            <small id="aggrement" class="text-info"></small>
          </div>
          
          
          <div class="mb-4"></div>
          
          <!-- 
          <button class="btn btn-primary btn-lg btn-block" type="submit" id="regist_submit">가입 완료</button>
           -->
          <button class="btn btn-primary btn-lg btn-block" type="button" id="regist_submit">가입 완료</button>
          
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 KED'LOS</p>
    </footer>
  </div>
<script>
// js에서 post방식을 사용할 때 headerName과 Token을 함께 보내주기 위함
let csrfHeaderName = "${_csrf.headerName}";
let csrfTokenValue = "${_csrf.token}";
</script>   

  
</body>

</html>