<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./include/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!-- Header-->
    <header class="bg-dark py-1">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Pratice</h1>
                <p class="lead fw-normal text-white-50 mb-0">solo project pratice</p>
            </div>
        </div>
    </header>
	<!-- 슬라이드
	Slider main container
	<div class="swiper">
	  Additional required wrapper
	  <div class="swiper-wrapper">
	    Slides
	    <div class="swiper-slide"><img src="/resources/img/FPqLwHuaUAc9__w.jpg" alt="" id="slider"/></div>
	    <div class="swiper-slide"><img src="/resources/img/KakaoTalk_20220520_013604492.png" alt="" id="slider"/></div>
	    <div class="swiper-slide"><img src="/resources/img/KakaoTalk_20220521_231829803.png" alt="" id="slider"/></div>
	    <div class="swiper-slide"><img src="/resources/img/KakaoTalk_20220521_231939728.png" alt="" id="slider"/></div>
	  </div>
	  If we need pagination
	  <div class="swiper-pagination">
	  </div>
	
	  If we need navigation buttons
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	
	  If we need scrollbar
	  <div class="swiper-scrollbar"></div>
	</div> 
	-->
   
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-3 mt-10">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/450x300-Movie.jpg" alt="영화 사진" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 가수 이름 -->
                                <h5 class="fw-bolder">영화</h5>
                                <!-- 정보 -->
      
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/movie/movieindex">영화 더보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/450x300-Drama.png" alt="드라마 사진" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 가수 이름 -->
                                <h5 class="fw-bolder">드라마</h5>
                                <!-- 정보 -->
      
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/drama/dramaindex">드라마 더보기</a></div>
                        </div>
                    </div>
                </div>
               <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/450x300-Ani.jpg" alt="애니" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 가수 이름 -->
                                <h5 class="fw-bolder">애니</h5>
                                <!-- 정보 -->
      
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/ani/aniindex">애니 더보기</a></div>
                        </div>
                    </div>
                </div>
                
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/450x300-Food.jpg" alt="음식" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 가수 이름 -->
                                <h5 class="fw-bolder">음식</h5>
                                <!-- 정보 -->
      
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/food/foodindex">음식 더보기</a></div>
                        </div>
                    </div>
                </div>
                
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/450x300-Travel.jpg" alt="여행 사진" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 가수 이름 -->
                                <h5 class="fw-bolder">여행</h5>
                                <!-- 정보 -->
      
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/travel/travelindex">여행 더보기</a></div>
                        </div>
                    </div>
                </div>
                
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/450x300-lodging.jpg" alt="숙소" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 가수 이름 -->
                                <h5 class="fw-bolder">숙소</h5>
                                <!-- 정보 -->
      
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/lodging/lodgingindex">숙소 더보기</a></div>
                        </div>
                    </div>
                </div>
                
                <!-- 나중에 추가 
                <div class="col mb-5">
                    <div class="card h-100">
                        Product image
                        <img class="card-img-top" src="/resources/img/450x300-Gaeul.png" alt="..." />
                        Product details
                        <div class="card-body p-4">
                            <div class="text-center">
                                가수 이름
                                <h5 class="fw-bolder">Gaeul</h5>
                                정보
      
                            </div>
                        </div>
                        Product actions
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/gaeul">정보 더보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        Sale badge
                         
                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        
                        Product image
                        <img class="card-img-top" src="/resources/img/450x300-Lei.png" alt="..." />
                        Product details
                        <div class="card-body p-4">
                            <div class="text-center">
                                Product name
                                <h5 class="fw-bolder">Lei</h5>
                                Product reviews
                                별점 정리 
                                	<div class="d-flex justify-content-center small text-warning mb-2">
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                </div>
                                개인 정보?
                                
                            </div>
                        </div>
                        Product actions
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/lei">정보 더보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        Sale badge
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        Product image
                        <img class="card-img-top" src="/resources/img/450x300-Liz.png" alt="..." />
                        Product details
                        <div class="card-body p-4">
                            <div class="text-center">
                                Product name
                                <h5 class="fw-bolder">Liz</h5>
                                개인 정보?
                                
                            </div>
                        </div>
                        Product actions
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/liz">정보 더보기</a></div>
                        </div>
                    </div>
                </div> -->
              
                
            </div>
        </div>
    </section>

    <!-- silder 스크립트
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
    </script> -->
<%@include file = "./include/footer.jsp" %>
