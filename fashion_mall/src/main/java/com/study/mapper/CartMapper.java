package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.CartDTO;
import com.study.dto.OrderInfoDTO;
import com.study.dto.ProductAttachDTO;

public interface CartMapper {
	// 카트 담기
	public int addCart(CartDTO addDto);
	
	// 카트 중복담기 체크
	public int checkCart(CartDTO checkDto);
	
	//장바구니 불러오기
	public List<CartDTO> selectCart(String user_id);
	
	//제품 수량 체크
	public int selectAmount(@Param("color") String color, @Param("size") String size, @Param("p_code") int p_code);
	
	//장바구니 수량 업데이트
	public boolean amountUpdate(@Param("user_id") String userid, @Param("p_amount") int p_amount,@Param("po_color") String color, @Param("po_size") String size, @Param("p_code") int p_code); 
	
	//장바구니 최종 가격 업데이트
	public boolean validPriceUpdate(@Param("user_id") String userid, @Param("valid_price") int price,@Param("po_color") String color, @Param("po_size") String size, @Param("p_code") int p_code); 
	
	//장바구니 담은 것 모두 삭제
	public boolean cartDelete(String userid);
	
	//해당 목록만 삭제
	public boolean cartProductDelete(@Param("user_id") String userid, @Param("po_color") String color, @Param("po_size") String size, @Param("p_code") int p_code);
	
	//주소 업데이트
	public boolean addrUpdate(@Param("user_id") String userid, @Param("address") String address);
	
	// 주문 성공시 ----------------------------------------------------------------------------------
	
	//제품 재고 업데이트
	public boolean updateProductAmount(@Param("p_amount") int p_amount, @Param("po_color") String color, @Param("po_size") String size, @Param("p_code") int p_code);
	
	//판매량 숫자 가져오기
	public int selectPsale(int p_code);
	
	//판매량 업데이트
	public boolean updatePsale(@Param("p_sale") int p_sale, @Param("p_code") int p_code);
	
	//주문자 정보 삽입해주기
	public boolean orderListInsert(@Param("order_num") int order_num, @Param("user_id") String userid, @Param("p_name") String p_name, @Param("po_size") String po_size, @Param("po_color") String po_color, @Param("p_amount") int p_amount, @Param("p_price") int p_price,@Param("p_code") int p_code);

	//내 주문 리스트 부르기
	public List<OrderInfoDTO> myOrderList(String user_id);
	
	//총 수량 가져오기
	public int selectTamount(int p_code);
	
	//총 수량 업데이트
	public boolean updateTamunt(@Param("t_amount") int t_amount, @Param("p_code") int p_code);
}
