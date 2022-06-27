<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../includes/header1.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/find.js"></script>
<style>
    .input-form {
      max-width: 950px;

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
<!DOCTYPE html>
<!-- Header-->
<link rel="stylesheet" href="/resources/css/main2.css" />

<section class="py-5">
	<div class="container-md px-4 px-lg-3 mt-10">
	  <div class="input-form-backgroud row">
       <div class="input-form col-md-12 mx-auto">
		<form action="" method="post" class="form-signin" id="find">
		
			<div class="form-group row justify-content-center">
	          <label for="password" class="col-sm-3 col-form-label">새로운 비밀번호</label>
	          <div class="col-sm-6">
	            <input
	              type="password"
	              name="password"
	              id="password"
	              class="form-control"
	              placeholder="비밀번호를 입력하세요"
	            />
	            <small id="password" class="text-info"></small>
	          </div>
	        </div>
		
			<div class="form-group row justify-content-center">
	          <label for="confirm_password" class="col-sm-3 col-form-label">확인 비밀번호</label>
	          <div class="col-sm-6">
	            <input
	              type="password"
	              name="confirm_password"
	              id="confirm_password"
	              class="form-control"
	              placeholder="비밀번호를 입력하세요"
	            />
	            <small id="confirm_password" class="text-info"></small>
	          </div>
	        </div>              
		    
		    <div class="form-group row justify-content-center">
		        <div class="col-sm-3">
					<button class="btn btn-outline-secondary" type="submit" id="findpwd">비밀번호 수정</button>
		        </div>
		    </div>
		    <input type="hidden" name="userid" id="userid" value="${userid}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		</form>
	   </div>
      </div>
	</div>
</section>

<%@include file = "../includes/footer.jsp" %>