<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../includes/header1.jsp" %>
<style>
    .input-form {
      max-width: 680px;
      max-height: 680px;

      margin-top: 80px;
      margin-bottom: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
</style>
<!-- Header-->
<link rel="stylesheet" href="/resources/css/main2.css" />

<section class="py-5" id="testheader">	
	<!-- 비밀번호 찾기 -->
	<div class="container-md px-4 px-lg-3 mt-10">
	 <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
		<h4 align="center"><em>회원 가입시에 입력한 이름과 아이디,</em></h4>
		<h4 align="center"><em> 이메일을 입력해 주세요</em></h4>
		<br />
		<form action="/member/findpwd" method="post" class="form-signin" id="findinfo">
		
			<div class="form-group row justify-content-center">
	          <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
	          <div class="col-sm-6">
	            <input
	              type="text"
	              name="user_id"
	              id="user_id"
	              class="form-control"
	              style="border:solid 1px gray; "
	            />
	            <small id="user_id" class="text-info"></small>
	          </div>
	        </div>
		   
			<div class="form-group row justify-content-center">
	          <label for="name" class="col-sm-2 col-form-label">이름</label>
	          <div class="col-sm-6">
	            <input
	              type="text"
	              name="name"
	              id="name"
	              class="form-control"
	              style="border:solid 1px gray; "
	            />
	            <small id="name" class="text-info"></small>
	          </div>
	        </div>
	        
	        <div class="form-group row justify-content-center">
		    	<label for="email" class='col-sm-2'>이메일</label>
	        	<div class="col-sm-6">
		            <div class="form-group email-form">
						<div class="input-group" >
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
				<div class="col-sm-1">  
					<div class="">
						<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
					</div>
				</div>
				<div class="col-sm-4" style ='padding-top: 0px;' >
					<div class="mail-check-box">
					<input class="form-control mail-check-input" placeholder="인증번호 입력" disabled="disabled" maxlength="6">
					</div>
				</div>
				<div class="col-sm-1" style ='padding-top: 0px;' >
					<span id="mail-check-warn"></span>
				</div>
			</div> <!-- 이메일 끝 -->        
		    
		    <div class="form-group row justify-content-center">
		        <div class="col-sm-2" style="padding-left: 2px; padding-right: 2px;">
					<button class="btn btn-outline-secondary" type="submit" id="find" style="padding-left: 6px; padding-right: 6px;">비밀번호 찾기</button>
		        </div>
		    </div>
		    
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		</form>
	</div>
	</div>
	</div>
</section>

<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/findid.js"></script>
<%@include file = "../includes/footer.jsp" %>