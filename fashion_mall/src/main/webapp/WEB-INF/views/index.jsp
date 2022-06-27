<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./includes/header1.jsp" %>
	<link rel="stylesheet" href="/resources/css/main2.css"/>
	<div id="page-wrapper">

	<!-- Carousel -->
		<section class="carousel" style="width:100%;">
			<div class="reel">
				<!-- 최신 리스트 보여주기 슬라이드 -->
				<%-- <c:forEach var="AttachDto" items="${Attach}" end="8">
					<c:url var="url" value="/display?">
						<c:param name="fileName" value="${AttachDto.filename}" />
						<c:param name="filePath" value="${AttachDto.uploadpath}"/>
					</c:url>
					<article>
						<a href="#" class="image featured"><img src="${url}" width="356" height="258" alt="" /></a>
						<header>
							<h3><a href="#">${AttachDto.p_name}</a></h3>
						</header>
						<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
					</article>
				</c:forEach> --%>
			</div>
		</section>
		
		<hr>
		
		<!-- Three -->
			<section id="three" class="main style1 special">
				<div class="container">
					<header class="major">
					    <div class="justify-content-center">
						  <h2 align="left" class="display-4"><em>인기 상품 Top 3</em></h2>
						  <div class="btn-group" role="group" aria-label="Basic example">
							  <button type="button" class="btn btn-outline-dark" id="top" style="margin: 10px; width: 70px; height: 50px">TOP</button>
							  <button type="button" class="btn btn-outline-dark" id="bottom" style="margin: 10px; width: 85px; height: 50px">BOTTOM</button>
							  <button type="button" class="btn btn-outline-dark" id="outer" style="margin: 10px; width: 70px; height: 50px">OUTER</button>
							  <button type="button" class="btn btn-outline-dark" id="shoes" style="margin: 10px; width: 70px; height: 50px">SHOES</button>
							  <button type="button" class="btn btn-outline-dark" id="stuff" style="margin: 10px; width: 70px; height: 50px">STUFF</button>
						  </div>
						</div>
					</header>
					<br>
				<div class="row gtr-150" id="productlist1">
				<!-- 인기상품 리스트 -->
				<!-- 반복문 -->
				<%-- <c:forEach var="AttachDto" items="${Attach}" end="5"> 
					<c:url var="url" value="/display?">
						<c:param name="fileName" value="${AttachDto.filename}" />
						<c:param name="filePath" value="${AttachDto.uploadpath}"/>
					</c:url>
					<div class="col-4 col-12-medium">
						<article style="background-color:white; padding-bottom:30px;">
							<a href="#" class="image featured"><img src="${url}" width="356" height="350"  alt="사진" /></a>
							<header>
								<h1 align="center" style="font-size:80px;"><a href="#">${AttachDto.p_name}</a></h1>
							</header>
							<h3 align="center">${AttachDto.p_price}</h3>
							<h3 align="center">${AttachDto.p_type}</h3>
						</article>
					</div>
				</c:forEach> --%>
				</div>	
						
			<div class="row gtr-150"></div>				
		<br>
		</div>
		</section>
		<br>
		</div>		
	</section>
</div>
<script src="/resources/js/index.js"></script>
<%@include file = "./includes/footer.jsp" %>