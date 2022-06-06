package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductAttachDTO {
	private int pcode;
	
	// 파일 관련 변수들
	private String uuid;
	private String uploadPath;
	private String fileName;

}
