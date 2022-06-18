package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.CartDTO;
import com.study.dto.OrderInfoDTO;
import com.study.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Transactional
	@Override
	public int addCart(CartDTO addDto) {
		return mapper.addCart(addDto);	
	}

	@Override
	public int checkCart(CartDTO checkDto) {
		return mapper.checkCart(checkDto);
	}
	
	//카트 불러오기
	@Override
	public List<CartDTO> select(String userid) {
		return mapper.selectCart(userid);
	}

	//제품 수량 체크
	@Override
	public int selectAmount(String color, String size, int p_code) {
		return mapper.selectAmount(color, size, p_code);
	}

	//수량 업데이트
	@Override
	public boolean amountUpdate(String userid, int p_amount, String color, String size, int p_code) {
		return mapper.amountUpdate(userid, p_amount, color, size, p_code);
	}

	//최종 가격 업데이트
	@Override
	public boolean validPriceUpdate(String userid, int price, String color, String size, int p_code) {
		return mapper.validPriceUpdate(userid, price, color, size, p_code);
	}
	
	//장바구니 전체 삭제
	@Override
	public boolean cartDelete(String userid) {
		return mapper.cartDelete(userid);
	}

	//장바구니 해당 제품 삭제
	@Override
	public boolean cartProductDelete(String userid, String color, String size, int p_code) {
		return mapper.cartProductDelete(userid, color, size, p_code);
	}

	//멤버 주소 업데이트
	@Override
	public boolean addrUpdate(String userid, String address) {
		return mapper.addrUpdate(userid, address);
	}

	//제품 재고 업데이트
	@Override
	public boolean updateProductAmount(int p_amount, String color, String size, int p_code) {
		return mapper.updateProductAmount(p_amount, color, size, p_code);
	}

	//판매량 가져오기
	@Override
	public int selectPsale(int p_code) {
		return mapper.selectPsale(p_code);
	}

	//판매량 증가
	@Override
	public boolean updatePsale(int p_sale, int p_code) {
		return mapper.updatePsale(p_sale, p_code);
	}

	//주문자 정보 입력 해주기
	@Override
	public boolean orderListInsert(int order_num, String userid, String p_name, String po_size, String po_color,
			int p_amount, int p_price, int p_code) {
		return mapper.orderListInsert(order_num, userid, p_name, po_size, po_color, p_amount, p_price, p_code);
	}

	//주문 리스트 가져오기
	@Override
	public List<OrderInfoDTO> myOrderList(String userid) {
		return mapper.myOrderList(userid);
	}

	//총 수량 가져오기
	@Override
	public int selectTamount(int p_code) {
		return mapper.selectTamount(p_code);
	}

	//총 수량 감소 시키기
	@Override
	public boolean updateTamunt(int t_amount, int p_code) {
		return mapper.updateTamunt(t_amount, p_code);
	}

	
	
}
