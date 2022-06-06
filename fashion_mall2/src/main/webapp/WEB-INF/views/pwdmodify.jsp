<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./include/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/find.js"></script>
<!DOCTYPE html>
<!-- Header-->
<header class="bg-dark py-1">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder" onclick="location.href='/'">Pwd Modify</h1>
            <p class="lead fw-normal text-white-50 mb-0">solo project pratice</p>
        </div>
    </div>
</header>
<section class="py-5">
	<div class="container-md px-4 px-lg-3 mt-10">
		<form action="" method="post" class="form-signin" id="find">
		
			<div class="form-group row justify-content-left">
	          <label for="password" class="col-sm-2 col-form-label">새로운 비밀번호</label>
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
		
			<div class="form-group row justify-content-left">
	          <label for="confirm_password" class="col-sm-2 col-form-label">확인 비밀번호</label>
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
		    
		    <div class="form-group row justify-content-left">
		        <div class="col-sm-6">
					<button class="btn btn-outline-secondary" type="submit" id="findpwd">비밀번호 수정</button>
		        </div>
		    </div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		</form>
	</div>
</section>

<%@include file = "./include/footer.jsp" %>