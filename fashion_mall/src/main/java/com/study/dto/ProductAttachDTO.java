package com.study.dto;

import lombok.Data;

@Data
public class ProductAttachDTO {
	private String uuid;
	private String uploadpath;
	private String filename;
	
	private String p_name;
	private String p_price;
	private String p_type;
}
