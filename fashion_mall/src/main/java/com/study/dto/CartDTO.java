package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {

	private String user_id; // user_id 외래키 설정
	private int p_code;
	private String p_name;
	private int p_price;
	private String po_size;
	private String po_color;
	private int p_amount; // pAmount : 상품 옵션별 재고
	
	// 필요에 맞게
	private int valid_price; // validprice = p_amount * p_price
	
	// 사진 가져오기
	private String uuid;
	private String uploadpath;
	private String filename;
	
}
