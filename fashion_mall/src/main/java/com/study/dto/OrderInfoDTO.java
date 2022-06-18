package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderInfoDTO {
	
	private int order_num;
	private String user_id;
	private int cart_no; 
	private String address;
	private String phone_num;
	private String email;
	private String msg; //주문 성공시 메세지?
	private String name;
	
	// 상품 정보
	private String po_size;
	private String po_color;
	private String p_amount;
	private String p_price;
	private String valid_price;
	private String p_name;
	private String oreg_date;
	
	// 사진 가져오기
	private String uuid;
	private String uploadpath;
	private String filename;
	
}
