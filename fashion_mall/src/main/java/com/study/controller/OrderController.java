package com.study.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.dto.CartDTO;
import com.study.dto.MemberDTO;
import com.study.dto.OrderInfoDTO;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductDTO;
import com.study.service.CartService;
import com.study.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	private CartService service;
	
	@Autowired
	private MemberService memberService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/checkout")
	public void order() {
		log.info("주문서 페이지 폼 요청");
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/cart")
	public void cart(Principal principal, Model model) {
		log.info("장바구니 폼 요청");
		
		List<CartDTO> mycart = service.select(principal.getName());
		log.info(mycart.toString());
		
		log.info("장바구니 밸류 추적 "+mycart);
		
		
		model.addAttribute("mycart", mycart);
	}
	
	//인풋 넘기기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/checkout")
	public void checkoutPost(int totalPrice, Model model, Principal principal) {
		log.info("토큰 정보와 총 가격 넘겨주기");
		
		MemberDTO memberDto = memberService.myinfo(principal.getName());
		List<CartDTO> cartDto = service.select(principal.getName());
		
		model.addAttribute("totalprice", totalPrice);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("cartDto", cartDto);
		log.info("카트정보 확인"+cartDto.toString());
		 
	}
	
	// 수량 체크 및 카트 수량 업데이트
	@GetMapping("/amountUpdate")
	public ResponseEntity<Integer> amountUpdate(String user_id, int p_code, String size, String color, int p_amount){
		log.info("수량체크를 위함"+user_id+" "+p_code+" "+size+" "+color);
		
		//제품 수량 체크
		if(service.selectAmount(color, size, p_code) >= p_amount) {
			//성공시 수량 업데이트
			if(service.amountUpdate(user_id, p_amount, color, size, p_code)) {
				return new ResponseEntity<Integer>(1, HttpStatus.OK);
			}
		}
		
		//실패시 0 을 보내어서 alert 출력
		return new ResponseEntity<Integer>(0, HttpStatus.OK);
	}
	
	//최대 가격 변동
	@GetMapping("/validPriceUpdate")
	public ResponseEntity<Integer> validPriceUpdate(String user_id, int p_code, String size, String color, int price){
		log.info("수량체크를 위함"+user_id+" "+p_code+" "+size+" "+color);
		

		if(service.validPriceUpdate(user_id, price, color, size, p_code)) {
			return new ResponseEntity<Integer>(1, HttpStatus.OK);
		}
		
		//실패시 0 을 보내어서 alert 출력
		return new ResponseEntity<Integer>(0, HttpStatus.OK);
	}
	
	//장바구니에서 목록 전체 삭제
	@GetMapping("/CartDelete")
	public ResponseEntity<Boolean> cartDelete(String user_id){
		log.info("카트 전부 삭제"+user_id);
		
		//카트 테이블 삭제
		if(service.cartDelete(user_id)) {
			//성공시
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		}
		
		//실패시
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	//장바구니에서 해당 제품 삭제
	@GetMapping("/CartProductDelete")
	public ResponseEntity<Boolean> cartProductDelete(String user_id, String color, String size, int p_code){
		log.info("해당 제품 삭제"+user_id+" "+color);
		
		//해당 제품 삭제
		if(service.cartProductDelete(user_id, color, size, p_code)) {
			//성공시
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		}
		
		//실패시
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	//사진 불러오기
	@GetMapping("/displayCart")
    public ResponseEntity<byte[]> getFile(String fileName, String filePath, String uuid){
        log.info("이미지 요청 "+fileName);

        File file = new File("c:\\upload\\"+filePath+"\\"+uuid+"_"+fileName);

        ResponseEntity<byte[]> image = null;

        HttpHeaders header = new HttpHeaders();
        try {
            //페이지에서 header의 Content-Type을 이걸로 하겠다고 추가해주는 부분
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return image;
    }
	
    //주소 업데이트
    @GetMapping("/MemberAddrUpdate")
    public ResponseEntity<Integer> MemberAddrUpdate(String user_id, String addr){
    	
    	//성공시
    	if(service.addrUpdate(user_id, addr)) {
    		return new ResponseEntity<Integer>(1, HttpStatus.OK);
    	}
    	
    	//실패시
    	return new ResponseEntity<Integer>(0, HttpStatus.OK);
    }
	
    //수량만 체크
    @GetMapping("/ProductAmountCheck")
    public ResponseEntity<Boolean> ProductAmountCheck(int code, String size, String color, int amount){
    	
    	//다시 한번 수량 체크
    	if(service.selectAmount(color, size, code) >= amount) {
    		//성공시
    		return new ResponseEntity<Boolean>(true, HttpStatus.OK);
    	};
    	
    	//실패시
    	return new ResponseEntity<Boolean>(false, HttpStatus.OK);
    }
	
    //판매량 증가 및 재고 감소 및 총 수량 감소
    @GetMapping("/ProductAmountUpdate")
    public ResponseEntity<Boolean> ProductAmountUpdate(int code, String size, String color, int amount){
    	
    	//재고 가져오기
    	int productAmount =  service.selectAmount(color, size, code);
    	log.info("현재 재고 값 확인"+productAmount);
    	
    	//재고 - 수량으로 현재 재고 업데이트해주기
    	int updateAmount = productAmount - amount;
    	log.info("업데이트될 재고 확인"+updateAmount);
    	
    	service.updateProductAmount(updateAmount, color, size, code);
    	
    	//총수량 가져오기
    	int Tamount = service.selectTamount(code);
    	log.info("총 수량 확인"+Tamount);
    	//총수량 - 내가 사려는 수량 으로 총수량 업데이트 해주기
    	int updateTamount = Tamount - amount;
    	log.info("업데이트 될 총 수량 확인"+updateTamount);
    	
    	service.updateTamunt(updateTamount, code);
    	
    	//판매량 가져오기
    	int pSale = service.selectPsale(code);
    	log.info("현재 판매량 가져오기"+pSale);
    	
    	//판매량 + 사려는 수량 으로 판매량 업데이트 해주기
    	int updatePsale = pSale + amount;
    	log.info("업데이트 될 판매량 확인"+updatePsale);
    	
    	service.updatePsale(updatePsale, code);
    	
    	return new ResponseEntity<Boolean>(true, HttpStatus.OK);
    }
    
    //주문자 정보 업데이트
    @GetMapping("/Orderinfoinsert")
    public ResponseEntity<Boolean> Orderinfoinsert(int orderNum, String user_id, String p_name, String size, String color, int amount, int price, int code){
    	log.info(orderNum+" "+user_id+" "+p_name+" "+size+" "+color+" "+amount+" "+price+" "+code);
    	
    	//주문자 정보 업데이트
    	service.orderListInsert(orderNum, user_id, p_name, size, color, amount, price, code);
    	
    	return new ResponseEntity<Boolean>(true, HttpStatus.OK);
    }
    
    //주문 리스트 부르기
    @GetMapping("/myorderList")
	public ResponseEntity<List<OrderInfoDTO>> myorderList(String user_id){
		
		log.info(user_id);
		
		return new ResponseEntity<List<OrderInfoDTO>>(service.myOrderList(user_id), HttpStatus.OK);
	}
    
    @GetMapping("/checkorder")
    public void checkorder() {
    	log.info("되는지 확인 주문사항");
    }
    
}





















