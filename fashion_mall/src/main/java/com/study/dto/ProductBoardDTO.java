package com.study.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductBoardDTO {

	private int bno;
	private int p_code;
	private String pb_content;
	private Date reg_date;
	
	private List<ProductAttachDTO> attachList;
	private ProductDTO product;
	
}
