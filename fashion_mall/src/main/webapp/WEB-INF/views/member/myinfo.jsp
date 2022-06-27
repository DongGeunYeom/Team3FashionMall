<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file = "../includes/header1.jsp" %>
<style>
    .input-form {
      width: 680px;
	  max-height: 1200px;
	  
      margin-bottom: 80px;
      margin-top: 40px;
      margin-left: 0px;
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
	<div class="container px-4 px-lg-3 mt-10">
	  <div class="row">
	  
		  <div class="col-2">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" href="#" role="tab" aria-controls="home">내 정보</a>
		      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#" role="tab" aria-controls="home">회원 정보 수정</a>
		      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#" role="tab" aria-controls="home">최근 구매 내역</a>
		    </div>
		  </div>
		  
		  
		  <div class="col-8">
		  
		  
  	<div class="input-form-background row">
	  <div class="input-form col-md-12 mx-auto" style='padding:40px;'>
        <div class="tab-content" id="nav-tabContent">
		<h3 class="mb-3" align="center">회원 정보</h3>

 		  <form action="/myinfo" method="post" id="info_Form">
 		  <!-- 이름 -->
          <div class="row">
          	<div class="col-md-3 mb-4">
				<label style="margin-bottom: 3px;">이름</label>
				<input type="text" class="form-control" id="name" name="name" value="${MemberDto.name}" readonly="readonly" style="border:solid 1px gray;">
			</div>
		  </div>
 		  <!-- 아이디 -->
          <label for="" style="margin-bottom: 3px;">아이디</label>
          <div class="row">
          	<div class="col-md-3 mb-4" style="flaot:flex; ">
	        	<input
		          type="text"
		          class="form-control"
		          name="user_id"
		          id="user_id"
		          placeholder=""
				  value="${MemberDto.user_id}"
				  readonly="readonly"
				  style="border:solid 1px gray;"
		        />
	        </div>
          </div>
          
          <!-- 회원 정보 수정에 들어갈 예정 -->
<!-- 	      <label>비밀번호</label>
          <div class="row">
	          <div class="col-md-6 mb-3">
	            <input type="password" class="form-control" name="password" id="password" placeholder="" value="" required>
			  </div>
	          <div class="col-md-3 mb-4 ">
		       	   <button type="submit" class="btn btn-outline-dark">비밀번호 수정</button>
		      </div>
          </div> -->
              
          <div class="row">
          	<div class="col-md-4 mb-4">
          		<label for="tel" style="margin-bottom: 3px;">전화번호</label>
          		<input type="text" class="form-control" id="phone_num" name="phone_num" value="${MemberDto.phone_num} " readonly="readonly" style="border:solid 1px gray;"/>
          	</div>
          </div>        
       <!-- 주민등록번호 -->
        <!--    <label for="">주민등록번호</label>
		<div class="row">
       		<div class="col-md-5 mb-4">
       			<input type="text" class="form-control" id="person_num1" name="person_num1" required />
       		</div>
       		<strong style="font-size: 23px">-</strong>
       		<div class="col-md-5 mb-4">
       			<input type="password" class="form-control" id="person_num2" name="person_num2" required />
       		</div>			
		</div> -->
		
		<!-- 이메일 -->
		<div class="row">
          <div class="col-md-5 mb-4">
            <label for="email" style="margin-bottom: 3px;">이메일</label>
            <input type="email" class="form-control" id="email" name="email" value="${MemberDto.email}" readonly="readonly" style="border:solid 1px gray;">
          </div>
        </div>
        
         <!-- 주소 -->
         <div class="row">
	         <div class="col-md-8 mb-4">
	            <label for="address" style="margin-bottom: 3px;">주소</label>
	            <input type="text" class="form-control" id="address" name="address" value="${MemberDto.address}" readonly="readonly" style="border:solid 1px gray;">
	 		 </div>
	 	 </div>
	 	 
	 	 <!-- 회원가입 날짜 -->
          <div class="row">
	          <div class="col-md-8 mb-4">
	            <label for="regdate" style="margin-bottom: 3px;">회원가입 날짜</label>
	            <input type="text" class="form-control" id="regdate" name="regdate" value="${MemberDto.reg_date}" readonly="readonly" style="border:solid 1px gray;">
	          </div>
	       </div>
          
          <input type="hidden" name="userid" value="${MemberDto.user_id}" />
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		  
		  </form>
		  
         <div class="d-flex justify-content-center">
			<button type="button" class="btn btn-danger" id="top" style="margin-top: 10px; width: 150px; height: 50px">회원 탈퇴</button>
		 </div>
		
		</div>
	  </div>
  </div>
</div>
	  
	  
	  </div>
	</div>
</section>
<!-- 영상 끌어올 때 쓰는 코드 -->
<!-- <div class="container">
	<div class="d-flex justify-content-center">
		<div class="embed-responsive embed-responsive-4by3">
		  <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/fDrjbj5OPv0?rel=0" allowfullscreen></iframe>
		</div>
	</div>
</div>  -->
<script>
    <!-- 스크립트에서 내 정보를 가져오기 위함 (id가 넘어감) -->
	<sec:authorize access="isAuthenticated()">
		user_id = '<sec:authentication property="principal.username"/>';
	</sec:authorize>

	<!-- csrf 토큰 -->
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/my_info2.js"></script>
<%@include file = "../includes/footer.jsp" %>