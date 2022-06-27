package com.study.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReviewDTO {
	private int rno;
	private int bno;
	private String r_title;
	private String r_content;
	private String user_id;
	private Date reg_date;
	
	private List<ReviewAttachDTO> attachList;
}
