package com.study.dto;

import lombok.Data;

@Data
public class AttachDTO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; // 이미지 1, 아니면 0
	
	private int bno; //원본 글 번호
}
