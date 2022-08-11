<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<%@include file="../includes/header1.jsp" %>
<!------ Include the above in your HEAD tag ---------->
<link
  rel="stylesheet"
  href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
  integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
  crossorigin="anonymous"
/>
<link rel="stylesheet" href="/resources/css/main2.css" />
<link rel="stylesheet" href="/resources/css/getdetail.css" />
<script defer src="/resources/js/getdetail.js"></script>
<script defer src="/resources/js/upload.js"></script>
<script defer src="/resources/js/review.js"></script>
<script defer src="/resources/js/qna.js"></script>
<!-- 필요한 정보 받기 -->
<input type="hidden" id="user_id" name="user_id" value="${user_id}" />
<input type="hidden" id="bno" name="bno" value="${readDto.bno}"/>
<input type="hidden" id="pcode" name="pcode" value="${productDto.p_code}"/>
<input type="hidden" id="pprice" name="pprice" value="${productDto.p_price}"/>
<input type="hidden" id="pname" name="pname" value="${productDto.p_name}"/>
<main>
<!-- 상품번호 받기 -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="card mb-10">
          <div class="card-header">
            <nav class="header-navigation">
              <!-- 목록으로 돌아가기 숏컷 -->
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/index">홈으로 돌아가기</a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="/board/search?cate=${productDto.p_type}">${productDto.p_type}</a></li>
              </ol>
            </nav>
          </div>
		  <!-- 상세페이지 본문 시작 -->
          <div id="productbody" class="card-body store-body">
            <div class="product-info">
              <div class="product-gallery">
                <div class="product-gallery-thumbnails">
                  <ol class="thumbnails-list list-unstyled">
                  <!-- 사진 파일 들어갈 곳 -->
                  </ol>
                </div>
                
                <div class="product-gallery-featured">
                	<!-- img 태그 들어가야 할 곳 -->
                </div>
                
              </div>
              <div class="product-payment-details">
                <h3 class="ptitle">상품명 : ${productDto.p_name}</h3>
                
                <div class="showprice">  
                
                </div>
               
                <h3 class="pbcontent">상품설명 : ${productDto.p_content}</h3>
                <div id="getvalue" class="mb-3">
                  
                  <label for="color">색상</label>
                  <select name="colors" id="pcolor" class="form-control">
                  		<option value="">--- 색상 선택 ---</option>
               		<c:forEach var="dto" items="${colorList}">
                   		<option value="${dto}">${dto}</option>
                   	</c:forEach>
                  </select>
                  	
                  <label for="psize">사이즈</label>                
                  <select name="sizes" id="psize" class="form-control">
                  	<option value="">--- 사이즈 선택 ---</option> 	
                  </select>                 
           
                  <div>
                    <label id ="pamountlabel" for="quant">수량</label>
                    <input type="number"
                      name="pamount"
                      min="0"
                      max="0"
                      id="pamount"
                      class="form-control mb-2 input-lg"
                      placeholder="수량을 선택해주세요"
                    />
                  </div>
            	<div class="showtotalprice">
            	</div>
                </div>
                <div id="cartBtns">
               		<button type="button" id="addcart" class="btn"
	                  style="margin-right: 10px;" >장바구니담기</button> 
	                <button type="button" id="buyproduct" class="btn btn-lg" >구매하기</button>
                </div>
               	 	<h3 id="hiddenstock">"이 상품은 품절되었습니다."</h3>
              </div>
            </div>
          </div>
          <div class="scroll-movebox flex flex-br-c">
            <button id="btn1">상품설명</button>
            <button id="btn2">상품평</button>
            <button id="btn3">상품문의</button>
          </div>
          <div class="bigPictureWrapper2">
				<div class="bigPicture2"></div>
		  </div>
          <div class="product-describe-images">
            <h2 id="div1" class="mb-5 qnatitle">상품사진</h2>
            <div class="recommended-items card-deck">
             
              <!--  반복 시작  
         	  <div class="card">
                <div class="card-body">
              		img 들어가야 할 곳
                </div>
              </div>   
                    반복 끝  -->
              
            </div>
            <!-- 상품사진 끝 -->
            
            
            <div class="describeProduct">
              <h2 class="productcontentLabel">상품설명</h2>
              <p class="productcontent">
              ${readDto.pb_content}
              </p>
            </div>
            
            <!-- Review Start -->
            <div class="xans-element- xans-product xans-product-review">
              <div id="div2" class="ec-base-table typeList">
                <br />
                <h2 class="rvtitle">상품평</h2>
                <p class="desc">상품의 사용후기를 적어주세요.</p>
                <table>
                  <caption></caption>
                  <colgroup>
                    <col style="width: 70px" />
                    <col style="width: auto" />
                    <col style="width: 120px" />
                    <col style="width: 120px" />
                    <col style="width: 80px" class="displaynone" />
                  </colgroup>
                  <thead id="reivewTable">
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">제목</th>
                      <th scope="col">작성자</th>
                      <th colspan="2" scope="col">작성일</th>
                      <th scope="col" class="displaynone">평점</th>
                    </tr>
                  </thead>
                  <tbody id="reviewList" name="reviewList">
                  </tbody>
                </table>
              </div>
            </div>
       		<!-- Pagination -->
            <div id="reviewPage" class="panel-footer">
            </div>
            <!-- End Pagination -->	
            
              <div class="fnbtnwrapper">
                <button type="button" class="btn fnbtn2" onclick="fn_Review()" >
                  상품평 등록
                </button>
              </div>
       
            <!-- Review End -->
            <!-- QNA Start -->
            <div class="xans-element- xans-product xans-product-qna">
              <div id="div3" class="ec-base-table typeList">
                <br />
                <h2 class="qnatitle">상품문의</h2>
                <table style="align:center;" class="board_list">
					<colgroup>
						<col width="9%" />
						<col>
						<col width="15%" />
						<col width="14%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>문의</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
				</table>
				
				<table class="board_list2">
					<tbody id="board_list1">
					<colgroup>
						<col width="9%" />
						<col>
						<col width="10%" />
						<col width="13%" />
						<col width="13%" />
					</colgroup>
					</tbody>
				</table>
              </div>
            </div>
            
            <!-- Pagination -->
            <div id="qnaPage" class="panel-footer1">
            </div>
            <!-- End Pagination -->
            
              <div class="fnbtnwrapper">
                <button type="button" class="btn fnbtn" onclick="fn_Qna()">
                  상품문의
                </button>
		    	<sec:authorize access="hasRole('ROLE_ADMIN')"> 
	            	<button type="button" class="btn fnbtn get_secret" onclick="openPopUp()">
		              비밀글 확인
		            </button>
			    </sec:authorize>
              </div>
            <!-- QNA End -->
          </div>
        </div>
      </div>
    </div>
  </div>
  
