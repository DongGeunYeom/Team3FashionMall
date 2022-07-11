<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.98.0">
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
	<link rel="stylesheet" href="/resources/css/signin.css" />
	
    <!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
	<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#712cf9">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"charset="utf-8"></script>
	

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<main class="form-signin w-100 m-auto">
	  <form id="login" method="post" action="/login">
	  <a href='/'>
	    <img class="mb-4" src="/resources/images/logo_01.png" alt="" width="200">
	  </a>
	    <h1 class="h3 mb-3 fw-normal">Login</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요">
	      <label for="user_id">ID</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요">
	      <label for="password">Password</label>
	    </div>
	    
	    <!-- 로그인 에러 -->
	      <div>
	        <p style="color: red;">${loginError}</p>
	      </div>

    	<!-- <a href="/member/findid">아이디/비밀번호 찾기</a> -->
    	<button type="button" class="btn btn-outline-secondary" id="findid">아이디 찾기</button>
    	<button type="button" class="btn btn-outline-secondary" id="findpwd">비밀번호 찾기</button>
	        
	    <div> <p>
	    
	    </p></div>
	    
	   	<div class="form-floating" style="width : 100%; text-align : center" >
		    <div style="display:inline-block"><button class="w-100 btn btn-lg btn-primary" type="submit" >로그인</button></div>
		    <div style="display:inline-block"><button class="w-100 btn btn-lg btn-success" type="button" onclick="location.href='/member/regist'">회원가입</button></div> 
	    </div>
	   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	    <p class="mt-5 mb-3 text-muted">&copy;2022 KED'LOS</p>
	  </form>
	</main>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script>
$("#findid").click(function(){
	// 아이디 찾기로 이동
	$("#login").attr("action","/member/findid");
	location.href="/member/findid";
})

$("#findpwd").click(function(){
	// 아이디 찾기로 이동
	$("#login").attr("action","/member/findpwd");
	location.href="/member/findpwd";
})
</script>
</body>
</html>
