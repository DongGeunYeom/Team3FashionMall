<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../includes/header1.jsp" %>    
<!DOCTYPE html>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<button onclick="requestPay()">결제하기</button>
  
<script>
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp56355768"); // 예: imp00000000
  
	//총금액은 foreach?
			
	//결제 버튼 눌리면 총금액고 판매자 이름 상품이름은
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "kakaopay",
          merchant_uid: "ORD20180131-0000011", //주문 번호
          name: "노르웨이 회전 의자", //상품 이름
          amount: 1000,
          buyer_email: "gildong@gmail.com", // 구매자 이메일
          buyer_name: "홍길동", // 구매자 이름
          buyer_tel: "010-4242-4242", // 구매자 번호
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
        	  //결제 성공시 넘어갈 페이지
              alert("결제 성공");
          } else {
        	  //결제 실패시 보여줘야 할 페이지 혹은 멘트
              alert("결제 실패");
          }
      });
    }
</script>
<%@include file = "../includes/footer.jsp" %>