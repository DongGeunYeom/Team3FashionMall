<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>	
<html>
<head>
  <title>title</title>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
  <!-- Bootstrap cdn 설정 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="../resources/css/style.css">
  <link rel="stylesheet" href="../resources/css/search.css">
  <link rel="stylesheet" href="http://www.justinaguilar.com/animations/css/animations.css"/>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js">
  
  
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
</head>
<body>



  
  <!-- 네비게이션(nav) 컨트롤에 사용하는 드롭다운. -->
  
  
  <div class="loggo slideExpandUp pulse">
	<center>
		<a href="/">
		 <img class="brand" src="/resources/FAimage/brand_test.png" alt="브랜드로고" style="width:700px;"/></a>
		<!-- <img class="brand" src="/resources/FAimage/test.gif" alt="브랜드로고" /></a> -->
	</center>
	</div>

        <header style="height:100px;"class="header-section">
        <div>
            <nav class="">
            
            <ul class="nav nav-pills navbar-left" style="position:relative; top:0px;">
            
            <li style="padding:20px;">
            	<input type="text" name="search" id="searchI" value=""/>
            	</li>
			<li style="margin:13px; left:-45px;"><a href="" class="search-btn" id="searchB"><i class="bi bi-search" aria-hidden="true" style="font-size:20px; color:#fff;"></i></a></li>
            
            </ul>
            
            <div style="margin:20px; float:right;">
    <nav>
      <div class="container-fluid" style="padding-bottom:10px; position:relative; bottom:10px;">
        <!-- 메뉴 설정 -->
        <div class="collapse navbar-collapse" >
          <!-- 메뉴 삽입 -->
          <ul id="aa" class="nav navbar-nav">
          
            <!-- 메뉴 => 판매자  : 나중에 관리자만 들어올 수 있게 시큐리티 설정 해주기 -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #000;"> 
                <i class="bi bi-person-lines-fill" style="font-size:25px; color:#fff;"></i>
              </a>
              <ul class="dropdown-menu">
                <li><a href="/admin/admin_register">상품 등록</a></li>
                <li><a href="/admin/admin_list">상품 관리</a></li>
              </ul>
            </li>
            <!-- 메뉴 => 사용자 -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #000;">
               <i class="bi bi-person" style="font-size:25px; color:#fff;"></i>
              </a>
              <ul class="dropdown-menu">
              	<sec:authorize access="isAnonymous()">
                	<li><a href="/member/regist">회원가입</a></li>
                	<li><a href="/member/login">로그인</a></li>
                </sec:authorize>
              	
                
                <form action="/member/logout" method="post" id="logoutForm">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
                </form>
                
                <form action="/admin/search" methos="post" id ="searchForm">    
				     <!--  
				     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
				     -->
				     <input type="hidden" name="keyword" id="keyword1" value=""/>
			     </form>
                
                <sec:authorize access="hasAnyRole({'ROLE_USER','ROLE_ADMIN'})">
           			<li><a href="/member/myinfo" id="myinfo">내 정보</a></li>
                   	<li><a href="#" id="logout">로그아웃</a></li>
           		</sec:authorize>
               
              </ul>
            </li>
            <!-- 메뉴 => 카트 -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #000;">
               <i class="bi bi-cart" style="font-size:25px; color:#fff;"></i>
              </a>
              <ul class="dropdown-menu">
              	
	            <li><a href="/order/cart">장바구니</a></li>

              </ul>
            </li>

              </ul>
            </li>
          </ul>
          
        </div>
      </div>
    </nav>
  </div>                
            
                <div class="container" style="text-align:center;">
                    <!-- Brand and toggle get grouped for better mobile display -->
        <!--             <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> -->
                    
                    <!-- 검색창 -->
                    

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul style="position:relative; top:10px;"class="nav navbar-nav">
                        <!--     <li class="active"><a href="#">home</a></li> -->
                        <!-- 해당 페이지로 넘어가는 링크 달아주세요 -->
                            <li><a href="/board/search?cate=top">상의</a></li>
                            <li><a href="/board/search?cate=pants">하의</a></li>
                            <li><a href="/board/search?cate=outer">아우터</a></li>
                            <li><a href="/board/search?cate=shoes">신발</a></li>
                            <li><a href="/board/search?cate=stuff">잡화</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container -->
                
              </nav>
			</div>
     </header>
     
<script>
  
  
  	$("#searchB").click(function(e){
  		e.preventDefault();
  		
  		
  		
  		var keyword = $("#searchI").val();
  		
  		
  		
     	$("#keyword1").attr("value",keyword);
        
     
     /* console.log($("#keyword").val()); */
        
        /* $("#searchB").attr("href","/admin/search?keyword="+keyword); */
        
        $("#searchForm").submit();
        
  	})
  	
  
  
</script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/logout.js"></script>
        