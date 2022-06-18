package com.study.dto;


import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	
	//상품 정보
	private int p_code;
	private String p_name;
	private int p_price;
	private int p_disprice;
	private String p_type;
	private String p_content;
	private int p_sale;
	private int t_amount;
	private Date reg_date;
	private String uuid;
	private String uploadpath;
	private String filename;
	
	//게시판 번호
	private int bno;
	
	//상품 게시판 상세 정보?
	private String pb_content;
	
	// 첨부파일 정보
	private List<ProductAttachDTO> attachList;
	
	// 옵션 정보
	private List<ProductOptDTO> optList;
	
	
	
}
