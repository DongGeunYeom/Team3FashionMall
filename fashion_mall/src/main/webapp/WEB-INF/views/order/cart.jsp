<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/header1.jsp" %>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="/resources/css/cart.css" />
<link
  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
  rel="stylesheet"
/>	
<link rel="stylesheet" href="/resources/css/main2.css" />

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


<main>
 <div class="container padding-bottom-3x mb-1">
    <!-- Alert-->
    <h1 align="center" class="Display-4" style="font-size: 50px;">Basket Info</h1>
    <br />
    <!-- Shopping Cart-->
    <div class="table-responsive shopping-cart">
        <table class="table">
            <thead>
                <tr class="ctitle">
                    <th class="text-left" style="width:20px;">Product Image</th>
                    <th class="text-left">Name</th>
                    <th class="test-left">Code</th>
                    <th class="text-left">Option</th>
                    <th class="text-center">Amount</th>
                    <th class="text-center">Price</th>
                    <th class="text-center">
                    	<label><button type="button" class="btn btn-outline-danger">장바구니 비우기</button></label> <!-- 함수 이용 장바구니 버튼 클릭시 userid 이용하여 orderinfo에 있는 모든 정보 삭제하기 ajax 이용 (alert 혹은 confirm 이용해서 확인)-->
                    </th>
                </tr>
            </thead>
            
            <tbody id="test1">
                <!-- 장바구니 목록에 보여줘야 하는 것들 -->
            <c:forEach var="product" items="${mycart}" >
            	
            	<!-- 사진 불러오기 url -->
                <c:url var="url" value="/order/displayCart?">
                	<c:param name="fileName" value="${product.filename}" />
                	<c:param name="uuid" value="${product.uuid}" />
                    <c:param name="filePath" value="${product.uploadpath}"/>
                </c:url>
                
              <tr id="orderlist">
                    <td>
                        <div class="product-item">
                            <a class="product-thumb" href="#"><img src="${url}" alt="Product" style="width: 125px; height: 120px;"></a> <!-- 상품 상세 페이지로 이동 -->
                        </div>
                    </td>
                    <td>
                    	<h3><a href="#">${product.p_name}</a></h3>
                    </td>
                	<td>
						<h4>${product.p_code}</h4>
                	</td>
                    <td>
                    	<div class="product-info">
                             <span id="size">Size  :  <em>${product.po_size}</em></span>
                             <br />
                             <span id="color">Color  : <em>${product.po_color}</em></span>
                        </div>
                    </td>
                    <td class="text-center">
                        <div class="count-input">
                           <i class="bi bi-patch-minus-fill" onclick="TestDown(this)"></i>
                           <input type="text" id="amount" name="amount" value="${product.p_amount}" style="margin:5px; width: 25px; height: 25px; border-radius: 95%;"readonly="readonly"/><!-- 내가 사려는 것의 수량 플러스 마이너스 버튼을 만들어야 할지 생각해야함 -->
                           <i class="bi bi-patch-plus-fill" onclick="TestUp(this)"></i>
                        </div>
                    </td>
                    <td class="text-center text-lg text-medium">${product.valid_price}</td><!-- 제품의 가격 수량 마다 가격이 올라가거나 내려가야함 -->
                    <td class="text-center"><a class="remove-from-cart" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="bi bi-trash" onclick="ProductDelete(this)"></i></a></td> <!-- ㄴ누르면 그 제품의 p_code나 p_name에 따라서 basket의 정보를 삭제 (한번 더 재차 확인 그리고 삭제시 수량 전부다 삭제)-->
               </tr>
               
             </c:forEach>
             <!-- 장바구니 목록에 보여줘야 하는 것들 -->
               
            </tbody>
        </table>
    </div>
    <div class="shopping-cart-footer">
        <div class="column text-lg">Total Price : <span class="text-medium"></span></div>
    </div>
    <div class="shopping-cart-footer">
        <div class="column"><a class="btn btn-outline-secondary" href="/index"><i class="icon-arrow-left"></i>&nbsp;Back to Shopping</a></div>
        <div class="column"><a class="btn btn-outline-success" href="/order/checkout">Payment</a></div>
    </div>
