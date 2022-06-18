<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header1.jsp" %>
<div class="container">
			<div class="row">
		  <div class="col-lg-12">
		    <h1 class="page-header">Board List</h1>
		  </div>
		  <!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
		  <div class="col-lg-12">
		    <div class="panel panel-default">
		      <div class="panel-heading">
		        Admin List Page
		        <button id="regBtn" type="button" class="btn btn-xs pull-right">
		          Register New Board
		        </button>
		      </div>
		      <!-- /.panel-heading -->
		      
		      <div class="panel-body">
		        <table class="table table-striped table-bordered table-hover">
		          <thead>
		            <tr>
		              <th>상품코드</th>
		              <th>카테고리</th>
		              <th>상품 이름</th>
		              <th>판매량</th>
		              <th>작성일</th>
		            </tr>
		          </thead>
		          <tbody>
		          	<!-- 게시판 리스트 반복문 -->
		            <c:forEach var="dto" items="${list}">
			          	<tr>
			          		<td>${dto.p_code }</td>
			          		<td>${dto.p_type}</td>
			          		<td>
			          			<a href="${dto.p_code}" class="move">${dto.p_name}</a>
			          		</td>
			          		<td>${dto.p_sale}</td>
			          		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"   value="${dto.reg_date}"/></td>
			          	</tr>
		          	</c:forEach>
		          </tbody>
		        </table>
		        <div class="row">
		          <!-- start search -->
		          <div class="col-md-12">
		            <div class="col-md-8">
		            	<!--search Form-->
		            	<form action="" method="get" id="searchForm">
		            		<input type="hidden" name="pageNum" value="${cri.pageNum}" />
							<input type="hidden" name="amount" value="${cri.amount}" />            	
		            		<select name="type" id="">
		            			<option value=""  <c:out value="${cri.type == '' ? 'selected':'' }"/>>---------</option>
		            			<option value="N" <c:out value="${cri.type == 'N' ? 'selected':'' }"/>>상품 이름</option>
		            			<option value="C" <c:out value="${cri.type == 'C' ? 'selected':'' }"/>>상품 설명</option>
		            			<option value="C" <c:out value="${cri.type == 'T' ? 'selected':'' }"/>>상품 카테고리</option>
		            		</select>            
		            		<input type="text" name="keyword" id=""  value="${cri.keyword}"/>
		            		<button class="btn btn-default" type="submit">Search</button>	
		            	</form>                
		            </div>
		            <div class="col-md-2 col-md-offset-2">
		              <!--페이지 목록 갯수 지정하는 폼-->
		              <select name="" id="amount" class="form-control">
		              	<option value="10"  <c:out value="${cri.amount == 10 ? 'selected':'' }"/>>10</option>
		              	<option value="20"  <c:out value="${cri.amount == 20 ? 'selected':'' }"/>>20</option>
		              	<option value="30"  <c:out value="${cri.amount == 30 ? 'selected':'' }"/>>30</option>
		              	<option value="40"  <c:out value="${cri.amount == 40 ? 'selected':'' }"/>>40</option>
		              </select>
		            </div>
		          </div>
		        </div>
		        <!-- end search -->
		        <!-- start Pagination -->
				<div class="text-center">
		          <ul class="pagination">
		            <c:if test="${pageDto.prev}">
		            	<li class="paginate_button previous"><a href="${pageDto.startPage-1}">Previous</a></li>
		            </c:if>
		            <c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
		            	<li class="paginate_button  ${pageDto.cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a></li>
		            </c:forEach>
		            <c:if test="${pageDto.next}">
		            	<li class="paginate_button next"><a href="${pageDto.endPage+1}">Next</a></li>
		            </c:if>
		          </ul>
		        </div>
		        <!-- end Pagination -->
		      </div>
		      <!-- end panel-body -->
		    </div>
		    <!-- end panel -->
		  </div>
		</div>
		<!-- /.row -->
		<%-- 페이지 링크를 처리할 폼 --%>
		<form action="/admin/admin_list" id="actionForm">
			<!-- pageNum, amount, type, keyword 값을 부를 때 
			     ① pageDto(pageDto.cri.pageNum) 
		     	 ② cri(criteria.pageNum(ModelAttribute 가 사용 안된 경우), cri.pageNum)     	 
		     -->
			
			<input type="hidden" name="pageNum" value="${cri.pageNum}" />
			<input type="hidden" name="amount" value="${cri.amount}" />
			<input type="hidden" name="type" value="${cri.type}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />
		</form>
			

</div>




<!-- 스크립트 -->
<script>
	//게시글 등록 성공 후 result 확인
	let result = '${result}';
	
</script>
<script src="/resources/js/adminList.js"></script>

<%@include file="../includes/footer.jsp" %>


