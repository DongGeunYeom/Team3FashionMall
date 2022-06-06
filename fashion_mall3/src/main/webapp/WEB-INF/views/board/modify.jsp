<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Modify Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label>Bno</label>
                					<input class="form-control" name="bno" readonly="readonly" value="${dto.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label>Title</label>
                					<input class="form-control" name="title" value="${dto.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>Content</label>
                					<textarea class="form-control" rows="3" name="content">${dto.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Writer</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${dto.writer}">                				
                				</div>  
                				
                				<sec:authentication property="principal" var="info"/>
                				<sec:authorize access="isAuthenticated()">
	                				<c:if test="${info.username == dto.writer}">
		                				<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>              			
		                				<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>              			
	                				</c:if>
                				</sec:authorize>
                				
                				<button type="submit" data-oper='list' class="btn btn-info">List</button>     
                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />         			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
<%-- 파일 첨부 영역 --%>    
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fas fa-file"></i>첨부파일</div>
			<div class="panel-body">
				<div class="form-group uploaddiv">
					<input type="file" name="uploadFile" id="" multiple/>
				</div>
				<div class="uploadResult">
					<ul><!-- 첨부파일정보 --></ul>
				</div>
			</div>
		</div>
	</div>
</div>        
<%-- remove와 list를 위한 폼--%>
<form action="" id="operForm">
	<input type="hidden" name="bno" value="${dto.bno}" />
	<input type="hidden" name="writer" value="${dto.writer}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>
<%-- 스크립트 --%>
<script>
	// 현재 글 번호
	let bno = ${dto.bno};
	
	// csrf 토큰 값
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/modify.js"></script> 
<script src="/resources/js/upload.js"></script> 
<%@include file="../includes/footer.jsp" %>       