</div>
<form action="/order/checkout" method="post" id="totalPriceInput">
	<input type="hidden" name="totalPrice" id="totalPrice" value=""/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
</form>
</main>

<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script>
	
	<!-- 스크립트에서 내 정보를 가져오기 위함 (id가 넘어감) -->
	<sec:authorize access="isAuthenticated()">
		user_id = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	// + 클릭 시 수량 증가 및 가격 변동
	function TestUp(obj){
		
		//영역 가져오기 부모
		var target = $(obj).parent().parent().parent();
		console.log(target);
		
		//수량 가져오기
		var amount = target.find("td .count-input #amount");
		amount = amount.val();
		console.log(amount);
		
		//가격 가져오기
		price = target.find("td:eq(5)").text();
		console.log(price);
		
		//한번 더 정수,실수형으로 바꿔줌
		amount = Number(amount);
		
		//수량 증가
		amount = amount + 1;
		console.log(amount);
		
		//최초의 가격 찾기
		price = Number(price) / (amount - 1)
		console.log(price);
		
		//최대 수량 한정
		if (amount > 10){
			alert("최대 수량은 10개입니다.");
			return;
		}
		
		//수량체크를 위한 값 가져오기
		var p_code = target.find("td h4").text();
		console.log(p_code);
		var size = target.find("td .product-info #size em").text();
		console.log(size);
		var color = target.find("td .product-info #color em").text();
		console.log(color);
			
 		//수량 있는지 체크 + cart 수량 업데이트
 		$.getJSON({
			url:'amountUpdate',
			data :{
				user_id : user_id,
				p_code : p_code,
				size : size,
				color : color,
				p_amount : amount
			},
			success:function(data){
				if(data == 0){
					
					alert("현재 제품의 최대 잔고 갯수입니다.");
					
					target.find("td .count-input #amount").attr('value',amount-1);
					
					price = price * (amount - 1);
					
					target.find("td:eq(5)").text(price);
					
					// 총 가격 변동
					TotalPrice();
					
				}else{
					
					//변동된 수량 삽입
					target.find("td .count-input #amount").attr('value',amount);
					
					//가격 변동
					//플러스는 가격을 수량 - 1 로 하고 나눠줘야함 
					//가격 나누기 전 수량으로 최초의 값이 나옴 
					price = price * amount;
					
					//가격 삽입
					target.find("td:eq(5)").text(price);
					
					//해당 제품의 최대 가격 조정
					$.getJSON({
						url:'validPriceUpdate',
						data :{
							user_id : user_id,
							p_code : p_code,
							size : size,
							color : color,
							price : price
						},
						success:function(data){
							
							//성공 시 총 가격 변동
							TotalPrice();
							
						}//두 번째 json success 끝
						
					})//두 번째 json 끝
				
				}//첫 번째 if ~ else문 에서 else문 끝
				
			}//첫 번째 json success 끝
			
		})//첫 번째 json 끝
	
	}//클릭 시 수량 증가 및 가격 변동 및 최종 가격 변동 끝

	// - 클릭시 수량 감소 및 가격 변동
	function TestDown(obj){
		//영역 가져오기 부모
		var target = $(obj).parent().parent().parent();
		console.log(target);
		
		//수량 가져오기
		var amount = target.find("td .count-input #amount");
		amount = amount.val();
		console.log(amount);
		
		//가격 가져오기
		price = target.find("td:eq(5)").text();
		console.log(price);
		
		//한번 더 정수,실수형으로 바꿔줌
		amount = Number(amount);
		
		//수량 감소
		amount = amount - 1;
		console.log(amount);
		
		//최초의 가격 가져오기
		
		//최소 수량
		if (amount < 1){
			alert("최소 수량은 1개입니다.");
			return;
		}
		
		//수량체크를 위한 값 가져오기
		var p_code = target.find("td h4").text();
		console.log(p_code);
		var size = target.find("td .product-info #size em").text();
		console.log(size);
		var color = target.find("td .product-info #color em").text();
		console.log(color);
		
 		//수량 있는지 체크 + cart 수량 업데이트
 		$.getJSON({
			url:'amountUpdate',
			data :{
				user_id : user_id,
				p_code : p_code,
				size : size,
				color : color,
				p_amount : amount
			},
			success:function(data){
			}
		})//json 끝
		
		//변동된 수량 삽입
		target.find("td .count-input #amount").attr('value',amount);
		
		//가격 변동
		//가격에서 수량을 나누면 최초의 가격
		//근데 빼기에서는 수량을 미리 빼버리고 나중에 최초의 값을 구할 때만 +1 해줌
		price = (price / (amount + 1)) * amount;
		
		//해당 제품의 최대 가격 조정
		$.getJSON({
			url:'validPriceUpdate',
			data :{
				user_id : user_id,
				p_code : p_code,
				size : size,
				color : color,
				price : price
			},
			success:function(data){
				
				//성공 시 총 가격 변동
				TotalPrice();
				
			}//제품 최대 가격 조정 json success 끝
			
		})//제품 최대 가격 조정 json 끝
		
		//가격 삽입
		target.find("td:eq(5)").text(price);
		
		//총 가격 변동
		TotalPrice();
		
	}// - 클릭시 수량 감소 및 가격 변동 및 최종 가격 끝

	//최초 가격변동
	TotalPrice();
	
	//합계 변동
	function TotalPrice(){
		
		//total값을 저장 해둘곳
		var totalPrice = 0;
		
		//총 가격 변동 일어나야함
		$("tr .text-medium").each(function(){
			var price = $(this).text();
			console.log(price);
			totalPrice = totalPrice + Number(price);
		});
		
		//최종 가격 삽입
		$(".shopping-cart-footer .text-lg .text-medium").text(totalPrice);
		
		//폼에도 삽입
		$("#totalPrice").attr('value',totalPrice);
				
	}//합계 변동 함수
	
	//해당 제품 삭제
	function ProductDelete(obj){
		
		//해당 영역을 찾아줘야함
		var target = $(obj).parent().parent().parent();
		console.log(target);
		
		//DB를 통해서 삭제 -> Json
		if(!confirm("해당 제품이 장바구니에서 사라집니다.")){
			return false;
		};
		
		var p_code = target.find("td h4").text();
		console.log(p_code);
		var size = target.find("td .product-info #size em").text();
		console.log(size);
		var color = target.find("td .product-info #color em").text();
		console.log(color);
		
		//해당 목록만 비우기
		$.getJSON({
			url:'CartProductDelete',
			data :{
				user_id : user_id,
				size : size,
				color : color,
				p_code : p_code
			},
			success:function(data){
				//성공시 해당 영역 삭제
				target.remove("");	
				
				TotalPrice();
			},

		})//json 끝
		
	}//해당 제품 삭제
	
	//장바구니 완전 비우기
	$(".btn-outline-danger").click(function(){
		
		if(!confirm("해당 장바구니 목록이 전부 사라집니다.")){
			return false;
		};
		
		//전부 비우기
		$.getJSON({
			url:'CartDelete',
			data :{
				user_id : user_id
			},
			success:function(data){
				
				$("tbody tr").remove("");
				
				TotalPrice();
			}
		})//json 끝
		
	})// 장바구니 완전 비우기
	
	//결제 버튼 클릭시 폼 전송
	$(".btn-outline-success").click(function(e){
		e.preventDefault();
		
		if($("#orderlist").length < 1){
			alert("현재 장바구니가 비어있습니다.");
			return false;
		}
		
		//폼 가져오기
		var form = $("#totalPriceInput");
		console.log(form);
		$("#totalPriceInput").submit();
		
	})
	




</script>
<!------ Footer tag ---------->
<%@include file="../includes/footer.jsp" %>
