<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/header1.jsp" %>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="/resources/css/checkout.css" />
<link rel="stylesheet" href="/resources/css/main2.css" />

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<div class="container">
  
  <h2 class="my-4 pt-2" align="center" style="padding-bottom: 20px;"><strong>주문 리스트</strong></h2>
  
  <div class="inner">
  <div class="container">
   <div class="row">
    
    <div class="col-8 col-12-medium" style="border:solid 1px gray; padding: 40px;">
    <section class="box article-list">
    
      <h4 class="mb-3" align="center"><strong>주문자 정보</strong></h4>
      
      <article class="box excerpt">
        <div class="" style="padding-bottom:20px;">
          <div class="col-md-6 mb-6" style="padding:0px;">
            <div class="">
              <label for="name" class="addresslabel">성함 <small style="font-size: 15px;">(입금하신 이름과 동일 해야합니다.)</small></label>
              <input type="text" id="name" class="form-control" value="${memberDto.name}" required style="border: solid 1px gray;"/>
            </div>
          </div>
        </div>
		</article>
		
		<article class="box excerpt">
		<div class="" style="padding-bottom:20px;">
	      <div class="col-md-6 mb-6" style="padding:0px;">
	        <label for="phonenum" class="addresslabel" >핸드폰 번호</label>
	        <input type="text" id="phonenum" class="form-control" value="${memberDto.phone_num}" required style="border: solid 1px gray;"/>
		  </div>
        </div>
		</article>
		
		<article class="box excerpt">
        <div class="" style="padding-bottom:20px;">
          <div class="col-md-6 mb-6" style="padding:0px;">
            <div class="">
              <label for="email" class="addresslabel" >이메일</label>
              <input type="email" id="email" class="form-control" value="${memberDto.email}"style="border: solid 1px gray;"/>
            </div>
          </div>
		 </div>
		 </article>
		 
		 <article class="box excerpt" style="margin-bottom: 0px;"> 
		 	<label for="address" class="addresslabel" >배송지</label>
		 </article>
		 
		 <article class="box excerpt" style="margin-bottom: 160px;">
		 <div class="" style="padding-bottom:20px;">
          <div class="col-md-10 mb-3" style="padding:0px;">
            <div class="">
           	  
           	  
           	  <div class="col-md-4 mb-4" style=" padding-left: 0px; margin-left:0px;">
             	 <input type="text" id="member_post" class="form-control" placeholder="우편번호"  readonly style="border: solid 1px gray;"/>
              </div>
              
              <div class="col-md-3 mb-4" style="margin-left: 0px">
                <button type="button" class="btn btn-outline-danger" onclick="findAddr()" style="margin-bottom: 20px; margin-bottom: 0px;">우편번호 찾기</button>
              </div>
              
              <input type="text" id="member_addr" class="form-control" placeholder="주소"  required style="margin-bottom: 20px; border: solid 1px gray;" readonly="readonly"/>
              <input type="text" id="member_addr2" class="form-control" placeholder="상세 주소" required style="border: solid 1px gray;"/>
              
            </div>
          </div>
          </div>
        </article>
          
        <article class="box excerpt" style="margin-bottom:5px;">
	        <div class="">
	          <button type="button" class="btn btn-outline-info">배송지 저장</button>
	        </div>
        </article>
      
      	<article class="box excerpt">
      		<div class="col-md-10 mb-3" style="padding:0px;">
      			<label for="address" class="addresslabel" >배송 요청 사항</label>
      			<input type="text" id="member_addr2" class="form-control" placeholder="배송시 요청 사항 입력 (예 : 현관문에 앞에 놔주세요 기사님!)" required style="border: solid 1px gray;"/>
      		</div>
      	</article>
      	
      	<article class="box excerpt">
      	</article>
    </section>
    </div>
    
    
    
    <div class="col-4 col-12-medium" style="border:solid 1px gray; padding: 40px;">
      <h4 class="mb-3" align="center">
        <span class="text-muted"><strong>주문 확인</strong></span>
      </h4>
      <h5 align="center">
        <small>(주문시 확인 사항 미확인으로 인한 불찰에 대해서</small>
      </h5>
      <h5 class="mb-3" align="center">
        <small> 당사는 절대 책임 지지않습니다.)</small>
      </h5>
      
      <ul class="list-group mb-3">
        <!-- 장바구니 리스트 -->
        <c:forEach var="product" items="${cartDto}" >
	        <li class="list-group-item d-flex justify-content-between lh-condensed" style="border:solid 1px black;">
	          <div>
	            <h6 class="my-0" id="productName">${product.p_name}</h6>
	            <small class="text-muted" id="code" style="font-size: 16px; color: black;">Code : <em>${product.p_code}</em>,</small>
	            <small class="text-muted" id="size" style="font-size: 16px; color: black;">Size : <em>${product.po_size}</em>,</small>
	            <small class="text-muted" id="color" style="font-size: 16px; color: black;">Color : <em>${product.po_color}</em>,</small>
	            <small class="text-muted" id="amount" style="font-size: 16px; color: black;">Amount : <em>${product.p_amount}</em></small>
	          </div>
	          <span class="text-muted" id="price">${product.valid_price}</span>
	        </li>
        </c:forEach>
        <!-- 장바구니 리스트 -->
        
       	<li style="list-style: none;">
       		<br />
       	</li>
        <li class="list-group-item d-flex justify-content-between" style="border:solid 1px black;">
          <span style="color: black;">Total Price(KOR)</span>
          <strong id="totalprice"></strong>
        </li>
      </ul>
      
      <button class="btn btn-lg btn-outline-primary" id="checkorder">
      	  주문시 확인 사항
      </button>
      
      <a href="/order/cart">
      	<button class="btn btn-lg btn-outline-success">
    	      장바구니
      	</button>
	  </a>
	  
      <button class="btn btn-lg btn-outline-dark">
          결제
      </button>
      
      
     </div>
    </div>
   </div> 
  </div>
