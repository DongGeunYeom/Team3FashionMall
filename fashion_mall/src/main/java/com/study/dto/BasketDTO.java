package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketDTO {
	
	private int basket;
	private int p_code;
	private int order_num;
	private String b_size;
	private String b_color;
	private int b_amount;
	private int total_price;
	
}
