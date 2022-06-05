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
                				
                				
                				<div class="container">
                				<div class="form-group">
                					<label>상품 이름</label>
                					<input class="form-control" name="name">                				
                				</div>  
                				<div class="form-group">
                					<label>카테고리</label>
                					<br>
                					<select name="" id="">
                						<option value="top">상의</option>
                						<option value="pants">하의</option>
                						<option value="outer">아우터</option>
                						<option value="shoes">신발</option>
                						<option value="stuff">잡화</option>
                					</select>
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
                				
                				
                				<!-- 여기가 좀 헷갈림 -->
                				
                				
		                				<div class="form-group" style="display:flex;">
				                					<label>사이즈</label>
				                					&nbsp&nbsp&nbsp&nbsp
				                					<input class="form-control" id="size" style="width: 200px;" > 
				                					&nbsp&nbsp&nbsp&nbsp
				                					<label>색상</label>
				                					&nbsp&nbsp&nbsp&nbsp
				                					<input class="form-control" id="color" style="width: 200px;" >           				
				                					&nbsp&nbsp&nbsp&nbsp
				                					<label>재고량</label>
				                					&nbsp&nbsp&nbsp&nbsp
				                					<input class="form-control" id="amount" style="width: 200px;" >  
				                					&nbsp&nbsp&nbsp&nbsp     
						                				<button id="my_button"
										                    	class="btn btn-outline-success btn-lg"
										                        type="button"> 
										                   		추가 
										                </button>    
				                					<!-- append 개념으로 html --> 
				     								
				                				</div>
                				
		                				
		                				
		                				<div id="my_div"></div> 
		                				
		                				 
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
                           <!-- 테스트 영역 -->
         <div class="container"> 
        
          
        <hr>
          
        <form> 
            <div class="form-group"> 
                <label for="">Enter Your Name:</label> 
                <input id="name" class="form-control"
                    type="text"
                    placeholder="Input Your Name Here"> 
            </div>
              
            <div class="form-group text-center"> 
                <button id="my_button"
                    class="btn btn-outline-success btn-lg"
                        type="button"> 
                    Add Name 
                </button> 
            </div> 
        </form> 
          
        <h3>List of Names:</h3>
        <div id="my_div"></div>
    </div> 
    
    
    <!-- 테스트 영역 -->   
            
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
  <script>
        function append_to_div(div_name, data){
            document.getElementById(div_name).innerText += data;
        }
          
        document.getElementById("my_button")
                .addEventListener('click', function() {
              
            var user_size = document.getElementById("size");
            var value1 = user_size.value.trim();
            var user_color = document.getElementById("color");
            var value2 = user_color.value.trim();
            var user_amount = document.getElementById("amount");
            var value3 = user_amount.value.trim();
              
            if(!value1)
                alert("사이즈를 입력해주세요.");
            else if(!value2)
            	alert("색상을 입력해주세요.")
            else if(!value3)
            	alert("수량을 입력해주세요.")
            else
                append_to_div("my_div", value1+"\t,\t"+value2+"\t,\t"+value3+"\n");
            
            user_size.value = "";
            user_color.value = "";
            user_amount.value = "";
          
        });
    </script>
 <!--  <script>
        function append_to_div(div_name, data){
            document.getElementById(div_name).innerText += data;
        }
          
        document.getElementById("my_button")
                .addEventListener('click', function() {
              
            var user_name = document.getElementById("name");
            var value = user_name.value.trim();
              
            if(!value)
                alert("Name Cannot be empty!");
            else
                append_to_div("my_div", value+"\n");
              
            user_name.value = "";
        });
    </script> -->
<%@include file="../test/footer.jsp" %>




















     