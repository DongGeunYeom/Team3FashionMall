package com.project.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
	private int p_code;
	private String p_name;
	private int p_price;
	private int p_disprice;
	private String p_type;
	private String p_content;
	private int p_sale;
	private int t_amount;
	private Date reg_date;

	// 첨부파일 정보
	private List<ProductAttachDTO> attachList;
	
	//옵션 정보
	private List<ProductOptDTO> optList;
}
