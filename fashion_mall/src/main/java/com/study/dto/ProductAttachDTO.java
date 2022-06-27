package com.study.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductAttachDTO {
	
	//사진 불러오기 용도
	private String uuid;
	private String uploadpath;
	private String filename;
	private boolean filetype;
	
	//상품 정보
	private String p_name;
	private String p_price;
	private String p_type;
	private int p_code;
	
	//게시판 번호 위해서 사용
	private int bno;
	
	// 모름
	private Date reg_date;
	
	// 상품 상세 내용
	private String p_content;
	
	
		
}
