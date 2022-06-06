<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html>
<!-- Header-->
<header class="bg-dark py-1">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder" onclick="location.href='/'">Login</h1>
            <p class="lead fw-normal text-white-50 mb-0">solo project pratice</p>
        </div>
    </div>
</header>
<div class="container-md px-4 px-lg-3 mt-10">
	<form action="/login" method="post" class="form-signin">
		<div class="justify-content-center">
		  <label for="username" class="col-sm-2 col-form-label justify-content-center"></label>
	      <div class="col-sm-6">
		      <input
		        type="text"
		        id="username"
		        name="username"
		        class="form-control"
		        placeholder="아이디"
		        required
		        autofocus
		      />
		  </div>
	      <label for="password" class="col-sm-2 col-form-label"></label>
	      <div class="col-sm-6">
		      <input
		        type="password"
		        id="password"
		        name="password"
		        class="form-control"
		        placeholder="비밀번호"
		        required
		      />
		  </div>
	  </div>
		  
	  <!-- 한칸 띄워쓰기 용도 -->
	  <label for="inputPassword" class="col-sm-2 col-form-label"></label>
	  
	  <div class="error-message col-sm-6">
		<span>${loginError}</span>
	  </div> 
	  
	  <!-- 한칸 띄워쓰기 용도 -->
	  <label for="inputPassword" class="col-sm-2 col-form-label"></label>
	  
      <div class="checkbox mb-3 col-sm-6">
        <label>
          <input type="checkbox" value="remember-me" /> Remember me
        </label>
      </div>
      
	  <div class="col-sm-6">
	  	<button type="submit" class="btn btn-outline-secondary" id="login">로그인</button>
	  	<button type="button" class="btn btn-outline-secondary" id="findid">아이디 찾기</button>
	  	<button type="button" class="btn btn-outline-secondary" id="findpwd">비밀번호 찾기</button>
	  </div>
	  
	  <!-- 토큰이 없으면 403 에러 -->
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	  
	</form>
</div>
<script>
$(function(){
	//controller에서 받아옴
	let msg = ${msg};
	if(msg){
		alert("회원가입이 되었습니다.");
	}
	
	let error-message = ${loginError};
	if (error-message){
		console.log(error-message);
		alert("아이디나 비밀번호를 확인해 주세요");		
	}
	

})	
</script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/login.js"></script>
<%@include file = "./include/footer.jsp" %>