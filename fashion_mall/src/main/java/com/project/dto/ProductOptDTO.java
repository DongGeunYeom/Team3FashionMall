package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductOptDTO {
	
	private String p_code;
	private String po_size;
	private String po_color;
	private int p_amount;
	
	
}
