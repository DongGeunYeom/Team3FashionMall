package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductOptDTO {

	private int p_code;
	private String po_size;
	private String po_color;
	private int p_amount;
	
}
