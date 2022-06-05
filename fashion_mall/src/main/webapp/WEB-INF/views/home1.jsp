<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.swiper {
  width: 100%;
  height: 700px;
}
	img{
  width: 100%;
  height: 700px;
}
</style>
<link
  rel="stylesheet"
  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
/>
<link rel="stylesheet" href="/resources/css/swiper.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script type="module">
  import Swiper from 'https://unpkg.com/swiper@8/swiper-bundle.esm.browser.min.js'

  const swiper = new Swiper(...)
</script>
</head>
<body>
	<div>
		<h1 align="center">Header</h1>
	</div>
	<!-- 슬라이드 -->
	<!-- Slider main container -->
	<div class="swiper">
	  <!-- Additional required wrapper -->
	  <div class="swiper-wrapper" style="transition-duraion: 0ms; transform:translate3d(-2400px, 0px, 0px);">
	    <!-- Slides -->
	    <div class="swiper-slide"><img src="/resources/img/FPqLwHuaUAc9__w.jpg" alt="" /></div>
	    <div class="swiper-slide"><img src="/resources/img/KakaoTalk_20220520_013604492.png" alt="" /></div>
	    <div class="swiper-slide"><img src="/resources/img/KakaoTalk_20220521_231829803.png" alt="" /></div>
	    <div class="swiper-slide"><img src="/resources/img/KakaoTalk_20220521_231939728.png" alt="" /></div>
	  </div>
	  <!-- If we need pagination -->
	  <div class="swiper-pagination">
	  	<span class="swiper-pagination-progressbar-fill" style="transform: translate3d(0px, 0px, 0px) scaleX(0.375) scaleY(1); transition-duration: 400ms;"></span>
	  </div>
	
	  <!-- If we need navigation buttons -->
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	
	  <!-- If we need scrollbar -->
	  <div class="swiper-scrollbar"></div>
	</div>
	<div>
		<h1 align="center">인기상품 리스트</h1>
	</div>
	<div>
		<h1 align="center">footer</h1>
	</div>
<script>
const swiper = new Swiper('.swiper', {
	  // Optional parameters
	  direction: 'horizontal',
	  loop: true,

	  // If we need pagination
	  pagination: {
	    el: '.swiper-pagination',
	  },

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },

	  // And if we need scrollbar
	  scrollbar: {
	    el: '.swiper-scrollbar',
	  },
	});// 위에꺼
</script>
</body>
</html>