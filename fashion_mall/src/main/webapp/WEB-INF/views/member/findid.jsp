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
	<div class="container-md px-4 px-lg-3 mt-10">
	 <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
		<h4 align="center"><em>회원 가입시에 입력한 이름과</em></h4>
		<h4 align="center"><em>주민등록번호를 입력해 주세요</em></h4>
		<br />
		
		<form action="" method="post" class="form-signin" id="findid">
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
	        
	        <div class="form-group row justify-content-center" style="margin-right: 0px;">
	          <label for="person_num1" class="col-sm-3 col-form-label" style="padding-right: 10px; padding-left: 10px; font-size: 20px;">주민등록번호</label>
	          <div class="col-sm-3" style="padding-left: 0px;">
	            <input
	              type="text"
	              name="person_num1"
	              id="person_num1"
	              class="form-control"
	              style="border:solid 1px gray; width:140px;"
	            />
	            <small id="person_num1" class="text-info"></small>
	          </div>
	          <label for="" style="padding-right: 0px; padding-left: 0px; margin-right:10px; width: 10px;"><strong style="font-size: 30px">-</strong></label>
	          <div class="col-sm-3" style="padding-left: 0px;">
	            <input
	              type="password"
	              name="person_num2"
	              id="person_num2"
	              class="form-control"
	              style="border:solid 1px gray; width:140px;"
	            />
	            <small id="person_num2" class="text-info"></small>
	          </div>
	        </div>
			
			<div class="form-group row justify-content-center">
		        <div class="col-sm-2" style="padding-left: 3px; padding-right: 3px;">
					<button class="btn btn-outline-secondary" type="submit" id="findid">아이디 찾기</button>
		        </div>
		    </div>
		    
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		    </div>
		</form>
	</div>
</div>
	
	<hr />
	
	<!-- 비밀번호 찾기 -->
	<div class="container-md px-4 px-lg-3 mt-10">
	 <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
		<h4 align="center"><em>회원 가입시에 입력한 이름과 아이디,</em></h4>
		<h4 align="center"><em> 주민등록번호를 입력해 주세요</em></h4>
		<br />
		<form action="/member/findpwd" method="post" class="form-signin" id="findpwd">
		
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
	        
	        <div class="form-group row justify-content-center" style="margin-right: 0px;">
	          <label for="person_num1" class="col-sm-3 col-form-label" style="padding-right: 10px; padding-left: 10px; font-size: 20px;">주민등록번호</label>
	          <div class="col-sm-3" style="padding-left: 0px;">
	            <input
	              type="text"
	              name="person_num1"
	              id="person_num1"
	              class="form-control"
	              style="border:solid 1px gray; width: 140px;" 
	            />
	            <small id="person_num1" class="text-info"></small>
	          </div>
			  <label for="" style="padding-right: 0px; padding-left: 0px; margin-right:10px; width: 10px;"><strong style="font-size: 30px">-</strong></label>
	          <div class="col-sm-3" style="padding-left: 0px;">
	            <input
	              type="password"
	              name="person_num2"
	              id="person_num2"
	              class="form-control"
	              style="border:solid 1px gray; width:140px;"
	            />
	            <small id="person_num2" class="text-info"></small>
	          </div>
	        </div>	        
		    
		    <div class="form-group row justify-content-center">
		        <div class="col-sm-2" style="padding-left: 2px; padding-right: 2px;">
					<button class="btn btn-outline-secondary" type="submit" id="findpwd" style="padding-left: 6px; padding-right: 6px;">비밀번호 찾기</button>
		        </div>
		    </div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		</form>
	</div>
	</div>
	</div>
</section>
<script>
$(function(){
	//controller에서 받아옴
	let check = ${check};
	if(!check){
		alert("입력한 정보가 다릅니다.");
	}
})	
</script>
<%@include file = "../includes/footer.jsp" %>