<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./include/header.jsp" %>
<!DOCTYPE html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/find.js"></script>
<!-- Header-->
<header class="bg-dark py-1">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder" onclick="location.href='/'">Pwd Find</h1>
            <p class="lead fw-normal text-white-50 mb-0">solo project pratice</p>
        </div>
    </div>
</header>
<section class="py-5">
	<div class="container-md px-4 px-lg-3 mt-10">
		<form action="" method="post" class="form-signin" id="find">
		
			<div class="form-group row justify-content-left">
	          <label for="userid" class="col-sm-2 col-form-label">아이디</label>
	          <div class="col-sm-6">
	            <input
	              type="text"
	              name="userid"
	              id="userid"
	              class="form-control"
	              placeholder="아이디를 입력하세요"
	            />
	            <small id="userid" class="text-info"></small>
	          </div>
	        </div>
		
			<div class="form-group row justify-content-left">
	          <label for="name" class="col-sm-2 col-form-label">이름</label>
	          <div class="col-sm-6">
	            <input
	              type="text"
	              name="name"
	              id="name"
	              class="form-control"
	              placeholder="이름을 입력하세요"
	            />
	            <small id="name" class="text-info"></small>
	          </div>
	        </div>
	        
	        <div class="form-group row justify-content-left">
	          <label for="personnum1" class="col-sm-2 col-form-label">주민등록번호</label>
	          <div class="col-sm-6">
	            <input
	              type="text"
	              name="personnum1"
	              id="personnum1"
	              class="form-control"
	              placeholder="주민등록번호 앞자리를 입력하세요"
	            />
	            <small id="personnum1" class="text-info"></small>
	          </div>
	        </div>
	        
	        <div class="form-group row justify-content-left">
	          <label for="personnum2" class="col-sm-2 col-form-label"></label>
	          <div class="col-sm-6">
	            <input
	              type="password"
	              name="personnum2"
	              id="personnum2"
	              class="form-control"
	              placeholder="주민등록번호 뒷자리를 입력하세요"
	            />
	            <small id="personnum2" class="text-info"></small>
	          </div>
	        </div>	        
		    
		    <div class="form-group row justify-content-left">
		        <div class="col-sm-6">
					<button class="btn btn-outline-secondary" type="submit" id="findpwd">비밀번호 찾기</button>
		        </div>
		    </div>
		    
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		</form>
	</div>
</section>

<%@include file = "./include/footer.jsp" %>