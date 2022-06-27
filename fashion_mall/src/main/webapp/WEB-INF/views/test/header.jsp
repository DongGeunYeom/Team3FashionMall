<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<html>
<head>
  <title>title</title>
  <!-- Bootstrap cdn 설정 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="../resources/css/style.css">
	<link rel="stylesheet" href="../resources/css/search.css"> 
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>



  
  <!-- 네비게이션(nav) 컨트롤에 사용하는 드롭다운. -->
  
  
  <div class="loggo">
		<center>
			<a href="/">
			 <img class="brand" src="/resources/FAimage/brand_test.png" alt="브랜드로고" style="width:700px;"/></a>
			<!-- <img class="brand" src="/resources/FAimage/test.gif" alt="브랜드로고" /></a> -->
		</center>
	</div>

        <header class="header-section">
        <div>
            <nav class="navbar navbar-default">
            
            <ul class="nav nav-pills navbar-left">
            <li style="padding:20px;">
            <input type="text" name="search" id="searchI" /> &nbsp  &nbsp </li>
			<li style="margin:13px; left:-45px;"><a href="/admin/search?keyword=" class="search-btn" id="searchB"><i class="fa fa-search" aria-hidden="true" style="font-size:20px;"></i></a></li>
            </ul>
                <div class="container">
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
                        <ul class="nav navbar-nav">
                        <!--     <li class="active"><a href="#">home</a></li> -->
                        <!-- 해당 페이지로 넘어가는 링크 달아주세요 -->
                            <li><a href="/admin/search?cate=top">상의</a></li>
                            <li><a href="/admin/search?cate=pants">하의</a></li>
                            <li><a href="/admin/search?cate=outer">아우터</a></li>
                            <li><a href="/admin/search?cate=shoes">신발</a></li>
                            <li><a href="/admin/search?cate=stuff">잡화</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container -->
            </nav>
    
    <div style="margin:20px; text-align:right;">
    <nav>
      <div class="container-fluid">
        <!-- 메뉴 설정 -->
        <div class="collapse navbar-collapse">
          <!-- 메뉴 삽입 -->
          <ul id="aa" class="nav navbar-nav">
            <!-- 메뉴 => 판매자  -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
                <i class="bi bi-person-lines-fill" style="font-size:25px; color:black;"></i>
              </a>
              <ul class="dropdown-menu">
                <li><a href="/admin/admin_register">상품 등록</a></li>
                <li><a href="/admin/admin_list">상품 관리</a></li>
              </ul>
            </li>
            <!-- 메뉴 => 사용자 -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               <i class="bi bi-person" style="font-size:25px; color:black;"></i>
              </a>
              <ul class="dropdown-menu">
                <li><a href="https://www.naver.com/">회원가입</a></li>
                <li><a href="https://www.daum.net/">로그인</a></li>
              </ul>
            </li>
            <!-- 메뉴 => 카트 -->
            <li>
              <a href="https://www.naver.com/"  >
               <i class="bi bi-cart" style="font-size:25px; color:black;"></i>
              </a></li>

              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
  </div>
    
  </header>
        