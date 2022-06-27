package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ProductOptDTO {
	
	private int p_code;
	private String po_size;
	private String po_color;
	private int p_amount;
	
	
}
