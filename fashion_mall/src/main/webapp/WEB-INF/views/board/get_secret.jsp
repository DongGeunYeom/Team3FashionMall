<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>문의글 목록</title>
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
 <!-- Bootstrap cdn 설정 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="../resources/css/style.css">
  <link rel="stylesheet" href="../resources/css/search.css">
  <link rel="stylesheet" href="http://www.justinaguilar.com/animations/css/animations.css"/>
 <link
  rel="stylesheet"
  href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
  integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
  crossorigin="anonymous"/>
<link rel="stylesheet" href="/resources/css/main2.css" />
<link rel="stylesheet" href="/resources/css/getdetail.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script defer src="/resources/js/get_secret.js" ></script>
</head>
<body>
<input type="hidden" id="user_id" name="user_id" value="${user_id}" />
<input type="hidden" id="bno" name="bno" value="${bno}"/>
<input type="hidden" id="qno" name="qno" value=""/>
<input type="hidden" id="q_title" name="q_title" value=""/>
<input type="hidden" id="q_content" name="q_content" value=""/>
<input type="hidden" id="q_answer" name="q_answer" value=""/>
<input type="hidden" id="hiddenuser" name="hiddenuser" value="" />
<input type="hidden" id="hiddenqno" name="hiddenqno"  value=""/>
<input type="hidden" id="secret" name="secret"  value=""/>
<!-- 문의 글 목록 -->
<div class="xans-element- xans-product xans-product-qna">
	<div id="div3" class="ec-base-table typeList">
       	<br />
           <h2 class="qnatitle">상품문의</h2>
           <table class="board_list" style="align:center;">
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
<!-- 비밀글 모달 -->
<div id="qnaModal2" class="modal" tabindex="-1" data-qno="1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="padding:5%;">
      <div class="modal-header">
          <h5 class="modal-title">상품문의작성</h5>
      </div>
      <div class="modal-body4">
 
      	<div class="form-group">
      		<label for="q_title9">상품문의 제목 </label>
      		<input type="hidden" name="qno9" id="qno9" />
      		<input type="hidden" name="secret9" id="secret9" />
      		<input type="text" name="q_title9" id="q_title9" class="form-control" placeholder="상품문의 제목"/>
      	</div>
      	 	
      	<div class="form-group">
      		<label for="q_content9" class="q_contentlabel">상품문의 내용</label>
      		</br>
      		<textarea name="q_content9" id="q_content9" rows="2" style="padding-bottom:5%; width:100%;">상품문의 내용을 적어주세요.</textarea>
     	</div>
     	
	     <div class="q_answer9" style="padding:0 1%;">
	   		 <label for="q_answer9" id="answerLabel9">상품문의 답변</label>
	   		 </br>
	   		 <textarea name="q_answer9" id="q_answer9" rows="2"  style="padding-bottom:5%; width:100%;">문의 답변을 적어주세요.</textarea> 
	   	  </div>
   	  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="secret1" >문의글 수정</button>
        <button type="button" class="btn" id="secret2"> 답변글 등록</button>
        <button type="button" class="btn btn-info" id="secret3" style="display:none;">답변글 수정</button>
        <button type="button" class="btn btn-primary" id="secret4">문의글 종료</button>
        <button type="button" class="btn btn-success" id="secretopen" >비밀글 공개</button>
        <button type="button" class="btn btn-danger" id="secretdelete" >문의글 삭제</button>
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
      <div class="modal-footer2">
        <button type="button" id="modalCloseBtn">확인</button>
        <button type="button" id="modalDeleteBtn" style="display:none;">삭제</button>
        <button type="button" id="modalChkCancleBtn" style="display:none;">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
	<sec:authorize access="isAuthenticated()">
		user_id = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
  	<!-- csrf 토큰 -->
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";	
</script>
</body>
</html>