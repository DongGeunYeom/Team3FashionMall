package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.CartDTO;
import com.study.dto.OrderInfoDTO;

public interface CartService {
	// 카트 담기
	public int addCart(CartDTO addDto);
	
	// 카트 중복 체크
	public int checkCart(CartDTO checkDto);
	
	//장바구니 불러오기
	public List<CartDTO> select(String userid);
	
	//제품 수량 체크
	public int selectAmount(String color,String size, int p_code);
	
	//장바구니 수량 업데이트
	public boolean amountUpdate(String userid, int p_amount, String color, String size, int p_code); 
	
	//장바구니 최종 가격 업데이트
	public boolean validPriceUpdate(String userid, int price, String color, String size, int p_code); 

	//장바구니 담긴 것 전부 삭제
	public boolean cartDelete(String userid);
	
	//해당 목록만 삭제
	public boolean cartProductDelete(String userid, String color, String size, int p_code);
	
	//멤버 주소 업데이트
	public boolean addrUpdate(String userid, String address);
	
	//제품 재고 업데이트
	public boolean updateProductAmount(int p_amount, String color, String size, int p_code);
	
	//판매량 숫자 가져오기
	public int selectPsale(int p_code);
	
	//판매량 업데이트
	public boolean updatePsale(int p_sale, int p_code);
	
	//주문자 정보 입력
	public boolean orderListInsert(int order_num, String userid, String p_name, String po_size, String po_color, int p_amount, int p_price, int p_code);

	//내 주문 정보 가져오기
	public List<OrderInfoDTO> myOrderList(String userid);
	
	//총 수량 가져오기
	public int selectTamount(int p_code);
	
	//총 수량 업데이트
	public boolean updateTamunt(int t_amount, int p_code);

}