<!-- 장바구니 모달 -->
<div id="modal" class="modal" tabindex="-1"  data-rno="1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
      <!-- 메세지 들어갈 공간 -->
      </div>
      <div class="modal-footer">
        <button type="button" id="modalCartBtn" onclick="location.href='/order/cart'">장바구니이동</button>
        <button type="button" id="modalShopBtn">쇼핑계속하기</button>
        <form action="/order/checkout" method="post" class="chckwrapper">
        	<button type="submit" id="modalContinueBtn" style="width:100%; font-size:20px; ">확인</button>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
        	<input type="hidden" name="totalPrice" id="totalPrice" value=0 />
        </form>
      </div>
    </div>
  </div>
</div>
<!--  모달 종료 -->

<%-- 리뷰 작성 모달 폼 --%>
<div id="reviewModal" class="modal" tabindex="-1" data-rno="1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h3 class="modal-title">리뷰 작성</h3>
      </div>
      <div class="modal-body3">
      <!--  구조 파악 -->
	     <div class="review_fn" style="display:none;">
	   		 <label for="rno">리뷰 번호</label>
	      	 <input type="text" name="rno" id="rno" class="form-control" readonly/>
	      	 <input type="hidden" name="rno9" id="rno9" />
	      	 <label id="imagelabel" for="images">리뷰 사진</label>
	      	 <!-- 사진 보여주는 곳 -->
	      	 <ul class="modal-picture"></ul>
	   	</div>
 
      	<div class="form-group">
      		<label for="r_title">리뷰 제목</label>
      		<input type="hidden" name="r_title9" id="r_title9" />
      		<input type="text" name="r_title" id="r_title" class="form-control" placeholder="리뷰 제목을 입력해주세요"/>
      	</div>
      	 
      	<div class="bigPictureWrapper">
			<div class="bigPicture"></div>
		</div>
		
      	<div class="form-group">
      		<label for="r_content" class="r_contentlabel">리뷰 내용</label>
      		<input type="hidden" name="r_content9" id="r_content9" />
      		<textarea name="r_content" id="r_content" rows="6" style="border:none; width:100%;" >리뷰 내용을 적어주세요.</textarea>
     	</div>
     	
     	<div class="form-group">
      		<label for="ruser_id">작성자</label>
      		<input type="hidden" name="ruser_id9" id="ruser_id9" />
      		<input type="text" name="ruser_id" id="ruser_id" class="form-control" value="" readonly/>
      	</div>
      	
		<div class="row">
			<div class="attachbox">
				<div id="addAttach" class="panel panel-default">
					<div class="attachbox-heading">리뷰 사진 첨부하기</div>
					<div class="panel-body">
						<div class="form-group uploaddiv">
							<input type="file" name="uploadFile" id="reviewFile" multiple/>
						</div>
						<div class="uploadResult">
						<ul></ul>
						</div>
					</div>
				</div>
			</div>
		</div>   
		     
     </div>
      	  
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="modalReviewInsertBtn">리뷰 등록</button>
        <button type="button" class="btn" id="modalCancleBtn">리뷰 끄기</button>
        <button type="button" class="btn btn-info" id="modalReviewModifyBtn" style="display:none;">리뷰 수정</button>
        <button type="button" class="btn" id="modalReviewConfirmBtn" style="display:none;">수정 확인</button>
        <button type="button" class="btn btn-danger" id="modalReviewDeleteBtn" style="display:none;">리뷰 삭제</button>
      </div>
      
    </div>
  </div>