</div>
<!------ Footer tag ---------->
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script>

<!-- 스크립트에서 내 정보를 가져오기 위함 (id가 넘어감) -->
<sec:authorize access="isAuthenticated()">
	user_id = '<sec:authentication property="principal.username"/>';
</sec:authorize>

//주문시 확인 사항에 대한 글
$("#checkorder").click(function(){
	var link = "http://localhost:9090/order/checkorder";
	window.open(link,"주문시 확인 사항","channelmode=no, width=500, height=800, location=no, menubar=no, resizable=no, status=no, left=750px, top=100px");
	
});

//
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}

//----------------------------------------------------------------------------
//결제 버튼 누르면 뜨게 하기 아직 실험
/* 	$(".btn-outline-success").click(function(){
	requestPay();
})//결제 버튼 누르면 뜨게 하기 아직 실험 */

	
//필요한 값 가져오기 	
var name = $("#name").val;
var email = $("#email").val();
var tel = $("#phonenum").val();

/* var price = $(".lh-condensed #price").text();

price = Number(price);
console.log(price); */

//결제 버튼 누르면 결제 페이지로
$(".btn-outline-dark").click(function(){
	
	var addr1 = $("#member_addr").val();
	var addr2 = $("#member_addr2").val();
	var addr = addr1 +" "+ addr2;
	
	if (addr == " "){
		alert("주소정보를 입력해 주세요");
		return false;
	}
	
	payment();
})

//아직 실험 기능
var IMP = window.IMP; // 생략 가능
IMP.init("imp26579557"); // 예: imp00000000

//결제 버튼 눌리면 총금액고 판매자 이름 상품이름은
function requestPay() {
	
  var addr1 = $("#member_addr").val();
  var addr2 = $("#member_addr2").val();
  var addr = addr1 +" "+ addr2;

  var randNum1 = Math.random() * (10000000 - 1) + 1;
  var randNum2 = Math.random() * (1000000 - 1) + 1;
  var uid = "ORD"+randNum1+"-"+randNum2;
  
  var postcode = Math.random() * (10000 - 1) + 1;
  
  var total = $(".justify-content-between #totalprice").text();
  
  // IMP.request_pay(param, callback) 결제창 호출
  IMP.request_pay({ // param
      pg: "kakaopay",
      pay_method: "kakaopay",
      merchant_uid: uid, //주문 번호 , 결제 실패하면 번호를 바꿔서 해보자
      name: "KED`LOS", //상품 이름
      amount: total,
      buyer_email: email, // 구매자 이메일
      buyer_name: name, // 구매자 이름
      buyer_tel: tel, // 구매자 번호
      buyer_addr: addr, //구매자 주소
      buyer_postcode: postcode // 이것도 바꿔서 해봐야 함
  }, 
  function (rsp) { // callback
      if (rsp.success) {
    	  //결제 성공시 넘어갈 페이지
          //함수 실행 판매량 증가, 재고 감소, orderinfo에 저장
          updateinfo();
      } else {
    	  //결제 실패시 보여줘야 할 페이지 혹은 멘트
          alert("결제가 실패하였습니다.");
      }
  
  });
}//아직 실험 기능
//----------------------------------------------------------------------------


