<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<html>
<head>
  <title>title</title>
  <!-- Bootstrap cdn ì¤ì  -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
            <ul class="nav nav-pills navbar-left">
            <li style="padding:20px;"><input type="text" name="" id="" /> &nbsp  &nbsp</li>
			<li style="margin:13px; left:-45px;"><a href="#" class="search-btn"><i class="fa fa-search" aria-hidden="true" style="font-size:20px;"></i></a></li>
            </ul>
  
  
  <!-- ë¤ë¹ê²ì´ì(nav) ì»¨í¸ë¡¤ì ì¬ìíë ëë¡­ë¤ì´. -->
  <div style="margin:20px; text-align:right;">
    <nav>
      <div class="container-fluid">
        <!-- ë©ë´ ì¤ì  -->
        <div class="collapse navbar-collapse">
          <!-- 메뉴 삽입 -->
          <ul id="aa" class="nav navbar-nav">
            <!-- 메뉴 => 판매자  -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
                <i class="bi bi-person-lines-fill" style="font-size:25px; color:black;"></i>
              </a>
              <ul class="dropdown-menu">
                <li><a href="#">register(seller)</a></li>
                <li><a href="#">login(seller)</a></li>
              </ul>
            </li>
            <!-- ë©ë´ => ì¬ì©ì -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               <i class="bi bi-person" style="font-size:25px; color:black;"></i>
              </a>
              <ul class="dropdown-menu">
                <li><a href="https://www.naver.com/">register</a></li>
                <li><a href="https://www.daum.net/">login</a></li>
              </ul>
            </li>
            <!-- ë©ë´ => ì¹´í¸ -->
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               <i class="bi bi-cart" style="font-size:25px; color:black;"></i>
              </a>
              <ul class="dropdown-menu">
                <li><a href="https://www.naver.com/">register</a></li>
                <li><a href="https://www.daum.net/">login</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
  <div class="loggo">
	<center><img class="brand" src="/resources/FAimage/brand.png" alt="사진" /></center>	
	</div>

        <header class="header-section">
        
            <nav class="navbar navbar-default">
            
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">home</a></li>
                            <li><a href="https://www.naver.com/">Top</a></li>
                            <li><a href="#">bottom</a></li>
                            <li><a href="#">outer</a></li>
                            <li><a href="#">shoes</a></li>
                            <li><a href="#">stuff</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container -->
            </nav>
        </header>
  
  
 
  
  
  
</body>	
</html>