</div>

<%-- 문의글 작성 모달 폼 --%>
<div id="qnaModal" class="modal" tabindex="-1" data-qno="1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title">상품문의작성</h5>
      </div>
      <div class="modal-body2">
 
      	<div class="form-group">
      		<label for="q_title">상품문의 제목</label>
      		<input type="text" name="q_title" id="q_title" class="form-control" placeholder="상품문의 제목"/>
      		<input type="hidden" name="q_user2" id="hiddenq_user2" value=""/>
      		<input type="hidden" name="q_title2" id="hiddentitle2" value=""/>
      	</div>
      	 	
      	<div class="form-group">
      		<label for="q_content" class="q_contentlabel">상품문의 내용</label>
      		<input type="hidden" name="q_content2" id="hiddencontent2" value=""/>
      		</br>
      		<textarea name="q_content" id="q_content" rows="2" style="padding-bottom:5%; width:100%;">상품문의 내용을 적어주세요.</textarea>
     	</div>
     	
      </div>
      
   	  <div class="q_answer" style="display:none; padding:0 5%;">
   		 <label for="qno">상품문의 번호</label>
      	 <input type="text" name="qno" id="qno" class="form-control"  value="" readonly/>
      	 <input type="hidden" name="hiddenqno2" id="hiddenqno2"  value=""/>
  		 </br>
   		 
   		 <label for="q_answer" id="answerLabel">상품문의 답변</label>
   		 </br>
   		 <textarea name="q_answer" id="q_answer" rows="2" style="padding-bottom:5%; width:100%;" readonly>문의 답변을 적어주세요.</textarea>
		 <input type="hidden" name="q_answer2" id="hiddenanswer2"  value=""/>
   	  </div>
   	  
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="modalQnaInsertBtn">문의글 등록</button>
        <button type="button" class="btn" id="modalQnaInsertSecretBtn">문의글 비밀등록</button>
        <button type="button" class="btn btn-info" id="modalQnaChangeBtn" >문의글 수정</button>
        <!--  <button type="button" class="btn" id="modalQnaAnswerBtn" style="display:none;">답변글 등록</button>
        <button type="button" class="btn btn-info" id="modalQnaModifyBtn" style="display:none;">답변글 수정</button>  -->
        <button type="button" class="btn btn-primary" id="modalQnaCancleBtn">작성 종료</button>
      </div>
    </div>
  </div>