//checkout 페이지 들어올 때 마다 실행 
TotalPrice();

//합계 변동
function TotalPrice(){
	
	//total값을 저장 해둘곳
	var totalPrice = 0;

	$(".lh-condensed  #price").each(function(){
		var price = $(this).text();
		price = Number(price);
		
		console.log("각 가격 받아오는지 체크"+price);
		
		totalPrice = totalPrice + Number(price);
	});
	
	console.log(totalPrice);
	
	//최종 가격 삽입
	$("#totalprice").text(totalPrice);
	
	//폼에도 삽입
	//$("#totalPrice").attr('value',totalPrice);
	var total = $(".justify-content-between #totalprice").text();
	total = Number(total);
	
	console.log(total);
}//합계 변동 함수


//배송지 저장하기
$(".btn-outline-info").click(function(){
	
	//주소 정보 가져오기
	var addr1 = $("#member_addr").val();
	var addr2 = $("#member_addr2").val();
	var addr = addr1 +" "+ addr2;
	
	console.log(addr);
	
	if(!confirm("해당 주소로 주소가 저장 됩니다.")){
		return false;
	}
	
	$.getJSON({
		url:'MemberAddrUpdate',
		data :{
			user_id : user_id,
			addr : addr
		},
		success:function(data){
			alert("주소가 변경되었습니다.");
		}
	})//json 끝
	
})//배송지 저장

//일단 결제 버튼 누를시 수량 체크 및 판매량 증가 및 재고 감소 및 orderinfo정보 전송 되는지 확인
function payment(){
	
	//각각의 수량 사이즈 컬러 상품이름 가져오기 
	$(".lh-condensed").each(function(){
		var productName = $(this).find("#productName").text();
		var size = $(this).find("#size em").text();
		var color = $(this).find("#color em").text();
		var amount = $(this).find("#amount em").text();
		var code = $(this).find("#code em").text();
		
		//수량 체크
		$.getJSON({
			url:'ProductAmountCheck',
			data :{
				code : code,
				size : size,
				color : color,
				amount : amount
			},
			success:function(data){
				if (data){

				}else{
					//실패시
					alert("현재 "+productName+" 제품의 잔고가 부족합니다.");
					return false;
				}
			}
		})//json 끝
		
	})//각각의 수량 사이즈 컬러 상품이름 가져오기 	
	
	requestPay();
	
}//일단 결제 버튼 누를시 수량 체크 및 판매량 증가 및 재고 감소 및 orderinfo정보 전송 되는지 확인

//결제 성공시 데이터 변화
//판매량 증가
//재고 감소
//총 재고량 감소
//주문자 정보에 데이터 삽입
function updateinfo(){
	
	//정보 가져오기
	$(".lh-condensed").each(function(){
		var productName = $(this).find("h6").text();
		var size = $(this).find("#size em").text();
		var color = $(this).find("#color em").text();
		var amount = $(this).find("#amount em").text();
		var code = $(this).find("#code em").text();
		var price = $(this).find("#price").text();
		price = Number(price);
		
		alert(productName,size,color,amount,code,price);
		
		//판매량 증가 및 재고 감소 및 총 재고량 감소
		$.getJSON({
			url:'ProductAmountUpdate',
			data :{
				code : code,
				size : size,
				color : color,
				amount : amount
			},
			success:function(data){
				
			}
		})//json 끝
		
		var orderNum = Math.random() * (1000-1) + 1;
		
		//order info에 정보 삽입 주문 정보도 삽입 해야함
	 	$.getJSON({
			url:'Orderinfoinsert',
			data :{
				p_name : productName,    // 상품 이름
				code : code,    // 상품 코드
				size : size,    // 사이즈
				color : color,  // 컬러
				amount : amount, // 현재 내가 사려는 수량
				price : price, // 제품당 총 가격
				
				user_id : user_id, // 내 아이디
				orderNum : 1000, //주문 번호
				
			},
			success:function(data){
			}
		})//json 끝 
	
	})//정보를 가져와서 판매량 증가 및 재고 감소 시키기
	
	 	
	//결제 성공 후 카트 테이블 삭제
	$.getJSON({
		url:'CartDelete',
		data :{
			user_id : user_id
		},
		success:function(data){
		}
	})//json 끝
	
	//맨마지막 결제 성공 시 index로
	alert("주문이 완료되었습니다.");
	//인덱스 페이지로
	location.href = '/index';
	
}//결제 성공시 데이터 변화

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@include file="../includes/footer.jsp" %>
