<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../test/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="padding:20px;">ADMINISTOR PAGE</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           상품 등록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="padding:50px;">
                			<form action="" method="post" role="form" style="padding:50px;">
                				<div class="form-group">
                					<label>상품 이름</label>
                					<input class="form-control" name="name">                				
                				</div>  
                				<div class="form-group">
                					<label>카테고리</label>
                					<input class="form-control" name="category">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 가격</label>
                					<input class="form-control" name="price">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 설명</label>
                					<textarea class="form-control" rows="3" name="content" style="resize: none;"></textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>상품 상세 내용</label>
                					<textarea class="form-control" rows="3" name="content" style="resize: none;"></textarea>               				
                				</div> 
                				<div class="form-group" style="display:flex;">
                					<label>사이즈</label>
                					&nbsp&nbsp&nbsp&nbsp
                					<input class="form-control" name="writer" style="width: 200px;" > 
                					&nbsp&nbsp&nbsp&nbsp
                					<label>색상</label>
                					&nbsp&nbsp&nbsp&nbsp
                					<input class="form-control" name="writer" style="width: 200px;" >           				
                					&nbsp&nbsp&nbsp&nbsp
                					<label>재고량</label>
                					&nbsp&nbsp&nbsp&nbsp
                					<input class="form-control" name="writer"style="width: 200px;" >  
                					&nbsp&nbsp&nbsp&nbsp     
                					<button type="text" class="btn btn-primary">추가</button>   
                					<!-- append 개념으로 html -->      				
                				</div>  
                				<input type="hidden" value="1" name="pageNum"/>
								<input type="hidden" value="10" name="amount"/>
								<input type="hidden" value="${cri.type}" name="type"/>
								<input type="hidden" value="${cri.keyword}" name="keyword"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                				<button type="submit" class="btn btn-default">Submit</button>              			
                				<button type="reset" class="btn btn-default">reset</button>                 				            			
                			</form>
                		</div>
                	</div>
                </div>
            </div> 
   	<div class="row">
   		<div class="col-lg-12">
   			<div class="panel panel-default">
   				<div class="panel-heading">파일첨부</div>
   				<div class="panel-body">
   					<div class="form-group uploaddiv">
   						<input type="file" name="uploadFile" id="" multiple/>
   					</div>
   					<div class="uploadResult">
   						<ul><!-- 첨부파일 정보 --></ul>
   					</div>
   				</div>
   			</div>
   		</div>
   	</div>  
   	<script> 
 		let csrfHeaderName="${_csrf.headerName}";
   		let csrfTokenValue="${_csrf.token}"; 
   	</script>
<!-- js 넣을 곳 -->  
<%@include file="../test/footer.jsp" %>



















     