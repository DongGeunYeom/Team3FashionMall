<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <!-- 중복아이디 체크시 403에러 방지를 위한 토큰 전송 -->
        <meta name="_csrf" content="${_csrf.token}">
		<meta name="_csrf_header" content="${_csrf.headerName}">
		
        <title>Solo Project Practice</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <style>
			.swiper {
		  width: 100%;
		  height: 400px;
		}
			#slider{
		  width: 100%;
		  height: 400px;
		}
		</style>
		<link
		  rel="stylesheet"
		  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
		/>
		<link rel="stylesheet" href="/resources/css/swiper.css" />
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</head>
<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="/index">Solo Pratice</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/index">Home</a></li>
                    <!-- 사람들이 각자 추천하는 게시판 -->
                    <li class="nav-item"><a class="nav-link" href="/board">Board</a></li>
                    <!-- 문의와 공지 게시판 -->
                    <li class="nav-item"><a class="nav-link" href="/qna">QnA</a></li>
                    <!-- <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li> -->
                </ul>
                	<!-- Login버튼으로 오른쪽으로 옮기려고 잠시 배치 해둠 -->
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4"></ul>
	              	
	              	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	              	
	              		<sec:authorize access="isAnonymous()">
	              			<li class="nav-item"><a class="nav-link" href="/productboard/productregister">상품등록</a></li>              
	              			<li class="nav-item"><a class="nav-link" href="/productboard/shopdetail">상품상세</a></li>
	              			<li class="nav-item"><a class="nav-link" href="/productboard/test">테스트</a></li>
	              			<li class="nav-item"><a class="nav-link" href="/login">Login</a></li>   
                        	<li class="nav-item"><a class="nav-link" href="/register">Register</a></li>                     
                        </sec:authorize>
	              		
	              		<form action="/logout" method="post" id="logoutForm">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
                        </form>
	              		
	              		<sec:authorize access="isAuthenticated()">
	              			<li class="nav-item"><a class="nav-link" href="/productboard/productregister">상품등록</a></li>              
	              			<li class="nav-item"><a class="nav-link" href="/productboard/shopdetail">상품상세</a></li>
	              			<li class="nav-item"><a class="nav-link" href="/productboard/shopdetail">테스트</a></li>
	              			<li class="nav-item"><a class="nav-link" href="#" id="myinfo">Myinfo</a></li>
                        	<li class="nav-item"><a class="nav-link" href="#" id="logout">Logout</a></li>                        
                        </sec:authorize>
	              		
	              		
	              	</ul>
		       
               <!--  <form class="d-flex">
                    <a href="/login">
	                	<button class="btn btn-outline-dark" type="button">
	                    Login
	               		</button>
                    </a>
                </form> -->
                
            </div>
        </div>
    </nav>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/logout.js"></script>
    