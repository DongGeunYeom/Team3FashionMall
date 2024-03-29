<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header1.jsp" %>

<div class="container">
            <div class="row">
                <div class="col-lg-12" style="width:100%;">
                    <h1 class="page-header">상품 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12" style="width:100%;">
                	<div class="panel panel-default">
                       
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form">
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
                					<input class="form-control" name="p_price" readonly="readonly" value="${dto.p_price}">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 할인 가격</label>
                					<input class="form-control" name="p_price" readonly="readonly" value="${dto.p_disprice}">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 설명</label>
                					<textarea class="form-control" rows="3" name="p_content" style="resize: none;"readonly="readonly">${dto.p_content}</textarea>               				
                				</div> 
                						<!-- 상품 옵션 div -->
		                			<label>옵션</label>
		                			<br>
		                		<c:forEach var="dto" items="${optlist}" >
		                			<div class="form-inline" style="display:inline-block;">
                					   <input class="form-control" name="po_size"  value="${dto.po_size}" readonly="readonly" style="width:100px;">
                					   <input class="form-control" name="po_color"  value="${dto.po_color}" readonly="readonly" style="width:100px;">
                					   <input class="form-control" name="p_amount"  value="${dto.p_amount}" readonly="readonly" style="width:100px;">        				
                				</div> 	
		                		</c:forEach>
		                				
		                		
		                		 <br><br>
		                		<button type="button" class="btn btn-default">Modify</button>		
                				<button type="reset" class="btn btn-info">List</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>  
              

</div>        
<%-- modify / list 버튼 클릭시 이동할 폼 --%>            
<form action="/admin/admin_modify" id="operForm">
	<input type="hidden" value="${dto.p_code}" name="p_code"/>
	<input type="hidden" value="${cri.pageNum}" name="pageNum"/>
	<input type="hidden" value="${cri.amount}" name="amount"/>
	<input type="hidden" value="${cri.type}" name="type"/>
	<input type="hidden" value="${cri.keyword}" name="keyword"/>
</form>    
<script>
	//현재 글 번호
	let p_code = ${dto.p_code};
	//로그인 사용자 가져오기
	
	let replyer=null;
	<sec:authorize access="isAuthenticated()">
		replyer='<sec:authentication property="principal.username"/>';
	</sec:authorize>
	//csrf토큰
	let csrfHeaderName="${_csrf.headerName}";
   	let csrfTokenValue="${_csrf.token}"; 
</script>        
<!-- <script src="/resources/js/adminRead.js"></script>    -->       
<script src="/resources/js/adminRead.js"></script>
<%@include file="../includes/footer.jsp" %>     












  