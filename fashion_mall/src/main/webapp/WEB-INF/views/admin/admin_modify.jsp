<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header1.jsp" %>

<div class="container">
            <div class="row">
                <div class="col-lg-12" style="width:100%;">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12" style="width:100%;">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Read Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label>상품 코드</label>
                					<input class="form-control" name="p_code" readonly="readonly" value="${dto.p_code}">                				
                				</div> 
                				<div class="form-group">
                					<label>카테고리</label>
                					<input class="form-control" name="p_type" readonly="readonly" value="${dto.p_type}">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 이름</label>
                					<input class="form-control" name="p_name" readonly="readonly" value="${dto.p_name}">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 가격</label>
                					<input class="form-control" name="p_price"  value="${dto.p_price}">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 할인 가격</label>
                					<input class="form-control" name="p_disprice" value="${dto.p_disprice}">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 설명</label>
                					<textarea class="form-control" rows="3" name="p_content" readonly="readonly" style="resize: none;">${dto.p_content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>상품 상세 설명</label>
                					<textarea class="form-control" rows="3" name="pb_content" readonly="readonly" style="resize: none;">${dto.pb_content}</textarea>               				
                				</div> 
                					<!-- 상품 옵션 div -->
		                			<label>옵션</label>
		                			<br>
		                			<ul>
		                		<c:forEach var="dto" items="${optlist}" >
		                			<div class="form-inline" style="display:inline-block;">
                					   <input class="form-control" name="po_size"  value="${dto.po_size}" readonly="readonly" style="width:100px;">
                					   <input class="form-control" name="po_color"  value="${dto.po_color}" readonly="readonly" style="width:100px;">
                					   <input class="form-control" name="p_amount"  value="${dto.p_amount}"  style="width:100px;">  				
                				</div> 
		                		</c:forEach>
		                		</ul>
		                				
		                			<input type="hidden" value="${dto.p_code}" name="p_code"/>
	<input type="hidden" value="${cri.pageNum}" name="pageNum"/>
	<input type="hidden" value="${cri.amount}" name="amount"/>
	<input type="hidden" value="${cri.type}" name="type"/>
	<input type="hidden" value="${cri.keyword}" name="keyword"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                		<br><br>
		                		<button type="submit" data-oper="modify" class="btn btn-default" id="modify">Modify</button>  	
                			<!-- 	<button type="reset" class="btn btn-info">List</button>    -->       			
                			</form>
                		</div>
                	</div>
                </div>
            </div>  
<%-- 파일 첨부 영역 --%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fas fa-file"></i> 첨부파일</div>
			<div class="panel-body">				
				<div class="uploadResult">
					<ul><!-- 첨부파일 정보 --></ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>               

</div>        
<%-- modify / list 버튼 클릭시 이동할 폼 --%>            
<!-- <form action="" method="post" id="operForm">

</form> -->    
<script>
	//현재 글 번호
	let p_code = ${dto.p_code};
	let bno = ${dto.bno};
	//로그인 사용자 가져오기
	
	let replyer=null;

	//csrf토큰
	let csrfHeaderName="${_csrf.headerName}";
   	let csrfTokenValue="${_csrf.token}"; 
   	console.log(csrfHeaderName);
   	console.log(csrfTokenValue);
   	$(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
</script>        

<script src="/resources/js/adminModify.js"></script>
<%@include file="../includes/footer.jsp" %>     












  