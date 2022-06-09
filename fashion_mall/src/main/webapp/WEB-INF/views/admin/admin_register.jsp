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
            
            <div class="container">
            
           
           
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
                					<input class="form-control" name="p_name" style="width:80%;">                				
                				</div>  
                				<div class="form-group">
                					<label>카테고리</label>
                					<br>
                					<select name="p_type" id="">
                						<option value="top">상의</option>
                						<option value="pants">하의</option>
                						<option value="outer">아우터</option>
                						<option value="shoes">신발</option>
                						<option value="stuff">잡화</option>
                					</select>
                				</div>  
                				<div class="form-group">
                					<label>상품 가격</label>
                					<input class="form-control" name="p_price" style="width:80%;">                				
                				</div>  
                				<div class="form-group">
                					<label>상품 설명</label>
                					<textarea class="form-control" rows="3" name="p_content" style="resize: none; width:80%;"></textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>상품 상세 내용</label>
                					<textarea class="form-control" rows="3" name="content" style="resize: none; width:80%;"></textarea>               				
                				</div> 
                				
                				
                				<!-- 여기가 좀 헷갈림 -->
                				
                				
		                				<div class="form-group" style="display:flex;">
		                				
		                					<table style="letter-spacing:10px; border-collapse: separate; border-spacing: 20px;">
		                						<tr>
		                						
		                							<td><label>사이즈</label>
		                							<div>
		                							<!-- radio div -->
		                							<label>옷</label>
		                							<input type="radio" name="O_type"  value="cloth" />
		                							<label>신발</label>
		                							<input type="radio" name="O_type"  value="shoes" />
		                			
		                						
				                					
					                					<select name="size" id="C_size" style="height:30px; display:none;" >
					                						<option value="S" selected>S</option>
					                						<option value="M">M</option>
					                						<option value="L">L</option>
					                						<option value="XL">XL</option>
					                						<option value="F">Free</option>
					                					</select> 
					                					<!-- div 나눠 줄 필요가 없다!!! -->
					                				
						                					<select name="size" id="S_size" style="height:30px;" >
						                						<option value="3" selected>230</option>
						                						<option value="4">240</option>
						                						<option value="5">250</option>
						                						<option value="6">260</option>
						                						<option value="7">270</option>
						                					</select> 
					
					                					</td>
				                					
				                					
				                					<td>
						                					<label>색상</label>
						                					<input class="form-control" id="color" style="width: 200px;" >
				                					</td>
				                					<td>
					                					<label>재고량</label>
					                					<input class="form-control" id="amount" style="width: 200px;" >  
					                				</td>
					                				<td>
					                				
						                				<button id="my_button"
										                    	class="btn btn-outline-success btn-lg"
										                        type="button"
										                        style="height:40px;"> 
										                   		추가 
										                </button>    
					                				</td>
		                						</tr>
		                					
		                					
		                					
		                					</table>
		                				
				                					
				                					<!-- display :none을 자바스크립트로 걸어주면 된다 -->
				                					
				                					
				                					<!-- append 개념으로 html --> 
				                				</div>
                				
		                				<div id="my_div" class=""></div> 
		                				
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
   	
   	<!-- 얘가 continer div -->
  </div>
   	<script> 
 		let csrfHeaderName="${_csrf.headerName}";
   		let csrfTokenValue="${_csrf.token}"; 
   	</script>
 <!-- js 넣을 곳 --> 
  <script>
       
        
        
     /*    $.ajax({
			url:'/admin/admin_register',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			contentType:'application/json',
			data:JSON.stringify(reply),
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})	 */
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
<script src="../resources/js/adminUpload.js"></script>  
<script src="../resources/js/adminRegister.js"></script>  
<%@include file="../test/footer.jsp" %>




















     