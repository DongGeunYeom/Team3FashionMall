package com.study.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private int replycnt;
	
	// 첨부파일 정보
	private List<AttachDTO> attachList;

}
