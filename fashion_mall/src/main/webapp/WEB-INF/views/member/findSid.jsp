<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .input-form {
      width: 480px;
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
<%@include file = "../includes/header1.jsp" %>
<link rel="stylesheet" href="/resources/css/main2.css" />

<!-- <!DOCTYPE html> -->
<!-- Header-->


<section class="py-5">
	<div class="container-md px-4 px-lg-3 mt-10">
	 <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
		<form action="/member/login"class="form-signin" id="findSid">
		
			<%-- <div class="form-group row justify-content-center">
	          <div class="">
	            <h2 align="left">${name}님의 아이디는 "${userid}"입니다.</h2>
	          </div>
	        </div> --%>
	          <div class="row justify-content-center">
	            <label for="userid" class="col-sm-3 col-form-label" style="font-size: 23px"><em>&nbsp &nbsp &nbsp 아이디 찾기</em></label>
		      </div>
		      
		      <div class="row justify-content-center">
		      	<p class="col-sm-5"><small>&nbsp  &nbsp &nbsp &nbsp &nbsp 고객님의 정보와 일치하는 아이디</small></p>
		      </div>
		      
		      <div class="form-group row justify-content-center" >
		          <div class="col-sm-3">
		            <input
		              type="text"
		              name="user_id"
		              id="user_id"
		              class="form-control"
		              value="${user_id}"
		              readonly="readonly"
		              style="border:solid 2px gray;"
		            />
		          </div>
	          </div>
	          
		    <div class="form-group row justify-content-center">
		        <div class="col-sm-2">
					<button class="btn btn-outline-secondary" type="submit" style="font-size: 15px;">로그인</button>
		        </div>
		    </div>
		</form>
	</div>
  </div>
</div>
</section>
<%@include file = "../includes/footer.jsp" %>