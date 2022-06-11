<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../test/header.jsp" %>


    <!-- <div style="display:flex;">
		<div class="card mb-3" style="max-width: 580px;">
	      <div class="row no-gutters" style="border:5px solid #000;">
	        <div class="col-md-4">
	          <img src="/resources/images/pic01.jpg" alt="..." style="width: 195px; height: 250px;">
	        </div>
	        <div class="col-md-8">
	          <div class="card-body">
	            <h5 class="card-title">Card title</h5>
	            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	          </div>
	        </div>
	      </div>
	    </div>
		<div class="card mb-3" style="max-width: 580px;">
	      <div class="row no-gutters" style="border:5px solid #000; margin:10px;">
	        <div class="col-md-4">
	          <img src="/resources/images/pic01.jpg" alt="..." style="width: 195px; height: 250px;">
	        </div>
	        <div class="col-md-8" style="padding:10px;">
	          <div class="card-body">
	            <h5 class="card-title">Card title</h5>
	            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	          </div>
	        </div>
	      </div>
	    </div>
	   </div>  -->
	   
	   
	<!-- <div class="" style="width: 100%; top:10px;">
		   <div style="justify-content:center; border:5px solid black; width:500px; position: relative; left:50px;">
	   asdsadsaddsa
	   </div> -->
	<!-- <div style="display:flex; border:5px solid black; float:left; position: relative; left:50px;">
	<div class="container">
	<ul class="sort" style="list-style:none;">
		<li style="">
			<input type="radio" value="1" name="sort" id="price" style="display:none;">
			<label for="price">낮은가격순</label>
		</li>
		<li>
			<input type="radio" value="2" name="sort" id="price2">
			<label for="price2">낮은가격순</label>
		</li>
		<li>
			<input type="radio" value="3" name="sort" id="price3">
			<label for="price3">낮은가격순</label>
		</li>
		<li>
			<input type="radio" value="4" name="sort" id="price4">
			<label for="price4">낮은가격순</label>
		</li>
		
	</ul>
	</div> -->
	

	<!--  -->
	<div class="container">
    <div>상품검색</div>
	<fieldset style="padding-top:30px; padding-bottom:0px; border: 2px solid #d3d3d3;">
	<p style="border-bottom:1px solid black; text-align:center; padding-bottom:40px;">
	<span style="border-bottom:1px solid black;"><i class="bi bi-search"></i>검색하신단어 :</span>
	</p>
		<table style="margin: 10px;">
			<tr>
				<th style="text-align:center; width:15%; height:30px;">
					<div>상품유형</div>
				</th>
				<td style="width:15%;">
					<div>
								<select name="" id="search" style="">
									<option value="1">통합검색</option>
									<option value="1">상의</option>
									<option value="2">하의</option>
									<option value="3">아우터</option>
									<option value="4">신발</option>
									<option value="5">잡화</option>
								</select>
					</div>
				</td>
				<th style="text-align:center; width:15%;">		
					<div style="">제품명/키워드</div>	
				</th>
				<td style="width:15%;">
					<div>
						<ul style="list-style:none; padding-left:0;">
							<li style="width:100px"><input type="text" name="" id="" placeholder="검색어를 입력하세요" style="text-align:center;"/></li>
						</ul>	
					</div>
				</td>
				 <td style="width:15%">
					<div class="aaa">
						<a class="bbb" href="">
							<span >search</span>
						</a>
					</div>
				</td> 
			</tr>
			<tr style="">
			<th style="text-align:center; width:15%; height:30px;">
					<div>상품유형</div>
				</th>
				<td style="width:15%;">
					<div>
								<select name="" id="search" style="">
									<option value="1">통합검색</option>
									<option value="1">상의</option>
									<option value="2">하의</option>
									<option value="3">아우터</option>
									<option value="4">신발</option>
									<option value="5">잡화</option>
								</select>
					</div>
				</td>
				<th style="text-align:center; width:15%;">		
					<div style="">제품명/키워드</div>	
				</th>
				<td style="width:15%;">
					<div>
						<ul style="list-style:none; padding-left:0;">
							<li style="width:100px"><input type="text" name="" id="" placeholder="검색어를 입력하세요" style="text-align:center;"/></li>
						</ul>	
					</div>
				</td>
			</tr>
		</table>
	</fieldset>
	
	
	
	   <div class="search">
		<div class="search-1" Onclick="location.href=''">
	      <div class="search-2">
	        <div class="search-img">
	          <img src="../resources/images/1.png" alt="..." style="width: 195px; height: 250px;">
	        </div>
	        <div class="search-text">
	          <div class="">
	            <h5 class="">Card title</h5>
	            <p class="">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	            <p class=""><small class="">Last updated 3 mins ago</small></p>
	          </div>
	        </div>
	        <div class="search-price">
	        <h5>price : 10000</h5>
	        </div>
	      </div>
	    </div>
		<div class="search-1" Onclick="location.href=''">
	      <div class="search-2">
	        <div class="search-img">
	          <img src="../resources/images/pic01.jpg" alt="..." style="width: 195px; height: 250px;">
	        </div>
	        <div class="search-text">
	          <div class="">
	            <h5 class="">Card title</h5>
	            <p class="">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	            <p class=""><small class="">Last updated 3 mins ago</small></p>
	          </div>
	        </div>
		        <div class="search-price">
		        <h5>price : 10000</h5>
		        </div>
	      </div>
	    </div>
	   </div>
 </div>
	   <!--  -->
	   
	   
	    
		
	
	
	
<%@include file="../test/footer.jsp" %>