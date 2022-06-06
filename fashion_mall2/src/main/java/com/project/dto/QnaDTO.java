package com.project.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class QnaDTO {
	private int bno;
	private int qno;
	private String qTitle;
	private String qContent;
	private String qWriter;
	private Date regDate;
	private int qa_ref;
	private int qa_lev;

}
