package com.study.dto;

import java.util.Date;

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
public class QnaDTO {
	private int qno;
	private int bno;
	private String q_title;
	private String q_content;
	private String user_id;
	private Date reg_date;
	
	// 문의 답변 컬럼
	private String q_answer;
	private Date update_date;
	private boolean qna_level;
	private boolean qna_secret;
}