</div>

<!-- 비밀글 모달 -->
<div id="qnaModal2" class="modal" tabindex="-1" data-qno="1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title">상품문의작성</h5>
      </div>
      <div class="modal-body4">
 
      	<div class="form-group">
      		<label for="q_title9">상품문의 제목 </label>
      		<input type="text" name="q_title9" id="q_title9" class="form-control" placeholder="상품문의 제목"/>
      	</div>
      	 	
      	<div class="form-group">
      		<label for="q_content9" class="q_contentlabel">상품문의 내용</label>
      		</br>
      		<textarea name="q_content9" id="q_content9" rows="2" style="padding-bottom:5%; width:100%;" >상품문의 내용을 적어주세요.</textarea>
     	</div>
     	
     	
	     <div class="q_answer9" style="padding:0 1%;">
	   		 
	   		 <label for="qno9">상품문의 번호</label>
	      	 <input type="text" name="qno9" id="qno9" class="form-control" readonly/>
	      	 </br>
	      	 
	      	 <label for="hiddenuser9">상품문의 아이디</label>
	      	 <input type="text" name="hiddenuser9" id="hiddenuser9" class="form-control" readonly/>
	  		 </br>
	   		 
	   		 <label for="q_answer9" id="answerLabel9">상품문의 답변</label>
	   		 </br>
	   		 <textarea name="q_answer9" id="q_answer9" rows="2" style="padding-bottom:5%; width:100%;" readonly>문의 답변을 적어주세요.</textarea> 
	   	  </div>
   	  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="secret1" >비밀글 수정</button>
        <!--  <button type="button" class="btn" id="secret2"> 답변글 등록</button> 
        <button type="button" class="btn btn-info" id="secret3" style="display:none;">답변글 수정</button> -->
        <button type="button" class="btn btn-primary" id="secret4">비밀글 종료</button>
        <button type="button" class="btn btn-success" id="secretopen" >비밀글 공개</button>
        <button type="button" class="btn btn-danger" id="secretdelete" >비밀글 삭제</button>
      </div>
    </div>
  </div>
</div>

<!-- Alert 대신 쓸 모달창 -->
<div id="chkModal" class="modal" tabindex="-1" data-qno="1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div id="chkModalBody" class="modal-body">
      <!-- 메세지 들어갈 공간 -->
      </div>
      <input type="hidden" name="hiddenqno" id="hiddenqno" value=""/>
      <input type="hidden" name="hiddenuser" id="hiddenuser" value=""/>
      <div class="modal-footer2">
        <button type="button" id="modalCloseBtn">확인</button>
        <button type="button" id="modalDeleteBtn" style="display:none;">삭제</button>
        <button type="button" id="modalChkCancleBtn" style="display:none;">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
    <!-- 스크립트에서 내 정보를 가져오기 위함 (id가 넘어감) -->
	<sec:authorize access="isAuthenticated()">
		user_id = '<sec:authentication property="principal.username"/>';
	</sec:authorize>

	console.log(user_id);	
	
	<!-- csrf 토큰 -->
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";	

</script>
</main>
<%@include file="../includes/footer.jsp" %>