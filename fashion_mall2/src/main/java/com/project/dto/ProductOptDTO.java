package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductOptDTO {
	private int pcode;
	private String psize;
	private String pcolor;
	private int pamount; // pAmount : 상품 옵션별 재고
}
