package com.project.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ReviewDTO {
	private int bno;
	private int rno;
	private String rTitle;
	private String rContent;
	private String replyer;
	private Date regDate;
	
	private List<ReviewAttachDTO> attachReviewList;
}
