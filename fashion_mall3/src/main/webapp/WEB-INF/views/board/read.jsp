<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Read Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form">
                				<div class="form-group">
                					<label>Bno</label>
                					<input class="form-control" name="bno" value="${dto.bno}" readonly="readonly">                				
                				</div> 
                				<div class="form-group">
                					<label>Title</label>
                					<input class="form-control" name="title" value="${dto.title}" readonly="readonly">                				
                				</div>  
                				<div class="form-group">
                					<label>Content</label>
                					<textarea class="form-control" rows="3" name="content" readonly="readonly">${dto.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Writer</label>
                					<input class="form-control" name="writer" value="${dto.writer}" readonly="readonly">                				
                				</div>  
                				
                				<sec:authentication property="principal" var="info"/>
                				<sec:authorize access="isAuthenticated()">
	                				<c:if test="${info.username == dto.writer}">
	                					<button type="button" class="btn btn-default">Modify</button>
	                				</c:if>		
                				</sec:authorize>
                				<button type="reset" class="btn btn-info">List</button>
                				          			
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
				<div class="uploadResult">
					<ul><!-- 첨부파일정보 --></ul>
				</div>
			</div>
		</div>
	</div>
</div>        
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>
<%-- 댓글 리스트 영역 --%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>
				Reply
				<sec:authorize access="isAuthenticated()">
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
				</sec:authorize>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2022-05-04 15:54</small>
							</div>
							<!-- 댓글 내용 -->
							<p>Good Job!!!</p>
						</div>
					</li>
				</ul>
			</div>
			<%-- 댓글 페이지 영역 --%>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>
<%-- 댓글 작성 모달 폼 --%>
<div class="modal" tabindex="-1" id="replyModal" data-rno="1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
          <h5 class="modal-title">Reply</h5>
      </div>
      <div class="modal-body">
      	<div class="form-group">
      		<label for="">내용</label>
      		<input type="text" name="reply" id="" class="form-control" placeholder="댓글 내용"/>
      	</div>
      	
      	<div class="form-group">
      		<label for="">작성자</label>
      		<input type="text" name="replyer" id="" class="form-control" placeholder="작성자" />
      	</div>
      	
      	<div class="form-group">
      		<label for="">작성일</label>
      		<input type="text" name="replydate" id="" class="form-control" placeholder="작성일"/>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="modalRegisterBtn">등록</button>
        <button type="button" class="btn btn-success" id="modalModBtn">수정</button>
        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
        <button type="button" class="btn btn-primary" id="modalCloseBtn" data-dismiss="modal" >종료</button>
      </div>
    </div>
  </div>
</div>
<%-- modify / list 버튼 클릭시 이동할 폼 --%>
<form action="/board/modify" id="operForm">
	<input type="hidden" name="bno" value="${dto.bno}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
</form>
<script>
	// 현재 글 번호
	let bno = ${dto.bno};
	
	// 로그인 사용자 가져오기
	let replyer = null;
	<sec:authorize access="isAuthenticated()">
		replyer = '<sec:authentication property="principal.username"/>'
	</sec:authorize>
	
	//csrf 토큰
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
</script>

<script src="/resources/js/read.js"></script>       
<script src="/resources/js/reply.js"></script>      
<script src="/resources/js/upload.js"></script>      
<%@include file="../includes/footer.jsp" %>       